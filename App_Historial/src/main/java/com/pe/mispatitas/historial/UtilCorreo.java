package com.pe.mispatitas.historial;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.InputStream;
import java.util.Properties;

/**
 * Clase de utilidad para el envío de correos electrónicos.
 * Utiliza JavaMail API para enviar correos a través de SMTP (Gmail).
 * 
 * @author Anai Huarancca
 */
public class UtilCorreo {

    /**
     * Método principal para probar el envío de correos electrónicos.
     * Carga la configuración desde un archivo properties y envía un correo de prueba.
     * 
     * @param args Argumentos de la línea de comandos (no utilizados)
     */
    public static void main(String[] args) {
        // Cargar propiedades de configuración desde el archivo config.properties
        Properties proo = new Properties();
        try (InputStream input = UtilCorreo.class.getClassLoader().getResourceAsStream("config.properties")) {

            if (input == null) {
                System.err.println("Sorry, error config.properties");
                return;
            }
            // Cargar las propiedades del archivo
            proo.load(input);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Obtener credenciales de correo desde las propiedades
        final String username = proo.getProperty("email");
        final String password = proo.getProperty("password");

        // Configurar propiedades para la conexión SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.user", "luissantos12@gmail.com");
        props.put("mail.smtp.starttls.enable", "true");

        // Crear autenticador para la sesión de correo
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };

        // Crear sesión de JavaMail con autenticación
        Session session = Session.getInstance(props, authenticator);
        try {
            // Crear mensaje de correo
            Message message = new MimeMessage(session);
            // Establecer la dirección de correo electrónico del remitente
            message.setFrom(new InternetAddress("correo_remitente@gmail.com"));

            // Establecer la dirección de correo electrónico del destinatario
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("luisdemaryori@gmail.com"));
            message.setSubject("Test");
            message.setText("helllllllllllo");
            // Enviar el correo
            Transport.send(message);

            System.err.println("Done");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}