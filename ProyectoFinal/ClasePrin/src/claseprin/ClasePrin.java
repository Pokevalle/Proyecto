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
       dbConnection dbc = new dbConnection();
       dbc.conectar();
       SubClasAreas areas = new SubClasAreas();
       areas.mostrarAreas();
       
    }
    
}
