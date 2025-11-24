/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.pe.mispatitas.historial.entidad;

import entidad.Servicio;
import java.io.InputStream;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Anai
 */
public class ServicioTest {
    
    public ServicioTest() {
    }

    /**
     * Test of getImagenBase64 method, of class Servicio.
     */
    @Test
    public void testGetImagenBase64() {
        System.out.println("getImagenBase64");
        Servicio instance = new Servicio();
        String expResult = "";
        String result = instance.getImagenBase64();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setImagenBase64 method, of class Servicio.
     */
    @Test
    public void testSetImagenBase64() {
        System.out.println("setImagenBase64");
        String imagenBase64 = "";
        Servicio instance = new Servicio();
        instance.setImagenBase64(imagenBase64);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getIdServicio method, of class Servicio.
     */
    @Test
    public void testGetIdServicio() {
        System.out.println("getIdServicio");
        Servicio instance = new Servicio();
        Integer expResult = null;
        Integer result = instance.getIdServicio();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setIdServicio method, of class Servicio.
     */
    @Test
    public void testSetIdServicio() {
        System.out.println("setIdServicio");
        Integer idServicio = null;
        Servicio instance = new Servicio();
        instance.setIdServicio(idServicio);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNombre method, of class Servicio.
     */
    @Test
    public void testGetNombre() {
        System.out.println("getNombre");
        Servicio instance = new Servicio();
        String expResult = "";
        String result = instance.getNombre();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setNombre method, of class Servicio.
     */
    @Test
    public void testSetNombre() {
        System.out.println("setNombre");
        String nombre = "";
        Servicio instance = new Servicio();
        instance.setNombre(nombre);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDescripcion method, of class Servicio.
     */
    @Test
    public void testGetDescripcion() {
        System.out.println("getDescripcion");
        Servicio instance = new Servicio();
        String expResult = "";
        String result = instance.getDescripcion();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDescripcion method, of class Servicio.
     */
    @Test
    public void testSetDescripcion() {
        System.out.println("setDescripcion");
        String descripcion = "";
        Servicio instance = new Servicio();
        instance.setDescripcion(descripcion);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFoto method, of class Servicio.
     */
    @Test
    public void testGetFoto() {
        System.out.println("getFoto");
        Servicio instance = new Servicio();
        InputStream expResult = null;
        InputStream result = instance.getFoto();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setFoto method, of class Servicio.
     */
    @Test
    public void testSetFoto() {
        System.out.println("setFoto");
        InputStream foto = null;
        Servicio instance = new Servicio();
        instance.setFoto(foto);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
