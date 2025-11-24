/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao;

import entidad.Asistencia;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) para la entidad Asistencia.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar registros de asistencia en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoAsistencia {

    /**
     * Selecciona y retorna todos los registros de asistencia de la base de datos.
     * 
     * @return Lista de todos los registros de asistencia
     */
    List<Asistencia> asistenciaSel();
    
    /**
     * Obtiene un registro de asistencia específico por su ID.
     * 
     * @param id Identificador único del registro de asistencia
     * @return El registro de asistencia encontrado o null si no existe
     */
    Asistencia asistenciaGet(Integer id);
    
    /**
     * Inserta un nuevo registro de asistencia en la base de datos.
     * 
     * @param asistencia Objeto Asistencia con los datos a insertar
     * @return El ID generado del nuevo registro, o -1 si falla la inserción
     */
    int asistenciaIns(Asistencia asistencia);
    
    /**
     * Actualiza los datos de un registro de asistencia existente en la base de datos.
     * 
     * @param asistencia Objeto Asistencia con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String asistenciaUpd(Asistencia asistencia);
    
    /**
     * Elimina un registro de asistencia de la base de datos por su ID.
     * 
     * @param id Identificador único del registro de asistencia a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String asistenciaDel(Integer id);
    
    /**
     * Busca un registro de asistencia por fecha y veterinario.
     * 
     * @param idVeterinario Identificador del veterinario
     * @param fecha Fecha del registro de asistencia
     * @return El registro de asistencia encontrado o null si no existe
     */
    Asistencia buscarPorFechaYVeterinario(Integer idVeterinario, String fecha);
    
    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    String getMensaje();
}
