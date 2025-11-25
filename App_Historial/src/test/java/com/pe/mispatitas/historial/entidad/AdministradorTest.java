/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.pe.mispatitas.historial.entidad;

import entidad.Administrador;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for the Administrador class.
 * Tests all getters, setters, and constructors.
 *
 * @author Anai
 */
public class AdministradorTest {
    
    public AdministradorTest() {
    }

    /**
     * Test of getIdAdministrador method, of class Administrador.
     */
    @Test
    public void testGetIdAdministrador() {
        System.out.println("getIdAdministrador");
        Administrador instance = new Administrador();
        Integer expResult = null;
        Integer result = instance.getIdAdministrador();
        assertEquals(expResult, result);
    }

    /**
     * Test of setIdAdministrador method, of class Administrador.
     */
    @Test
    public void testSetIdAdministrador() {
        System.out.println("setIdAdministrador");
        Integer idAdministrador = 1;
        Administrador instance = new Administrador();
        instance.setIdAdministrador(idAdministrador);
        assertEquals(idAdministrador, instance.getIdAdministrador());
    }

    /**
     * Test of setIdAdministrador with null value.
     */
    @Test
    public void testSetIdAdministradorNull() {
        System.out.println("setIdAdministrador with null");
        Integer idAdministrador = null;
        Administrador instance = new Administrador();
        instance.setIdAdministrador(idAdministrador);
        assertNull(instance.getIdAdministrador());
    }

    /**
     * Test of getNombreAdministrador method, of class Administrador.
     */
    @Test
    public void testGetNombreAdministrador() {
        System.out.println("getNombreAdministrador");
        Administrador instance = new Administrador();
        String result = instance.getNombreAdministrador();
        assertNull(result);
    }

    /**
     * Test of setNombreAdministrador method, of class Administrador.
     */
    @Test
    public void testSetNombreAdministrador() {
        System.out.println("setNombreAdministrador");
        String nombreAdministrador = "Juan";
        Administrador instance = new Administrador();
        instance.setNombreAdministrador(nombreAdministrador);
        assertEquals(nombreAdministrador, instance.getNombreAdministrador());
    }

    /**
     * Test of setNombreAdministrador with empty string.
     */
    @Test
    public void testSetNombreAdministradorEmpty() {
        System.out.println("setNombreAdministrador with empty string");
        String nombreAdministrador = "";
        Administrador instance = new Administrador();
        instance.setNombreAdministrador(nombreAdministrador);
        assertEquals(nombreAdministrador, instance.getNombreAdministrador());
    }

    /**
     * Test of setNombreAdministrador with null value.
     */
    @Test
    public void testSetNombreAdministradorNull() {
        System.out.println("setNombreAdministrador with null");
        String nombreAdministrador = null;
        Administrador instance = new Administrador();
        instance.setNombreAdministrador(nombreAdministrador);
        assertNull(instance.getNombreAdministrador());
    }

    /**
     * Test of getApellidoAdministrador method, of class Administrador.
     */
    @Test
    public void testGetApellidoAdministrador() {
        System.out.println("getApellidoAdministrador");
        Administrador instance = new Administrador();
        String result = instance.getApellidoAdministrador();
        assertNull(result);
    }

    /**
     * Test of setApellidoAdministrador method, of class Administrador.
     */
    @Test
    public void testSetApellidoAdministrador() {
        System.out.println("setApellidoAdministrador");
        String apellidoAdministrador = "Pérez";
        Administrador instance = new Administrador();
        instance.setApellidoAdministrador(apellidoAdministrador);
        assertEquals(apellidoAdministrador, instance.getApellidoAdministrador());
    }

    /**
     * Test of setApellidoAdministrador with empty string.
     */
    @Test
    public void testSetApellidoAdministradorEmpty() {
        System.out.println("setApellidoAdministrador with empty string");
        String apellidoAdministrador = "";
        Administrador instance = new Administrador();
        instance.setApellidoAdministrador(apellidoAdministrador);
        assertEquals(apellidoAdministrador, instance.getApellidoAdministrador());
    }

    /**
     * Test of setApellidoAdministrador with null value.
     */
    @Test
    public void testSetApellidoAdministradorNull() {
        System.out.println("setApellidoAdministrador with null");
        String apellidoAdministrador = null;
        Administrador instance = new Administrador();
        instance.setApellidoAdministrador(apellidoAdministrador);
        assertNull(instance.getApellidoAdministrador());
    }

    /**
     * Test of getCorreo method, of class Administrador.
     */
    @Test
    public void testGetCorreo() {
        System.out.println("getCorreo");
        Administrador instance = new Administrador();
        String result = instance.getCorreo();
        assertNull(result);
    }

    /**
     * Test of setCorreo method, of class Administrador.
     */
    @Test
    public void testSetCorreo() {
        System.out.println("setCorreo");
        String correo = "admin@example.com";
        Administrador instance = new Administrador();
        instance.setCorreo(correo);
        assertEquals(correo, instance.getCorreo());
    }

    /**
     * Test of setCorreo with empty string.
     */
    @Test
    public void testSetCorreoEmpty() {
        System.out.println("setCorreo with empty string");
        String correo = "";
        Administrador instance = new Administrador();
        instance.setCorreo(correo);
        assertEquals(correo, instance.getCorreo());
    }

    /**
     * Test of setCorreo with null value.
     */
    @Test
    public void testSetCorreoNull() {
        System.out.println("setCorreo with null");
        String correo = null;
        Administrador instance = new Administrador();
        instance.setCorreo(correo);
        assertNull(instance.getCorreo());
    }

    /**
     * Test of getContra method, of class Administrador.
     */
    @Test
    public void testGetContra() {
        System.out.println("getContra");
        Administrador instance = new Administrador();
        String result = instance.getContra();
        assertNull(result);
    }

    /**
     * Test of setContra method, of class Administrador.
     */
    @Test
    public void testSetContra() {
        System.out.println("setContra");
        String contra = "password123";
        Administrador instance = new Administrador();
        instance.setContra(contra);
        assertEquals(contra, instance.getContra());
    }

    /**
     * Test of setContra with empty string.
     */
    @Test
    public void testSetContraEmpty() {
        System.out.println("setContra with empty string");
        String contra = "";
        Administrador instance = new Administrador();
        instance.setContra(contra);
        assertEquals(contra, instance.getContra());
    }

    /**
     * Test of setContra with null value.
     */
    @Test
    public void testSetContraNull() {
        System.out.println("setContra with null");
        String contra = null;
        Administrador instance = new Administrador();
        instance.setContra(contra);
        assertNull(instance.getContra());
    }

    /**
     * Test of default constructor.
     */
    @Test
    public void testDefaultConstructor() {
        System.out.println("default constructor");
        Administrador instance = new Administrador();
        assertNotNull(instance);
        assertNull(instance.getIdAdministrador());
        assertNull(instance.getNombreAdministrador());
        assertNull(instance.getApellidoAdministrador());
        assertNull(instance.getCorreo());
        assertNull(instance.getContra());
    }

    /**
     * Test of full constructor with all parameters.
     */
    @Test
    public void testFullConstructor() {
        System.out.println("full constructor");
        Integer idAdministrador = 1;
        String nombreAdministrador = "Juan";
        String apellidoAdministrador = "Pérez";
        String correo = "juan.perez@example.com";
        String contra = "password123";
        
        Administrador instance = new Administrador(idAdministrador, nombreAdministrador, 
                apellidoAdministrador, correo, contra);
        
        assertNotNull(instance);
        assertEquals(idAdministrador, instance.getIdAdministrador());
        assertEquals(nombreAdministrador, instance.getNombreAdministrador());
        assertEquals(apellidoAdministrador, instance.getApellidoAdministrador());
        assertEquals(correo, instance.getCorreo());
        assertEquals(contra, instance.getContra());
    }

    /**
     * Test of full constructor with null values.
     */
    @Test
    public void testFullConstructorWithNulls() {
        System.out.println("full constructor with null values");
        Integer idAdministrador = null;
        String nombreAdministrador = null;
        String apellidoAdministrador = null;
        String correo = null;
        String contra = null;
        
        Administrador instance = new Administrador(idAdministrador, nombreAdministrador, 
                apellidoAdministrador, correo, contra);
        
        assertNotNull(instance);
        assertNull(instance.getIdAdministrador());
        assertNull(instance.getNombreAdministrador());
        assertNull(instance.getApellidoAdministrador());
        assertNull(instance.getCorreo());
        assertNull(instance.getContra());
    }

    /**
     * Test of all setters and getters together.
     */
    @Test
    public void testAllSettersAndGetters() {
        System.out.println("all setters and getters");
        Administrador instance = new Administrador();
        
        Integer id = 5;
        String nombre = "María";
        String apellido = "García";
        String correo = "maria.garcia@example.com";
        String contra = "securePassword456";
        
        instance.setIdAdministrador(id);
        instance.setNombreAdministrador(nombre);
        instance.setApellidoAdministrador(apellido);
        instance.setCorreo(correo);
        instance.setContra(contra);
        
        assertEquals(id, instance.getIdAdministrador());
        assertEquals(nombre, instance.getNombreAdministrador());
        assertEquals(apellido, instance.getApellidoAdministrador());
        assertEquals(correo, instance.getCorreo());
        assertEquals(contra, instance.getContra());
    }
    
}
