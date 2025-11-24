/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoAdministrador;
import com.pe.mispatitas.historial.dao.DaoUsuario;
import com.pe.mispatitas.historial.dao.DaoVeterinario;
import com.pe.mispatitas.historial.dao.impl.DaoAdministradorImpl;
import com.pe.mispatitas.historial.dao.impl.DaoUsuarioImpl;
import com.pe.mispatitas.historial.dao.impl.DaoVeterinarioImpl;
import entidad.Administrador;
import entidad.Usuario;
import entidad.Veterinario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Servlet que gestiona el proceso de autenticación (login) del sistema.
 * Permite el inicio de sesión para usuarios, veterinarios y administradores.
 * Valida el formato del correo electrónico y verifica las credenciales en la base de datos.
 * 
 * @author Anai Huarancca
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {

    /**
     * Procesa las solicitudes de login (GET y POST).
     * Valida las credenciales y redirige según el tipo de usuario autenticado.
     * 
     * @param request Objeto HttpServletRequest con los datos de la solicitud
     * @param response Objeto HttpServletResponse para enviar la respuesta
     * @throws ServletException Si ocurre un error en el servlet
     * @throws IOException Si ocurre un error de entrada/salida
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Obtener parámetros del formulario de login
        String correo = request.getParameter("correo");
        String contra = request.getParameter("contra");
        String mensajeAlerta;
        
        // Validar que los campos no estén vacíos
        if ("".equals(correo) || "".equals(contra)) {
            mensajeAlerta = "todos los campos son obligatorios";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        } else if (validarCorreo(correo) == false) {
            // Validar formato del correo electrónico
            System.out.println("entro validar");
            mensajeAlerta = "no es un correo valido";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;

        }
        
        // Obtener listas de usuarios, veterinarios y administradores
        DaoUsuario daoUsuario = new DaoUsuarioImpl();
        List<Usuario> usuarios = daoUsuario.usuarioSel();
        DaoVeterinario dao = new DaoVeterinarioImpl();
        List<Veterinario> veterinarios = dao.veterinarioSel();
        DaoAdministrador daoAdmin = new DaoAdministradorImpl();
        List<Administrador> administradores = daoAdmin.administradorSel();
    

        // Verificar si el correo está registrado en alguna de las tablas
        boolean correoRegistrado = false;

        for (Usuario usuario : usuarios) {
            if (usuario.getCorreoUsuario().equals(correo)) {
                correoRegistrado = true;
                break; // Si encontraste el correo, no necesitas seguir buscando
            }
        }
        for (Veterinario veterinario : veterinarios) {
            if (veterinario.getCorreo().equals(correo)) {
                correoRegistrado = true;
                break; // Si encontraste el correo, no necesitas seguir buscando
            }
        }

        for(Administrador administrador : administradores){
            if(administrador.getCorreo().equals(correo)){
                correoRegistrado = true;
                break;
            }
        }


        // Si el correo no está registrado, mostrar error
        if (!correoRegistrado) {
            mensajeAlerta = "Usuario no encontrado";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

        // Autenticar usuario
        for (Usuario usuario : usuarios) {
            if (usuario.getCorreoUsuario().equals(correo) && usuario.getContra().equals(contra)) {
                System.out.println("Buscando usuario");
                Integer codigoUsuario = usuario.getIdUsuario();
                // Guardar el idUsuario en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("codigoUsuario", codigoUsuario);
                // Redirigir a la página de usuario
                response.sendRedirect(request.getContextPath() + "/indexUsuario.jsp");
                return;
            }
        }
       
        // Autenticar veterinario
        for (Veterinario veterinario : veterinarios) {
            if (veterinario.getCorreo().equals(correo) && veterinario.getContra().equals(contra)) {
                System.out.println("Buscando veterinario");

                Integer idVeterinario = veterinario.getIdVeterinario();
                request.setAttribute("idVeterinario", idVeterinario);
                request.getRequestDispatcher("/indexVeterinario.jsp").forward(request, response);
                return;
            }
        }

        // Autenticar administrador
        for(Administrador administrador : administradores){
            if(administrador.getCorreo().equals(correo) && administrador.getContra().equals(contra)){
                System.out.println("Buscando administrador");
                Integer idAdministrador = administrador.getIdAdministrador();
                request.setAttribute("idAdministrador", idAdministrador);
                request.getRequestDispatcher("/indexAdministrador.jsp").forward(request, response);
                return;
            }
        }

        // Si no se encontró coincidencia, la contraseña es incorrecta
        mensajeAlerta = "Contraseña incorrecta";
        request.setAttribute("mensajeAlerta", mensajeAlerta);
        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }

    /**
     * Valida el formato de un correo electrónico usando expresiones regulares.
     * 
     * @param correo Correo electrónico a validar
     * @return true si el formato es válido, false en caso contrario
     */
    private boolean validarCorreo(String correo) {
        // Expresión regular para validar un correo electrónico
        String regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,6}$";

        // Compilar la expresión regular en un patrón
        Pattern pattern = Pattern.compile(regex);

        // Crear un objeto Matcher para la cadena de entrada
        Matcher matcher = pattern.matcher(correo);

        // Verificar si la cadena coincide con el patrón
        return matcher.matches();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
