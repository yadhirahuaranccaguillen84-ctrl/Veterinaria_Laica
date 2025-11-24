/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pe.mispatitas.historial.dao.impl;

import com.pe.mispatitas.historial.dao.DaoAdministrador;
import entidad.Administrador;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.Conexion;
import java.sql.Statement;

/**
 * Implementación de la interfaz DaoAdministrador.
 * Proporciona la lógica de acceso a datos para la entidad Administrador en la base de datos MySQL.
 * Utiliza encriptación AES para las contraseñas.
 * 
 * @author Anai Huarancca
 */
public class DaoAdministradorImpl implements DaoAdministrador{

    // Objeto para gestionar la conexión a la base de datos
    private final Conexion conexion;
    // Mensaje de error para las operaciones
    private String mensaje;

    /**
     * Constructor que inicializa la conexión a la base de datos.
     */
    public DaoAdministradorImpl() {
        conexion = new Conexion();
    }

    /**
     * Selecciona y retorna todos los administradores de la base de datos.
     * Desencripta las contraseñas usando AES_DECRYPT de MySQL.
     * 
     * @return Lista de todos los administradores
     */
    @Override
    public List<Administrador> administradorSel() {

        List<Administrador> lista = null;
        StringBuilder sql = new StringBuilder();
        // Consulta SQL que desencripta la contraseña usando AES_DECRYPT
        sql.append("SELECT ")
                .append("idAdministrador,")
                .append("nombreAdministrador,")
                .append("apellidoAdministrador,")
                .append("correo,")
                .append("CAST(AES_DECRYPT(contraseña,'AES') AS CHAR) ")
                .append("FROM administrador");
       
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<>();
            // Recorrer los resultados y crear objetos Administrador
            while (rs.next()) {
                Administrador administrador = new Administrador();
                administrador.setIdAdministrador(rs.getInt(1));
                administrador.setNombreAdministrador(rs.getString(2));
                administrador.setApellidoAdministrador(rs.getString(3));
                administrador.setCorreo(rs.getString(4));
                administrador.setContra(rs.getString(5));
                lista.add(administrador);
            }
        } catch (Exception e) {
            mensaje = e.getMessage();
        }
        return lista;

    }

    /**
     * Calcula o desencripta una contraseña usando funciones de MySQL.
     * Nota: Este método parece tener un propósito específico de desencriptación.
     * 
     * @param contrasena Contraseña a procesar
     * @return La contraseña desencriptada o null si hay error
     */
    @Override
    public String calcularMD5MySQL(String contrasena) {
        String sql="SELECT CAST(AES_DECRYPT(?,'AES') AS CHAR) AS contra_Desencriptada FROM administrador";
//        String sql = "SELECT MD5(?) AS hash_md5";
        try (Connection cn = conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, contrasena);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("contra_Desencriptada");
                }
            }
        } catch (Exception e) {
            mensaje = e.getMessage();
        }
        return null;
    }

    /**
     * Obtiene un administrador específico por su ID.
     * Desencripta la contraseña usando AES_DECRYPT de MySQL.
     * 
     * @param id Identificador único del administrador
     * @return El administrador encontrado o null si no existe
     */
    @Override
    public Administrador administradorGet(Integer id) {

        Administrador administrador = null;
        StringBuilder sql = new StringBuilder();
        // Consulta SQL que desencripta la contraseña usando AES_DECRYPT
        sql.append("SELECT ")
                .append("idAdministrador,")
                .append("nombreAdministrador,")
                .append("apellidoAdministrador,")
                .append("correo,")
                .append("CAST(AES_DECRYPT(contraseña,'AES') AS CHAR) ")
                .append("FROM administrador ")
                .append("WHERE idAdministrador = ?");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            administrador = new Administrador();
            if (rs.next()) {
                administrador.setIdAdministrador(rs.getInt(1));
                administrador.setNombreAdministrador(rs.getString(2));
                administrador.setApellidoAdministrador(rs.getString(3));
                administrador.setCorreo(rs.getString(4));
                administrador.setContra(rs.getString(5));
            }
        } catch (Exception e) {
            mensaje = e.getMessage();
        }
        return administrador;

    }

    /**
     * Inserta un nuevo administrador en la base de datos.
     * Encripta la contraseña usando AES_ENCRYPT de MySQL.
     * Retorna el ID generado automáticamente.
     * 
     * @param administrador Objeto Administrador con los datos a insertar
     * @return El ID generado del nuevo administrador, o -1 si falla la inserción
     */
    @Override
    public int administradorIns(Administrador administrador) {
        int idGenerado = -1; // Valor por defecto si la inserción falla

        StringBuilder sql = new StringBuilder();
        // Consulta SQL que encripta la contraseña usando AES_ENCRYPT
        sql.append("INSERT INTO administrador(")
                .append("nombreAdministrador,")
                .append("apellidoAdministrador,")
                .append("correo,")
                .append("contraseña ")
                .append(") VALUES (?,?,?,AES_ENCRYPT(?,'AES'))");

        try (Connection cn = conexion.getConexion()) {
            // Establecer el flag de retorno de claves generadas automáticamente
            try (PreparedStatement ps = cn.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, administrador.getNombreAdministrador());
                ps.setString(2, administrador.getApellidoAdministrador());
                ps.setString(3, administrador.getCorreo());
                ps.setString(4, administrador.getContra());

                int resultado = ps.executeUpdate();

                if (resultado == 0) {
                    System.err.println("Cero registros agregados");
                } else {
                    // Recuperar el ID generado automáticamente
                    try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            idGenerado = generatedKeys.getInt(1);
                            System.out.println("ID generado: " + idGenerado);
                        } else {
                            System.err.println("No se pudo obtener el ID generado");
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
        return idGenerado;

    }

    /**
     * Actualiza los datos de un administrador existente en la base de datos.
     * 
     * @param administrador Objeto Administrador con los datos actualizados
     * @return Mensaje de error si ocurre algún problema, null si la actualización fue exitosa
     */
    @Override
    public String administradorUpd(Administrador administrador) {

        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE administrador SET ")
                .append("nombreAdministrador = ?,")
                .append("apellidoAdministrador = ?,")
                .append("correo = ?,")
                .append("contraseña = ? ")
                .append("WHERE idAdministrador = ?");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            ps.setString(1, administrador.getNombreAdministrador());
            ps.setString(2, administrador.getApellidoAdministrador());
            ps.setString(3, administrador.getCorreo());
            ps.setString(4, administrador.getContra());
            ps.setInt(5, administrador.getIdAdministrador());
            int resultado = ps.executeUpdate();
            if (resultado == 0) {
                mensaje = "Cero registros actualizados";
            }
        } catch (Exception e) {
            mensaje = e.getMessage();
        }
        return mensaje;

    }

    /**
     * Elimina un administrador de la base de datos por su ID.
     * 
     * @param id Identificador único del administrador a eliminar
     * @return Mensaje de error si ocurre algún problema, null si la eliminación fue exitosa
     */
    @Override
    public String administradorDel(Integer id) {
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM administrador")
                .append(" WHERE idAdministrador = ?");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            ps.setInt(1, id);
            int resultado = ps.executeUpdate();
            if (resultado == 0) {
                mensaje = "Cero registros eliminados";
            }
        } catch (Exception e) {
            mensaje = e.getMessage();
        }
        return mensaje;
    }

    /**
     * Obtiene el último mensaje de error generado por las operaciones del DAO.
     * 
     * @return Mensaje de error o null si no hay errores
     */
    @Override
    public String getMensaje() {
        return mensaje;
    }
}
