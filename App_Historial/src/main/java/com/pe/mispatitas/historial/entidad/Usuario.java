
package entidad;

/**
 * Clase que representa la entidad Usuario del sistema de veterinaria.
 * Almacena la información de los usuarios/clientes que utilizan el sistema.
 * 
 * @author Anai Huarancca
 */
public class Usuario {
    
    // Identificador único del usuario
    private Integer idUsuario;
    // Nombre completo del usuario
    private String nombreUsuario;
    // Correo electrónico del usuario (usado para login)
    private String correoUsuario;
    // Teléfono de contacto del usuario
    private String telefono;
    // Contraseña del usuario
    private String contra;

    /**
     * Constructor por defecto sin parámetros.
     */
    public Usuario() {
    }

    /**
     * Constructor completo con todos los parámetros.
     * 
     * @param idUsuario Identificador único del usuario
     * @param nombreUsuario Nombre completo del usuario
     * @param correoUsuario Correo electrónico del usuario
     * @param telefono Teléfono de contacto
     * @param contra Contraseña del usuario
     */
    public Usuario(Integer idUsuario, String nombreUsuario, String correoUsuario, String telefono, String contra) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.correoUsuario = correoUsuario;
        this.telefono = telefono;
        this.contra = contra;
    }

    /**
     * Obtiene el identificador único del usuario.
     * 
     * @return El ID del usuario
     */
    public Integer getIdUsuario() {
        return idUsuario;
    }

    /**
     * Establece el identificador único del usuario.
     * 
     * @param idUsuario El ID del usuario
     */
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * Obtiene el nombre completo del usuario.
     * 
     * @return El nombre del usuario
     */
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    /**
     * Establece el nombre completo del usuario.
     * 
     * @param nombreUsuario El nombre del usuario
     */
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    /**
     * Obtiene el correo electrónico del usuario.
     * 
     * @return El correo electrónico
     */
    public String getCorreoUsuario() {
        return correoUsuario;
    }

    /**
     * Establece el correo electrónico del usuario.
     * 
     * @param correoUsuario El correo electrónico
     */
    public void setCorreoUsuario(String correoUsuario) {
        this.correoUsuario = correoUsuario;
    }

    /**
     * Obtiene el teléfono de contacto del usuario.
     * 
     * @return El teléfono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Establece el teléfono de contacto del usuario.
     * 
     * @param telefono El teléfono
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * Obtiene la contraseña del usuario.
     * 
     * @return La contraseña
     */
    public String getContra() {
        return contra;
    }

    /**
     * Establece la contraseña del usuario.
     * 
     * @param contra La contraseña
     */
    public void setContra(String contra) {
        this.contra = contra;
    }
    
    
    
    
}
