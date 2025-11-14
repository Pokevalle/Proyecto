
package SubClases;

import ClaseVentanas.RegistrarP;
import claseprin.dbConnection;
import javax.swing.JOptionPane;
import java.sql.*;

/**
 *
 * @author Slad
 */
public class SubTicket {
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
    }

