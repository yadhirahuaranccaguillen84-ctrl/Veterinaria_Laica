/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao;

import entidad.Administrador;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) para la entidad Administrador.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar administradores en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoAdministrador {

    /**
     * Selecciona y retorna todos los administradores de la base de datos.
     * 
     * @return Lista de todos los administradores
     */
    List<Administrador> administradorSel();

    /**
     * Obtiene un administrador específico por su ID.
     * 
     * @param id Identificador único del administrador
     * @return El administrador encontrado o null si no existe
     */
    Administrador administradorGet(Integer id);

    /**
     * Inserta un nuevo administrador en la base de datos.
     * 
     * @param administrador Objeto Administrador con los datos a insertar
     * @return El ID generado del nuevo administrador, o -1 si falla la inserción
     */
    int administradorIns(Administrador administrador);

    /**
     * Actualiza los datos de un administrador existente en la base de datos.
     * 
     * @param administrador Objeto Administrador con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String administradorUpd(Administrador administrador);

    /**
     * Elimina un administrador de la base de datos por su ID.
     * 
     * @param id Identificador único del administrador a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String administradorDel(Integer id);
    
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
