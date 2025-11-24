<%-- 
    Página principal (index) del sistema de veterinaria Laica.
    Muestra información general sobre la clínica veterinaria, servicios ofrecidos,
    características y galería de imágenes.
    Incluye el formulario de login para usuarios, veterinarios y administradores.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <%-- Incluir enlaces CSS y JavaScript comunes --%>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>

        <%-- Enlaces a fuentes de Google Fonts --%>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
        
    </head>
    <body>
        <%-- Encabezado de la página con barra de navegación --%>
        <header class="header">
            <%-- Incluir barra de navegación para usuarios no autenticados --%>
             <%@include file="WEB-INF/jspf/encabezadoNormal.jspf" %>

            <%-- Mensaje de bienvenida en el header --%>
            <div class="header__texto">
                <h2 class="no-margin">Bienvenido a Laica</h2>
                <p class="no-margin">Ofrecemos los mejores servicios para tu mascota</p>
            </div>
        </header>
        <%-- Sección que muestra los servicios ofrecidos --%>
        <section>
            <div class="contenedor">
                <div class="caja2">
                    <h3 class="no-margin">Lo que ofrecemos</h3>
                </div>
            </div>
        </section>
        <%-- Sección con mensaje motivacional y botón de contacto --%>
        <section>
            <div class="contenedor">
                <div class="caja">
                    <div class="caja__texto">
                        <h3>Calidad y Experiencia</h3>
                        <p>"El cuidado de tus mascotas es nuestra especialidad, ¡porque su bienestar es nuestra prioridad!"</p>
                    </div>
                    <div class="caja__contacto">
                        <a class="boton" href="#">Contactenos</a>
                    </div>
                </div>
            </div>
        </section>
        <%-- Galería de imágenes de mascotas --%>
        <section class="contenedor">
            <div class="img-efecto">
                <img src="img/mascota1.jpg" alt="Mascota 1">
                <img src="img/mascota2.jpg" alt="Mascota 2">
                <img src="img/mascota3.jpg" alt="Mascota 3">
                <img src="img/mascota4.jpg" alt="Mascota 4">
                <img src="img/mascota5.jpg" alt="Mascota 5">
            </div>
        </section>
        <%-- Sección que describe los servicios de calidad --%>
        <section class="servicio">
            <div class="contenedor">
                <div class="caja3">
                    <div class="caja3__texto">
                        <h4>Servicios de Calidad</h4>
                        <p>"En nuestra veterinaria, ofrecemos un servicio de calidad excepcional para garantizar la salud y felicidad de tus queridas mascotas. Confía en nuestros expertos cuidadores para brindarles la atención que se merecen".</p>
                        <div class="caja3__enlace">
                            <a class="boton" href="#">Servicios</a>
                        </div>
                    </div>
                    <div class="caja3__imagen">
                        <img src="img/gato.jpg" alt="gato">
                    </div>
                </div>
            </div>
        </section>
        <%-- Galería de imágenes de servicios --%>
        <section class="galeria">
            <img class="galeria_img1" src="img/servi1.jpg" alt="Servicio 1">
            <img class="galeria_img2" src="img/servi2.jpg" alt="Servicio 2">
            <img class="galeria_img3" src="img/servi3.jpg" alt="Servicio 3">
            <img class="galeria_img4" src="img/servi4.jpg" alt="Servicio 4">
            <img class="galeria_img5" src="img/servi5.jpg" alt="Servicio 5">
        </section>
        <%-- Sección que muestra las características principales de la clínica --%>
        <section>
            <div class="contenedor">
                <div class="caja2">
                    <h3 class="no-margin">Nuestras Caracteristicas</h3>
                </div>
            </div>
        </section>
        <%-- Contenido detallado de las características de la clínica --%>
        <section class="caracteristica">
            <div class="contenedor caracteristicas">
                <%-- Característica 1: Cuidado Veterinario --%>
                <div class="carac_1">
                    <h4 class="centrar-texto">Cuidado Veterinario</h4>
                    <p>En nuestra veterinaria, entendemos que cada mascota es única y especial. Nos enorgullece ofrecer un cuidado veterinario excepcional que va más allá del tratamiento médico. Es un compromiso con el bienestar y la felicidad de tus fieles amigos de cuatro patas.</p>
                </div>
                <%-- Característica 2: Capacitación --%>
                <div class="carac_2">
                    <h4 class="centrar-texto">Capacitacion</h4>
                    <p>En nuestra veterinaria, no solo nos preocupamos por la salud de tus mascotas, sino que también creemos en empoderar a nuestros clientes con conocimientos y recursos para el cuidado responsable de sus amigos peludos.</p>
                </div>
                <%-- Imagen decorativa --%>
                <div class="carac_3">
                    <img src="img/perroInicio.jpg" alt="perro">
                </div>
                <%-- Característica 3: Tratamientos --%>
                <div class="carac_4">
                    <h4 class="centrar-texto">Tratamientos</h4>
                    <p>Cuando nuestras queridas mascotas se enfrentan a la enfermedad, merecen el mejor cuidado posible. En nuestra clínica veterinaria, nos dedicamos a brindar tratamientos compasivos y efectivos para ayudar a las mascotas a recuperar su salud y vitalidad.</p>
                </div>
                <%-- Característica 4: Atención --%>
                <div class="carac_5">
                    <h4 class="centrar-texto">Atencion</h4>
                    <p>Además, valoramos profundamente la relación con nuestros clientes. Sabemos que cada mascota es especial y que cada dueño tiene preocupaciones y preguntas únicas. Estamos disponibles para escucharte, responder tus dudas y brindarte apoyo en cada paso del camino.</p>
                </div>
            </div>
        </section>

        <%-- Pie de página con información de contacto y enlaces --%>

        <%@include file="WEB-INF/jspf/pie.jspf" %>

    </body>

</html>
