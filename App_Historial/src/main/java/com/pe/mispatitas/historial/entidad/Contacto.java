/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidad;

/**
 * Clase que representa la entidad Contacto del sistema de veterinaria.
 * Almacena los mensajes de contacto enviados por los usuarios al sistema.
 * 
 * @author Anai Huarancca
 */
public class Contacto {
    // Identificador único del mensaje de contacto
    private Integer idContacto;
    // Identificador del usuario que envió el mensaje
    private Integer idUsuario;
    // Contenido del mensaje de contacto
    private String mensaje;
    // Nombre del usuario que envió el mensaje
    private String nombreUsuario;
    // Teléfono del usuario que envió el mensaje
    private String telefonoUsuario;
    /**
     * Constructor por defecto sin parámetros.
     */
    public Contacto() {
    }

    /**
     * Obtiene el nombre del usuario que envió el mensaje.
     * 
     * @return El nombre del usuario
     */
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    /**
     * Establece el nombre del usuario que envió el mensaje.
     * 
     * @param nombreUsuario El nombre del usuario
     */
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    /**
     * Obtiene el teléfono del usuario que envió el mensaje.
     * 
     * @return El teléfono del usuario
     */
    public String getTelefonoUsuario() {
        return telefonoUsuario;
    }

    /**
     * Establece el teléfono del usuario que envió el mensaje.
     * 
     * @param telefonoUsuario El teléfono del usuario
     */
    public void setTelefonoUsuario(String telefonoUsuario) {
        this.telefonoUsuario = telefonoUsuario;
    }

    /**
     * Constructor con parámetros básicos.
     * 
     * @param idContacto Identificador único del mensaje de contacto
     * @param idUsuario Identificador del usuario que envió el mensaje
     * @param mensaje Contenido del mensaje de contacto
     */
    public Contacto(Integer idContacto, Integer idUsuario, String mensaje) {
        this.idContacto = idContacto;
        this.idUsuario = idUsuario;
        this.mensaje = mensaje;
    }

    /**
     * Obtiene el identificador único del mensaje de contacto.
     * 
     * @return El ID del contacto
     */
    public Integer getIdContacto() {
        return idContacto;
    }

    /**
     * Establece el identificador único del mensaje de contacto.
     * 
     * @param idContacto El ID del contacto
     */
    public void setIdContacto(Integer idContacto) {
        this.idContacto = idContacto;
    }

    /**
     * Obtiene el identificador del usuario que envió el mensaje.
     * 
     * @return El ID del usuario
     */
    public Integer getIdUsuario() {
        return idUsuario;
    }

    /**
     * Establece el identificador del usuario que envió el mensaje.
     * 
     * @param idUsuario El ID del usuario
     */
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * Obtiene el contenido del mensaje de contacto.
     * 
     * @return El mensaje de contacto
     */
    public String getMensaje() {
        return mensaje;
    }

    /**
     * Establece el contenido del mensaje de contacto.
     * 
     * @param mensaje El mensaje de contacto
     */
    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }



}
