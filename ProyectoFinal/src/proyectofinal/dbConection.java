package proyectofinal;

import java.sql.*;

/**
 *
 * @author SlayerX
 */
public class dbConection {
    static String url="jdbc:mysql://localhost";
   static String user= "root";
   static String pass= "";
    
    public static Connection conectar (){
        Connection con = null;
        try{
            con=DriverManager.getConnection(url,user,pass);
            System.out.println("Conexion Exitosa");
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
       return con;
    }
}
