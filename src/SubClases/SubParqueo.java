/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SubClases;
import claseprin.dbConnection;
import java.sql.*;
/**
 *
 * @author Slad
 */
public class SubParqueo {

   public String obtenerSpotPorTicket(int ticketId) {
        try (Connection con = dbConnection.conectar()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT spot_id FROM ticket WHERE ticket_id = ?"
            );

            ps.setInt(1, ticketId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("spot_id");
            }

            return null;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 🔥 Aquí está el método que te falta
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

    public boolean marcarOcupado(String spotId) {
        try (Connection con = dbConnection.conectar()) {

            PreparedStatement ps = con.prepareStatement(
                "UPDATE spots SET status = 'OCCUPIED' WHERE spot_id = ?"
            );

            ps.setString(1, spotId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

