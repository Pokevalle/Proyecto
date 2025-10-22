
package claseprin;
//sql.*este se utilizo para utilizar todas las librerias de sql importado
import java.sql.*;
/**
 *
 * @author Slad
 */
public class dbConnection {
   
   static String url = "jdbc:mysql://localhost:3306/parqueoprueba";
   static String user = "root";
   static String contraseña ="";
    
    
    public static Connection conectar(){
        Connection con = null;
        try{
         Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection(url,user,contraseña);
            System.out.println("Conexion Exitosa");
        }catch (ClassNotFoundException e){
            System.out.println("No se encontro el driver JDBC: " + e.getMessage());
        }
        
        catch(SQLException e)
        {
            System.out.println("Error " + e.getMessage());
        }
        return con;
    }
           
            
    
}
