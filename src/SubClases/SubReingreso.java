package SubClases;

import claseprin.dbConnection;
import java.sql.Timestamp;
import java.sql.*;
import javax.swing.JOptionPane;

public class SubReingreso {

    public boolean registrarSalidaTemporal(int ticketId) {
        try (Connection con = dbConnection.conectar()) {

            PreparedStatement ps = con.prepareStatement(
                "UPDATE ticket SET salida_temporal = NOW() WHERE ticket_id = ?"
            );

            ps.setInt(1, ticketId);
            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, 
                "Error guardando salida temporal:\n" + e.getMessage());
            return false;
        }
    }

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

    public Ticket obtenerTicketActivo(String placa) {
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
            System.out.println("Error obtenerTicketActivo: " + e.getMessage());
            return null;
        }
    }

    public long calcularHorasFuera(Timestamp salidaTemporal) {
        long diff = System.currentTimeMillis() - salidaTemporal.getTime();
        return diff / (1000 * 60 * 60);
    }

    public String validarReingreso(String placa) {

        Ticket t = obtenerTicketActivo(placa);

        if (t == null)
            return "NO_TICKET";

        if (t.salidaTemporal == null)
            return "NO_SALIDA_TEMP";

        long horasFuera = calcularHorasFuera(t.salidaTemporal);

        if (t.modo.equalsIgnoreCase("VARIABLE")) {

            int horasCompradas = (int) (t.monto / 2);

            if (horasCompradas <= 2)
                return "NO_APLICA_VARIABLE";

            if (horasFuera > 2)
                return "CADUCADO";

            return "OK";
        }

        if (t.modo.equalsIgnoreCase("FLAT")) {

            if (horasFuera > 2)
                return "CADUCADO";

            return "OK";
        }

        return "ERROR";
    }

    public boolean permitirReingreso(int ticketId) {

    try (Connection con = dbConnection.conectar()) {

        // 1) limpiar salida temporal
        PreparedStatement ps = con.prepareStatement(
            "UPDATE ticket SET salida_temporal = NULL WHERE ticket_id = ?"
        );
        ps.setInt(1, ticketId);
        ps.executeUpdate();

        // 2) cambiar spot a OCCUPIED
        SubParqueo sp = new SubParqueo();
        String spot = sp.obtenerSpotPorTicket(ticketId);

        if (spot != null) {
            sp.marcarOcupado(spot);
        }

        return true;

    } catch (Exception e) {
        System.out.println("Error permitirReingreso: " + e.getMessage());
        return false;
    }
}
    public boolean marcarTemporal(String spotId) {
    try (Connection con = dbConnection.conectar()) {

        PreparedStatement ps = con.prepareStatement(
            "UPDATE spots SET status = 'TEMPORAL' WHERE spot_id = ?"
        );

        ps.setString(1, spotId);
        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
}

