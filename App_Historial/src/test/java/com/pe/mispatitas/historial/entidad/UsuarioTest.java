/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.pe.mispatitas.historial.entidad;

import entidad.Usuario;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Anai
 */
public class UsuarioTest {
    
    public UsuarioTest() {
    }

    /**
     * Test of getIdUsuario method, of class Usuario.
     */
    @Test
    public void testGetIdUsuario() {
        System.out.println("getIdUsuario");
        Usuario instance = new Usuario();
        Integer expResult = null;
        Integer result = instance.getIdUsuario();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setIdUsuario method, of class Usuario.
     */
    @Test
    public void testSetIdUsuario() {
        System.out.println("setIdUsuario");
        Integer idUsuario = null;
        Usuario instance = new Usuario();
        instance.setIdUsuario(idUsuario);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNombreUsuario method, of class Usuario.
     */
    @Test
    public void testGetNombreUsuario() {
        System.out.println("getNombreUsuario");
        Usuario instance = new Usuario();
        String expResult = "";
        String result = instance.getNombreUsuario();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setNombreUsuario method, of class Usuario.
     */
    @Test
    public void testSetNombreUsuario() {
        System.out.println("setNombreUsuario");
        String nombreUsuario = "";
        Usuario instance = new Usuario();
        instance.setNombreUsuario(nombreUsuario);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCorreoUsuario method, of class Usuario.
     */
    @Test
    public void testGetCorreoUsuario() {
        System.out.println("getCorreoUsuario");
        Usuario instance = new Usuario();
        String expResult = "";
        String result = instance.getCorreoUsuario();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setCorreoUsuario method, of class Usuario.
     */
    @Test
    public void testSetCorreoUsuario() {
        System.out.println("setCorreoUsuario");
        String correoUsuario = "";
        Usuario instance = new Usuario();
        instance.setCorreoUsuario(correoUsuario);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTelefono method, of class Usuario.
     */
    @Test
    public void testGetTelefono() {
        System.out.println("getTelefono");
        Usuario instance = new Usuario();
        String expResult = "";
        String result = instance.getTelefono();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setTelefono method, of class Usuario.
     */
    @Test
    public void testSetTelefono() {
        System.out.println("setTelefono");
        String telefono = "";
        Usuario instance = new Usuario();
        instance.setTelefono(telefono);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getContra method, of class Usuario.
     */
    @Test
    public void testGetContra() {
        System.out.println("getContra");
        Usuario instance = new Usuario();
        String expResult = "";
        String result = instance.getContra();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setContra method, of class Usuario.
     */
    @Test
    public void testSetContra() {
        System.out.println("setContra");
        String contra = "";
        Usuario instance = new Usuario();
        instance.setContra(contra);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
