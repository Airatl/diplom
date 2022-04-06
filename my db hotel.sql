DROP DATABASE IF EXISTS `hotel`;
CREATE DATABASE IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;

CREATE TABLE IF NOT EXISTS `hotel` (
  `number_hotel` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `telephone` bigint DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`number_hotel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `hotel` (`number_hotel`, `name`, `owner`, `telephone`, `address`) VALUES
	(1, 'LasV', 'ИРЕ', 89995554411, 'Орджиникизовская 7');


CREATE TABLE IF NOT EXISTS `room` (
  `numder_room` int NOT NULL AUTO_INCREMENT,
  `hotel` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `square` int DEFAULT NULL,
  `rooms` varchar(50) DEFAULT NULL,
  `sleeping_places` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price_per_day` int DEFAULT NULL,
  PRIMARY KEY (`numder_room`),
  KEY `FK_room_hotel` (`hotel`),
  CONSTRAINT `FK_room_hotel` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`number_hotel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `booking` (
  `gap` int NOT NULL AUTO_INCREMENT,
  `room` int DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gap`),
  KEY `FK_booking_room` (`room`) USING BTREE,
  CONSTRAINT `FK_booking_room` FOREIGN KEY (`room`) REFERENCES `room` (`numder_room`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `client` (
  `passport_number` int NOT NULL,
  `FIO` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `foreign_passport` int DEFAULT NULL,
  PRIMARY KEY (`passport_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `user` (
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `passport_number` bigint DEFAULT NULL,
  `FIO` varchar(50) DEFAULT NULL,
  `telephone` bigint DEFAULT NULL,
  `access` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hotel` int DEFAULT NULL,
  PRIMARY KEY (`login`),
  KEY `FK_user_hotel` (`hotel`),
  CONSTRAINT `FK_user_hotel` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`number_hotel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `user` (`login`, `password`, `passport_number`, `FIO`, `telephone`, `access`, `hotel`) VALUES
	('zip', '111', 8050303030, 'ШАН', 89174356070, 'admin', 1);


CREATE TABLE IF NOT EXISTS `service` (
  `code_services` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`code_services`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `service` (`code_services`, `name`, `description`, `price`) VALUES
	(1, '3 разовое питание', 'завтрак обед и ужин в комнату', 550),
	(2, 'мини бар', 'кока-кола, пепси, фрукты', 400);


CREATE TABLE IF NOT EXISTS `indoor_service` (
  `code_indoor_service` int NOT NULL AUTO_INCREMENT,
  `room` int DEFAULT NULL,
  `service` int DEFAULT NULL,
  PRIMARY KEY (`code_indoor_service`),
  KEY `FK_indoor_service_cheque` (`room`) USING BTREE,
  KEY `FK_indoor_service_service` (`service`),
  CONSTRAINT `FK_indoor_service_room` FOREIGN KEY (`room`) REFERENCES `room` (`numder_room`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_indoor_service_service` FOREIGN KEY (`service`) REFERENCES `service` (`code_services`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `cheque` (
  `number_cheque` int NOT NULL AUTO_INCREMENT,
  `client` int NOT NULL DEFAULT '0',
  `booking` int DEFAULT NULL,
  `list_services` int DEFAULT NULL,
  PRIMARY KEY (`number_cheque`),
  KEY `FK_cheque_room` (`booking`) USING BTREE,
  KEY `FK_cheque_client` (`client`) USING BTREE,
  CONSTRAINT `FK_cheque_booking` FOREIGN KEY (`booking`) REFERENCES `booking` (`gap`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cheque_client` FOREIGN KEY (`client`) REFERENCES `client` (`passport_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 