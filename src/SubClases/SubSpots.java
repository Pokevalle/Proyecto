/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SubClases;

import claseprin.dbConnection;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;



/**
 *
 * @author Slad
 */
public class SubSpots {
    //porcentaje :D
    public double getPorcentaje(String areaNombre, String tipoVehiculo) {

    double ocupados = 0;
    double capacidad = 0;

    String sqlOcupados = 
        "SELECT COUNT(*) FROM spots s " +
        "JOIN area a ON s.area_id = a.area_id " +
        "WHERE a.nombre=? AND s.tipo_vehiculo=? AND s.status='OCUPADO'";

    String sqlCapacidad = 
        "SELECT SUM(capacidad) FROM area WHERE nombre=? AND tipo_vehiculo=?";

    try (Connection con = dbConnection.conectar();
         PreparedStatement ps1 = con.prepareStatement(sqlOcupados);
         PreparedStatement ps2 = con.prepareStatement(sqlCapacidad)) {

        ps1.setString(1, areaNombre);
        ps1.setString(2, tipoVehiculo);

        ResultSet rs1 = ps1.executeQuery();
        if (rs1.next()) ocupados = rs1.getInt(1);

        ps2.setString(1, areaNombre);
        ps2.setString(2, tipoVehiculo);

        ResultSet rs2 = ps2.executeQuery();
        if (rs2.next()) capacidad = rs2.getInt(1);

    } catch (Exception e) {
        e.printStackTrace();
    }

    if (capacidad == 0) return 0;
    return (ocupados * 100.0) / capacidad;
}
    
    
    
    
    //otra funcion
     public void CargarSpots(JTable tabla){
    
    JFileChooser chooser = new JFileChooser();
    chooser.setDialogTitle("Selecciona el archivo de Spots");
    int resultado = chooser.showOpenDialog(null);
    if (resultado == JFileChooser.APPROVE_OPTION){
        String ruta = chooser.getSelectedFile().getAbsolutePath();
        
        List<String[]> datos = new ArrayList<>();
        
        try(BufferedReader br = new BufferedReader(new FileReader(ruta))){
            String linea;
            while((linea = br.readLine())!= null){
            if(linea.trim().isEmpty()) continue;
            String[] partes = linea.split(",");
            if(partes.length == 4) {
                datos.add(new String[]{
                partes[0].trim(),
                partes[1].trim(),
                partes[2].trim(),
                partes[3].trim()
                        });
            }
        }
        } catch (IOException e){
            JOptionPane.showMessageDialog(null, "Error al leer Archivo:\\n" + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return;
            
        }
        DefaultTableModel modelo = new DefaultTableModel(new String[]{"Id Spot","Area Id", "Tipo de Vehiculo", "Status"}, 0);
        for(String[] fila : datos){
            modelo.addRow(fila);
        }
        tabla.setModel(modelo);
        
        //Mensaje si quiere cargar a la base de datos
        
        int confirm = JOptionPane.showConfirmDialog(null, "¿Desea Cargar el archivo " + chooser.getSelectedFile().getName() + " (Tabla: Spots)?", " Subir Archivo a MySQL", JOptionPane.YES_NO_OPTION);
        //aqui le pide que confirme y luego de que confirme llama a la funcion
        if(confirm == JOptionPane.YES_OPTION){
            SubirDatosMySQL(datos,"spots");
        }
    }
}
    //funcion que llama el JOption
    public void SubirDatosMySQL(List<String[]> datos, String nombreTabla){
       try (Connection con = dbConnection.conectar()) {
            if (con == null) {
                JOptionPane.showMessageDialog(null, "Error: No se pudo conectar a la base de datos.");
                return;
            }
            String sqlInsert = "INSERT INTO spots (spot_id, area_id, tipo_vehiculo, status) VALUES (?, ?, ?, ?)";
            String sqlCheck = "SELECT COUNT(*) FROM spots WHERE spot_id = ?";
            PreparedStatement psInsert = con.prepareStatement(sqlInsert);
            PreparedStatement psCheck = con.prepareStatement(sqlCheck);

            int insertados = 0, repetidos = 0;

            for (String[] fila : datos) {
                psCheck.setString(1, fila[0]);
                ResultSet rs = psCheck.executeQuery();
                rs.next();

                if (rs.getInt(1) > 0) {
                    repetidos++;
                    continue;
                }

                psInsert.setString(1, fila[0]);
                psInsert.setString(2, fila[1]);
                psInsert.setString(3, fila[2]);
                psInsert.setString(4, fila[3]);
                psInsert.addBatch();
                insertados++;
            }

            psInsert.executeBatch();

            if (repetidos == 1)
                JOptionPane.showMessageDialog(null, "⚠ 1 registro no se pudo cargar por estar duplicado.");
            else if (repetidos > 1)
                JOptionPane.showMessageDialog(null, "⚠ " + repetidos + " registros no se pudieron cargar por duplicados.");

            JOptionPane.showMessageDialog(null, "✅ Se cargaron correctamente " + insertados + " registros.");

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al subir a MySQL:\n" + e.getMessage());
        }
}
}
