
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
      try{
            return DriverManager.getConnection(url, user, contraseña);
        } catch(SQLException e) {
            System.out.println("Error de conexión: " + e.getMessage());
            return null; //Devuelve null en caso de error
        }
    }
           
            
    
}
