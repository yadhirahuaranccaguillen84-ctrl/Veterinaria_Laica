<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="Javas/app.js" type="module"></script>
        <link href="css/estilo1.css" rel="stylesheet" type="text/css"/>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <link href="css/mascotaUsuario.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoAdministrador.jspf" %>
        <div class="madreMascotaUsuario">
             <div style="max-width: 400px; margin: 0 auto 20px; text-align: center;">

                <label for="selectVet" style="margin-top: 15px; display: block;"><strong>Seleccionar Veterinario:</strong></label>
                <select id="selectVet" style="width: 100%; padding: 8px;">
                    <option value="">-- Seleccione --</option>

                </select>
            </div>
            
            
            <h2 style="text-align:center; margin-top:30px;">Historiales Clínicos</h2>

<table border="1" cellpadding="10" cellspacing="0" 
       style="width:90%; margin:20px auto; border-collapse:collapse; text-align:center;">

    <thead style="background:#f2f2f2;">
        <tr>
            <th>ID Historial</th>
            <th>Veterinario</th>
            <th>ID Mascota</th>
            <th>Fecha</th>
            <th>Descripción</th>
            <th>Tratamiento</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="h" items="${listaHistorial}">
            <tr>
                <td>${h.idHistorial}</td>
                <td>${h.idVeterinario}</td>
                <td>${h.idMascota}</td>
                <td>${h.fechaHistorial}</td>
                <td>${h.descripcion}</td>
                <td>${h.tratamiento}</td>
            </tr>
        </c:forEach>

        <c:if test="${empty listaHistorial}">
            <tr>
                <td colspan="6" style="color:red; font-weight:bold;">
                    No hay historiales disponibles
                </td>
            </tr>
        </c:if>
    </tbody>

</table>
        </div>
<script>
document.addEventListener('DOMContentLoaded', async () => {
    const inputFiltro = document.getElementById("searchVet");
    const selectVet = document.getElementById("selectVet");

    // Carga veterinarios desde la API
    async function cargarVeterinarios() {
        try {
            const response = await fetch("api/veterinarios");
            const data = await response.json();
            
            console.log("dta",data)


            // Limpia el select
            selectVet.innerHTML = '<option value="">-- Seleccione --</option>';

            // Llena opciones
            data.veterinarios.forEach(vet => {
                const option = document.createElement("option");
                option.value = vet.idVeterinario;
                option.textContent = vet.nombreVeterinario;
                selectVet.appendChild(option);
            });

        } catch (error) {
            console.error("Error cargando veterinarios:", error);
        }
    }

    await cargarVeterinarios();

    // Filtro de búsqueda
    inputFiltro.addEventListener("input", function () {
        const filtro = this.value.toLowerCase();
        for (let option of selectVet.options) {
            const texto = option.text.toLowerCase();
            option.style.display = texto.includes(filtro) ? "block" : "none";
        }
    });

});
</script>

<script>
        document.addEventListener('DOMContentLoaded', async () => {
            try {
                // Llamada a la API de veterinarios
                const response = await fetch("api/veterinarios");
                const data = await response.json();

                // Crear un mapa id → nombre
                const mapaVeterinarios = {};
                data.veterinarios.forEach(vet => {
                    mapaVeterinarios[vet.idVeterinario] = vet.nombreVeterinario;
                });

                // Recorre la tabla y reemplaza la celda de idVeterinario
                document.querySelectorAll("tbody tr").forEach(row => {
                    const celda = row.cells[1]; // segunda columna (Veterinario)
                    const id = celda.textContent.trim();
                    if (mapaVeterinarios[id]) {
                        celda.textContent = id + " - " + mapaVeterinarios[id];
                    }
                });

            } catch (error) {
                console.error("Error cargando veterinarios:", error);
            }
        });
        </script>
        <script>
document.addEventListener("DOMContentLoaded", () => {
    const selectVet = document.getElementById("selectVet");
    const tabla = document.querySelector("tbody");

    // Cuando cambie el veterinario seleccionado
    selectVet.addEventListener("change", function() {
        const idSeleccionado = this.value;

        // Recorremos todas las filas
        document.querySelectorAll("tbody tr").forEach(row => {
            const celdaIdVet = row.cells[1]; // columna veterinario
            const texto = celdaIdVet.textContent.trim();

            // Si no seleccionó ninguno → mostrar todo
            if (idSeleccionado === "") {
                row.style.display = "";
                return;
            }

            // Obtiene solo el ID antes del nombre (por si dice "12 - Maria")
            const idFila = texto.split(" - ")[0];

            // Mostrar solo coincidencias
            row.style.display = (idFila === idSeleccionado) ? "" : "none";
        });

    });
});
</script>



        <%@include file="WEB-INF/jspf/pie.jspf" %>
       
    </body>
</html>
