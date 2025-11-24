
package com.pe.mispatitas.historial.dao;

import entidad.Mascota;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) para la entidad Mascota.
 * Define los métodos CRUD (Create, Read, Update, Delete) para gestionar mascotas en la base de datos.
 * 
 * @author Anai Huarancca
 */
public interface DaoMascota {
    /**
     * Selecciona y retorna todas las mascotas de la base de datos.
     * 
     * @return Lista de todas las mascotas
     */
    List<Mascota> mascotaSel();

    /**
     * Obtiene una mascota específica por su ID.
     * 
     * @param id Identificador único de la mascota
     * @return La mascota encontrada o null si no existe
     */
    Mascota mascotaGet(Integer id);

    /**
     * Inserta una nueva mascota en la base de datos.
     * 
     * @param mascota Objeto Mascota con los datos a insertar
     * @return Mensaje de error si ocurre algún problema, null si la inserción fue exitosa
     */
    String mascotaIns(Mascota mascota);

    /**
     * Actualiza los datos de una mascota existente en la base de datos.
     * 
     * @param mascota Objeto Mascota con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    String mascotaUpd(Mascota mascota);

    /**
     * Elimina una mascota de la base de datos por su ID.
     * 
     * @param id Identificador único de la mascota a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    String mascotaDel(Integer id);

    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    String getMensaje();
    
}
