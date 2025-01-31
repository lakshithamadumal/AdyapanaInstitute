-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.39 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for adyapana_db
CREATE DATABASE IF NOT EXISTS `adyapana_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adyapana_db`;

-- Dumping structure for table adyapana_db.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(45) NOT NULL,
  `line2` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.address: ~18 rows (approximately)
INSERT INTO `address` (`id`, `line1`, `line2`, `city_id`) VALUES
	(4, '123 Main Street', 'Apt 5B', 1),
	(5, '45 Lake Road', 'Suite 12', 2),
	(6, '10 Temple Lane', 'Building 3', 3),
	(7, '7 Flower Street', 'Floor 2', 4),
	(8, '89 Ocean Drive', 'Villa 7', 5),
	(9, '56 Hilltop View', 'Unit 9', 6),
	(10, '33 Station Road', 'Block A', 7),
	(11, '12 Sunrise Avenue', 'Penthouse', 8),
	(12, '99 Market Street', 'Shop 3', 9),
	(13, '67 Park Lane', 'House 22', 10),
	(14, '21 River Side', 'Cottage 2', 11),
	(15, '88 City Center', 'Tower 1', 12),
	(27, 'frhfds', 'hfdh', 14),
	(28, 'llllll', 'lllllll', 14),
	(29, 'lllllllll', 'lllllllll', 14),
	(30, 'sdgsd', 'gsdgsd', 12),
	(31, 'gdsag', 'dsgd', 14),
	(32, 'gdsag', 'dsgd', 13);

-- Dumping structure for table adyapana_db.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_sno` int NOT NULL,
  `attendance_type_id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_student1_idx` (`student_sno`),
  KEY `fk_attendance_attendance_type1_idx` (`attendance_type_id`),
  CONSTRAINT `fk_attendance_attendance_type1` FOREIGN KEY (`attendance_type_id`) REFERENCES `attendance_type` (`id`),
  CONSTRAINT `fk_attendance_student1` FOREIGN KEY (`student_sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.attendance: ~4 rows (approximately)
INSERT INTO `attendance` (`id`, `student_sno`, `attendance_type_id`, `date`) VALUES
	(11, 22, 1, '2025-01-20'),
	(12, 23, 2, '2025-01-20'),
	(13, 24, 1, '2025-01-20'),
	(14, 25, 1, '2025-01-20'),
	(15, 23, 1, '2025-01-22');

-- Dumping structure for table adyapana_db.attendance_type
CREATE TABLE IF NOT EXISTS `attendance_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.attendance_type: ~2 rows (approximately)
INSERT INTO `attendance_type` (`id`, `type`) VALUES
	(1, 'Present'),
	(2, 'Absent');

-- Dumping structure for table adyapana_db.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.city: ~15 rows (approximately)
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Badulla'),
	(2, 'Bandarawela'),
	(3, 'Wellawaya'),
	(4, 'Colombo'),
	(5, 'Kandy'),
	(6, 'Galle'),
	(7, 'Jaffna'),
	(8, 'Matara'),
	(9, 'Kurunegala'),
	(10, 'Anuradhapura'),
	(11, 'Badulla'),
	(12, 'Ratnapura'),
	(13, 'Trincomalee'),
	(14, 'Gampaha'),
	(15, 'Negombo');

-- Dumping structure for table adyapana_db.class
CREATE TABLE IF NOT EXISTS `class` (
  `classno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `subject_subno` int NOT NULL,
  `teacher_tno` int NOT NULL,
  `timeslot` varchar(45) NOT NULL,
  `day_id` int NOT NULL,
  PRIMARY KEY (`classno`),
  KEY `fk_class_subject_idx` (`subject_subno`),
  KEY `fk_class_teacher1_idx` (`teacher_tno`),
  KEY `fk_class_day1_idx` (`day_id`),
  CONSTRAINT `fk_class_day1` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  CONSTRAINT `fk_class_subject` FOREIGN KEY (`subject_subno`) REFERENCES `subject` (`subno`),
  CONSTRAINT `fk_class_teacher1` FOREIGN KEY (`teacher_tno`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.class: ~10 rows (approximately)
INSERT INTO `class` (`classno`, `name`, `subject_subno`, `teacher_tno`, `timeslot`, `day_id`) VALUES
	(21, 'A', 1, 11, '8:00 AM - 10:00 AM', 1),
	(22, 'B', 2, 2, '10:00 AM - 12:00 PM', 1),
	(23, 'C', 3, 3, '8:00 AM - 10:00 AM', 2),
	(24, 'D', 4, 4, '10:00 AM - 12:00 PM', 2),
	(25, 'E', 5, 5, '8:00 AM - 10:00 AM', 3),
	(26, 'F', 6, 6, '10:00 AM - 12:00 PM', 3),
	(27, 'G', 7, 7, '8:00 AM - 10:00 AM', 2),
	(28, 'H', 8, 8, '10:00 AM - 12:00 PM', 4),
	(29, 'I', 9, 9, '8:00 AM - 10:00 AM', 5),
	(30, 'J', 10, 10, '10:00 AM - 12:00 PM', 5);

-- Dumping structure for table adyapana_db.day
CREATE TABLE IF NOT EXISTS `day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.day: ~6 rows (approximately)
INSERT INTO `day` (`id`, `name`) VALUES
	(1, 'Monday'),
	(2, 'Tuesday'),
	(3, 'Wednesday'),
	(4, 'Thursday'),
	(5, 'Friday'),
	(6, 'Saturday '),
	(7, 'Sunday');

-- Dumping structure for table adyapana_db.enrolment
CREATE TABLE IF NOT EXISTS `enrolment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_sno` int NOT NULL,
  `teacher_tno` int NOT NULL,
  `subject_subno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enrolment_student1_idx` (`student_sno`),
  KEY `fk_enrolment_teacher1_idx` (`teacher_tno`),
  KEY `fk_enrolment_subject1_idx` (`subject_subno`),
  CONSTRAINT `fk_enrolment_student1` FOREIGN KEY (`student_sno`) REFERENCES `student` (`sno`),
  CONSTRAINT `fk_enrolment_subject1` FOREIGN KEY (`subject_subno`) REFERENCES `subject` (`subno`),
  CONSTRAINT `fk_enrolment_teacher1` FOREIGN KEY (`teacher_tno`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.enrolment: ~3 rows (approximately)
INSERT INTO `enrolment` (`id`, `student_sno`, `teacher_tno`, `subject_subno`) VALUES
	(1, 24, 5, 10),
	(14, 22, 10, 1),
	(17, 23, 6, 5);

-- Dumping structure for table adyapana_db.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` bigint NOT NULL,
  `student_sno` int NOT NULL,
  `teacher_tno` int NOT NULL,
  `subject_subno` int NOT NULL,
  `month_id` int NOT NULL,
  `value` double NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_has_teacher_teacher1_idx` (`teacher_tno`),
  KEY `fk_student_has_teacher_student1_idx` (`student_sno`),
  KEY `fk_invoice_subject1_idx` (`subject_subno`),
  KEY `fk_invoice_month1_idx` (`month_id`),
  CONSTRAINT `fk_invoice_month1` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`),
  CONSTRAINT `fk_invoice_subject1` FOREIGN KEY (`subject_subno`) REFERENCES `subject` (`subno`),
  CONSTRAINT `fk_student_has_teacher_student1` FOREIGN KEY (`student_sno`) REFERENCES `student` (`sno`),
  CONSTRAINT `fk_student_has_teacher_teacher1` FOREIGN KEY (`teacher_tno`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.invoice: ~0 rows (approximately)
INSERT INTO `invoice` (`id`, `student_sno`, `teacher_tno`, `subject_subno`, `month_id`, `value`, `date`) VALUES
	(1737483073876, 22, 10, 1, 4, 1500, '2025-01-21'),
	(1737483172346, 22, 10, 1, 1, 1500, '2025-01-21'),
	(1737483411874, 24, 5, 10, 6, 1500, '2025-01-21'),
	(1737488928326, 24, 5, 10, 1, 1500, '2025-01-22'),
	(1737489645552, 22, 10, 1, 2, 1500, '2025-01-22'),
	(1737489713897, 22, 10, 1, 3, 1500, '2025-01-22'),
	(1737490008986, 22, 10, 1, 2, 1500, '2025-01-22'),
	(1737490282260, 22, 10, 1, 2, 1500, '2025-01-22'),
	(1737490678687, 22, 10, 1, 2, 1500, '2025-01-22'),
	(1737490757376, 22, 10, 1, 4, 1500, '2025-01-22'),
	(1737490778490, 22, 10, 1, 2, 1500, '2025-01-22'),
	(1737490816897, 22, 10, 1, 1, 1500, '2025-01-22'),
	(1737491023096, 22, 10, 1, 2, 1500, '2025-01-22'),
	(1737491146268, 24, 5, 10, 2, 1500, '2025-01-22'),
	(1737491181836, 22, 10, 1, 1, 1500, '2025-01-22'),
	(1737530535492, 24, 5, 10, 2, 1500, '2025-01-22'),
	(1737532719754, 24, 5, 10, 1, 1500, '2025-01-22'),
	(1737532755805, 22, 10, 1, 3, 1500, '2025-01-22'),
	(1737532772942, 22, 10, 1, 2, 1500, '2025-01-22');

-- Dumping structure for table adyapana_db.month
CREATE TABLE IF NOT EXISTS `month` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.month: ~12 rows (approximately)
INSERT INTO `month` (`id`, `name`) VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'April'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'August'),
	(9, 'September'),
	(10, 'October'),
	(11, 'November'),
	(12, 'December');

-- Dumping structure for table adyapana_db.student
CREATE TABLE IF NOT EXISTS `student` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address_id` int NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `fk_student_address1_idx` (`address_id`),
  CONSTRAINT `fk_student_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.student: ~11 rows (approximately)
INSERT INTO `student` (`sno`, `name`, `address_id`, `dob`) VALUES
	(22, 'Kamal Perera', 11, '2005-03-15'),
	(23, 'Nimali Silva', 12, '2006-07-22'),
	(24, 'Amila Fernando', 13, '2004-11-05'),
	(25, 'Sanduni Wickramasinghe', 14, '2005-01-10'),
	(26, 'Supun Jayawardena', 5, '2003-12-03'),
	(27, 'Dinuka Rathnayake', 6, '2006-04-18'),
	(28, 'Tharindu Pathirana', 7, '2005-09-25'),
	(29, 'Ishani Karunaratne', 8, '2006-06-30'),
	(30, 'Harsha Gunawardena', 9, '2004-08-17'),
	(31, 'Anjali De Silva', 10, '2005-02-13');

-- Dumping structure for table adyapana_db.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `subno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`subno`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.subject: ~13 rows (approximately)
INSERT INTO `subject` (`subno`, `name`, `description`, `price`) VALUES
	(1, 'Mathematics', 'Mathematics', 1500),
	(2, 'Science', 'Science', 2000),
	(3, 'English', 'English', 1800),
	(4, 'History', 'History', 1400),
	(5, 'Geography', 'Geography', 1500),
	(6, 'Sinhala', 'Sinhala', 1300),
	(7, 'Tamil', 'Tamil', 1300),
	(8, 'Commerce', 'Commerce', 2200),
	(9, 'Information Technology', 'Information Technology', 2500),
	(10, 'Art', 'Art', 1500),
	(11, 'Buddhism', 'Buddhism', 1000),
	(12, 'Physical Education', 'Physical Education', 1100);

-- Dumping structure for table adyapana_db.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `tno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address_id` int NOT NULL,
  `subject_subno` int NOT NULL,
  PRIMARY KEY (`tno`),
  KEY `fk_teacher_address1_idx` (`address_id`),
  KEY `fk_teacher_subject1_idx` (`subject_subno`),
  CONSTRAINT `fk_teacher_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_teacher_subject1` FOREIGN KEY (`subject_subno`) REFERENCES `subject` (`subno`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table adyapana_db.teacher: ~11 rows (approximately)
INSERT INTO `teacher` (`tno`, `name`, `address_id`, `subject_subno`) VALUES
	(2, 'Ruwan Wijesinghe', 11, 10),
	(3, 'Sumudu Perera', 12, 11),
	(4, 'Nadeesha Fernando', 13, 8),
	(5, 'Ashan Jayawardena', 14, 3),
	(6, 'Priyanka Rathnayake', 5, 5),
	(7, 'Samantha Karunaratne', 6, 5),
	(8, 'Dilini Pathirana', 7, 4),
	(9, 'Sanjeewa Gunasekara', 8, 9),
	(10, 'Iresha De Silva', 9, 1),
	(11, 'Mahesh Amarasinghe', 10, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
