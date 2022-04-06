-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.26 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных отель
CREATE DATABASE IF NOT EXISTS `отель` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `отель`;

-- Дамп структуры для таблица отель.бронирование
CREATE TABLE IF NOT EXISTS `бронирование` (
  `промежуток` int NOT NULL AUTO_INCREMENT,
  `помещение` int DEFAULT NULL,
  `дата_начала` varchar(50) DEFAULT NULL,
  `дата_окончания` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`промежуток`),
  KEY `FK_бронирование_помещение` (`помещение`) USING BTREE,
  CONSTRAINT `FK_бронирование_помещение` FOREIGN KEY (`помещение`) REFERENCES `помещение` (`номер_помещения`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.бронирование: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `бронирование` DISABLE KEYS */;
/*!40000 ALTER TABLE `бронирование` ENABLE KEYS */;

-- Дамп структуры для таблица отель.клиент
CREATE TABLE IF NOT EXISTS `клиент` (
  `номер_паспорта` int NOT NULL,
  `ФИО` varchar(50) DEFAULT NULL,
  `адрес` varchar(50) DEFAULT NULL,
  `гражданство` varchar(50) DEFAULT NULL,
  `загран_паспорт` int DEFAULT NULL,
  PRIMARY KEY (`номер_паспорта`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.клиент: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `клиент` DISABLE KEYS */;
/*!40000 ALTER TABLE `клиент` ENABLE KEYS */;

-- Дамп структуры для таблица отель.отель
CREATE TABLE IF NOT EXISTS `отель` (
  `номер_гостиницы` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(50) DEFAULT NULL,
  `владелец` varchar(50) DEFAULT NULL,
  `сотрудник` varchar(50) DEFAULT NULL,
  `телефон` bigint DEFAULT NULL,
  `адрес` int DEFAULT NULL,
  PRIMARY KEY (`номер_гостиницы`),
  KEY `FK_отель_арендадатели` (`сотрудник`),
  CONSTRAINT `FK_отель_арендадатели` FOREIGN KEY (`сотрудник`) REFERENCES `пользователь` (`логин`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.отель: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `отель` DISABLE KEYS */;
/*!40000 ALTER TABLE `отель` ENABLE KEYS */;

-- Дамп структуры для таблица отель.пользователи
CREATE TABLE IF NOT EXISTS `пользователь` (
  `логин` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `пароль` varchar(50) DEFAULT NULL,
  `ФИО` varchar(50) DEFAULT NULL,
  `телефон` bigint DEFAULT NULL,
  `статус` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`логин`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.пользователи: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `пользователи` DISABLE KEYS */;
/*!40000 ALTER TABLE `пользователи` ENABLE KEYS */;

-- Дамп структуры для таблица отель.помещение
CREATE TABLE IF NOT EXISTS `помещение` (
  `номер_помещения` int NOT NULL AUTO_INCREMENT,
  `отель` int DEFAULT NULL,
  `этаж` varchar(50) DEFAULT NULL,
  `площадь` int DEFAULT NULL,
  `комнаты` varchar(50) DEFAULT NULL,
  `спальные_места` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `цена_за_день` int DEFAULT NULL,
  PRIMARY KEY (`номер_помещения`),
  KEY `FK_помещение_отель` (`отель`),
  CONSTRAINT `FK_помещение_отель` FOREIGN KEY (`отель`) REFERENCES `отель` (`номер_гостиницы`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.помещение: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `помещение` DISABLE KEYS */;
/*!40000 ALTER TABLE `помещение` ENABLE KEYS */;

-- Дамп структуры для таблица отель.услуга
CREATE TABLE IF NOT EXISTS `услуга` (
  `код_услуги` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(50) DEFAULT NULL,
  `описание` varchar(50) DEFAULT NULL,
  `цена` int DEFAULT NULL,
  PRIMARY KEY (`код_услуги`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.услуга: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `услуга` DISABLE KEYS */;
/*!40000 ALTER TABLE `услуга` ENABLE KEYS */;

-- Дамп структуры для таблица отель.услуги_брони
CREATE TABLE IF NOT EXISTS `услуги_брони` (
  `код` int NOT NULL AUTO_INCREMENT,
  `чек` int DEFAULT NULL,
  `услуга` int DEFAULT NULL,
  PRIMARY KEY (`код`),
  KEY `FK_услуги_брони_услуга` (`услуга`),
  KEY `FK_услуги_брони_чек` (`чек`),
  CONSTRAINT `FK_услуги_брони_услуга` FOREIGN KEY (`услуга`) REFERENCES `услуга` (`код_услуги`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_услуги_брони_чек` FOREIGN KEY (`чек`) REFERENCES `чек` (`номер_чека`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.услуги_брони: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `услуги_брони` DISABLE KEYS */;
/*!40000 ALTER TABLE `услуги_брони` ENABLE KEYS */;

-- Дамп структуры для таблица отель.чек
CREATE TABLE IF NOT EXISTS `чек` (
  `номер_чека` int NOT NULL AUTO_INCREMENT,
  `клиент` int NOT NULL DEFAULT '0',
  `бронирование` int DEFAULT NULL,
  `список_услуг` int DEFAULT NULL,
  PRIMARY KEY (`номер_чека`),
  KEY `FK_чек_помещение` (`бронирование`) USING BTREE,
  KEY `FK_чек_клиент` (`клиент`) USING BTREE,
  CONSTRAINT `FK_чек_бронирование` FOREIGN KEY (`бронирование`) REFERENCES `бронирование` (`промежуток`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_чек_клиент` FOREIGN KEY (`клиент`) REFERENCES `клиент` (`номер_паспорта`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы отель.чек: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `чек` DISABLE KEYS */;
/*!40000 ALTER TABLE `чек` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
