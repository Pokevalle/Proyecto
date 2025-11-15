
package SubClases;

import ClaseVentanas.RegistrarP;
import claseprin.dbConnection;
import javax.swing.JOptionPane;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;



/**
 *
 * @author Slad
 */
public class SubTicket {
    
    public Integer obtenerTicketIdActivo(String placa) {
    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "SELECT ticket_id FROM ticket WHERE placa = ? AND fecha_salida IS NULL"
        );

        ps.setString(1, placa);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("ticket_id");
        }

        return null;

    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}
    
    public boolean registrarSalidaTemporal(int ticketId) {
    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "UPDATE ticket SET salida_temporal = NOW() WHERE ticket_id = ?"
        );

        ps.setInt(1, ticketId);
        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
    
    public int minutosDesdeUltimaSalida(String placa) {
    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "SELECT TIMESTAMPDIFF(MINUTE, fecha_salida, NOW()) AS minutos " +
            "FROM ticket " +
            "WHERE placa = ? AND fecha_salida IS NOT NULL " +
            "ORDER BY fecha_salida DESC LIMIT 1"
        );

        ps.setString(1, placa);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("minutos"); 
        }

        return -1; // Nunca ha salido

    } catch (Exception e) {
        e.printStackTrace();
        return -1;
    }
}
    
    
    public boolean tieneTicketActivo(String placa) {
    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "SELECT ticket_id FROM ticket WHERE placa = ? AND fecha_salida IS NULL"
        );
        ps.setString(1, placa);
        ResultSet rs = ps.executeQuery();

        return rs.next(); // TRUE si tiene ticket activo

    } catch (Exception e) {
        JOptionPane.showMessageDialog(null,
            "Error al verificar ticket activo:\n" + e.getMessage());
        return true; // por seguridad NO permitir crear
    }
}
    public boolean crearTicket(String placa, String modo, double monto) {

    try (Connection con = dbConnection.conectar()) {

        // --- OBTENER VEHICULO ---
        PreparedStatement psVeh = con.prepareStatement(
            "SELECT tipo_vehiculo, tipo_area FROM vehiculos WHERE placa = ?"
        );
        psVeh.setString(1, placa);
        ResultSet rv = psVeh.executeQuery();

        if (!rv.next()) {
            JOptionPane.showMessageDialog(null, "Vehículo no registrado.");
            return false;
        }

        String tipoVehiculo = rv.getString("tipo_vehiculo");
        String tipoArea = rv.getString("tipo_area");

        if (tipoVehiculo == null) tipoVehiculo = "";
        if (tipoArea == null) tipoArea = "";

        tipoVehiculo = tipoVehiculo.trim().toUpperCase();
        tipoArea = tipoArea.trim().toUpperCase();

        if (tipoArea.equals("VISITANTE")) tipoArea = "ESTUDIANTE";

        // --- GENERAR VARIANTES DE AREA ---
        List<String> areaCandidates = new ArrayList<>();
        areaCandidates.add(tipoArea);
        areaCandidates.add(tipoArea + "S");
        if (tipoArea.endsWith("S")) {
            areaCandidates.add(tipoArea.substring(0, tipoArea.length() - 1));
        }

        Set<String> temp = new LinkedHashSet<>(areaCandidates);
        areaCandidates = new ArrayList<>(temp);

        // --- BUSCAR SPOT ---
        String foundSpotID = null;
        String foundAreaID = null;

        PreparedStatement psCountArea = con.prepareStatement(
            "SELECT COUNT(*) FROM area WHERE UPPER(nombre) = UPPER(?) AND UPPER(tipo_vehiculo) = UPPER(?)"
        );

        for (String nombreArea : areaCandidates) {

            psCountArea.setString(1, nombreArea);
            psCountArea.setString(2, tipoVehiculo);
            ResultSet rc = psCountArea.executeQuery();
            rc.next();

            if (rc.getInt(1) == 0) continue;

            PreparedStatement psSpot = con.prepareStatement(
                "SELECT s.spot_id, s.area_id FROM spots s " +
                "JOIN area a ON s.area_id = a.area_id " +
                "WHERE UPPER(a.nombre) = UPPER(?) " +
                "AND UPPER(a.tipo_vehiculo) = UPPER(?) " +
                "AND s.status = 'FREE' LIMIT 1"
            );

            psSpot.setString(1, nombreArea);
            psSpot.setString(2, tipoVehiculo);
            ResultSet rs = psSpot.executeQuery();

            if (rs.next()) {
                foundSpotID = rs.getString("spot_id");
                foundAreaID = rs.getString("area_id");
                break;
            }
        }

        if (foundSpotID == null) {
            JOptionPane.showMessageDialog(null,
                "No hay espacios disponibles para este vehículo.",
                "Sin espacio", JOptionPane.WARNING_MESSAGE);
            return false;
        }

        // --- INSERTAR TICKET ---
        PreparedStatement psInsert = con.prepareStatement(
            "INSERT INTO ticket (placa, area_id, spot_id, fecha_ingreso, modo, monto) " +
            "VALUES (?, ?, ?, NOW(), ?, ?)"
        );

        psInsert.setString(1, placa);
        psInsert.setString(2, foundAreaID);
        psInsert.setString(3, foundSpotID);
        psInsert.setString(4, modo);
        psInsert.setDouble(5, monto);

        psInsert.executeUpdate();

        // --- OCUPAR SPOT ---
        PreparedStatement psUpd = con.prepareStatement(
            "UPDATE spots SET status = 'OCCUPIED' WHERE spot_id = ?"
        );
        psUpd.setString(1, foundSpotID);
        psUpd.executeUpdate();

        JOptionPane.showMessageDialog(null, "Ticket creado con éxito.");
        return true;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
    
    public String obtenerEntidadPorPlaca(String placa) {

    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "SELECT tipo_area FROM vehiculos WHERE placa = ?"
        );
        ps.setString(1, placa);

        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            // No existe en vehiculos → visitante por defecto
            return "VISITANTE";
        }

        String tipoArea = rs.getString("tipo_area");

        // Regresar entidad EXACTA del campo tipo_area
        // Ya tienes valores así:
        //  - ESTUDIANTE
        //  - CATEDRATICO
        //  - VISITANTE
        return tipoArea.toUpperCase();

    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}
    
    
    //verificacion placa existente
    public void VerificarPlaca(String placa) {

        // 1. MEJORA: Verificar si es nulo O si está vacío después de limpiar espacios
        if (placa == null || placa.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "Ingrese una placa antes de continuar.");
            return;
        }

        // 2. LA SOLUCIÓN: Limpiar la placa antes de usarla
        // Quita espacios al inicio y al final, y la convierte a mayúsculas
        String placaLimpia = placa.trim().toUpperCase();

        try (Connection con = dbConnection.conectar()) {
            String sql = "SELECT COUNT(*) FROM vehiculos WHERE placa = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            
            // 3. USA LA PLACA LIMPIA en la consulta
            ps.setString(1, placaLimpia);
            
            ResultSet rs = ps.executeQuery();

            rs.next();
            int existe = rs.getInt(1);

            if (existe > 0) {
                JOptionPane.showMessageDialog(null,
                        "Vehículo encontrado. Puede continuar con el ticket.",
                        "Placa existente",
                        JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null,
                        "La placa no está registrada.\nPor favor, llene el formulario de registro.",
                        "Placa no encontrada",
                        JOptionPane.WARNING_MESSAGE);

                RegistrarP registro = new RegistrarP();
                // Si la placa no existe, puedes pasarle la placa limpia 
                // al formulario de registro para que el usuario no la escriba de nuevo.
                // registro.txtPlaca.setText(placaLimpia); 
                registro.setVisible(true);

            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,
                    "Error al verificar placa:\n" + e.getMessage(),
                    "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Ticket obtenerTicketActivoDatos(String placa) {

    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "SELECT ticket_id, modo, fecha_ingreso, salida_temporal, monto " +
            "FROM ticket WHERE placa = ? AND fecha_salida IS NULL"
        );

        ps.setString(1, placa);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Ticket t = new Ticket();
            t.id = rs.getInt("ticket_id");
            t.modo = rs.getString("modo");
            t.ingreso = rs.getTimestamp("fecha_ingreso");
            t.salidaTemporal = rs.getTimestamp("salida_temporal");
            t.monto = rs.getDouble("monto");
            return t;
        }

        return null;

    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}
    
public boolean limpiarSalidaTemporal(int ticketId) {
    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "UPDATE ticket SET salida_temporal = NULL WHERE ticket_id = ?"
        );

        ps.setInt(1, ticketId);
        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
    
    }

