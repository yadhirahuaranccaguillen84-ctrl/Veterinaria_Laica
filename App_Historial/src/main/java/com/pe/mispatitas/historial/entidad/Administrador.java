/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidad;

/**
 * Clase que representa la entidad Administrador del sistema de veterinaria.
 * Contiene la información personal y de acceso de un administrador.
 * 
 * @author Anai Huarancca
 */
public class Administrador {
    // Identificador único del administrador
    private Integer idAdministrador;
    // Nombre del administrador
    private String nombreAdministrador;
    // Apellido del administrador
    private String apellidoAdministrador;
    // Correo electrónico del administrador (usado para login)
    private String correo;
    // Contraseña del administrador
    private String contra;



    /**
     * Constructor por defecto sin parámetros.
     */
    public Administrador() {}

    /**
     * Constructor completo con todos los parámetros.
     * 
     * @param idAdministrador Identificador único del administrador
     * @param nombreAdministrador Nombre del administrador
     * @param apellidoAdministrador Apellido del administrador
     * @param correo Correo electrónico del administrador
     * @param contra Contraseña del administrador
     */
    public Administrador(Integer idAdministrador, String nombreAdministrador, String apellidoAdministrador, String correo, String contra) {
        this.idAdministrador = idAdministrador;
        this.nombreAdministrador = nombreAdministrador;
        this.apellidoAdministrador = apellidoAdministrador;
        this.correo = correo;
        this.contra = contra;
    }

    /**
     * Obtiene el identificador único del administrador.
     * 
     * @return El ID del administrador
     */
    public Integer getIdAdministrador() {
        return idAdministrador;
    }

    /**
     * Establece el identificador único del administrador.
     * 
     * @param idAdministrador El ID del administrador
     */
    public void setIdAdministrador(Integer idAdministrador) {
        this.idAdministrador = idAdministrador;
    }

    /**
     * Obtiene el nombre del administrador.
     * 
     * @return El nombre del administrador
     */
    public String getNombreAdministrador() {
        return nombreAdministrador;
    }

    /**
     * Establece el nombre del administrador.
     * 
     * @param nombreAdministrador El nombre del administrador
     */
    public void setNombreAdministrador(String nombreAdministrador) {
        this.nombreAdministrador = nombreAdministrador;
    }

    /**
     * Obtiene el apellido del administrador.
     * 
     * @return El apellido del administrador
     */
    public String getApellidoAdministrador() {
        return apellidoAdministrador;
    }

    /**
     * Establece el apellido del administrador.
     * 
     * @param apellidoAdministrador El apellido del administrador
     */
    public void setApellidoAdministrador(String apellidoAdministrador) {
        this.apellidoAdministrador = apellidoAdministrador;
    }

    /**
     * Obtiene el correo electrónico del administrador.
     * 
     * @return El correo electrónico del administrador
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * Establece el correo electrónico del administrador.
     * 
     * @param correo El correo electrónico del administrador
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * Obtiene la contraseña del administrador.
     * 
     * @return La contraseña del administrador
     */
    public String getContra() {
        return contra;
    }

    /**
     * Establece la contraseña del administrador.
     * 
     * @param contra La contraseña del administrador
     */
    public void setContra(String contra) {
        this.contra = contra;
    }
    
}
