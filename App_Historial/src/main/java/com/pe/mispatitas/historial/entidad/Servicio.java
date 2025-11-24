/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidad;

import java.io.InputStream;

/**
 * Clase que representa la entidad Servicio del sistema de veterinaria.
 * Almacena la información de los servicios ofrecidos por la clínica veterinaria.
 * 
 * @author Anai Huarancca
 */
public class Servicio {
    
    // Identificador único del servicio
    private Integer idServicio;
    // Nombre del servicio
    private String nombre;
    // Descripción detallada del servicio
    private String descripcion;
    // Foto del servicio como InputStream
    private InputStream foto;
    // Imagen del servicio codificada en Base64 para visualización web
    private String imagenBase64;


    /**
     * Constructor por defecto sin parámetros.
     */
    public Servicio() {
    }

    /**
     * Constructor con parámetros básicos (sin foto).
     * 
     * @param idServicio Identificador único del servicio
     * @param nombre Nombre del servicio
     * @param descripcion Descripción del servicio
     */
    public Servicio(Integer idServicio, String nombre, String descripcion) {
        this.idServicio = idServicio;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    /**
     * Constructor completo con todos los parámetros incluyendo foto.
     * 
     * @param idServicio Identificador único del servicio
     * @param nombre Nombre del servicio
     * @param descripcion Descripción del servicio
     * @param foto Foto del servicio
     */
    public Servicio(Integer idServicio, String nombre, String descripcion, InputStream foto) {
        this.idServicio = idServicio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.foto = foto;
    }

    /**
     * Obtiene la imagen del servicio codificada en Base64.
     * 
     * @return La imagen en Base64
     */
    public String getImagenBase64() {
        return imagenBase64;
    }

    /**
     * Establece la imagen del servicio codificada en Base64.
     * 
     * @param imagenBase64 La imagen en Base64
     */
    public void setImagenBase64(String imagenBase64) {
        this.imagenBase64 = imagenBase64;
    }

    /**
     * Obtiene el identificador único del servicio.
     * 
     * @return El ID del servicio
     */
    public Integer getIdServicio() {
        return idServicio;
    }

    /**
     * Establece el identificador único del servicio.
     * 
     * @param idServicio El ID del servicio
     */
    public void setIdServicio(Integer idServicio) {
        this.idServicio = idServicio;
    }

    /**
     * Obtiene el nombre del servicio.
     * 
     * @return El nombre del servicio
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Establece el nombre del servicio.
     * 
     * @param nombre El nombre del servicio
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Obtiene la descripción del servicio.
     * 
     * @return La descripción del servicio
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Establece la descripción del servicio.
     * 
     * @param descripcion La descripción del servicio
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Obtiene la foto del servicio como InputStream.
     * 
     * @return La foto como InputStream
     */
    public InputStream getFoto() {
        return foto;
    }

    /**
     * Establece la foto del servicio como InputStream.
     * 
     * @param foto La foto como InputStream
     */
    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

   
    
    
}
