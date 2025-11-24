/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.pe.mispatitas.historial.entidad;

import entidad.Contacto;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Anai
 */
public class ContactoTest {
    
    public ContactoTest() {
    }

    /**
     * Test of getNombreUsuario method, of class Contacto.
     */
    @Test
    public void testGetNombreUsuario() {
        System.out.println("getNombreUsuario");
        Contacto instance = new Contacto();
        String expResult = "";
        String result = instance.getNombreUsuario();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setNombreUsuario method, of class Contacto.
     */
    @Test
    public void testSetNombreUsuario() {
        System.out.println("setNombreUsuario");
        String nombreUsuario = "";
        Contacto instance = new Contacto();
        instance.setNombreUsuario(nombreUsuario);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTelefonoUsuario method, of class Contacto.
     */
    @Test
    public void testGetTelefonoUsuario() {
        System.out.println("getTelefonoUsuario");
        Contacto instance = new Contacto();
        String expResult = "";
        String result = instance.getTelefonoUsuario();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setTelefonoUsuario method, of class Contacto.
     */
    @Test
    public void testSetTelefonoUsuario() {
        System.out.println("setTelefonoUsuario");
        String telefonoUsuario = "";
        Contacto instance = new Contacto();
        instance.setTelefonoUsuario(telefonoUsuario);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getIdContacto method, of class Contacto.
     */
    @Test
    public void testGetIdContacto() {
        System.out.println("getIdContacto");
        Contacto instance = new Contacto();
        Integer expResult = null;
        Integer result = instance.getIdContacto();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setIdContacto method, of class Contacto.
     */
    @Test
    public void testSetIdContacto() {
        System.out.println("setIdContacto");
        Integer idContacto = null;
        Contacto instance = new Contacto();
        instance.setIdContacto(idContacto);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getIdUsuario method, of class Contacto.
     */
    @Test
    public void testGetIdUsuario() {
        System.out.println("getIdUsuario");
        Contacto instance = new Contacto();
        Integer expResult = null;
        Integer result = instance.getIdUsuario();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setIdUsuario method, of class Contacto.
     */
    @Test
    public void testSetIdUsuario() {
        System.out.println("setIdUsuario");
        Integer idUsuario = null;
        Contacto instance = new Contacto();
        instance.setIdUsuario(idUsuario);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMensaje method, of class Contacto.
     */
    @Test
    public void testGetMensaje() {
        System.out.println("getMensaje");
        Contacto instance = new Contacto();
        String expResult = "";
        String result = instance.getMensaje();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setMensaje method, of class Contacto.
     */
    @Test
    public void testSetMensaje() {
        System.out.println("setMensaje");
        String mensaje = "";
        Contacto instance = new Contacto();
        instance.setMensaje(mensaje);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
