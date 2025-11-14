package claseprin;
import java.sql.*;
import javax.swing.JOptionPane;
//se agrego por la para la tabla
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Slad
 */
public class SubClasAreas {
    //Mostrar Tabla de Areas
     public static void mostrarAreas(JTable tabla) {
       try (Connection con = dbConnection.conectar();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM area")) {

        //crea el modelo Tabla:
        DefaultTableModel modelo = new DefaultTableModel();
        modelo.addColumn("Area ID");
        modelo.addColumn("Nombre");
        modelo.addColumn("Capacidad");
        modelo.addColumn("Tipo Vehiculo");
        
        while (rs.next()){
            Object[] fila = new Object [4];
            fila[0] = rs.getString("area_id");
            fila[1] = rs.getString("nombre");
            fila[2] = rs.getInt("capacidad");
            fila[3] = rs.getString("tipo_vehiculo");
            modelo.addRow(fila);
            
        }
        //asigna a la tabla correspondiente
        tabla.setModel(modelo);
         } catch (Exception e) {
        javax.swing.JOptionPane.showMessageDialog(null,"Error al cargar las áreas:\n" + e.getMessage());
    }
    }
     
     
     public static boolean crearArea(String areaId, String nombre, int capacidad, String tipoVehiculo) {
    // Validar tipo de vehículo
    if (!tipoVehiculo.equals("AUTO") && !tipoVehiculo.equals("MOTO")) {
        JOptionPane.showMessageDialog(null, "Tipo de vehículo inválido. Solo: AUTO o MOTO");
        return false;
    }
    
    // Validar capacidad
    if (capacidad < 1 || capacidad > 100) {
        JOptionPane.showMessageDialog(null, "Capacidad debe ser entre 1 y 100");
        return false;
    }
    
    // Validar que area_id no exista
    if (existeArea(areaId)) {
        JOptionPane.showMessageDialog(null, "El Area ID " + areaId + " ya existe");
        return false;
    }
    
    String sql = "INSERT INTO area (area_id, nombre, capacidad, tipo_vehiculo) VALUES (?, ?, ?, ?)";
    
    try (Connection con = dbConnection.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setString(1, areaId.toUpperCase());
        ps.setString(2, nombre.toUpperCase());
        ps.setInt(3, capacidad);
        ps.setString(4, tipoVehiculo);
        
        int filasAfectadas = ps.executeUpdate();
        return filasAfectadas > 0;
        
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "Error al crear área:\n" + e.getMessage());
        return false;
    }
}

// MÉTODO AUXILIAR: Verificar si área existe
private static boolean existeArea(String areaId) {
    String sql = "SELECT COUNT(*) FROM area WHERE area_id = ?";
    
    try (Connection con = dbConnection.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setString(1, areaId.toUpperCase());
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
        
    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "Error al verificar área: " + e.getMessage());
    }
    return false;
}   
}
