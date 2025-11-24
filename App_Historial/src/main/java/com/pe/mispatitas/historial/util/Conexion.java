package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase de utilidad para gestionar la conexión a la base de datos MySQL.
 * Proporciona métodos para establecer y obtener conexiones a la base de datos.
 * 
 * @author Anai Huarancca
 */
public class Conexion {

    // URL de conexión a la base de datos MySQL
    private final String URL = "jdbc:mysql://localhost:3306/testingveterinaria";
    // Driver JDBC para MySQL
    private final String DRIVER = "com.mysql.cj.jdbc.Driver";
    // Usuario de la base de datos
    private final String USER = "root";
    // Contraseña de la base de datos
    private final String PASS = "";

    /**
     * Establece y retorna una conexión a la base de datos MySQL.
     * Carga el driver JDBC y crea la conexión usando las credenciales configuradas.
     * 
     * @return Objeto Connection que representa la conexión a la base de datos
     * @throws SQLException Si ocurre un error al establecer la conexión o cargar el driver
     */
    public Connection getConexion() throws SQLException {
        Connection c = null;
        try {
            // Carga el driver JDBC de MySQL
            Class.forName(DRIVER).newInstance();
            // Establece la conexión con la base de datos
            c = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException
                | IllegalAccessException
                | InstantiationException
                | SQLException e) {
            // Propaga la excepción con el mensaje de error
            throw new SQLException(e.getMessage());
        }

        return c;

    }

}
