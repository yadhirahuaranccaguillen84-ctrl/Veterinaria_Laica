<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Dashboard - Usuario</title>
    <%@include file="WEB-INF/jspf/enlaces.jspf" %>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans&family=PT+Sans:wght@400;700&display=swap"
      rel="stylesheet"
    />
    <!-- Chart.js Library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <style>
      .dashboard-container {
        min-height: 90vh;
        margin-top: 10vh;
        padding: 30px 50px;
        background-color: #f5f5f5;
        width: 100%;
        box-sizing: border-box;
        overflow-x: hidden;
      }

      .dashboard-header {
        margin-bottom: 30px;
      }

      .dashboard-header h1 {
        font-size: 36px;
        color: #333;
        margin-bottom: 10px;
      }

      .dashboard-header p {
        font-size: 16px;
        color: #666;
      }

      .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 25px;
        margin-bottom: 40px;
      }

      .stat-card {
        background: white;
        border-radius: 12px;
        padding: 25px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border-left: 4px solid;
      }

      .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
      }

      .stat-card.mascotas {
        border-left-color: #ffd93d;
      }

      .stat-card.historial {
        border-left-color: #9f8ad0;
      }

      .stat-card.visitas {
        border-left-color: #65e3e3;
      }

      .stat-card.vacunas {
        border-left-color: #6bcf7f;
      }

      .stat-card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
      }

      .stat-card-title {
        font-size: 14px;
        color: #666;
        text-transform: uppercase;
        font-weight: 600;
      }

      .stat-card-icon {
        font-size: 32px;
        opacity: 0.8;
      }

      .stat-card-value {
        font-size: 36px;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
      }

      .stat-card-link {
        color: #667eea;
        text-decoration: none;
        font-size: 14px;
        display: inline-flex;
        align-items: center;
        gap: 5px;
        transition: color 0.3s ease;
      }

      .stat-card-link:hover {
        color: #9f8ad0;
      }

      .quick-actions {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .quick-actions h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 25px;
        border-bottom: 3px solid #667eea;
        padding-bottom: 10px;
      }

      .actions-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
      }

      .action-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 10px;
        padding: 25px;
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        cursor: pointer;
        text-decoration: none;
        color: white;
        display: block;
      }

      .action-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
      }

      .action-card-icon {
        font-size: 48px;
        margin-bottom: 15px;
      }

      .action-card-title {
        font-size: 18px;
        font-weight: 600;
      }

      .pets-section {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .pets-section h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 25px;
        border-bottom: 3px solid #667eea;
        padding-bottom: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .pets-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 25px;
      }

      .pet-card {
        background: #f9f9f9;
        border-radius: 12px;
        padding: 20px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border: 2px solid transparent;
        cursor: pointer;
      }

      .pet-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
        border-color: #667eea;
      }

      .pet-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 8px;
        margin-bottom: 15px;
        background: #e0e0e0;
      }

      .pet-name {
        font-size: 20px;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
      }

      .pet-info {
        display: flex;
        flex-direction: column;
        gap: 8px;
      }

      .pet-info-item {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 14px;
        color: #666;
      }

      .pet-info-item i {
        color: #667eea;
      }

      .recent-history {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .recent-history h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 25px;
        border-bottom: 3px solid #667eea;
        padding-bottom: 10px;
      }

      .history-item {
        padding: 20px;
        border-bottom: 1px solid #eee;
        display: flex;
        align-items: center;
        gap: 15px;
        transition: background-color 0.3s ease;
      }

      .history-item:last-child {
        border-bottom: none;
      }

      .history-item:hover {
        background-color: #f9f9f9;
      }

      .history-icon {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
        color: white;
        flex-shrink: 0;
        background: #9f8ad0;
      }

      .history-content {
        flex: 1;
      }

      .history-title {
        font-size: 16px;
        font-weight: 600;
        color: #333;
        margin-bottom: 5px;
      }

      .history-date {
        font-size: 14px;
        color: #666;
      }

      .empty-state {
        text-align: center;
        padding: 40px;
        color: #999;
      }

      .empty-state-icon {
        font-size: 64px;
        margin-bottom: 20px;
        opacity: 0.5;
      }

      .tips-section {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .tips-section h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 25px;
        border-bottom: 3px solid #667eea;
        padding-bottom: 10px;
      }

      .tip-card {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 15px;
        border-left: 4px solid #667eea;
      }

      .tip-title {
        font-size: 16px;
        font-weight: 600;
        color: #333;
        margin-bottom: 8px;
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .tip-content {
        font-size: 14px;
        color: #666;
        line-height: 1.6;
      }

      .chart-container {
        background: white;
        border-radius: 12px;
        padding: 25px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .chart-container h3 {
        font-size: 18px;
        color: #333;
        margin-bottom: 20px;
        border-bottom: 2px solid #667eea;
        padding-bottom: 10px;
      }

      .chart-wrapper {
        position: relative;
        height: 300px;
      }

      @media (max-width: 768px) {
        .dashboard-container {
          padding: 20px;
        }

        .stats-grid {
          grid-template-columns: 1fr;
        }

        .actions-grid {
          grid-template-columns: 1fr;
        }

        .pets-grid {
          grid-template-columns: 1fr;
        }

        .dashboard-header h1 {
          font-size: 28px;
        }
      }
    </style>
  </head>
  <body>
    <%@include file="WEB-INF/jspf/encabezadoUsuario.jspf" %>

    <div class="dashboard-container">
      <div class="dashboard-header">
        <h1>Mi Dashboard</h1>
        <p>Bienvenido a tu panel de control de Laica</p>
      </div>

      <!-- Statistics Cards -->
      <div class="stats-grid">
        <div class="stat-card mascotas">
          <div class="stat-card-header">
            <span class="stat-card-title">Mis Mascotas</span>
            <i class="bx bx-paw stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalMascotas">0</div>
          <a href="#" id="mascotasLink" class="stat-card-link">
            Ver todas <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card historial">
          <div class="stat-card-header">
            <span class="stat-card-title">Historiales Clínicos</span>
            <i class="bx bx-clipboard stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalHistoriales">0</div>
          <a href="#" id="historialLink" class="stat-card-link">
            Ver historiales <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card visitas">
          <div class="stat-card-header">
            <span class="stat-card-title">Visitas Recientes</span>
            <i class="bx bx-calendar-check stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="visitasRecientes">0</div>
          <a href="#" id="historialLink2" class="stat-card-link">
            Ver todas <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card vacunas">
          <div class="stat-card-header">
            <span class="stat-card-title">Próximas Vacunas</span>
            <i class="bx bx-shield stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="proximasVacunas">0</div>
          <a href="#" id="historialLink3" class="stat-card-link">
            Ver calendario <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>
      </div>

      <!-- Quick Actions -->
      <div class="quick-actions">
        <h2>Acciones Rápidas</h2>
        <div class="actions-grid">
          <a href="#" id="agregarMascotaLink" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-plus-circle"></i>
            </div>
            <div class="action-card-title">Agregar Mascota</div>
          </a>

          <a href="#" id="verHistorialLink" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-clipboard"></i>
            </div>
            <div class="action-card-title">Ver Historial</div>
          </a>

          <a href="#" id="contactoLink" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-envelope"></i>
            </div>
            <div class="action-card-title">Contactar</div>
          </a>

          <a href="/Historial/MostrarServicioUsuario" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-list-ul"></i>
            </div>
            <div class="action-card-title">Ver Servicios</div>
          </a>
        </div>
      </div>

      <!-- My Pets Section -->
      <div class="pets-section">
        <h2>
          Mis Mascotas
          <a
            href="#"
            id="verTodasMascotasLink"
            style="font-size: 14px; color: #667eea; text-decoration: none"
          >
            Ver todas →
          </a>
        </h2>
        <div class="pets-grid" id="petsGrid">
          <div class="empty-state">
            <div class="empty-state-icon">
              <i class="bx bx-paw"></i>
            </div>
            <p>Cargando mascotas...</p>
          </div>
        </div>
      </div>

      <!-- Recent History Section -->
      <div class="recent-history">
        <h2>Historial Clínico Reciente</h2>
        <div id="recentHistoryContainer">
          <div class="empty-state">
            <div class="empty-state-icon">
              <i class="bx bx-clipboard"></i>
            </div>
            <p>Cargando historial clínico...</p>
          </div>
        </div>
      </div>

      <!-- Pet Care Tips Section -->
      <div class="tips-section">
        <h2>Consejos para el Cuidado de tu Mascota</h2>
        <div class="tip-card">
          <div class="tip-title">
            <i class="bx bx-heart"></i>
            Alimentación Balanceada
          </div>
          <div class="tip-content">
            Asegúrate de proporcionar una dieta equilibrada y adecuada para la
            edad y tamaño de tu mascota. Consulta con tu veterinario sobre las
            porciones recomendadas.
          </div>
        </div>
        <div class="tip-card">
          <div class="tip-title">
            <i class="bx bx-water"></i>
            Hidratación Constante
          </div>
          <div class="tip-content">
            Mantén siempre agua fresca y limpia disponible para tu mascota. El
            agua es esencial para su salud y bienestar.
          </div>
        </div>
        <div class="tip-card">
          <div class="tip-title">
            <i class="bx bx-walk"></i>
            Ejercicio Regular
          </div>
          <div class="tip-content">
            El ejercicio diario es importante para mantener a tu mascota
            saludable y feliz. Adapta la intensidad según la raza y edad.
          </div>
        </div>
        <div class="tip-card">
          <div class="tip-title">
            <i class="bx bx-calendar"></i>
            Visitas Veterinarias
          </div>
          <div class="tip-content">
            Programa revisiones regulares con tu veterinario para mantener al
            día las vacunas y detectar cualquier problema de salud a tiempo.
          </div>
        </div>
      </div>

      <!-- Chart Section -->
      <div class="chart-container">
        <h3>Actividad de Visitas</h3>
        <div class="chart-wrapper">
          <canvas id="visitsChart"></canvas>
        </div>
      </div>
    </div>

    <%@include file="WEB-INF/jspf/pie.jspf" %>

    <script>
      // Chart instance
      let visitsChart = null;

      // User data cache
      let userData = {
        mascotas: [],
        historiales: [],
        idUsuario: null,
      };

      // Initialize user ID from localStorage
      function initializeUserData() {
        const codigo =
          localStorage.getItem("codigoUsuario") ||
          localStorage.getItem("idUsuario");
        userData.idUsuario = codigo;

        if (codigo) {
          // Update links with user ID
          const mascotasLink = document.getElementById("mascotasLink");
          const historialLink = document.getElementById("historialLink");
          const historialLink2 = document.getElementById("historialLink2");
          const historialLink3 = document.getElementById("historialLink3");
          const agregarMascotaLink =
            document.getElementById("agregarMascotaLink");
          const verHistorialLink = document.getElementById("verHistorialLink");
          const contactoLink = document.getElementById("contactoLink");
          const verTodasMascotasLink = document.getElementById(
            "verTodasMascotasLink"
          );

          if (mascotasLink) {
            mascotasLink.href =
              "<%= request.getContextPath() %>/listarMascota?idUsuario=" +
              codigo;
          }
          if (historialLink) {
            historialLink.href =
              "<%= request.getContextPath() %>/listarHistorialUsuario?idUsuario=" +
              codigo;
          }
          if (historialLink2) {
            historialLink2.href =
              "<%= request.getContextPath() %>/listarHistorialUsuario?idUsuario=" +
              codigo;
          }
          if (historialLink3) {
            historialLink3.href =
              "<%= request.getContextPath() %>/listarHistorialUsuario?idUsuario=" +
              codigo;
          }
          if (agregarMascotaLink) {
            agregarMascotaLink.href =
              "<%= request.getContextPath() %>/registrarMascota.jsp";
          }
          if (verHistorialLink) {
            verHistorialLink.href =
              "<%= request.getContextPath() %>/listarHistorialUsuario?idUsuario=" +
              codigo;
          }
          if (contactoLink) {
            contactoLink.href =
              "<%= request.getContextPath() %>/contacto?idUsuario=" + codigo;
          }
          if (verTodasMascotasLink) {
            verTodasMascotasLink.href =
              "<%= request.getContextPath() %>/listarMascota?idUsuario=" +
              codigo;
          }
        }
      }

      // Load user statistics
      async function loadStatistics() {
        try {
          const codigo = userData.idUsuario;
          if (!codigo) {
            console.warn("No user ID found");
            return;
          }

          // Load pets
          const mascotasResponse = await fetch(
            "<%= request.getContextPath() %>/listarMascota?idUsuario=" + codigo
          );
          if (mascotasResponse.ok) {
            const mascotasText = await mascotasResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(mascotasText, "text/html");

            // Try to find pets in the page
            const mascotas = [];
            const petCards = doc.querySelectorAll(
              '.contenedorGeneral, .pet-card, [class*="mascota"]'
            );

            if (petCards.length > 0) {
              petCards.forEach((card) => {
                const nombre =
                  card
                    .querySelector('.nombreMascota, [class*="nombre"]')
                    ?.textContent?.trim() || "Sin nombre";
                const imagen = card.querySelector("img")?.src || "";
                const datos = card.querySelectorAll(
                  '.datosMascota span, [class*="dato"]'
                );

                mascotas.push({
                  nombre: nombre,
                  imagen: imagen,
                  datos: Array.from(datos).map((d) => d.textContent.trim()),
                });
              });
            }

            userData.mascotas = mascotas;
            const totalMascotas = mascotas.length;
            animateValue("totalMascotas", 0, totalMascotas, 1000);
            displayPets(mascotas);
          }

          // Load medical history
          const historialResponse = await fetch(
            "<%= request.getContextPath() %>/listarHistorialUsuario?idUsuario=" +
              codigo
          );
          if (historialResponse.ok) {
            const historialText = await historialResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(historialText, "text/html");

            const historiales = [];
            const rows = doc.querySelectorAll(
              'table tr, .historial-item, [class*="historial"]'
            );

            if (rows.length > 0) {
              rows.forEach((row, index) => {
                if (index === 0) return; // Skip header
                const cells = row.querySelectorAll('td, [class*="celda"]');
                if (cells.length >= 3) {
                  historiales.push({
                    mascota: cells[0]?.textContent?.trim() || "Mascota",
                    fecha:
                      cells[1]?.textContent?.trim() || "Fecha no disponible",
                    descripcion:
                      cells[2]?.textContent?.trim() || "Sin descripción",
                    tratamiento: cells[3]?.textContent?.trim() || "",
                  });
                }
              });
            }

            userData.historiales = historiales;
            const totalHistoriales = historiales.length;
            animateValue("totalHistoriales", 0, totalHistoriales, 1000);

            // Count recent visits (last 30 days)
            const hoy = new Date();
            const hace30Dias = new Date(hoy);
            hace30Dias.setDate(hace30Dias.getDate() - 30);

            const visitasRecientes = historiales.filter((h) => {
              try {
                const fecha = new Date(h.fecha);
                return fecha >= hace30Dias;
              } catch {
                return false;
              }
            }).length;

            animateValue("visitasRecientes", 0, visitasRecientes, 1000);
            displayRecentHistory(historiales.slice(0, 5));
            updateVisitsChart(historiales);
          }

          // Set default value for upcoming vaccines
          document.getElementById("proximasVacunas").textContent = "0";
        } catch (error) {
          console.error("Error loading statistics:", error);
          document.getElementById("totalMascotas").textContent = "0";
          document.getElementById("totalHistoriales").textContent = "0";
          document.getElementById("visitasRecientes").textContent = "0";
        }
      }

      // Animate value counter
      function animateValue(elementId, start, end, duration) {
        const element = document.getElementById(elementId);
        if (!element) return;

        const targetValue = Math.max(0, parseInt(end) || 0);
        const currentValue = parseInt(element.textContent) || start || 0;
        const actualStart = isNaN(currentValue) ? 0 : Math.max(0, currentValue);

        if (actualStart > targetValue) {
          element.textContent = targetValue;
          return;
        }

        const range = targetValue - actualStart;
        if (range === 0) {
          element.textContent = targetValue;
          return;
        }

        const stepTime = Math.max(10, Math.abs(Math.floor(duration / range)));
        let current = actualStart;

        const timer = setInterval(() => {
          current += 1;
          current = Math.max(0, current);
          element.textContent = current;

          if (current >= targetValue) {
            element.textContent = targetValue;
            clearInterval(timer);
          }
        }, stepTime);
      }

      // Display pets
      function displayPets(mascotas) {
        const petsGrid = document.getElementById("petsGrid");
        if (!petsGrid) return;

        if (mascotas.length === 0) {
          const emptyState = document.createElement("div");
          emptyState.className = "empty-state";
          emptyState.style.gridColumn = "1 / -1";
          emptyState.innerHTML =
            '<div class="empty-state-icon">' +
            '<i class="bx bx-paw"></i>' +
            "</div>" +
            "<p>No tienes mascotas registradas</p>" +
            '<a href="<%= request.getContextPath() %>/registrarMascota.jsp" ' +
            'style="display: inline-block; margin-top: 15px; padding: 10px 20px; ' +
            "background: #667eea; color: white; text-decoration: none; " +
            'border-radius: 8px;">' +
            "Agregar Mascota" +
            "</a>";
          petsGrid.appendChild(emptyState);
          return;
        }

        petsGrid.innerHTML = "";
        mascotas.slice(0, 6).forEach((mascota) => {
          const petCard = document.createElement("div");
          petCard.className = "pet-card";
          petCard.onclick = () => {
            window.location.href =
              "<%= request.getContextPath() %>/listarMascota?idUsuario=" +
              userData.idUsuario;
          };

          // Build pet info HTML
          let petInfoHtml = "";
          if (mascota.datos && mascota.datos.length > 0) {
            petInfoHtml = mascota.datos
              .slice(0, 3)
              .map(
                (dato) =>
                  '<div class="pet-info-item"><i class="bx bx-info-circle"></i> ' +
                  escapeHtml(dato) +
                  "</div>"
              )
              .join("");
          } else {
            petInfoHtml =
              '<div class="pet-info-item"><i class="bx bx-info-circle"></i> Información no disponible</div>';
          }

          const imagenSrc =
            mascota.imagen ||
            "https://via.placeholder.com/300x200?text=Mascota";

          petCard.innerHTML =
            '<img src="' +
            escapeHtml(imagenSrc) +
            '" ' +
            'alt="' +
            escapeHtml(mascota.nombre) +
            '" ' +
            'class="pet-image" ' +
            "onerror=\"this.src='https://via.placeholder.com/300x200?text=Mascota'\">" +
            '<div class="pet-name">' +
            escapeHtml(mascota.nombre) +
            "</div>" +
            '<div class="pet-info">' +
            petInfoHtml +
            "</div>";
          petsGrid.appendChild(petCard);
        });
      }

      // Display recent history
      function displayRecentHistory(historiales) {
        const container = document.getElementById("recentHistoryContainer");
        if (!container) return;

        if (historiales.length === 0) {
          container.innerHTML =
            '<div class="empty-state">' +
            '<div class="empty-state-icon">' +
            '<i class="bx bx-clipboard"></i>' +
            "</div>" +
            "<p>No hay historial clínico registrado</p>" +
            "</div>";
          return;
        }

        container.innerHTML = "";
        historiales.forEach((historial) => {
          const historyItem = document.createElement("div");
          historyItem.className = "history-item";
          historyItem.onclick = () => {
            window.location.href =
              "<%= request.getContextPath() %>/listarHistorialUsuario?idUsuario=" +
              userData.idUsuario;
          };

          const tratamientoText = historial.tratamiento
            ? " | " + escapeHtml(historial.tratamiento)
            : "";

          historyItem.innerHTML =
            '<div class="history-icon">' +
            '<i class="bx bx-clipboard"></i>' +
            "</div>" +
            '<div class="history-content">' +
            '<div class="history-title">' +
            escapeHtml(historial.mascota) +
            " - " +
            escapeHtml(historial.descripcion) +
            "</div>" +
            '<div class="history-date">' +
            '<i class="bx bx-calendar"></i> ' +
            escapeHtml(historial.fecha) +
            tratamientoText +
            "</div>" +
            "</div>";
          container.appendChild(historyItem);
        });
      }

      // Update visits chart
      function updateVisitsChart(historiales) {
        const ctx = document.getElementById("visitsChart");
        if (!ctx) return;

        // Group visits by month
        const meses = {};
        historiales.forEach((h) => {
          if (h.fecha) {
            try {
              const fecha = new Date(h.fecha);
              if (!isNaN(fecha.getTime())) {
                const mes = fecha.toLocaleString("es-ES", {
                  month: "short",
                  year: "numeric",
                });
                meses[mes] = (meses[mes] || 0) + 1;
              }
            } catch (e) {
              console.warn("Fecha inválida:", h.fecha);
            }
          }
        });

        const labels = Object.keys(meses).sort();
        const data = labels.map((label) => meses[label]);

        if (visitsChart) {
          visitsChart.destroy();
        }

        if (labels.length === 0) {
          ctx.getContext("2d").clearRect(0, 0, ctx.width, ctx.height);
          return;
        }

        visitsChart = new Chart(ctx, {
          type: "line",
          data: {
            labels: labels,
            datasets: [
              {
                label: "Visitas",
                data: data,
                borderColor: "#667eea",
                backgroundColor: "rgba(102, 126, 234, 0.1)",
                borderWidth: 3,
                fill: true,
                tension: 0.4,
                pointRadius: 5,
                pointHoverRadius: 7,
                pointBackgroundColor: "#667eea",
                pointBorderColor: "#fff",
                pointBorderWidth: 2,
              },
            ],
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
              legend: {
                display: false,
              },
              tooltip: {
                backgroundColor: "rgba(0, 0, 0, 0.8)",
                padding: 12,
              },
            },
            scales: {
              y: {
                beginAtZero: true,
                ticks: {
                  stepSize: 1,
                },
                grid: {
                  color: "rgba(0, 0, 0, 0.05)",
                },
              },
              x: {
                grid: {
                  display: false,
                },
              },
            },
            animation: {
              duration: 1500,
              easing: "easeInOutQuart",
            },
          },
        });
      }

      // Helper function to escape HTML
      function escapeHtml(text) {
        if (!text) return "";
        const div = document.createElement("div");
        div.textContent = text;
        return div.innerHTML;
      }

      // Initialize on page load
      document.addEventListener("DOMContentLoaded", function () {
        initializeUserData();
        loadStatistics();

        // Auto-refresh every 5 minutes
        setInterval(() => {
          loadStatistics();
        }, 300000);
      });
    </script>
  </body>
</html>
