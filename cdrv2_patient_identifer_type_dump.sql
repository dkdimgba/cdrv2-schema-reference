-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.44 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table openmrs.patient_identifier_type
CREATE TABLE IF NOT EXISTS `patient_identifier_type` (
  `patient_identifier_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(255) DEFAULT NULL,
  `check_digit` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `format_description` varchar(255) DEFAULT NULL,
  `validator` varchar(200) DEFAULT NULL,
  `location_behavior` varchar(50) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `uniqueness_behavior` varchar(50) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_type_id`),
  UNIQUE KEY `patient_identifier_type_uuid_index` (`uuid`),
  KEY `patient_identifier_type_retired_status` (`retired`),
  KEY `type_creator` (`creator`),
  KEY `user_who_retired_patient_identifier_type` (`retired_by`),
  KEY `patient_identifier_type_changed_by` (`changed_by`),
  CONSTRAINT `patient_identifier_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_patient_identifier_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table openmrs.patient_identifier_type: ~16 rows (approximately)
INSERT INTO `patient_identifier_type` (`patient_identifier_type_id`, `name`, `description`, `format`, `check_digit`, `creator`, `date_created`, `required`, `format_description`, `validator`, `location_behavior`, `retired`, `retired_by`, `date_retired`, `retire_reason`, `uuid`, `uniqueness_behavior`, `date_changed`, `changed_by`) VALUES
	(1, 'OpenMRS Identification Number', 'Unique number used in OpenMRS', '', 1, 1, '2005-09-22 00:00:00', 0, NULL, 'org.openmrs.patient.impl.LuhnIdentifierValidator', NULL, 0, NULL, NULL, NULL, '8d793bee-c2cc-11de-8d13-0010c6dffd0f', NULL, NULL, NULL),
	(2, 'Old Identification Number', 'Number given out prior to the OpenMRS system (No check digit)', '', 0, 1, '2005-09-22 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, '8d79403a-c2cc-11de-8d13-0010c6dffd0f', NULL, NULL, NULL),
	(3, 'OpenMRS ID', 'OpenMRS patient identifier, with check-digit', NULL, 0, 2, '2021-01-26 16:17:30', 1, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, '05a29f94-c0ed-11e2-94be-8c13b969e334', NULL, '2022-03-17 16:00:17', 1),
	(4, 'ART Number', 'Unique Identifier for all patient enrolled into HIV treatment program', NULL, 0, 1, '2018-04-25 15:00:08', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, 'c82916e4-168c-495f-8ed0-b1b286c30a05', NULL, NULL, NULL),
	(5, 'Hospital Number', 'Hospital Number of patient irrespective of PEPFAR id system', NULL, 0, 1, '2018-04-25 15:01:03', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, 'fd0df06c-fcd4-4625-89b2-6b72ca44b8ed', NULL, NULL, NULL),
	(6, 'ANC Number', 'Antenatal care registration number', NULL, 0, 1, '2018-05-04 14:48:43', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, '33032052-a90b-4af1-9bb6-66f8c664d23c', 'UNIQUE', NULL, NULL),
	(7, 'Exposed Infant Id', 'Exposed infant identifier', NULL, 0, 1, '2018-05-04 14:49:28', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, 'c377c85b-46a7-4759-aca3-3af7bc487ada', 'UNIQUE', NULL, NULL),
	(8, 'HIV testing Id (Client Code)', 'Number assigned to patients during HIV testing', NULL, 0, 1, '2018-05-04 14:51:15', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, 'a03a1424-56df-46e1-a94d-b468856b2235', 'UNIQUE', NULL, NULL),
	(9, 'PEP', 'Special ID for Post Exposure Prophylaxis Patients', NULL, 0, 1, '2019-08-31 13:02:30', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'aab8f0d8-52a8-4083-8d8b-9526c9ec8af7', NULL, NULL, NULL),
	(10, 'Recency ID', 'Custom ID for Recency Patient', NULL, 0, 1, '2020-01-30 13:02:30', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, 'dab8f222-33a8-4055-778b-3336c9ec8yto', 'UNIQUE', NULL, NULL),
	(11, 'Recency Participant ID', 'Participant ID for Recency', NULL, 0, 1, '2020-02-13 11:29:13', 0, 'Participant ID must meet specified requirements. (Max of 10 characters, with 2 Uppercase Alphabets and 8 Numbers)', NULL, 'NOT_USED', 1, 1, '2020-02-18 10:01:46', 'duplicate', 'fa783a2c-5d78-428d-801f-1c00860a3148', 'UNIQUE', NULL, NULL),
	(12, 'tst', NULL, NULL, 0, 1, '2020-02-13 15:02:28', 0, NULL, NULL, NULL, 1, 1, '2020-02-17 12:02:17', 'non', '2833cf6e-fe3f-4ff8-8723-4657663b2803', NULL, NULL, NULL),
	(13, 'Covid19 Unique Case Number', 'Covid19 Unique Case Number that uniquely identifies a patient enrolled into covid19 program', NULL, 0, 1, '2021-09-02 16:35:25', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, '9b09f271-da1a-47fa-b5aa-0ea87f7238f9', NULL, NULL, NULL),
	(14, 'National Identification Number', 'National ID, could be NIN, Drivers License, Voters ID, International Passport.', NULL, 0, 1, '2021-12-08 16:13:41', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, '81745b04-6bfa-4e48-8de9-a43a6c396d91', NULL, NULL, NULL),
	(15, 'Tuberculosis Program Identification Number', 'Tuberculosis Program Identification Number', NULL, 0, 1, '2021-12-14 17:07:58', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, 'e0da470a-de83-42bc-8ca7-0ac8a9ae626f', NULL, NULL, NULL),
	(16, 'Transit ID', NULL, NULL, 0, 1, '2025-06-05 16:07:55', 0, NULL, NULL, 'NOT_USED', 0, NULL, NULL, NULL, '3f3b8580-2c60-4915-a4ad-724bed1fa33a', NULL, '2025-06-05 18:02:44', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
