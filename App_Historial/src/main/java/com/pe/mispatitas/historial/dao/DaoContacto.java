/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao;

import entidad.Contacto;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) para la entidad Contacto.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar mensajes de contacto en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoContacto {
    /**
     * Selecciona y retorna todos los mensajes de contacto de la base de datos.
     * 
     * @return Lista de todos los mensajes de contacto
     */
    List<Contacto> contactoSel();

    /**
     * Obtiene un mensaje de contacto específico por su ID.
     * 
     * @param id Identificador único del mensaje de contacto
     * @return El mensaje de contacto encontrado o null si no existe
     */
    Contacto contactoGet(Integer id);

    /**
     * Inserta un nuevo mensaje de contacto en la base de datos.
     * 
     * @param contacto Objeto Contacto con los datos a insertar
     * @return Mensaje de error si ocurre algún problema, null si la inserción fue exitosa
     */
    String contactoIns(Contacto contacto);

    /**
     * Actualiza los datos de un mensaje de contacto existente en la base de datos.
     * 
     * @param contacto Objeto Contacto con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String contactoUpd(Contacto contacto);

    /**
     * Elimina un mensaje de contacto de la base de datos por su ID.
     * 
     * @param id Identificador único del mensaje de contacto a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String contactoDel(Integer id);

    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    String getMensaje();
}
