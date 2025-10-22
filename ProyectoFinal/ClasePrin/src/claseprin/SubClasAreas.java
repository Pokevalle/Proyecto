package claseprin;
import java.sql.*;
/**
 *
 * @author Slad
 */
public class SubClasAreas {
     public void mostrarAreas() {
        // Conectarse a la base
        Connection con = dbConnection.conectar();
        if (con == null) {
            System.out.println("No se pudo conectar a la base de datos.");
            return;
        }

        try {
            // Crear un objeto Statement para hacer consultas SQL
            Statement stmt = con.createStatement();

            // Ejecutar una consulta
            String sql = "SELECT * FROM areas_sin_capacidad";
            ResultSet rs = stmt.executeQuery(sql);

            // Mostrar encabezado
            System.out.println("area_id | nombre | tipo_vehiculo");
            System.out.println("--------------------------------");

            // Recorrer los resultados
            while (rs.next()) {
                String id = rs.getString("area_id");
                String nombre = rs.getString("nombre");
                String tipo = rs.getString("tipo_vehiculo");
                System.out.println(id + " | " + nombre + " | " + tipo);
            }

            // Cerrar recursos
            rs.close();
            stmt.close();
            con.close();
} catch (SQLException e) {
            System.out.println("Error al leer: " + e.getMessage());
        }
    }
}
