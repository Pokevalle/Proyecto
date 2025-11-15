/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SubClases;
import claseprin.dbConnection;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Slad
 */
public class SubReportes {

    // Clase interna para retornar datos a la tabla
    public static class TicketReporte {
        public int id;
        public String placa;
        public String modo;
        public Timestamp ingreso;
        public Timestamp salida;
        public double monto;
    }


    public ArrayList<TicketReporte> obtenerTicketsDelDia() {

        ArrayList<TicketReporte> lista = new ArrayList<>();

        String sql =
            "SELECT ticket_id, placa, modo, fecha_ingreso, fecha_salida, monto " +
            "FROM ticket " +
            "WHERE DATE(fecha_salida) = CURDATE()";

        try (Connection con = dbConnection.conectar();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                TicketReporte tr = new TicketReporte();
                tr.id = rs.getInt("ticket_id");
                tr.placa = rs.getString("placa");
                tr.modo = rs.getString("modo");
                tr.ingreso = rs.getTimestamp("fecha_ingreso");
                tr.salida = rs.getTimestamp("fecha_salida");
                tr.monto = rs.getDouble("monto");

                lista.add(tr);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    public double obtenerTotalDelDia() {

        String sql =
            "SELECT SUM(monto) AS total FROM ticket WHERE DATE(fecha_salida) = CURDATE()";

        try (Connection con = dbConnection.conectar();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getDouble("total");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}

