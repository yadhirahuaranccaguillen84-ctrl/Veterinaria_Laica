/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidad;

/**
 * Clase que representa la entidad Asistencia del sistema de veterinaria.
 * Registra el control de asistencia de los veterinarios con sus horarios de entrada y salida.
 * 
 * @author Anai Huarancca
 */
public class Asistencia {
    // Identificador único del registro de asistencia
    private Integer idAsistencia;
    // Identificador del veterinario al que pertenece esta asistencia
    private Integer idVeterinario;
    // Fecha del registro de asistencia
    private String fecha;
    // Hora de llegada del veterinario
    private String horaLlegada;
    // Hora de salida del veterinario
    private String horaSalida;
    // Estado de la asistencia (presente, ausente, etc.)
    private String estado;
    /**
     * Constructor por defecto sin parámetros.
     */
    public Asistencia() {}

    /**
     * Constructor completo con todos los parámetros.
     * 
     * @param idAsistencia Identificador único del registro de asistencia
     * @param idVeterinario Identificador del veterinario
     * @param fecha Fecha del registro de asistencia
     * @param horaLlegada Hora de llegada del veterinario
     * @param horaSalida Hora de salida del veterinario
     * @param estado Estado de la asistencia
     */
    public Asistencia(Integer idAsistencia, Integer idVeterinario, String fecha, String horaLlegada, String horaSalida, String estado) {
        this.idAsistencia = idAsistencia;
        this.idVeterinario = idVeterinario;
        this.fecha = fecha;
        this.horaLlegada = horaLlegada;
        this.horaSalida = horaSalida;
        this.estado = estado;
    }

    /**
     * Obtiene el identificador único del registro de asistencia.
     * 
     * @return El ID de la asistencia
     */
    public Integer getIdAsistencia() {
        return idAsistencia;
    }

    /**
     * Establece el identificador único del registro de asistencia.
     * 
     * @param idAsistencia El ID de la asistencia
     */
    public void setIdAsistencia(Integer idAsistencia) {
        this.idAsistencia = idAsistencia;
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
     * Obtiene la fecha del registro de asistencia.
     * 
     * @return La fecha de asistencia
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * Establece la fecha del registro de asistencia.
     * 
     * @param fecha La fecha de asistencia
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * Obtiene la hora de llegada del veterinario.
     * 
     * @return La hora de llegada
     */
    public String getHoraLlegada() {
        return horaLlegada;
    }

    /**
     * Establece la hora de llegada del veterinario.
     * 
     * @param horaLlegada La hora de llegada
     */
    public void setHoraLlegada(String horaLlegada) {
        this.horaLlegada = horaLlegada;
    }

    /**
     * Obtiene la hora de salida del veterinario.
     * 
     * @return La hora de salida
     */
    public String getHoraSalida() {
        return horaSalida;
    }

    /**
     * Establece la hora de salida del veterinario.
     * 
     * @param horaSalida La hora de salida
     */
    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }   

    /**
     * Obtiene el estado de la asistencia.
     * 
     * @return El estado de la asistencia
     */
    public String getEstado() {
        return estado;
    }

    /**
     * Establece el estado de la asistencia.
     * 
     * @param estado El estado de la asistencia
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
