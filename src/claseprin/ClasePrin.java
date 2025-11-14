package claseprin;
/**
 *
 * @author Slad
 */
public class ClasePrin {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
       Login ingresar = new Login();
       ingresar.setVisible(true);
       dbConnection dbc = new dbConnection();
       dbc.conectar();
       
       
       
       
    }
    
}
