<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Dashboard - Veterinario</title>
    <%@include file="WEB-INF/jspf/enlaces.jspf" %>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans&family=PT+Sans:wght@400;700&display=swap"
      rel="stylesheet"
    />
    <!-- Chart.js Library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns@3.0.0/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
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

      .stat-card.pets {
        border-left-color: #65e3e3;
      }

      .stat-card.historial {
        border-left-color: #9f8ad0;
      }

      .stat-card.mensajes {
        border-left-color: #fbc2eb;
      }

      .stat-card.asistencia {
        border-left-color: #667eea;
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
        border-bottom: 3px solid #65e3e3;
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

      .recent-activities {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      }

      .recent-activities h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 25px;
        border-bottom: 3px solid #65e3e3;
        padding-bottom: 10px;
      }

      .activity-item {
        padding: 20px;
        border-bottom: 1px solid #eee;
        display: flex;
        align-items: center;
        gap: 15px;
        transition: background-color 0.3s ease;
      }

      .activity-item:last-child {
        border-bottom: none;
      }

      .activity-item:hover {
        background-color: #f9f9f9;
      }

      .activity-icon {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
        color: white;
        flex-shrink: 0;
      }

      .activity-icon.pets {
        background: #65e3e3;
      }

      .activity-icon.historial {
        background: #9f8ad0;
      }

      .activity-icon.mensaje {
        background: #fbc2eb;
      }

      .activity-content {
        flex: 1;
      }

      .activity-title {
        font-size: 16px;
        font-weight: 600;
        color: #333;
        margin-bottom: 5px;
      }

      .activity-date {
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

      /* Charts Section */
      .charts-section {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
        gap: 25px;
        margin-bottom: 40px;
        width: 100%;
        box-sizing: border-box;
      }

      .chart-container {
        background: white;
        border-radius: 12px;
        padding: 25px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        position: relative;
        min-height: 400px;
        height: auto;
        overflow: hidden;
        display: flex;
        flex-direction: column;
      }

      .chart-container h3 {
        font-size: 18px;
        color: #333;
        margin-bottom: 20px;
        border-bottom: 2px solid #65e3e3;
        padding-bottom: 10px;
        margin-top: 0;
        flex-shrink: 0;
      }

      .chart-wrapper {
        position: relative;
        flex: 1;
        min-height: 280px;
        max-height: 320px;
        overflow: hidden;
      }

      .chart-loading {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
        color: #999;
      }

      .refresh-btn {
        position: absolute;
        top: 25px;
        right: 25px;
        background: #667eea;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 8px 15px;
        cursor: pointer;
        font-size: 14px;
        display: flex;
        align-items: center;
        gap: 5px;
        transition: background 0.3s ease;
      }

      .refresh-btn:hover {
        background: #764ba2;
      }

      .refresh-btn:disabled {
        background: #ccc;
        cursor: not-allowed;
      }

      .stats-animation {
        animation: countUp 1s ease-out;
      }

      @keyframes countUp {
        from {
          opacity: 0;
          transform: translateY(10px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .pulse {
        animation: pulse 2s infinite;
      }

      @keyframes pulse {
        0%,
        100% {
          opacity: 1;
        }
        50% {
          opacity: 0.7;
        }
      }

      .chart-legend {
        margin-top: 15px;
        font-size: 12px;
        color: #666;
        text-align: center;
        flex-shrink: 0;
        padding-top: 10px;
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

        .charts-section {
          grid-template-columns: 1fr;
        }

        .chart-container {
          min-height: 350px;
          height: auto;
        }

        .chart-wrapper {
          min-height: 240px;
          max-height: 270px;
        }

        .dashboard-header h1 {
          font-size: 28px;
        }
      }
    </style>
  </head>
  <body>
    <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>

    <div class="dashboard-container">
      <div class="dashboard-header">
        <h1>Dashboard Veterinario</h1>
        <p>Bienvenido al panel de control de Laica</p>
      </div>

      <!-- Statistics Cards -->
      <div class="stats-grid">
        <div class="stat-card pets">
          <div class="stat-card-header">
            <span class="stat-card-title">Total Mascotas</span>
            <i class="bx bx-paw stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalMascotas">0</div>
          <a href="/Historial/mascotaVeterinario" class="stat-card-link">
            Ver todas <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card historial">
          <div class="stat-card-header">
            <span class="stat-card-title">Historiales Clínicos</span>
            <i class="bx bx-clipboard stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalHistoriales">0</div>
          <a href="/Historial/ReporteHistorial" class="stat-card-link">
            Ver reportes <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card mensajes">
          <div class="stat-card-header">
            <span class="stat-card-title">Mensajes</span>
            <i class="bx bx-message stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalMensajes">0</div>
          <a href="/Historial/contactoVeterinario" class="stat-card-link">
            Ver mensajes <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card asistencia">
          <div class="stat-card-header">
            <span class="stat-card-title">Asistencia Hoy</span>
            <i class="bx bx-calendar-check stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="asistenciaHoy">Cargando...</div>
          <a href="/Historial/MarcarAsistencia.jsp" class="stat-card-link">
            Marcar asistencia <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>
      </div>

      <!-- Quick Actions -->
      <div class="quick-actions">
        <h2>Acciones Rápidas</h2>
        <div class="actions-grid">
          <a href="/Historial/mascotaVeterinario" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-paw"></i>
            </div>
            <div class="action-card-title">Ver Mascotas</div>
          </a>

          <a
            href="/Historial/registrarHistorialVeterinario.jsp"
            class="action-card"
          >
            <div class="action-card-icon">
              <i class="bx bx-plus-circle"></i>
            </div>
            <div class="action-card-title">Nuevo Historial</div>
          </a>

          <a href="/Historial/MarcarAsistencia.jsp" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-time-five"></i>
            </div>
            <div class="action-card-title">Marcar Asistencia</div>
          </a>

          <a href="/Historial/ReporteHistorial" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-bar-chart-alt-2"></i>
            </div>
            <div class="action-card-title">Ver Reportes</div>
          </a>

          <a href="/Historial/contactoVeterinario" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-envelope"></i>
            </div>
            <div class="action-card-title">Mensajes</div>
          </a>

          <a href="/Historial/MostrarServicio" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-list-ul"></i>
            </div>
            <div class="action-card-title">Servicios</div>
          </a>
        </div>
      </div>

      <!-- Charts Section -->
      <div class="charts-section">
        <div class="chart-container">
          <button class="refresh-btn" onclick="refreshCharts()" id="refreshBtn">
            <i class="bx bx-refresh"></i> Actualizar
          </button>
          <h3>Historiales Clínicos por Mes</h3>
          <div class="chart-wrapper">
            <canvas id="historialesChart"></canvas>
          </div>
          <div class="chart-legend">
            Tendencia de historiales clínicos registrados
          </div>
        </div>

        <div class="chart-container">
          <h3>Mascotas por Especie</h3>
          <div class="chart-wrapper">
            <canvas id="especiesChart"></canvas>
          </div>
          <div class="chart-legend">Distribución de mascotas por tipo</div>
        </div>

        <div class="chart-container">
          <h3>Actividad Semanal</h3>
          <div class="chart-wrapper">
            <canvas id="actividadChart"></canvas>
          </div>
          <div class="chart-legend">Actividad de la última semana</div>
        </div>

        <div class="chart-container">
          <h3>Asistencias del Mes</h3>
          <div class="chart-wrapper">
            <canvas id="asistenciasChart"></canvas>
          </div>
          <div class="chart-legend">Registro de asistencias mensuales</div>
        </div>
      </div>

      <!-- Recent Activities -->
      <div class="recent-activities">
        <h2>Actividades Recientes</h2>
        <div id="recentActivities">
          <div class="empty-state">
            <div class="empty-state-icon">
              <i class="bx bx-time"></i>
            </div>
            <p>Cargando actividades recientes...</p>
          </div>
        </div>
      </div>
    </div>

    <%@include file="WEB-INF/jspf/pie.jspf" %>

    <script>
      // Obtener idVeterinario del localStorage
      const idVeterinario = localStorage.getItem("idVeterinario");

      // Chart instances
      let historialesChart = null;
      let especiesChart = null;
      let actividadChart = null;
      let asistenciasChart = null;

      // Data cache
      let dashboardData = {
        mascotas: [],
        historiales: [],
        mensajes: [],
        asistencias: [],
      };

      // Función para cargar estadísticas
      async function loadStatistics() {
        try {
          // Cargar datos de mascotas
          const mascotasResponse = await fetch("/Historial/mascotaVeterinario");
          if (mascotasResponse.ok) {
            const mascotasText = await mascotasResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(mascotasText, "text/html");
            const mascotasTable = doc.querySelector(".tablaHistorial");
            if (mascotasTable) {
              const rows = Array.from(
                mascotasTable.querySelectorAll("tr")
              ).slice(1);
              const totalMascotas = rows.length;

              // Extraer datos de mascotas para gráficos
              dashboardData.mascotas = rows.map((row) => {
                const cells = row.querySelectorAll("td");
                return {
                  nombre: cells[0]?.textContent?.trim() || "",
                  especie: cells[3]?.textContent?.trim() || "",
                  raza: cells[5]?.textContent?.trim() || "",
                  fechaNacimiento: cells[2]?.textContent?.trim() || "",
                };
              });

              // Animar contador - asegurar que totalMascotas sea un número válido
              const totalMascotasNum = Math.max(
                0,
                parseInt(totalMascotas) || 0
              );
              animateValue("totalMascotas", 0, totalMascotasNum, 1000);
            }
          }

          // Cargar datos de historiales
          const historialesResponse = await fetch(
            "/Historial/ReporteHistorial"
          );
          if (historialesResponse.ok) {
            const historialesText = await historialesResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(historialesText, "text/html");
            const historialesTable = doc.querySelector(".tablaHistorial");
            if (historialesTable) {
              const rows = Array.from(
                historialesTable.querySelectorAll("tr")
              ).slice(1);
              // Filtrar filas vacías o inválidas
              const validRows = rows.filter((row) => {
                const cells = row.querySelectorAll("td");
                // Verificar que la fila tenga celdas y no esté vacía
                return cells.length > 0 && row.textContent.trim().length > 0;
              });
              const totalHistoriales = validRows.length;

              // Extraer datos de historiales para gráficos
              dashboardData.historiales = validRows.map((row) => {
                const cells = row.querySelectorAll("td");
                return {
                  fecha: cells[4]?.textContent?.trim() || "",
                  tratamiento: cells[6]?.textContent?.trim() || "",
                  idMascota: cells[3]?.textContent?.trim() || "",
                };
              });

              // Animar contador - asegurar que totalHistoriales sea un número válido
              const totalHistorialesNum = Math.max(
                0,
                parseInt(totalHistoriales) || 0
              );
              // Limpiar cualquier valor previo antes de animar
              const historialesElement =
                document.getElementById("totalHistoriales");
              if (historialesElement) {
                historialesElement.textContent = "0";
                animateValue("totalHistoriales", 0, totalHistorialesNum, 1000);
              }

              // Actualizar gráficos después de cargar datos
              updateHistorialesChart();
              updateActividadChart();
            } else {
              // Si no hay tabla, establecer a 0
              document.getElementById("totalHistoriales").textContent = "0";
            }
          } else {
            // Si la respuesta falla, establecer a 0
            document.getElementById("totalHistoriales").textContent = "0";
          }

          // Cargar datos de mensajes
          const mensajesResponse = await fetch(
            "/Historial/contactoVeterinario"
          );
          if (mensajesResponse.ok) {
            const mensajesText = await mensajesResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(mensajesText, "text/html");
            const mensajesTable = doc.querySelector(".tablaHistorial");
            if (mensajesTable) {
              const rows = Array.from(
                mensajesTable.querySelectorAll("tr")
              ).slice(1);
              const totalMensajes = rows.length;

              dashboardData.mensajes = rows.map((row) => {
                const cells = row.querySelectorAll("td");
                return {
                  mensaje: cells[2]?.textContent?.trim() || "",
                  usuario: cells[1]?.textContent?.trim() || "",
                };
              });

              // Animar contador - asegurar que totalMensajes sea un número válido
              const totalMensajesNum = Math.max(
                0,
                parseInt(totalMensajes) || 0
              );
              animateValue("totalMensajes", 0, totalMensajesNum, 1000);
            }
          }

          // Cargar asistencia del día
          const asistenciaResponse = await fetch("/Historial/api/veterinarios");
          if (asistenciaResponse.ok) {
            const asistenciaData = await asistenciaResponse.json();
            if (asistenciaData.asistencias) {
              dashboardData.asistencias = asistenciaData.asistencias;

              const today = new Date().toISOString().split("T")[0];
              const asistenciaHoy = asistenciaData.asistencias.filter((a) => {
                return (
                  a.fecha &&
                  a.fecha.startsWith(today) &&
                  a.idVeterinario == idVeterinario
                );
              }).length;

              const asistenciaElement =
                document.getElementById("asistenciaHoy");
              asistenciaElement.textContent =
                asistenciaHoy > 0 ? "Registrada" : "Pendiente";
              asistenciaElement.classList.add("stats-animation");

              // Actualizar gráfico de asistencias
              updateAsistenciasChart();
            }
          }

          // Actualizar gráfico de especies después de cargar mascotas
          updateEspeciesChart();
        } catch (error) {
          console.error("Error cargando estadísticas:", error);
          // Valores por defecto si hay error
          document.getElementById("totalMascotas").textContent = "0";
          document.getElementById("totalHistoriales").textContent = "0";
          document.getElementById("totalMensajes").textContent = "0";
          document.getElementById("asistenciaHoy").textContent = "Pendiente";
        }
      }

      // Función para animar valores numéricos
      function animateValue(elementId, start, end, duration) {
        const element = document.getElementById(elementId);
        if (!element) return;

        // Asegurar que end sea un número válido y no negativo
        const targetValue = Math.max(0, parseInt(end) || 0);

        // Obtener el valor actual del elemento si existe, o usar start
        const currentValue = parseInt(element.textContent) || start || 0;
        const actualStart = isNaN(currentValue) ? 0 : Math.max(0, currentValue);

        // Si el valor actual es mayor que el objetivo, simplemente actualizar
        if (actualStart > targetValue) {
          element.textContent = targetValue;
          return;
        }

        const range = targetValue - actualStart;

        // Si no hay cambio, solo actualizar el valor
        if (range === 0) {
          element.textContent = targetValue;
          return;
        }

        // Calcular el tiempo por paso (mínimo 10ms para evitar problemas)
        const stepTime = Math.max(10, Math.abs(Math.floor(duration / range)));
        let current = actualStart;

        const timer = setInterval(() => {
          current += 1;
          // Asegurar que nunca sea negativo
          current = Math.max(0, current);
          element.textContent = current;

          if (current >= targetValue) {
            element.textContent = targetValue;
            clearInterval(timer);
          }
        }, stepTime);
      }

      // Función para actualizar gráfico de historiales por mes
      function updateHistorialesChart() {
        const ctx = document.getElementById("historialesChart");
        if (!ctx) return;

        // Agrupar historiales por mes
        const meses = {};
        dashboardData.historiales.forEach((h) => {
          if (h.fecha) {
            const fecha = new Date(h.fecha);
            const mes = fecha.toLocaleString("es-ES", { month: "short" });
            meses[mes] = (meses[mes] || 0) + 1;
          }
        });

        const labels = Object.keys(meses);
        const data = Object.values(meses);

        if (historialesChart) {
          historialesChart.destroy();
        }

        historialesChart = new Chart(ctx, {
          type: "line",
          data: {
            labels: labels,
            datasets: [
              {
                label: "Historiales Clínicos",
                data: data,
                borderColor: "#9f8ad0",
                backgroundColor: "rgba(159, 138, 208, 0.1)",
                borderWidth: 3,
                fill: true,
                tension: 0.4,
                pointRadius: 5,
                pointHoverRadius: 7,
                pointBackgroundColor: "#9f8ad0",
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
                titleFont: { size: 14 },
                bodyFont: { size: 13 },
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

      // Función para actualizar gráfico de especies
      function updateEspeciesChart() {
        const ctx = document.getElementById("especiesChart");
        if (!ctx) return;

        // Contar mascotas por especie
        const especiesCount = {};
        dashboardData.mascotas.forEach((m) => {
          const especie = m.especie || "Sin especificar";
          especiesCount[especie] = (especiesCount[especie] || 0) + 1;
        });

        const labels = Object.keys(especiesCount);
        const data = Object.values(especiesCount);
        const colors = [
          "#65E3E3",
          "#9f8ad0",
          "#fbc2eb",
          "#667eea",
          "#764ba2",
          "#a18cd1",
        ];

        if (especiesChart) {
          especiesChart.destroy();
        }

        especiesChart = new Chart(ctx, {
          type: "doughnut",
          data: {
            labels: labels,
            datasets: [
              {
                data: data,
                backgroundColor: colors.slice(0, labels.length),
                borderWidth: 3,
                borderColor: "#fff",
              },
            ],
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
              legend: {
                position: "bottom",
                labels: {
                  padding: 15,
                  font: { size: 12 },
                },
              },
              tooltip: {
                backgroundColor: "rgba(0, 0, 0, 0.8)",
                padding: 12,
                callbacks: {
                  label: function (context) {
                    const label = context.label || "";
                    const value = context.parsed || 0;
                    const total = context.dataset.data.reduce(
                      (a, b) => a + b,
                      0
                    );
                    const percentage = ((value / total) * 100).toFixed(1);
                    return `${label}: ${value} (${percentage}%)`;
                  },
                },
              },
            },
            animation: {
              animateRotate: true,
              animateScale: true,
              duration: 1500,
            },
          },
        });
      }

      // Función para actualizar gráfico de actividad semanal
      function updateActividadChart() {
        const ctx = document.getElementById("actividadChart");
        if (!ctx) return;

        // Obtener historiales de la última semana
        const hoy = new Date();
        const semana = [];
        for (let i = 6; i >= 0; i--) {
          const fecha = new Date(hoy);
          fecha.setDate(fecha.getDate() - i);
          semana.push(fecha.toLocaleDateString("es-ES", { weekday: "short" }));
        }

        const actividad = new Array(7).fill(0);
        dashboardData.historiales.forEach((h) => {
          if (h.fecha) {
            const fecha = new Date(h.fecha);
            const diffTime = hoy - fecha;
            const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));
            if (diffDays >= 0 && diffDays < 7) {
              actividad[6 - diffDays]++;
            }
          }
        });

        if (actividadChart) {
          actividadChart.destroy();
        }

        actividadChart = new Chart(ctx, {
          type: "bar",
          data: {
            labels: semana,
            datasets: [
              {
                label: "Historiales",
                data: actividad,
                backgroundColor: "rgba(102, 126, 234, 0.8)",
                borderColor: "#667eea",
                borderWidth: 2,
                borderRadius: 8,
                borderSkipped: false,
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
              easing: "easeOutBounce",
            },
          },
        });
      }

      // Función para actualizar gráfico de asistencias
      function updateAsistenciasChart() {
        const ctx = document.getElementById("asistenciasChart");
        if (!ctx) return;

        // Filtrar asistencias del mes actual y del veterinario
        const hoy = new Date();
        const mesActual = hoy.getMonth();
        const añoActual = hoy.getFullYear();

        const asistenciasMes = dashboardData.asistencias.filter((a) => {
          if (!a.fecha || a.idVeterinario != idVeterinario) return false;
          const fecha = new Date(a.fecha);
          return (
            fecha.getMonth() === mesActual && fecha.getFullYear() === añoActual
          );
        });

        // Contar por día de la semana
        const diasSemana = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
        const asistenciasPorDia = new Array(7).fill(0);

        asistenciasMes.forEach((a) => {
          if (a.fecha) {
            const fecha = new Date(a.fecha);
            const diaSemana = fecha.getDay();
            asistenciasPorDia[diaSemana]++;
          }
        });

        if (asistenciasChart) {
          asistenciasChart.destroy();
        }

        asistenciasChart = new Chart(ctx, {
          type: "radar",
          data: {
            labels: diasSemana,
            datasets: [
              {
                label: "Asistencias",
                data: asistenciasPorDia,
                backgroundColor: "rgba(251, 194, 235, 0.3)",
                borderColor: "#fbc2eb",
                borderWidth: 3,
                pointBackgroundColor: "#fbc2eb",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "#fbc2eb",
                pointRadius: 5,
                pointHoverRadius: 7,
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
              r: {
                beginAtZero: true,
                ticks: {
                  stepSize: 1,
                },
                grid: {
                  color: "rgba(0, 0, 0, 0.1)",
                },
              },
            },
            animation: {
              duration: 2000,
              easing: "easeOutQuart",
            },
          },
        });
      }

      // Función para refrescar todos los gráficos
      function refreshCharts() {
        const btn = document.getElementById("refreshBtn");
        btn.disabled = true;
        btn.innerHTML =
          '<i class="bx bx-loader-alt bx-spin"></i> Actualizando...';

        // Recargar datos
        loadStatistics().then(() => {
          setTimeout(() => {
            btn.disabled = false;
            btn.innerHTML = '<i class="bx bx-refresh"></i> Actualizar';
          }, 1000);
        });
      }

      // Función para cargar actividades recientes
      async function loadRecentActivities() {
        const activitiesContainer = document.getElementById("recentActivities");
        activitiesContainer.innerHTML =
          '<div class="empty-state"><div class="empty-state-icon"><i class=\'bx bx-time\'></i></div><p>Cargando actividades recientes...</p></div>';

        try {
          // Cargar historiales recientes
          const historialesResponse = await fetch(
            "/Historial/ReporteHistorial"
          );
          if (historialesResponse.ok) {
            const historialesText = await historialesResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(historialesText, "text/html");
            const historialesTable = doc.querySelector(".tablaHistorial");

            if (historialesTable) {
              const rows = Array.from(
                historialesTable.querySelectorAll("tr")
              ).slice(1); // Excluir header
              const recentRows = rows.slice(0, 5); // Últimos 5

              if (recentRows.length > 0) {
                activitiesContainer.innerHTML = "";
                recentRows.forEach((row) => {
                  const cells = row.querySelectorAll("td");
                  if (cells.length >= 4) {
                    const fecha =
                      cells[2]?.textContent || "Fecha no disponible";
                    const mascota = cells[1]?.textContent || "Mascota";

                    const activityItem = document.createElement("div");
                    activityItem.className = "activity-item";
                    activityItem.innerHTML = `
                                            <div class="activity-icon historial">
                                                <i class='bx bx-clipboard'></i>
                                            </div>
                                            <div class="activity-content">
                                                <div class="activity-title">Nuevo historial clínico registrado</div>
                                                <div class="activity-date">Mascota: ${mascota} - ${fecha}</div>
                                            </div>
                                        `;
                    activitiesContainer.appendChild(activityItem);
                  }
                });
              } else {
                activitiesContainer.innerHTML =
                  '<div class="empty-state"><div class="empty-state-icon"><i class=\'bx bx-info-circle\'></i></div><p>No hay actividades recientes</p></div>';
              }
            } else {
              activitiesContainer.innerHTML =
                '<div class="empty-state"><div class="empty-state-icon"><i class=\'bx bx-info-circle\'></i></div><p>No hay actividades recientes</p></div>';
            }
          }
        } catch (error) {
          console.error("Error cargando actividades:", error);
          activitiesContainer.innerHTML =
            '<div class="empty-state"><div class="empty-state-icon"><i class=\'bx bx-error-circle\'></i></div><p>Error al cargar actividades</p></div>';
        }
      }

      // Cargar datos al iniciar
      document.addEventListener("DOMContentLoaded", function () {
        loadStatistics();
        loadRecentActivities();

        // Auto-refresh cada 5 minutos
        setInterval(() => {
          loadStatistics();
          loadRecentActivities();
        }, 300000); // 5 minutos
      });
    </script>
  </body>
</html>
