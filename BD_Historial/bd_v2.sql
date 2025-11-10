SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `nombreAdministrador` varchar(50) NOT NULL,
  `apellidoAdministrador` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` blob NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `asistencia` (
  `idAsistencia` int(11) NOT NULL,
  `idVeterinario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_llegada_real` time DEFAULT NULL,
  `hora_salida_real` time DEFAULT NULL,
  `estado` enum('ASISTENCIA','TARDANZA','FALTA') NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `contacto` (
  `idContacto` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER $$
CREATE TRIGGER `before_insert_contacto` BEFORE INSERT ON `contacto` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_contacto` BEFORE UPDATE ON `contacto` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;



CREATE TABLE `detallehistorial` (
  `idHistorial` int(11) NOT NULL,
  `idVeterinario` int(11) NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER $$
CREATE TRIGGER `before_insert_detallehistorial` BEFORE INSERT ON `detallehistorial` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_detallehistorial` BEFORE UPDATE ON `detallehistorial` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;



CREATE TABLE `historial` (
  `idHistorial` int(11) NOT NULL,
  `idVeterinario` int(11) NOT NULL,
  `idMascota` int(11) NOT NULL,
  `fechaHistorial` date NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tratamiento` varchar(200) NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER $$
CREATE TRIGGER `before_insert_historial` BEFORE INSERT ON `historial` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_historial` BEFORE UPDATE ON `historial` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;



CREATE TABLE `mascota` (
  `idMascota` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombreMascota` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `razaMascota` varchar(20) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `sexo` char(1) NOT NULL,
  `foto` blob NOT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER $$
CREATE TRIGGER `before_insert_mascota` BEFORE INSERT ON `mascota` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_mascota` BEFORE UPDATE ON `mascota` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;



CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `foto` blob NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER $$
CREATE TRIGGER `before_insert_servicio` BEFORE INSERT ON `servicio` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_servicio` BEFORE UPDATE ON `servicio` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;



CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `contraseña` blob NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER $$
CREATE TRIGGER `before_insert_usuario` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_usuario` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;



CREATE TABLE `veterinario` (
  `idVeterinario` int(11) NOT NULL,
  `nombreVeterinario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` blob NOT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER $$
CREATE TRIGGER `before_insert_veterinaio` BEFORE INSERT ON `veterinario` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_veterinario` BEFORE UPDATE ON `veterinario` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;


ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`);


ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idAsistencia`),
  ADD KEY `asistencia_ibfk_1` (`idVeterinario`);


ALTER TABLE `contacto`
  ADD PRIMARY KEY (`idContacto`),
  ADD KEY `idUsuario` (`idUsuario`);


ALTER TABLE `detallehistorial`
  ADD PRIMARY KEY (`idHistorial`,`idVeterinario`),
  ADD KEY `idVeterinario` (`idVeterinario`);


ALTER TABLE `historial`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `idVeterinario` (`idVeterinario`),
  ADD KEY `idMascota` (`idMascota`);


ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `idUsuario` (`idUsuario`);


ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`);


ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);


ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`idVeterinario`);


ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `asistencia`
  MODIFY `idAsistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `contacto`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;


ALTER TABLE `historial`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;


ALTER TABLE `mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;


ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;


ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;


ALTER TABLE `veterinario`
  MODIFY `idVeterinario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`idVeterinario`) REFERENCES `veterinario` (`idVeterinario`);


ALTER TABLE `contacto`
  ADD CONSTRAINT `contacto_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);


ALTER TABLE `detallehistorial`
  ADD CONSTRAINT `detallehistorial_ibfk_1` FOREIGN KEY (`idHistorial`) REFERENCES `historial` (`idHistorial`),
  ADD CONSTRAINT `detallehistorial_ibfk_2` FOREIGN KEY (`idVeterinario`) REFERENCES `veterinario` (`idVeterinario`);


ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`);


ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

