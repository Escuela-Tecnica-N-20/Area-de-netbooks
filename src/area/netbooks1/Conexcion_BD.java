
package area.netbooks1;

import java.sql.*;
import javax.swing.JOptionPane;


public class Conexcion_BD {


       Connection enlazar = null;
    public Connection Conectar(){
try {
Class.forName("com.mysql.jdbc.Driver");
enlazar = DriverManager.getConnection("jdbc:mysql://localhost/area_netbooks", "root", "");
} 
catch (ClassNotFoundException | SQLException e) {
JOptionPane.showMessageDialog(null, e + "No se pudo conectar a la Base de Datos");
}
return enlazar;  
}
}
