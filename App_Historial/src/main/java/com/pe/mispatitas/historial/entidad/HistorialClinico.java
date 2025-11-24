
package entidad;


/**
 * Clase que representa la entidad HistorialClinico del sistema de veterinaria.
 * Almacena el historial médico de las mascotas, incluyendo diagnósticos y tratamientos.
 * 
 * @author Anai Huarancca
 */
public class HistorialClinico {
    // Identificador único del historial clínico
    private Integer idHistorial;
    // Identificador de la mascota a la que pertenece este historial
    private Integer idMascota;
    // Identificador del veterinario que atendió a la mascota
    private Integer idVeterinario;
    // Fecha en que se registró el historial
    private String fechaHistorial;
    // Descripción del diagnóstico o condición de la mascota
    private String descripcion;
    // Tratamiento aplicado a la mascota
    private String tratamiento;
    // Nombre de la mascota (atributo auxiliar para consultas)
    private String nombreMascota;
    /**
     * Constructor por defecto sin parámetros.
     */
    public HistorialClinico() {
    }

    /**
     * Constructor completo con todos los parámetros.
     * 
     * @param idHistorial Identificador único del historial clínico
     * @param idVeterinario Identificador del veterinario que atendió
     * @param idMascota Identificador de la mascota
     * @param fechaHistorial Fecha del registro del historial
     * @param descripcion Descripción del diagnóstico
     * @param tratamiento Tratamiento aplicado
     */
    public HistorialClinico(Integer idHistorial, Integer idVeterinario,Integer idMascota,  String fechaHistorial, String descripcion, String tratamiento) {
        this.idHistorial = idHistorial;
        this.idMascota = idMascota;
        this.idVeterinario = idVeterinario;
        this.fechaHistorial = fechaHistorial;
        this.descripcion = descripcion;
        this.tratamiento = tratamiento;
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
     * Obtiene el identificador único del historial clínico.
     * 
     * @return El ID del historial
     */
    public Integer getIdHistorial() {
        return idHistorial;
    }

    /**
     * Establece el identificador único del historial clínico.
     * 
     * @param idHistorial El ID del historial
     */
    public void setIdHistorial(Integer idHistorial) {
        this.idHistorial = idHistorial;
    }

    /**
     * Obtiene el identificador de la mascota.
     * 
     * @return El ID de la mascota
     */
    public Integer getIdMascota() {
        return idMascota;
    }

    /**
     * Establece el identificador de la mascota.
     * 
     * @param idMascota El ID de la mascota
     */
    public void setIdMascota(Integer idMascota) {
        this.idMascota = idMascota;
    }

    /**
     * Obtiene el identificador del veterinario.
     * 
     * @return El ID del veterinario
     */
    public Integer getIdVeterinario() {
        return idVeterinario;
    }

    /**
     * Establece el identificador del veterinario.
     * 
     * @param idVeterinario El ID del veterinario
     */
    public void setIdVeterinario(Integer idVeterinario) {
        this.idVeterinario = idVeterinario;
    }

    /**
     * Obtiene la fecha del registro del historial.
     * 
     * @return La fecha del historial
     */
    public String getFechaHistorial() {
        return fechaHistorial;
    }

    /**
     * Establece la fecha del registro del historial.
     * 
     * @param fechaHistorial La fecha del historial
     */
    public void setFechaHistorial(String fechaHistorial) {
        this.fechaHistorial = fechaHistorial;
    }

    /**
     * Obtiene la descripción del diagnóstico.
     * 
     * @return La descripción del diagnóstico
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Establece la descripción del diagnóstico.
     * 
     * @param descripcion La descripción del diagnóstico
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Obtiene el tratamiento aplicado.
     * 
     * @return El tratamiento
     */
    public String getTratamiento() {
        return tratamiento;
    }

    /**
     * Establece el tratamiento aplicado.
     * 
     * @param tratamiento El tratamiento
     */
    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }
    
    
}
