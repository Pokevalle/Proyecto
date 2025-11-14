/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SubClases;


import claseprin.dbConnection;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import java.sql.*;


/**
 *
 * @author Slad
 */
public class SubPersona {
    public String placa;
    public String carnet;
    public String nombres;
    public String apellidos;
    public String telefono;
    public double saldo;
    public String tipoVehiculo;
    public String tipoarea;

    public  SubPersona(String placa, String carnet, String nombres, String apellidos, String telefono,double saldo, String tipoVehiculo, String tipoarea) {
        this.placa = placa;
    this.carnet = carnet;
    this.nombres = nombres;
    this.apellidos = apellidos;
    this.telefono = telefono; 
    this.saldo = saldo; 
    this.tipoVehiculo = tipoVehiculo;
    this.tipoarea = tipoarea;
    }
public SubPersona() {
      
    }
    public String getPlaca() {
        return placa;
    }

    public String getCarnet() {
        return carnet;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getTelefono() {
        return telefono;
    }
    public double getSaldo() {
        return saldo;
    }

    public String getTipoVehiculo() {
        return tipoVehiculo;
    }

    public String getTipoarea() {
        return tipoarea;
    }

public void CrearPersona(SubPersona p) {

    // Validar campos obligatorios
    if (p.placa.isEmpty() || p.carnet.isEmpty() || p.nombres.isEmpty() ||
        p.apellidos.isEmpty() || p.telefono.isEmpty() || p.tipoarea.isEmpty()) {

        JOptionPane.showMessageDialog(null, "Debe llenar todos los campos obligatorios.");
        return;
    }

    try (Connection con = dbConnection.conectar()) {
        con.setAutoCommit(false);

        // 🔹 Verificar carnet duplicado
        String checkCarnet = "SELECT COUNT(*) FROM personas WHERE carnet = ?";
        PreparedStatement psCheck = con.prepareStatement(checkCarnet);
        psCheck.setString(1, p.getCarnet());
        ResultSet rs = psCheck.executeQuery();
        rs.next();

        if (rs.getInt(1) > 0) {
            JOptionPane.showMessageDialog(null, "El carnet ya está registrado.");
            return;
        }

        // 🔹 Validar saldo solo si NO es visitante
        if (!p.tipoarea.equalsIgnoreCase("VISITANTE")) {

            if (p.getSaldo() < 0) {
                JOptionPane.showMessageDialog(null,
                    "El saldo no puede ser negativo.");
                return;
            }
        }

        // 🔹 Insertar persona
        String sqlPersona = "INSERT INTO personas (placa, carnet, nombres, apellidos, telefono, saldos) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement psPersona = con.prepareStatement(sqlPersona);
        psPersona.setString(1, p.getPlaca());
        psPersona.setString(2, p.getCarnet());
        psPersona.setString(3, p.getNombres());
        psPersona.setString(4, p.getApellidos());
        psPersona.setString(5, p.getTelefono());

        if (p.tipoarea.equalsIgnoreCase("VISITANTE")) {
            psPersona.setNull(6, java.sql.Types.DOUBLE);
        } else {
            psPersona.setDouble(6, p.getSaldo());
        }

        psPersona.executeUpdate();

        // 🔹 Insertar vehículo
        String sqlVehiculo = "INSERT INTO vehiculos (placa, tipo_vehiculo, tipo_area) VALUES (?, ?, ?)";
        PreparedStatement psVehiculo = con.prepareStatement(sqlVehiculo);
        psVehiculo.setString(1, p.getPlaca());
        psVehiculo.setString(2, p.getTipoVehiculo());
        psVehiculo.setString(3, p.getTipoarea());
        psVehiculo.executeUpdate();

        con.commit();
        JOptionPane.showMessageDialog(null, "Registro guardado correctamente.");

    } catch (SQLIntegrityConstraintViolationException e) {
        JOptionPane.showMessageDialog(null, "La placa o el carnet ya existen.");
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, "Error al registrar:\n" + e.getMessage());
    }
}

    
    //Funcion que carga el archivo csv
    public void CargarPersona(JTable tabla){
    //titulo
    JFileChooser chooser = new JFileChooser();
    chooser.setDialogTitle("Selecciona el archivo de Personas");
    int resultado = chooser.showOpenDialog(null);
    if (resultado == JFileChooser.APPROVE_OPTION){
        String ruta = chooser.getSelectedFile().getAbsolutePath();
        
        List<String[]> datos = new ArrayList<>();
        
        try(BufferedReader br = new BufferedReader(new FileReader(ruta))){
            String linea;
            while((linea = br.readLine())!= null){
            if(linea.trim().isEmpty()) continue;
            String[] partes = linea.split(",");
            if(partes.length == 5) {
                datos.add(new String[]{
                partes[0].trim(),
                partes[1].trim(),
                partes[2].trim(),
                partes[3].trim(),
                partes[4].trim()
                        });
            }
        }
        } catch (IOException e){
            JOptionPane.showMessageDialog(null, "Error al leer Archivo:\\n" + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return;
            
        }
        DefaultTableModel modelo = new DefaultTableModel(new String[]{"Placa","Carnet","Nombres", "Apellidos", "Telefono"}, 0);
        for(String[] fila : datos){
            modelo.addRow(fila);
        }
        tabla.setModel(modelo);
        
        //Mensaje si quiere cargar a la base de datos
        
        int confirm = JOptionPane.showConfirmDialog(null, "¿Desea Cargar el archivo " + chooser.getSelectedFile().getName() + " (Tabla: Personas)?", " Subir Archivo a MySQL", JOptionPane.YES_NO_OPTION);
        //aqui le pide que confirme y luego de que confirme llama a la funcion
        if(confirm == JOptionPane.YES_OPTION){
            SubirDatosMySQL(datos,"Personas");
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
            String sqlInsert = "INSERT INTO personas (placa, carnet, nombres, apellidos, telefono) VALUES (?, ?, ?, ?, ?)";
            String sqlCheck = "SELECT COUNT(*) FROM personas WHERE carnet = ?";
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
                psInsert.setString(5, fila[4]);
                psInsert.addBatch();
                insertados++;
            }

            psInsert.executeBatch();

            if (repetidos == 1)
                JOptionPane.showMessageDialog(null, "1 registro no se pudo cargar por estar duplicado.");
            else if (repetidos > 1)
                JOptionPane.showMessageDialog(null, repetidos + " registros no se pudieron cargar por duplicados.");

            JOptionPane.showMessageDialog(null, "Se cargaron correctamente " + insertados + " registros.");

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al subir a MySQL:\n" + e.getMessage());
        }
    }
}
