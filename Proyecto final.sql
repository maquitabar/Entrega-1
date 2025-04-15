CREATE DATABASE `turismo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE turismo;
CREATE TABLE `adherentes` (
  `id_adherentes` int NOT NULL,
  `documento` int NOT NULL,
  `apenom` varchar(60) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `fechanac` date NOT NULL,
  PRIMARY KEY (`id_adherentes`)
); 

CREATE TABLE `hoteles` (
  `id_hotel` int NOT NULL,
  `edad_menor` int NOT NULL,
  `telefono` int NOT NULL,
  `nombre_hotel` varchar(60) NOT NULL,
  `razon_social` varchar(45) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `fecha_alta` date NOT NULL,
  PRIMARY KEY (`id_hotel`)
); 

CREATE TABLE `categoria_habitacion` (
  `id_hotel` int NOT NULL,
  `categoria_habitacion` varchar(45) NOT NULL,
  `cant_pasajeros_total` int NOT NULL,
  PRIMARY KEY (`categoria_habitacion`,`id_hotel`),
  KEY `categoria_idx` (`id_hotel`),
  CONSTRAINT `categoria` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id_hotel`)
); 

CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL,
  `id_adherente` int NOT NULL,
  `id_hotel` int NOT NULL,
  `precio_hotel` decimal(11,2) NOT NULL,
  `precio_sub` decimal(11,2) NOT NULL,
  `precio_adh` decimal(11,2) NOT NULL,
  `categoria_habitacion` varchar(45) NOT NULL,
  `politicas_aceptacion` varchar(1000) NOT NULL,
  `politicas_cancelación` varchar(1000) NOT NULL,
  `observaciones_adh` varchar(1000) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `adherente_idx` (`id_adherente`),
  KEY `hotel_idx` (`id_hotel`),
  KEY `categoria_idx` (`categoria_habitacion`,`id_hotel`),
  CONSTRAINT `adherente` FOREIGN KEY (`id_adherente`) REFERENCES `adherentes` (`id_adherentes`),
  CONSTRAINT `cat_hotel` FOREIGN KEY (`categoria_habitacion`) REFERENCES `categoria_habitacion` (`categoria_habitacion`),
  CONSTRAINT `hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id_hotel`)
); 

CREATE TABLE `pasajeros_adicionales` (
  `id_reserva` int NOT NULL,
  `n_documento` int NOT NULL,
  `apenom_adicional` varchar(60) NOT NULL,
  `vinculo` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`n_documento`,`id_reserva`),
  KEY `id_reserva_idx` (`id_reserva`),
  CONSTRAINT `id_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`)
); 