package claseprin;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class SubAreas {
   public void CargarArea(JTable tabla){
    
    JFileChooser chooser = new JFileChooser();
    chooser.setDialogTitle("Selecciona el archivo de Area");
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
        DefaultTableModel modelo = new DefaultTableModel(new String[]{"Area Id","Nombre", "Capacidad", "Tipo de Vehiculo"}, 0);
        for(String[] fila : datos){
            modelo.addRow(fila);
        }
        tabla.setModel(modelo);
        
        //Mensaje si quiere cargar a la base de datos
        
        int confirm = JOptionPane.showConfirmDialog(null, "¿Desea Cargar el archivo " + chooser.getSelectedFile().getName() + " (Tabla: Area)?", " Subir Archivo a MySQL", JOptionPane.YES_NO_OPTION);
        //aqui le pide que confirme y luego de que confirme llama a la funcion
        if(confirm == JOptionPane.YES_OPTION){
            SubirDatosMySQL(datos,"Area");
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
            String sqlInsert = "INSERT INTO area (area_id, nombre, capacidad, tipo_vehiculo) VALUES (?, ?, ?, ?)";
            String sqlCheck = "SELECT COUNT(*) FROM area WHERE area_id = ?";
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
