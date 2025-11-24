/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao;

import entidad.Usuario;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) para la entidad Usuario.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar usuarios en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoUsuario {

    /**
     * Selecciona y retorna todos los usuarios de la base de datos.
     * 
     * @return Lista de todos los usuarios
     */
    List<Usuario> usuarioSel();

    /**
     * Obtiene un usuario específico por su ID.
     * 
     * @param id Identificador único del usuario
     * @return El usuario encontrado o null si no existe
     */
    Usuario usuarioGet(Integer id);

    /**
     * Inserta un nuevo usuario en la base de datos.
     * 
     * @param usuario Objeto Usuario con los datos a insertar
     * @return El ID generado del nuevo usuario, o -1 si falla la inserción
     */
    int usuarioIns(Usuario usuario);

    /**
     * Actualiza los datos de un usuario existente en la base de datos.
     * 
     * @param usuario Objeto Usuario con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String usuarioUpd(Usuario usuario);

    /**
     * Elimina un usuario de la base de datos por su ID.
     * 
     * @param id Identificador único del usuario a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String usuarioDel(Integer id);
    
    /**
     * Calcula o desencripta una contraseña usando funciones de MySQL.
     * 
     * @param contrasena Contraseña a procesar
     * @return La contraseña desencriptada o null si hay error
     */
    String calcularMD5MySQL(String contrasena);

    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    String getMensaje();

}
