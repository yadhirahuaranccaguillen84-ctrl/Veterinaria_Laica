/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidad;

/**
 * Clase que representa la entidad Veterinario del sistema de veterinaria.
 * Almacena la información personal, laboral y de acceso de los veterinarios.
 * 
 * @author Anai Huarancca
 */
public class Veterinario {
    // Identificador único del veterinario
    private Integer idVeterinario;
    // Nombre completo del veterinario
    private String nombreVeterinario;
    // Correo electrónico del veterinario (usado para login)
    private String correo;
    // Contraseña del veterinario
    private String contra;
    // Sueldo del veterinario
    private String sueldo;
    // Hora de ingreso laboral del veterinario
    private String hora_ingreso;
    // Hora de salida laboral del veterinario
    private String hora_salida;

    /**
     * Constructor por defecto sin parámetros.
     */
    public Veterinario() {
    }

    /**
     * Constructor completo con todos los parámetros.
     * 
     * @param idVeterinario Identificador único del veterinario
     * @param nombreVeterinario Nombre completo del veterinario
     * @param correo Correo electrónico del veterinario
     * @param contra Contraseña del veterinario
     * @param sueldo Sueldo del veterinario
     * @param hora_ingreso Hora de ingreso laboral
     * @param hora_salida Hora de salida laboral
     */
    public Veterinario(Integer idVeterinario, String nombreVeterinario, String correo, String contra, String sueldo, String hora_ingreso, String hora_salida) {
        this.idVeterinario = idVeterinario;
        this.nombreVeterinario = nombreVeterinario;
        this.correo = correo;
        this.contra = contra;
        this.sueldo = sueldo;
        this.hora_ingreso = hora_ingreso;
        this.hora_salida = hora_salida;
    }

    /**
     * Obtiene el identificador único del veterinario.
     * 
     * @return El ID del veterinario
     */
    public Integer getIdVeterinario() {
        return idVeterinario;
    }

    /**
     * Establece el identificador único del veterinario.
     * 
     * @param idVeterinario El ID del veterinario
     */
    public void setIdVeterinario(Integer idVeterinario) {
        this.idVeterinario = idVeterinario;
    }

    /**
     * Obtiene el nombre completo del veterinario.
     * 
     * @return El nombre del veterinario
     */
    public String getNombreVeterinario() {
        return nombreVeterinario;
    }

    /**
     * Establece el nombre completo del veterinario.
     * 
     * @param nombreVeterinario El nombre del veterinario
     */
    public void setNombreVeterinario(String nombreVeterinario) {
        this.nombreVeterinario = nombreVeterinario;
    }

    /**
     * Obtiene el correo electrónico del veterinario.
     * 
     * @return El correo electrónico
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * Establece el correo electrónico del veterinario.
     * 
     * @param correo El correo electrónico
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * Obtiene la contraseña del veterinario.
     * 
     * @return La contraseña
     */
    public String getContra() {
        return contra;
    }

    /**
     * Establece la contraseña del veterinario.
     * 
     * @param contra La contraseña
     */
    public void setContra(String contra) {
        this.contra = contra;
    }

    /**
     * Obtiene el sueldo del veterinario.
     * 
     * @return El sueldo
     */
    public String getSueldo() {
        return sueldo;
    }

    /**
     * Establece el sueldo del veterinario.
     * 
     * @param sueldo El sueldo
     */
    public void setSueldo(String sueldo) {
        this.sueldo = sueldo;
    }

    /**
     * Obtiene la hora de ingreso laboral del veterinario.
     * 
     * @return La hora de ingreso
     */
    public String getHora_ingreso() {
        return hora_ingreso;
    }

    /**
     * Establece la hora de ingreso laboral del veterinario.
     * 
     * @param hora_ingreso La hora de ingreso
     */
    public void setHora_ingreso(String hora_ingreso) {
        this.hora_ingreso = hora_ingreso;
    }

    /**
     * Obtiene la hora de salida laboral del veterinario.
     * 
     * @return La hora de salida
     */
    public String getHora_salida() {
        return hora_salida;
    }

    /**
     * Establece la hora de salida laboral del veterinario.
     * 
     * @param hora_salida La hora de salida
     */
    public void setHora_salida(String hora_salida) {
        this.hora_salida = hora_salida;
    }
    
    
    
}
