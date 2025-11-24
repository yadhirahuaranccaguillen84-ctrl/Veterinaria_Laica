/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao;

import entidad.Veterinario;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) para la entidad Veterinario.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar veterinarios en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoVeterinario {
    /**
     * Selecciona y retorna todos los veterinarios de la base de datos.
     * 
     * @return Lista de todos los veterinarios
     */
    List<Veterinario> veterinarioSel();

    /**
     * Obtiene un veterinario específico por su ID.
     * 
     * @param id Identificador único del veterinario
     * @return El veterinario encontrado o null si no existe
     */
    Veterinario veterinarioGet(Integer id);

    /**
     * Inserta un nuevo veterinario en la base de datos.
     * 
     * @param veterinario Objeto Veterinario con los datos a insertar
     * @return Mensaje de error si ocurre algún problema, null si la inserción fue exitosa
     */
    String veterinarioIns(Veterinario veterinario);

    /**
     * Actualiza los datos de un veterinario existente en la base de datos.
     * 
     * @param veterinario Objeto Veterinario con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String veterinarioUpd(Veterinario veterinario);
    
    /**
     * Calcula o desencripta una contraseña usando funciones de MySQL.
     * 
     * @param contrasena Contraseña a procesar
     * @return La contraseña desencriptada o null si hay error
     */
    String calcularMD5MySQL(String contrasena);

    /**
     * Elimina un veterinario de la base de datos por su ID.
     * 
     * @param id Identificador único del veterinario a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String veterinarioDel(Integer id);

    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    String getMensaje();
}
