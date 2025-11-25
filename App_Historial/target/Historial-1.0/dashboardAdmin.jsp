<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Dashboard - Administrador</title>
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

      .stat-card.veterinarios {
        border-left-color: #667eea;
      }

      .stat-card.historial {
        border-left-color: #9f8ad0;
      }

      .stat-card.usuarios {
        border-left-color: #fbc2eb;
      }

      .stat-card.asistencia {
        border-left-color: #65e3e3;
      }

      .stat-card.mascotas {
        border-left-color: #ffd93d;
      }

      .stat-card.sistema {
        border-left-color: #6bcf7f;
      }

      .stat-card.pendientes {
        border-left-color: #ff6b6b;
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
        border-bottom: 3px solid #667eea;
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

      .activity-icon.veterinarios {
        background: #667eea;
      }

      .activity-icon.historial {
        background: #9f8ad0;
      }

      .activity-icon.usuarios {
        background: #fbc2eb;
      }

      .activity-icon.asistencia {
        background: #65e3e3;
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
        border-bottom: 2px solid #667eea;
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

      /* Notifications Section */
      .notifications-section {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .notifications-section h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 25px;
        border-bottom: 3px solid #667eea;
        padding-bottom: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .notification-item {
        padding: 15px;
        border-left: 4px solid;
        border-radius: 8px;
        margin-bottom: 15px;
        background: #f9f9f9;
        transition: all 0.3s ease;
      }

      .notification-item:hover {
        background: #f0f0f0;
        transform: translateX(5px);
      }

      .notification-item.info {
        border-left-color: #667eea;
      }

      .notification-item.success {
        border-left-color: #6bcf7f;
      }

      .notification-item.warning {
        border-left-color: #ffd93d;
      }

      .notification-item.error {
        border-left-color: #ff6b6b;
      }

      .notification-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 8px;
      }

      .notification-title {
        font-weight: 600;
        color: #333;
        font-size: 16px;
      }

      .notification-time {
        font-size: 12px;
        color: #999;
      }

      .notification-message {
        font-size: 14px;
        color: #666;
        line-height: 1.5;
      }

      /* Filters Section */
      .filters-section {
        background: white;
        border-radius: 12px;
        padding: 20px 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        align-items: center;
      }

      .filter-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
      }

      .filter-group label {
        font-size: 14px;
        color: #666;
        font-weight: 600;
      }

      .filter-group input,
      .filter-group select {
        padding: 10px 15px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 14px;
        transition: border-color 0.3s ease;
      }

      .filter-group input:focus,
      .filter-group select:focus {
        outline: none;
        border-color: #667eea;
      }

      .filter-btn {
        padding: 10px 20px;
        background: #667eea;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        transition: background 0.3s ease;
        align-self: flex-end;
      }

      .filter-btn:hover {
        background: #764ba2;
      }

      /* System Status */
      .system-status {
        display: flex;
        gap: 15px;
        margin-top: 10px;
      }

      .status-indicator {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 8px 15px;
        background: #f0f0f0;
        border-radius: 20px;
        font-size: 14px;
      }

      .status-dot {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background: #6bcf7f;
        animation: pulse 2s infinite;
      }

      .status-dot.warning {
        background: #ffd93d;
      }

      .status-dot.error {
        background: #ff6b6b;
      }

      /* Export Section */
      .export-section {
        display: flex;
        gap: 10px;
        margin-top: 20px;
      }

      .export-btn {
        padding: 10px 20px;
        background: #6bcf7f;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        transition: background 0.3s ease;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .export-btn:hover {
        background: #5ab86d;
      }

      .export-btn.secondary {
        background: #667eea;
      }

      .export-btn.secondary:hover {
        background: #764ba2;
      }

      /* Search Bar */
      .search-section {
        background: white;
        border-radius: 12px;
        padding: 20px 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .search-bar {
        display: flex;
        gap: 15px;
        align-items: center;
      }

      .search-input {
        flex: 1;
        padding: 12px 20px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 14px;
        transition: border-color 0.3s ease;
      }

      .search-input:focus {
        outline: none;
        border-color: #667eea;
      }

      .search-btn {
        padding: 12px 25px;
        background: #667eea;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        transition: background 0.3s ease;
      }

      .search-btn:hover {
        background: #764ba2;
      }

      /* Performance Metrics */
      .performance-metrics {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin-bottom: 40px;
      }

      .metric-card {
        background: white;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
      }

      .metric-label {
        font-size: 14px;
        color: #666;
        margin-bottom: 10px;
      }

      .metric-value {
        font-size: 28px;
        font-weight: bold;
        color: #333;
      }

      .metric-change {
        font-size: 12px;
        margin-top: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 5px;
      }

      .metric-change.positive {
        color: #6bcf7f;
      }

      .metric-change.negative {
        color: #ff6b6b;
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
    <%@include file="WEB-INF/jspf/encabezadoAdministrador.jspf" %>

    <div class="dashboard-container">
      <div class="dashboard-header">
        <h1>Dashboard Administrador</h1>
        <p>Bienvenido al panel de control administrativo de Laica</p>
      </div>

      <!-- Statistics Cards -->
      <div class="stats-grid">
        <div class="stat-card veterinarios">
          <div class="stat-card-header">
            <span class="stat-card-title">Total Veterinarios</span>
            <i class="bx bx-user-md stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalVeterinarios">0</div>
          <a href="/Historial/asistencia.jsp" class="stat-card-link">
            Ver veterinarios <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card historial">
          <div class="stat-card-header">
            <span class="stat-card-title">Historiales Clínicos</span>
            <i class="bx bx-clipboard stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalHistoriales">0</div>
          <a href="/Historial/historialAdministrador" class="stat-card-link">
            Ver historiales <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card usuarios">
          <div class="stat-card-header">
            <span class="stat-card-title">Usuarios</span>
            <i class="bx bx-user stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalUsuarios">0</div>
          <a href="/Historial/createUsers.jsp" class="stat-card-link">
            Gestionar usuarios <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card asistencia">
          <div class="stat-card-header">
            <span class="stat-card-title">Asistencias Hoy</span>
            <i class="bx bx-calendar-check stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="asistenciasHoy">0</div>
          <a href="/Historial/asistencia.jsp" class="stat-card-link">
            Ver asistencias <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card mascotas">
          <div class="stat-card-header">
            <span class="stat-card-title">Total Mascotas</span>
            <i class="bx bx-paw stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalMascotas">0</div>
          <a href="/Historial/historialAdministrador" class="stat-card-link">
            Ver mascotas <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>

        <div class="stat-card sistema">
          <div class="stat-card-header">
            <span class="stat-card-title">Estado Sistema</span>
            <i class="bx bx-server stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="sistemaEstado">Operativo</div>
          <div class="system-status">
            <div class="status-indicator">
              <div class="status-dot" id="statusDot"></div>
              <span id="statusText">Todo normal</span>
            </div>
          </div>
        </div>

        <div class="stat-card pendientes">
          <div class="stat-card-header">
            <span class="stat-card-title">Pendientes</span>
            <i class="bx bx-time-five stat-card-icon"></i>
          </div>
          <div class="stat-card-value" id="totalPendientes">0</div>
          <a href="/Historial/asistencia.jsp" class="stat-card-link">
            Ver pendientes <i class="bx bx-right-arrow-alt"></i>
          </a>
        </div>
      </div>

      <!-- Search Section -->
      <div class="search-section">
        <div class="search-bar">
          <input
            type="text"
            class="search-input"
            id="searchInput"
            placeholder="Buscar en el sistema..."
            onkeyup="handleSearch(event)"
          />
          <button class="search-btn" onclick="performSearch()">
            <i class="bx bx-search"></i> Buscar
          </button>
        </div>
      </div>

      <!-- Filters Section -->
      <div class="filters-section">
        <div class="filter-group">
          <label>Fecha Desde</label>
          <input type="date" id="fechaDesde" />
        </div>
        <div class="filter-group">
          <label>Fecha Hasta</label>
          <input type="date" id="fechaHasta" />
        </div>
        <div class="filter-group">
          <label>Tipo de Datos</label>
          <select id="tipoDatos">
            <option value="all">Todos</option>
            <option value="historiales">Historiales</option>
            <option value="asistencias">Asistencias</option>
            <option value="usuarios">Usuarios</option>
          </select>
        </div>
        <button class="filter-btn" onclick="applyFilters()">
          <i class="bx bx-filter"></i> Aplicar Filtros
        </button>
        <button
          class="filter-btn"
          onclick="resetFilters()"
          style="background: #999"
        >
          <i class="bx bx-refresh"></i> Limpiar
        </button>
      </div>

      <!-- Performance Metrics -->
      <div class="performance-metrics">
        <div class="metric-card">
          <div class="metric-label">Tiempo de Respuesta</div>
          <div class="metric-value" id="tiempoRespuesta">120ms</div>
          <div class="metric-change positive">
            <i class="bx bx-trending-down"></i> -5% vs ayer
          </div>
        </div>
        <div class="metric-card">
          <div class="metric-label">Uptime del Sistema</div>
          <div class="metric-value" id="uptime">99.9%</div>
          <div class="metric-change positive">
            <i class="bx bx-trending-up"></i> Estable
          </div>
        </div>
        <div class="metric-card">
          <div class="metric-label">Usuarios Activos</div>
          <div class="metric-value" id="usuariosActivos">0</div>
          <div class="metric-change positive">
            <i class="bx bx-user"></i> En línea
          </div>
        </div>
        <div class="metric-card">
          <div class="metric-label">Carga del Sistema</div>
          <div class="metric-value" id="cargaSistema">45%</div>
          <div class="metric-change positive">
            <i class="bx bx-check-circle"></i> Normal
          </div>
        </div>
      </div>

      <!-- Quick Actions -->
      <div class="quick-actions">
        <h2>Acciones Rápidas</h2>
        <div class="actions-grid">
          <a href="/Historial/createUsers.jsp" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-user-plus"></i>
            </div>
            <div class="action-card-title">Crear Usuario</div>
          </a>

          <a href="/Historial/historialAdministrador" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-clipboard"></i>
            </div>
            <div class="action-card-title">Ver Historiales</div>
          </a>

          <a href="/Historial/asistencia.jsp" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-time-five"></i>
            </div>
            <div class="action-card-title">Gestionar Asistencias</div>
          </a>

          <a href="/Historial/indexAdministrador.jsp" class="action-card">
            <div class="action-card-icon">
              <i class="bx bx-home"></i>
            </div>
            <div class="action-card-title">Inicio</div>
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
          <h3>Asistencias por Veterinario</h3>
          <div class="chart-wrapper">
            <canvas id="asistenciasVeterinarioChart"></canvas>
          </div>
          <div class="chart-legend">
            Distribución de asistencias por veterinario
          </div>
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

        <div class="chart-container">
          <h3>Crecimiento de Historiales</h3>
          <div class="chart-wrapper">
            <canvas id="crecimientoChart"></canvas>
          </div>
          <div class="chart-legend">Tendencia de crecimiento mensual</div>
        </div>

        <div class="chart-container">
          <h3>Distribución de Actividad</h3>
          <div class="chart-wrapper">
            <canvas id="distribucionChart"></canvas>
          </div>
          <div class="chart-legend">Distribución por tipo de actividad</div>
        </div>
      </div>

      <!-- Notifications Section -->
      <div class="notifications-section">
        <h2>
          Notificaciones del Sistema
          <span
            style="font-size: 14px; color: #999; font-weight: normal"
            id="notificationCount"
            >0 nuevas</span
          >
        </h2>
        <div id="notificationsContainer">
          <div class="empty-state">
            <div class="empty-state-icon">
              <i class="bx bx-bell"></i>
            </div>
            <p>Cargando notificaciones...</p>
          </div>
        </div>
      </div>

      <!-- Recent Activities -->
      <!-- <div class="recent-activities">
        <h2>
          Actividades Recientes
          <div class="export-section">
            <button class="export-btn" onclick="exportData('csv')">
              <i class="bx bx-download"></i> Exportar CSV
            </button>
            <button class="export-btn secondary" onclick="exportData('pdf')">
              <i class="bx bx-file"></i> Exportar PDF
            </button>
          </div>
        </h2>
        <div id="recentActivities">
          <div class="empty-state">
            <div class="empty-state-icon">
              <i class="bx bx-time"></i>
            </div>
            <p>Cargando actividades recientes...</p>
          </div>
        </div>
      </div> -->
    </div>

    <%@include file="WEB-INF/jspf/pie.jspf" %>

    <script>
      // Chart instances
      let historialesChart = null;
      let asistenciasVeterinarioChart = null;
      let actividadChart = null;
      let asistenciasChart = null;
      let crecimientoChart = null;
      let distribucionChart = null;

      // Data cache
      let dashboardData = {
        veterinarios: [],
        historiales: [],
        usuarios: [],
        asistencias: [],
        mascotas: [],
        notifications: [],
      };

      // Filter state
      let currentFilters = {
        fechaDesde: null,
        fechaHasta: null,
        tipoDatos: "all",
        searchQuery: "",
      };

      // Función para cargar estadísticas
      async function loadStatistics() {
        try {
          // Cargar datos de veterinarios y asistencias
          const veterinariosResponse = await fetch(
            "/Historial/api/veterinarios"
          );
          if (veterinariosResponse.ok) {
            const veterinariosData = await veterinariosResponse.json();
            if (veterinariosData.veterinarios) {
              dashboardData.veterinarios = veterinariosData.veterinarios;
              const totalVeterinarios = veterinariosData.veterinarios.length;
              animateValue("totalVeterinarios", 0, totalVeterinarios, 1000);
            }
            if (veterinariosData.asistencias) {
              dashboardData.asistencias = veterinariosData.asistencias;

              // Contar asistencias de hoy
              const today = new Date().toISOString().split("T")[0];
              const asistenciasHoy = veterinariosData.asistencias.filter(
                (a) => {
                  return a.fecha && a.fecha.startsWith(today);
                }
              ).length;

              animateValue("asistenciasHoy", 0, asistenciasHoy, 1000);

              // Actualizar gráficos de asistencias
              updateAsistenciasVeterinarioChart();
              updateAsistenciasChart();
            }
          }

          // Cargar datos de historiales
          const historialesResponse = await fetch(
            "/Historial/historialAdministrador"
          );
          if (historialesResponse.ok) {
            const historialesText = await historialesResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(historialesText, "text/html");
            const historialesTable =
              doc.querySelector(".tablaHistorial") ||
              doc.querySelector("table");

            if (historialesTable) {
              const rows = Array.from(
                historialesTable.querySelectorAll("tr")
              ).slice(1);

              // Filtrar filas vacías o inválidas
              const validRows = rows.filter((row) => {
                const cells = row.querySelectorAll("td");
                return cells.length > 0 && row.textContent.trim().length > 0;
              });

              const totalHistoriales = validRows.length;

              // Extraer datos de historiales para gráficos
              dashboardData.historiales = validRows.map((row) => {
                const cells = row.querySelectorAll("td");
                return {
                  fecha:
                    cells[4]?.textContent?.trim() ||
                    cells[3]?.textContent?.trim() ||
                    "",
                  tratamiento:
                    cells[6]?.textContent?.trim() ||
                    cells[5]?.textContent?.trim() ||
                    "",
                  idMascota:
                    cells[3]?.textContent?.trim() ||
                    cells[2]?.textContent?.trim() ||
                    "",
                };
              });

              // Animar contador
              const totalHistorialesNum = Math.max(
                0,
                parseInt(totalHistoriales) || 0
              );
              const historialesElement =
                document.getElementById("totalHistoriales");
              if (historialesElement) {
                historialesElement.textContent = "0";
                animateValue("totalHistoriales", 0, totalHistorialesNum, 1000);
              }

              // Actualizar gráficos después de cargar datos
              updateHistorialesChart();
              updateActividadChart();
              updateCrecimientoChart();
              updateDistribucionChart();
            } else {
              document.getElementById("totalHistoriales").textContent = "0";
            }
          } else {
            document.getElementById("totalHistoriales").textContent = "0";
          }

          // Cargar datos de usuarios (aproximación - puede necesitar ajuste según tu API)
          // Por ahora, establecer un valor por defecto o intentar obtenerlo
          const usuariosElement = document.getElementById("totalUsuarios");
          if (usuariosElement && usuariosElement.textContent === "0") {
            // Si hay veterinarios, podemos estimar usuarios
            // Esto debería ser reemplazado por un endpoint real de usuarios
            usuariosElement.textContent =
              dashboardData.veterinarios.length || "0";
          }

          // Cargar datos de mascotas (desde historiales)
          const totalMascotas = new Set(
            dashboardData.historiales.map((h) => h.idMascota)
          ).size;
          animateValue("totalMascotas", 0, totalMascotas, 1000);

          // Calcular pendientes (asistencias no registradas hoy)
          const totalVeterinarios = dashboardData.veterinarios.length;
          const asistenciasHoyCount =
            parseInt(document.getElementById("asistenciasHoy").textContent) ||
            0;
          const pendientes = Math.max(
            0,
            totalVeterinarios - asistenciasHoyCount
          );
          animateValue("totalPendientes", 0, pendientes, 1000);

          // Actualizar métricas de rendimiento
          updatePerformanceMetrics();

          // Cargar notificaciones
          loadNotifications();
        } catch (error) {
          console.error("Error cargando estadísticas:", error);
          // Valores por defecto si hay error
          document.getElementById("totalVeterinarios").textContent = "0";
          document.getElementById("totalHistoriales").textContent = "0";
          document.getElementById("totalUsuarios").textContent = "0";
          document.getElementById("asistenciasHoy").textContent = "0";
        }
      }

      // Función para animar valores numéricos
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

      // Función para actualizar gráfico de historiales por mes
      function updateHistorialesChart() {
        const ctx = document.getElementById("historialesChart");
        if (!ctx) return;

        // Agrupar historiales por mes
        const meses = {};
        dashboardData.historiales.forEach((h) => {
          if (h.fecha) {
            try {
              const fecha = new Date(h.fecha);
              if (!isNaN(fecha.getTime())) {
                const mes = fecha.toLocaleString("es-ES", { month: "short" });
                meses[mes] = (meses[mes] || 0) + 1;
              }
            } catch (e) {
              console.warn("Fecha inválida:", h.fecha);
            }
          }
        });

        const labels = Object.keys(meses);
        const data = Object.values(meses);

        if (historialesChart) {
          historialesChart.destroy();
        }

        if (labels.length === 0) {
          ctx.getContext("2d").clearRect(0, 0, ctx.width, ctx.height);
          return;
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

      // Función para actualizar gráfico de asistencias por veterinario
      function updateAsistenciasVeterinarioChart() {
        const ctx = document.getElementById("asistenciasVeterinarioChart");
        if (!ctx) return;

        // Contar asistencias por veterinario
        const asistenciasPorVet = {};
        dashboardData.asistencias.forEach((a) => {
          if (a.idVeterinario) {
            const vetId = a.idVeterinario.toString();
            asistenciasPorVet[vetId] = (asistenciasPorVet[vetId] || 0) + 1;
          }
        });

        // Obtener nombres de veterinarios
        const labels = [];
        const data = [];
        const colors = [
          "#667eea",
          "#9f8ad0",
          "#fbc2eb",
          "#65e3e3",
          "#764ba2",
          "#a18cd1",
        ];

        Object.keys(asistenciasPorVet).forEach((vetId) => {
          const vet = dashboardData.veterinarios.find(
            (v) => v.idVeterinario == vetId
          );
          let nombre;
          if (vet) {
            const nombreVet = vet.nombre || "Vet";
            const apellidoVet = vet.apellido || "";
            nombre = (nombreVet + " " + apellidoVet).trim();
          } else {
            nombre = "Veterinario " + vetId;
          }
          labels.push(nombre);
          data.push(asistenciasPorVet[vetId]);
        });

        if (asistenciasVeterinarioChart) {
          asistenciasVeterinarioChart.destroy();
        }

        if (labels.length === 0) {
          ctx.getContext("2d").clearRect(0, 0, ctx.width, ctx.height);
          return;
        }

        asistenciasVeterinarioChart = new Chart(ctx, {
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
                    return label + ": " + value + " (" + percentage + "%)";
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
            try {
              const fecha = new Date(h.fecha);
              if (!isNaN(fecha.getTime())) {
                const diffTime = hoy - fecha;
                const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));
                if (diffDays >= 0 && diffDays < 7) {
                  actividad[6 - diffDays]++;
                }
              }
            } catch (e) {
              console.warn("Fecha inválida:", h.fecha);
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

        // Filtrar asistencias del mes actual
        const hoy = new Date();
        const mesActual = hoy.getMonth();
        const añoActual = hoy.getFullYear();

        const asistenciasMes = dashboardData.asistencias.filter((a) => {
          if (!a.fecha) return false;
          try {
            const fecha = new Date(a.fecha);
            return (
              !isNaN(fecha.getTime()) &&
              fecha.getMonth() === mesActual &&
              fecha.getFullYear() === añoActual
            );
          } catch (e) {
            return false;
          }
        });

        // Contar por día de la semana
        const diasSemana = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
        const asistenciasPorDia = new Array(7).fill(0);

        asistenciasMes.forEach((a) => {
          if (a.fecha) {
            try {
              const fecha = new Date(a.fecha);
              if (!isNaN(fecha.getTime())) {
                const diaSemana = fecha.getDay();
                asistenciasPorDia[diaSemana]++;
              }
            } catch (e) {
              console.warn("Fecha inválida:", a.fecha);
            }
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
                backgroundColor: "rgba(101, 227, 227, 0.3)",
                borderColor: "#65e3e3",
                borderWidth: 3,
                pointBackgroundColor: "#65e3e3",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "#65e3e3",
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

      // Función para actualizar gráfico de crecimiento
      function updateCrecimientoChart() {
        const ctx = document.getElementById("crecimientoChart");
        if (!ctx) return;

        // Agrupar historiales por mes y calcular crecimiento
        const meses = {};
        dashboardData.historiales.forEach((h) => {
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

        // Calcular crecimiento acumulado
        const crecimientoAcumulado = [];
        let acumulado = 0;
        data.forEach((valor) => {
          acumulado += valor;
          crecimientoAcumulado.push(acumulado);
        });

        if (crecimientoChart) {
          crecimientoChart.destroy();
        }

        if (labels.length === 0) {
          ctx.getContext("2d").clearRect(0, 0, ctx.width, ctx.height);
          return;
        }

        crecimientoChart = new Chart(ctx, {
          type: "line",
          data: {
            labels: labels,
            datasets: [
              {
                label: "Nuevos Historiales",
                data: data,
                borderColor: "#667eea",
                backgroundColor: "rgba(102, 126, 234, 0.1)",
                borderWidth: 2,
                fill: false,
                tension: 0.4,
              },
              {
                label: "Crecimiento Acumulado",
                data: crecimientoAcumulado,
                borderColor: "#6bcf7f",
                backgroundColor: "rgba(107, 207, 127, 0.1)",
                borderWidth: 2,
                fill: true,
                tension: 0.4,
              },
            ],
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
              legend: {
                display: true,
                position: "top",
              },
              tooltip: {
                backgroundColor: "rgba(0, 0, 0, 0.8)",
                padding: 12,
              },
            },
            scales: {
              y: {
                beginAtZero: true,
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
            },
          },
        });
      }

      // Función para actualizar gráfico de distribución
      function updateDistribucionChart() {
        const ctx = document.getElementById("distribucionChart");
        if (!ctx) return;

        // Calcular distribución de actividades
        const distribucion = {
          historiales: dashboardData.historiales.length,
          asistencias: dashboardData.asistencias.length,
          veterinarios: dashboardData.veterinarios.length,
          mascotas: new Set(dashboardData.historiales.map((h) => h.idMascota))
            .size,
        };

        const labels = [
          "Historiales",
          "Asistencias",
          "Veterinarios",
          "Mascotas",
        ];
        const data = [
          distribucion.historiales,
          distribucion.asistencias,
          distribucion.veterinarios,
          distribucion.mascotas,
        ];
        const colors = ["#667eea", "#9f8ad0", "#fbc2eb", "#65e3e3"];

        if (distribucionChart) {
          distribucionChart.destroy();
        }

        distribucionChart = new Chart(ctx, {
          type: "bar",
          data: {
            labels: labels,
            datasets: [
              {
                label: "Cantidad",
                data: data,
                backgroundColor: colors,
                borderColor: colors.map((c) => c),
                borderWidth: 2,
                borderRadius: 8,
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

      // Función para refrescar todos los gráficos
      function refreshCharts() {
        const btn = document.getElementById("refreshBtn");
        btn.disabled = true;
        btn.innerHTML =
          '<i class="bx bx-loader-alt bx-spin"></i> Actualizando...';

        // Recargar datos
        loadStatistics().then(() => {
          // Actualizar todos los gráficos
          updateHistorialesChart();
          updateAsistenciasVeterinarioChart();
          updateActividadChart();
          updateAsistenciasChart();
          updateCrecimientoChart();
          updateDistribucionChart();
          updatePerformanceMetrics();

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
            "/Historial/historialAdministrador"
          );
          if (historialesResponse.ok) {
            const historialesText = await historialesResponse.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(historialesText, "text/html");
            const historialesTable =
              doc.querySelector(".tablaHistorial") ||
              doc.querySelector("table");

            if (historialesTable) {
              const rows = Array.from(
                historialesTable.querySelectorAll("tr")
              ).slice(1);
              const recentRows = rows.slice(0, 5); // Últimos 5

              if (recentRows.length > 0) {
                activitiesContainer.innerHTML = "";
                recentRows.forEach((row) => {
                  const cells = row.querySelectorAll("td");
                  if (cells.length >= 3) {
                    const fecha =
                      cells[4]?.textContent?.trim() ||
                      cells[3]?.textContent?.trim() ||
                      "Fecha no disponible";
                    const mascota =
                      cells[1]?.textContent?.trim() ||
                      cells[0]?.textContent?.trim() ||
                      "Mascota";

                    const activityItem = document.createElement("div");
                    activityItem.className = "activity-item";
                    activityItem.innerHTML =
                      '<div class="activity-icon historial">' +
                      "<i class='bx bx-clipboard'></i>" +
                      "</div>" +
                      '<div class="activity-content">' +
                      '<div class="activity-title">Nuevo historial clínico registrado</div>' +
                      '<div class="activity-date">Mascota: ' +
                      mascota +
                      " - " +
                      fecha +
                      "</div>" +
                      "</div>";
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

      // Función para cargar notificaciones
      function loadNotifications() {
        const notificationsContainer = document.getElementById(
          "notificationsContainer"
        );
        const notifications = [
          {
            type: "info",
            title: "Sistema Actualizado",
            message:
              "El sistema se ha actualizado correctamente. Todas las funciones están operativas.",
            time: "Hace 2 horas",
          },
          {
            type: "success",
            title: "Backup Completado",
            message: "El backup automático se ha completado exitosamente.",
            time: "Hace 5 horas",
          },
          {
            type: "warning",
            title: "Alta Carga de Datos",
            message:
              "Se detectó un aumento en el uso de recursos. Monitoreando...",
            time: "Hace 1 día",
          },
        ];

        dashboardData.notifications = notifications;

        if (notifications.length === 0) {
          notificationsContainer.innerHTML =
            '<div class="empty-state"><div class="empty-state-icon"><i class=\'bx bx-bell-off\'></i></div><p>No hay notificaciones</p></div>';
          return;
        }

        notificationsContainer.innerHTML = "";
        notifications.forEach((notif) => {
          const notifItem = document.createElement("div");
          notifItem.className = "notification-item " + notif.type;
          notifItem.innerHTML =
            '<div class="notification-header">' +
            '<div class="notification-title">' +
            notif.title +
            "</div>" +
            '<div class="notification-time">' +
            notif.time +
            "</div>" +
            "</div>" +
            '<div class="notification-message">' +
            notif.message +
            "</div>";
          notificationsContainer.appendChild(notifItem);
        });

        document.getElementById("notificationCount").textContent =
          notifications.length + " nuevas";
      }

      // Función para actualizar métricas de rendimiento
      function updatePerformanceMetrics() {
        // Simular métricas (en producción, esto vendría de una API)
        const tiempoRespuesta = Math.floor(Math.random() * 50) + 100;
        document.getElementById("tiempoRespuesta").textContent =
          tiempoRespuesta + "ms";

        const usuariosActivos =
          dashboardData.veterinarios.length ||
          Math.floor(Math.random() * 10) + 5;
        document.getElementById("usuariosActivos").textContent =
          usuariosActivos;

        const cargaSistema = Math.floor(Math.random() * 30) + 30;
        document.getElementById("cargaSistema").textContent =
          cargaSistema + "%";

        // Actualizar estado del sistema
        const sistemaEstado =
          cargaSistema < 70
            ? "Operativo"
            : cargaSistema < 90
            ? "Carga Alta"
            : "Crítico";
        document.getElementById("sistemaEstado").textContent = sistemaEstado;

        const statusDot = document.getElementById("statusDot");
        const statusText = document.getElementById("statusText");

        if (cargaSistema < 70) {
          statusDot.className = "status-dot";
          statusText.textContent = "Todo normal";
        } else if (cargaSistema < 90) {
          statusDot.className = "status-dot warning";
          statusText.textContent = "Monitoreando";
        } else {
          statusDot.className = "status-dot error";
          statusText.textContent = "Atención requerida";
        }
      }

      // Función para búsqueda
      function handleSearch(event) {
        if (event.key === "Enter") {
          performSearch();
        }
      }

      function performSearch() {
        const query = document.getElementById("searchInput").value.trim();
        currentFilters.searchQuery = query;

        if (query) {
          // Filtrar datos según la búsqueda
          console.log("Buscando:", query);
          // Aquí puedes implementar la lógica de búsqueda
          alert(
            "Buscando: " +
              query +
              "\n\nEsta funcionalidad puede conectarse a un endpoint de búsqueda."
          );
        }
      }

      // Función para aplicar filtros
      function applyFilters() {
        const fechaDesde = document.getElementById("fechaDesde").value;
        const fechaHasta = document.getElementById("fechaHasta").value;
        const tipoDatos = document.getElementById("tipoDatos").value;

        currentFilters.fechaDesde = fechaDesde;
        currentFilters.fechaHasta = fechaHasta;
        currentFilters.tipoDatos = tipoDatos;

        // Recargar datos con filtros
        loadStatistics();
        loadRecentActivities();

        console.log("Filtros aplicados:", currentFilters);
      }

      // Función para resetear filtros
      function resetFilters() {
        document.getElementById("fechaDesde").value = "";
        document.getElementById("fechaHasta").value = "";
        document.getElementById("tipoDatos").value = "all";
        document.getElementById("searchInput").value = "";

        currentFilters = {
          fechaDesde: null,
          fechaHasta: null,
          tipoDatos: "all",
          searchQuery: "",
        };

        loadStatistics();
        loadRecentActivities();
      }

      // Función para exportar datos
      function exportData(format) {
        const data = {
          veterinarios: dashboardData.veterinarios.length,
          historiales: dashboardData.historiales.length,
          asistencias: dashboardData.asistencias.length,
          fecha: new Date().toISOString(),
        };

        if (format === "csv") {
          // Generar CSV
          let csv = "Tipo,Cantidad\n";
          csv += "Veterinarios," + data.veterinarios + "\n";
          csv += "Historiales," + data.historiales + "\n";
          csv += "Asistencias," + data.asistencias + "\n";

          const blob = new Blob([csv], { type: "text/csv" });
          const url = window.URL.createObjectURL(blob);
          const a = document.createElement("a");
          a.href = url;
          const timestamp = new Date().getTime();
          a.download = "dashboard_export_" + timestamp + ".csv";
          a.click();
          window.URL.revokeObjectURL(url);
        } else if (format === "pdf") {
          // Para PDF, normalmente usarías una librería como jsPDF
          alert(
            "Exportación a PDF:\n\n" +
              "Veterinarios: " +
              data.veterinarios +
              "\n" +
              "Historiales: " +
              data.historiales +
              "\n" +
              "Asistencias: " +
              data.asistencias +
              "\n\n" +
              "Para implementar PDF completo, considera usar jsPDF o generar desde el servidor."
          );
        }
      }

      // Función para actualizar métricas en tiempo real
      function startRealTimeUpdates() {
        // Actualizar métricas cada 30 segundos
        setInterval(() => {
          updatePerformanceMetrics();
        }, 30000);
      }

      // Cargar datos al iniciar
      document.addEventListener("DOMContentLoaded", function () {
        loadStatistics();
        loadRecentActivities();
        startRealTimeUpdates();

        // Auto-refresh cada 5 minutos
        setInterval(() => {
          loadStatistics();
          loadRecentActivities();
          loadNotifications();
        }, 300000); // 5 minutos

        // Establecer fecha por defecto (últimos 30 días)
        const hoy = new Date();
        const hace30Dias = new Date();
        hace30Dias.setDate(hace30Dias.getDate() - 30);

        document.getElementById("fechaHasta").value = hoy
          .toISOString()
          .split("T")[0];
        document.getElementById("fechaDesde").value = hace30Dias
          .toISOString()
          .split("T")[0];
      });
    </script>
  </body>
</html>
