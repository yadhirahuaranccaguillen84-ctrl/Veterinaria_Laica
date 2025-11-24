/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoMascota;
import com.pe.mispatitas.historial.dao.impl.DaoMascotaImpl;
import entidad.Mascota;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/**
 * Servlet que gestiona el registro de nuevas mascotas en el sistema.
 * Permite a los usuarios registrar sus mascotas con información personal y una foto.
 * 
 * @author Anai Huarancca
 */
@WebServlet(name = "registroMascotaServlet", urlPatterns = {"/registroMascota"})
@MultipartConfig
public class registroMascotaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Procesa las solicitudes de registro de mascotas (GET y POST).
     * Valida los campos obligatorios y guarda la mascota en la base de datos.
     * 
     * @param request Objeto HttpServletRequest con los datos del formulario
     * @param response Objeto HttpServletResponse para enviar la respuesta
     * @throws ServletException Si ocurre un error en el servlet
     * @throws IOException Si ocurre un error de entrada/salida
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DaoMascota dao = new DaoMascotaImpl();

        // Obtener parámetros del formulario
        String nombreMascota = request.getParameter("nombreMascota");
        String razaMascota = request.getParameter("razaMascota");
        String generoMascota = request.getParameter("generoMascota");
        String fechaMascota = request.getParameter("fechaMascota");
        String descripcionMascota = request.getParameter("descripcionMascota");
        String especieMascota = request.getParameter("especieMascota");

        int idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
        String mensajeAlerta;
        // Obtener la imagen subida
        Part part = request.getPart("imagenMascota");
        InputStream inputStream = part.getInputStream();
        
        // Validar que todos los campos obligatorios estén completos
        if ("".equals(nombreMascota) || "".equals(razaMascota) || "".equals(generoMascota) || "".equals(fechaMascota) || "".equals(descripcionMascota) || "".equals(especieMascota)) {
            mensajeAlerta = "todos los campos son obligatorios";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("registrarMascota.jsp").forward(request, response);
        } else {
            // Crear objeto Mascota y guardarlo en la base de datos
            Mascota cat = new Mascota(null, idUsuario, nombreMascota, fechaMascota, especieMascota, razaMascota, descripcionMascota, generoMascota, inputStream);
            dao.mascotaIns(cat);
            // Redirigir a la página principal del usuario
            response.sendRedirect(request.getContextPath() + "/indexUsuario.jsp");
        }

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
