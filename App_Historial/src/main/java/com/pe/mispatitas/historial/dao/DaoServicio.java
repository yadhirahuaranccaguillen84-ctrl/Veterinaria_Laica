/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao;

import java.util.List;
import entidad.Servicio;

/**
 * Interfaz DAO (Data Access Object) para la entidad Servicio.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar servicios en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoServicio {
    /**
     * Selecciona y retorna todos los servicios de la base de datos.
     * 
     * @return Lista de todos los servicios
     */
    List<Servicio> servicioSel();

    /**
     * Obtiene un servicio específico por su ID.
     * 
     * @param id Identificador único del servicio
     * @return El servicio encontrado o null si no existe
     */
    Servicio servicioGet(Integer id);

    /**
     * Inserta un nuevo servicio en la base de datos.
     * 
     * @param servicio Objeto Servicio con los datos a insertar
     * @return Mensaje de error si ocurre algún problema, null si la inserción fue exitosa
     */
    String servicioIns(Servicio servicio);

    /**
     * Actualiza todos los datos de un servicio existente en la base de datos.
     * 
     * @param servicio Objeto Servicio con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String servicioUpd(Servicio servicio);
    
    /**
     * Actualiza parcialmente los datos de un servicio existente (sin incluir la foto).
     * 
     * @param servicio Objeto Servicio con los datos a actualizar
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String servicioUpdParcial(Servicio servicio);

    /**
     * Elimina un servicio de la base de datos por su ID.
     * 
     * @param id Identificador único del servicio a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String servicioDel(Integer id);

    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    String getMensaje();
}
