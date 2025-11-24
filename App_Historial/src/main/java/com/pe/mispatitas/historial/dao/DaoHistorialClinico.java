/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao;

import entidad.HistorialClinico;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) para la entidad HistorialClinico.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar historiales clínicos en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoHistorialClinico {
    /**
     * Selecciona y retorna todos los historiales clínicos de la base de datos.
     * 
     * @return Lista de todos los historiales clínicos
     */
    List<HistorialClinico> historialSel();

    /**
     * Obtiene un historial clínico específico por su ID.
     * 
     * @param id Identificador único del historial clínico
     * @return El historial clínico encontrado o null si no existe
     */
    HistorialClinico historialGet(Integer id);
    
    /**
     * Obtiene todos los historiales clínicos de una mascota específica.
     * 
     * @param id Identificador único de la mascota
     * @return Lista de historiales clínicos de la mascota
     */
    List<HistorialClinico> historialMascotaGet(Integer id);
    
    /**
     * Inserta un nuevo historial clínico en la base de datos.
     * 
     * @param historial Objeto HistorialClinico con los datos a insertar
     * @return Mensaje de error si ocurre algún problema, null si la inserción fue exitosa
     */
    String historialIns(HistorialClinico historial);

    /**
     * Actualiza los datos de un historial clínico existente en la base de datos.
     * 
     * @param historial Objeto HistorialClinico con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String historialUpd(HistorialClinico historial);

    /**
     * Elimina un historial clínico de la base de datos por su ID.
     * 
     * @param id Identificador único del historial clínico a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String historialDel(Integer id);

    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    String getMensaje();
}
