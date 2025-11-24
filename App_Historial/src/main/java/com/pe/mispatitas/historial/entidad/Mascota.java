package entidad;

import java.io.InputStream;

/**
 * Clase que representa la entidad Mascota del sistema de veterinaria.
 * Almacena toda la información relacionada con las mascotas registradas en el sistema.
 * 
 * @author Anai Huarancca
 */
public class Mascota {

    // Identificador único de la mascota
    private Integer idMascota;
    // Identificador del usuario propietario de la mascota
    private Integer idUsuario;
    // Nombre de la mascota
    private String nombreMascota;
    // Fecha de nacimiento de la mascota
    private String fechaNacimiento;
    // Especie de la mascota (perro, gato, etc.)
    private String especie;
    // Raza de la mascota
    private String razaMascota;
    // Descripción adicional de la mascota
    private String descripcion;
    // Sexo de la mascota
    private String sexo;
    // Foto de la mascota como InputStream
    private InputStream foto;
    // Imagen de la mascota codificada en Base64 para visualización web
    private String imagenBase64;
    // Nombre del usuario propietario (atributo auxiliar para consultas)
    private String nombreUsuario;
    // Tratamiento más reciente (atributo auxiliar para consultas)
    private String tratamiento;
    // Fecha del historial más reciente (atributo auxiliar para consultas)
    private String fechaHistorial;

    /**
     * Constructor por defecto sin parámetros.
     */
    public Mascota() {
    }

    /**
     * Constructor completo con todos los parámetros.
     * 
     * @param idMascota Identificador único de la mascota
     * @param idUsuario Identificador del usuario propietario
     * @param nombreMascota Nombre de la mascota
     * @param fechaNacimiento Fecha de nacimiento
     * @param especie Especie de la mascota
     * @param razaMascota Raza de la mascota
     * @param descripcion Descripción adicional
     * @param sexo Sexo de la mascota
     * @param foto Foto de la mascota
     */
    public Mascota(Integer idMascota, Integer idUsuario, String nombreMascota, String fechaNacimiento, String especie, String razaMascota, String descripcion, String sexo, InputStream foto) {
        this.idMascota = idMascota;
        this.idUsuario = idUsuario;
        this.nombreMascota = nombreMascota;
        this.fechaNacimiento = fechaNacimiento;
        this.razaMascota = razaMascota;
        this.descripcion = descripcion;
        this.sexo = sexo;
        this.foto = foto;
        this.especie=especie;
    }

    /**
     * Obtiene el identificador único de la mascota.
     * 
     * @return El ID de la mascota
     */
    public Integer getIdMascota() {
        return idMascota;
    }

    /**
     * Establece el identificador único de la mascota.
     * 
     * @param idMascota El ID de la mascota
     */
    public void setIdMascota(Integer idMascota) {
        this.idMascota = idMascota;
    }

    /**
     * Obtiene el identificador del usuario propietario.
     * 
     * @return El ID del usuario
     */
    public Integer getIdUsuario() {
        return idUsuario;
    }

    /**
     * Establece el identificador del usuario propietario.
     * 
     * @param idUsuario El ID del usuario
     */
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * Obtiene el nombre de la mascota.
     * 
     * @return El nombre de la mascota
     */
    public String getNombreMascota() {
        return nombreMascota;
    }

    /**
     * Establece el nombre de la mascota.
     * 
     * @param nombreMascota El nombre de la mascota
     */
    public void setNombreMascota(String nombreMascota) {
        this.nombreMascota = nombreMascota;
    }

    /**
     * Obtiene la fecha de nacimiento de la mascota.
     * 
     * @return La fecha de nacimiento
     */
    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * Establece la fecha de nacimiento de la mascota.
     * 
     * @param fechaNacimiento La fecha de nacimiento
     */
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * Obtiene la raza de la mascota.
     * 
     * @return La raza de la mascota
     */
    public String getRazaMascota() {
        return razaMascota;
    }

    /**
     * Establece la raza de la mascota.
     * 
     * @param razaMascota La raza de la mascota
     */
    public void setRazaMascota(String razaMascota) {
        this.razaMascota = razaMascota;
    }

    /**
     * Obtiene la descripción adicional de la mascota.
     * 
     * @return La descripción
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Establece la descripción adicional de la mascota.
     * 
     * @param descripcion La descripción
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Obtiene el sexo de la mascota.
     * 
     * @return El sexo de la mascota
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * Establece el sexo de la mascota.
     * 
     * @param sexo El sexo de la mascota
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * Obtiene la foto de la mascota como InputStream.
     * 
     * @return La foto como InputStream
     */
    public InputStream getFoto() {
        return foto;
    }

    /**
     * Establece la foto de la mascota como InputStream.
     * 
     * @param foto La foto como InputStream
     */
    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    /**
     * Obtiene la imagen de la mascota codificada en Base64.
     * 
     * @return La imagen en Base64
     */
    public String getImagenBase64() {
        return imagenBase64;
    }

    /**
     * Establece la imagen de la mascota codificada en Base64.
     * 
     * @param imagenBase64 La imagen en Base64
     */
    public void setImagenBase64(String imagenBase64) {
        this.imagenBase64 = imagenBase64;
    }

    /**
     * Obtiene el nombre del usuario propietario.
     * 
     * @return El nombre del usuario
     */
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    /**
     * Establece el nombre del usuario propietario.
     * 
     * @param nombreUsuario El nombre del usuario
     */
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    /**
     * Obtiene el tratamiento más reciente de la mascota.
     * 
     * @return El tratamiento
     */
    public String getTratamiento() {
        return tratamiento;
    }

    /**
     * Establece el tratamiento más reciente de la mascota.
     * 
     * @param tratamiento El tratamiento
     */
    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    /**
     * Obtiene la fecha del historial más reciente.
     * 
     * @return La fecha del historial
     */
    public String getFechaHistorial() {
        return fechaHistorial;
    }

    /**
     * Establece la fecha del historial más reciente.
     * 
     * @param fechaHistorial La fecha del historial
     */
    public void setFechaHistorial(String fechaHistorial) {
        this.fechaHistorial = fechaHistorial;
    }

    /**
     * Obtiene la especie de la mascota.
     * 
     * @return La especie de la mascota
     */
    public String getEspecie() {
        return especie;
    }

    /**
     * Establece la especie de la mascota.
     * 
     * @param especie La especie de la mascota
     */
    public void setEspecie(String especie) {
        this.especie = especie;
    }
    
    

}
