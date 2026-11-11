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

-- Dumping structure for table cdr.encounter_type
CREATE TABLE IF NOT EXISTS `encounter_type` (
  `encounter_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `view_privilege` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE KEY `encounter_type_unique_name` (`name`),
  UNIQUE KEY `encounter_type_uuid_index` (`uuid`),
  KEY `encounter_type_retired_status` (`retired`),
  KEY `user_who_created_type` (`creator`),
  KEY `user_who_retired_encounter_type` (`retired_by`),
  KEY `privilege_which_can_view_encounter_type` (`view_privilege`),
  KEY `privilege_which_can_edit_encounter_type` (`edit_privilege`),
  KEY `encounter_type_changed_by` (`changed_by`),
  CONSTRAINT `encounter_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit_encounter_type` FOREIGN KEY (`edit_privilege`) REFERENCES `openmrs`.`privilege` (`privilege`),
  CONSTRAINT `privilege_which_can_view_encounter_type` FOREIGN KEY (`view_privilege`) REFERENCES `openmrs`.`privilege` (`privilege`),
  CONSTRAINT `user_who_created_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_encounter_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cdr.encounter_type: ~70 rows (approximately)
INSERT INTO `encounter_type` (`encounter_type_id`, `name`, `description`, `creator`, `date_created`, `retired`, `retired_by`, `date_retired`, `retire_reason`, `uuid`, `view_privilege`, `edit_privilege`, `changed_by`, `date_changed`) VALUES
	(1, 'Discharge', 'Indicates that a patient\'s inpatient care at the hospital is ending, and they are expected to leave soon.', 2, '2013-08-01 19:27:50', 0, NULL, NULL, NULL, '181820aa-88c9-479b-9077-af92f5364329', NULL, NULL, NULL, NULL),
	(2, 'Client Intake/HIV testing', 'Indicates that the patient has been admitted for inpatient care, and is not expected to leave the hospital unless discharged.', 2, '2013-08-01 19:27:27', 0, NULL, NULL, NULL, 'e22e39fd-7db2-45e7-80f1-60fa0d5a4378', NULL, NULL, 1, '2019-09-05 15:59:46'),
	(3, 'Visit Note', 'Encounter where a full or abbreviated examination is done, usually leading to a presumptive or confirmed diagnosis, recorded by the examining clinician.', 2, '2013-08-02 06:16:06', 0, NULL, NULL, NULL, 'd7151f82-c1f3-4152-a605-2f9ea7414a79', NULL, NULL, NULL, NULL),
	(4, 'Check Out', 'The patient is explicitly leaving the hospital/clinic.(Usually no formal encounter is captured for this.)', 2, '2013-08-02 06:14:43', 0, NULL, NULL, NULL, '25a042b2-60bc-4940-a909-debd098b7d82', NULL, NULL, NULL, NULL),
	(5, 'Check In', 'Indicates the patient has done the required paperwork and check-in to begin a visit to the clinic/hospital.', 2, '2013-08-02 06:13:23', 0, NULL, NULL, NULL, 'ca3aed11-1aa4-42a1-b85c-8332fc8001fc', NULL, NULL, 2, '2018-04-04 12:50:43'),
	(6, 'Transfer Within Hospital (Simple)', 'Indicates that a patient is being transferred into a different department within the hospital. (Transfers out of the hospital should not use this encounter type.)', 2, '2013-08-01 19:28:10', 0, NULL, NULL, NULL, '7b68d557-85ef-4fc8-b767-4fa4f5eb5c23', NULL, NULL, 1, '2018-06-12 10:24:30'),
	(7, 'Vitals', 'For capturing vital signs', 2, '2013-08-12 13:08:05', 0, NULL, NULL, NULL, '67a71486-1a54-468f-ac3e-7091a9a79584', NULL, NULL, NULL, NULL),
	(8, 'INITIAL', 'The Initial Encounter', 1, '2018-04-04 17:12:24', 0, NULL, NULL, NULL, '05ade461-2cd8-4919-bdd7-d27c511ee238', NULL, NULL, NULL, NULL),
	(9, 'Child Birth Registration', 'Child Birth Registration', 1, '2018-04-10 14:28:16', 0, NULL, NULL, NULL, '51139c37-6fc2-4858-8a62-a57e08655262', NULL, NULL, 1, '2018-06-12 09:39:16'),
	(10, 'General Antenatal Care', NULL, 1, '2018-04-11 11:09:18', 0, NULL, NULL, NULL, 'c6f26a9a-5a8c-493a-a5a7-57bd2c81628d', NULL, NULL, 1, '2018-06-12 16:20:56'),
	(11, 'Laboratory Order and Result form', 'Laboratory Order and Result form', 1, '2018-04-11 11:28:16', 0, NULL, NULL, NULL, '7ccf3847-7bc3-42e5-8b7e-4125712660ea', NULL, NULL, 1, '2018-06-19 14:34:38'),
	(12, 'Care', 'Care Card', 1, '2018-04-24 09:09:33', 0, NULL, NULL, NULL, '0b8d256c-e5df-4801-9653-b6ae5b6e906b', NULL, NULL, NULL, NULL),
	(13, 'Pharmacy Order Form', 'Pharmacy Order Form', 1, '2018-04-25 04:41:39', 0, NULL, NULL, NULL, 'a1fa6aa3-59e1-4833-a28c-bb62f2fb07df', NULL, NULL, 1, '2018-06-20 08:04:03'),
	(14, 'HIV Enrollment', 'HIV Enrollment', 1, '2018-04-25 15:38:12', 0, NULL, NULL, NULL, '11eb2647-91b4-482a-9cb3-08573e0d219b', NULL, 'Task: emr.patient.encounter.edit', 1, '2019-05-24 09:50:25'),
	(15, 'Client Tracking and Termination', 'Client Tracking and Termination', 1, '2018-05-02 04:09:08', 0, NULL, NULL, NULL, 'ba6fb85e-8dc3-43e3-a269-59842cd2d364', NULL, NULL, NULL, NULL),
	(16, 'Delivery register', 'Delivery register', 1, '2018-05-03 09:49:57', 0, NULL, NULL, NULL, '7daccd30-d04c-4215-b71e-97b8af8b3af3', NULL, NULL, 1, '2018-06-19 06:02:42'),
	(17, 'Program Enrollment', NULL, 1, '2018-05-03 17:32:16', 0, NULL, NULL, NULL, '1781336d-de21-4b6a-b12a-e260bcac62e7', NULL, NULL, NULL, NULL),
	(18, 'Child Follow Up', 'Child Follow Up', 1, '2018-05-05 15:55:08', 0, NULL, NULL, NULL, '2b286913-827b-4420-8595-22391fce5b6f', NULL, NULL, NULL, NULL),
	(19, 'Partner Register', 'Partner Register', 1, '2018-06-06 09:06:00', 0, NULL, NULL, NULL, '99734e44-9756-48fd-bb55-3dcc67bf7aa5', NULL, NULL, 1, '2018-06-19 12:44:49'),
	(20, 'Client intake form', 'Client intake form', 1, '2018-06-19 16:29:18', 0, NULL, NULL, NULL, '254574ff-2daf-4552-ba47-ca1636ddffa6', NULL, NULL, 1, '2018-06-19 16:33:43'),
	(21, 'GBV', 'GBV', 1, '2018-08-02 09:16:21', 0, NULL, NULL, NULL, '8c3468a7-11e3-4225-9f2f-0f85c8176cb4', NULL, NULL, NULL, NULL),
	(22, 'Client Referral Form', 'Encounter for Client Referral form', 1, '2018-08-10 23:16:54', 0, NULL, NULL, NULL, '9462d434-8008-47d8-8531-e98e6e3897ae', NULL, NULL, NULL, NULL),
	(23, 'IPT', 'IPT', 1, '2018-08-13 12:43:39', 0, NULL, NULL, NULL, 'fed74d87-1e07-459e-a9ee-5d8d5d611a3c', NULL, NULL, NULL, NULL),
	(24, 'Pediatric Initial Clinical Evaluation', 'Pediatric Initial Clinical Evaluation Form', 1, '2019-08-29 20:17:10', 0, NULL, NULL, NULL, 'fc86e55e-41f2-4753-95f1-d998c578f069', NULL, 'Manage Forms', 1, '2019-08-29 20:21:30'),
	(25, 'ART Commencement Form', 'ART Commencement Form', 1, '2019-08-29 20:30:50', 0, NULL, NULL, NULL, '21a8459c-8578-4649-931c-0cf565ee161b', NULL, 'Manage Forms', NULL, NULL),
	(26, 'Adult Initial Clinical Evaluation', 'Adult Initial Clinical Evaluation', 1, '2019-08-29 20:35:31', 0, NULL, NULL, NULL, '8c53ed84-7d89-4db9-aa57-04392849084b', NULL, 'Manage Forms', NULL, NULL),
	(27, 'HEI (HIV Exposed Infant) Area', 'HEI (HIV Exposed Infant) Area', 1, '2019-08-29 21:45:24', 0, NULL, NULL, NULL, 'c7ae3ad3-92bf-4530-ac09-d4aeb698d52c', NULL, 'Manage Forms', NULL, NULL),
	(28, 'HTS (HIV testing services)', 'HTS (HIV testing services)', 1, '2019-08-29 21:46:08', 0, NULL, NULL, NULL, '01d2a9bc-a9fa-42a9-9901-360228c61054', NULL, 'Manage Forms', NULL, NULL),
	(29, 'PMTCT (Prevention of mother-to-child trans)', 'PMTCT (Patient Program Enrollment Prevention of mother-to-child transmission)', 1, '2019-08-29 22:07:59', 0, NULL, NULL, NULL, 'a0b54c00-791f-4e28-af92-639cbd88a7b4', NULL, 'Manage Forms', NULL, NULL),
	(30, 'ART (antiretroviral therapy) Area', 'ART (antiretroviral therapy) Area', 1, '2019-08-30 08:50:17', 0, NULL, NULL, NULL, '1d2b1595-6c9e-4c9c-985b-5e919125d1a0', NULL, 'Manage Forms', NULL, NULL),
	(31, 'Viral Load Sample Collection', 'Viral Load Sample was collected', 1, '2019-09-27 17:03:02', 0, NULL, NULL, NULL, 'df45df29-9cc2-4704-8f19-de149c9377fe', NULL, NULL, NULL, NULL),
	(32, 'Enhanced Adherence Counselling', 'Enhanced Adherence Counseling', 1, '2019-10-01 05:07:25', 0, NULL, NULL, NULL, 'e1d460ac-7493-47d6-bb95-24e87b7fad35', NULL, NULL, NULL, NULL),
	(33, 'Risk Stratification Adult', 'risk stratification(adult) form', 1, '2019-11-06 20:57:17', 0, NULL, NULL, NULL, 'a8939d83-59d7-4f3c-aa80-029d7e4d8095', NULL, NULL, NULL, NULL),
	(34, 'Risk Stratification Pediatrics', 'Risk stratification (pediatrics) form', 1, '2019-11-06 20:58:02', 0, NULL, NULL, NULL, '723f8ea2-8708-4a68-a557-d5f232c8b45c', NULL, NULL, NULL, NULL),
	(35, 'PMTCT HIV Testing', 'PMTCT HIV Testing', 1, '2021-02-01 13:11:40', 0, NULL, NULL, NULL, '136e629b-78b6-4cdb-b76a-01c598d6a173', NULL, NULL, NULL, NULL),
	(36, 'Operation Triple Zero (OTZ) Service', 'Operation Triple Zero (OTZ) Service', 1, '2019-12-23 11:31:41', 0, NULL, NULL, NULL, '08bb08f1-5b14-487d-bdf3-74095f11c43e', NULL, NULL, NULL, NULL),
	(37, 'IntensiveÂ PatientÂ FollowÂ upÂ Form', 'IntensiveÂ PatientÂ FollowÂ upÂ Form', 1, '2021-05-06 11:01:51', 0, NULL, NULL, NULL, '099661d2-12a3-473d-a768-be6288e4f22e', NULL, NULL, NULL, NULL),
	(38, 'Adverse Drug Reaction', 'Adverse Drug Reaction', 1, '2021-05-31 23:30:24', 0, NULL, NULL, NULL, 'd1368f8b-3262-4053-a90f-c0a325e65939', NULL, 'Manage Forms', 1, '2021-07-10 13:20:19'),
	(39, 'Recency', 'Recency encounter type', 1, '2021-07-10 13:19:38', 0, NULL, NULL, NULL, 'ecfe9337-5c94-453d-a150-98ddf40cc9d6', NULL, 'Manage Forms', 1, '2021-07-10 13:20:53'),
	(40, 'Covid19 Case Investigation', 'Covid19 Case Investigation', 1, '2021-09-02 16:47:40', 0, NULL, NULL, NULL, '0a573847-276b-4a39-80f2-c3463b1716b0', NULL, 'Task: emr.patient.encounter.edit', NULL, NULL),
	(41, 'Covid19 Contact Investigation', NULL, 1, '2021-09-02 17:07:34', 0, NULL, NULL, NULL, 'c4b87cd6-8006-49c4-a69a-3a21a85f0937', NULL, 'Manage Forms', NULL, NULL),
	(42, 'Covid19 Daily Contact Investigation', NULL, 1, '2021-09-02 17:08:10', 0, NULL, NULL, NULL, '25290479-371b-47f8-9ddd-4b87f7c62be2', NULL, 'Manage Forms', NULL, NULL),
	(43, 'Covid19 Program Area', NULL, 1, '2021-09-03 09:41:16', 0, NULL, NULL, NULL, '2ca9b687-9a56-4a80-a1e2-ec0897e10097', NULL, 'Manage Forms', NULL, NULL),
	(44, 'PMTCT Registration Form', NULL, 1, '2021-11-02 14:01:14', 0, NULL, NULL, NULL, '97735f91-bb8c-4b49-9409-d1bc2899d941', NULL, NULL, NULL, NULL),
	(45, 'Maternal Cohort Register', NULL, 1, '2021-11-03 23:10:08', 0, NULL, NULL, NULL, '990a8120-8402-47fd-b256-4a1fb9bcbeaf', NULL, NULL, NULL, NULL),
	(46, 'TB Program', 'TB Program', 1, '2021-12-13 12:34:37', 0, NULL, NULL, NULL, '87d4614e-a421-4125-9dd9-f5c0d5fb4d50', 'Manage Forms', NULL, NULL, NULL),
	(47, 'TB Interruption Tracking', 'TB Interruption Tracking', 1, '2021-12-13 12:37:55', 0, NULL, NULL, NULL, '150e3441-67f4-46c3-99e7-61578d9ca221', NULL, NULL, NULL, NULL),
	(48, 'TB Referral For Community and Facility Register', 'TB Referral For Community and Facility Register', 1, '2021-12-13 12:38:10', 0, NULL, NULL, NULL, 'f337b250-0ca8-4e2d-a2f7-44c485eea8c1', NULL, NULL, NULL, NULL),
	(49, 'TB Preventive Theraphy', 'TB Preventive Theraphy', 1, '2021-12-13 12:38:28', 0, NULL, NULL, NULL, 'e9272664-ad3c-487e-8af2-d4f727180748', NULL, NULL, NULL, NULL),
	(50, 'TB Patient Referral or Transfer Form', 'TB Patient Referral or Transfer Form', 1, '2021-12-13 12:38:43', 0, NULL, NULL, NULL, '80146a7f-027b-4779-8d30-5c73b7aeaabb', NULL, NULL, NULL, NULL),
	(51, 'Specimen Examination Result Form', 'Specimen Examination Result Form', 1, '2021-12-13 12:38:53', 0, NULL, NULL, NULL, '0f654a8d-5e5f-4b7f-8595-e55a602e5974', NULL, NULL, NULL, NULL),
	(52, 'LGA-Health Facility TB Central Register Form', 'LGA-Health Facility TB Central Register Form', 1, '2021-12-13 12:39:06', 0, NULL, NULL, NULL, '664465bf-e18d-416c-b154-c595324ec4e7', NULL, NULL, NULL, NULL),
	(53, 'DR-TB In-Patient Discharge Form', 'DR-TB In-Patient Discharge Form', 1, '2021-12-13 12:39:19', 0, NULL, NULL, NULL, 'be400d24-f75f-453a-baf2-c5c3e555ec0f', NULL, NULL, NULL, NULL),
	(54, 'TB Patient Treatment Card Form', 'TB Patient Treatment Card Form', 1, '2021-12-13 12:39:33', 0, NULL, NULL, NULL, 'b6ba145d-be1b-46a6-ab1f-cd95ef0fba2d', NULL, NULL, NULL, NULL),
	(55, 'TB Referral For Community and Facility Form', 'TB Referral For Community and Facility Form', 1, '2021-12-13 12:39:58', 0, NULL, NULL, NULL, '7880771d-5762-41b9-8597-46bfdea47948', NULL, NULL, NULL, NULL),
	(56, 'Specimen Examination Request Form', 'Specimen Examination Request Form', 1, '2021-12-13 12:40:26', 0, NULL, NULL, NULL, '27e834a7-a8bb-4f9d-8082-6400ad7a239c', NULL, NULL, NULL, NULL),
	(57, 'TB Index Patient Contact Investigation Form', 'TB Index Patient Contact Investigation Form', 1, '2021-12-13 12:40:42', 0, NULL, NULL, NULL, 'b345da4c-71ae-4bbb-a90d-b856cecea71b', NULL, NULL, NULL, NULL),
	(58, 'Presumptive TB Register Form', 'Presumptive TB Register Form', 1, '2021-12-13 12:40:56', 0, NULL, NULL, NULL, '7055d09f-d5db-4ba7-91a1-8fd002d916ef', NULL, NULL, NULL, NULL),
	(59, 'Specimen Shipment Form', 'Specimen Shipment Form', 1, '2021-12-13 12:41:09', 0, NULL, NULL, NULL, '94336ebb-8c07-4265-8bb8-c7788e9a01df', NULL, NULL, NULL, NULL),
	(60, 'Facility Tuberculosis Contact management Register', 'Facility Tuberculosis Contact management Register', 1, '2021-12-13 12:41:19', 0, NULL, NULL, NULL, 'c7ade487-eea6-4b63-9e04-490ec4548d94', NULL, NULL, NULL, NULL),
	(61, 'DR-TB Treatment Register Form', 'DR-TB Treatment Register Form', 1, '2021-12-13 12:41:37', 0, NULL, NULL, NULL, '7400c3ce-8ac1-4f36-846d-7ddea6286645', NULL, NULL, NULL, NULL),
	(62, 'TB Laboratory Register Form', 'TB Laboratory Register Form', 1, '2021-12-13 12:41:49', 0, NULL, NULL, NULL, '5fcb537c-132a-4b59-9bc1-8c3e1bb2ad63', NULL, NULL, NULL, NULL),
	(63, 'Tuberculosis Program Form', 'Tuberculosis Program Form', 1, '2021-12-13 12:42:01', 0, NULL, NULL, NULL, '06f0d00f-854a-4dcf-8033-4e6bbe3ea029', NULL, NULL, NULL, NULL),
	(64, 'TB Screening Form', 'TB Screening Form', 1, '2021-12-13 12:42:45', 0, NULL, NULL, NULL, 'e7cee2cb-9cb4-4361-b216-3d1e461cc769', NULL, NULL, NULL, NULL),
	(65, 'TB Screening and Case Identification', 'TB Screening and Case Identification', 1, '2022-01-10 17:11:34', 0, NULL, NULL, NULL, '8b1a1844-4506-4c18-b938-38360673243c', NULL, NULL, NULL, NULL),
	(66, 'TB Testing and Shipment', 'TB Testing and Shipment', 1, '2022-01-10 17:12:18', 0, NULL, NULL, NULL, '59e09412-b4ae-4e50-953b-ac57dd6cf8db', NULL, NULL, NULL, NULL),
	(67, 'TB Treatment', 'TB Treatment', 1, '2022-01-10 17:12:33', 0, NULL, NULL, NULL, 'a9e47851-2632-4193-843a-bed6ee5677b1', NULL, NULL, NULL, NULL),
	(68, 'TB Treatment Monitoring', 'TB Treatment Monitoring', 1, '2022-01-10 17:12:43', 0, NULL, NULL, NULL, '665f3e9e-3a8d-48e4-b74a-d7ed9bae2c1d', NULL, NULL, NULL, NULL),
	(69, 'HIV Program', 'HIV Program', 1, '2022-01-18 12:06:48', 0, NULL, NULL, NULL, '80de892a-e504-4ac1-9366-f5f0f8a5c4a5', NULL, 'Manage Forms', NULL, NULL),
	(70, 'OVC Linkage Form', 'OVC Linkage Form', 1, '2023-06-05 21:46:34', 0, NULL, NULL, NULL, 'd3ac6e1d-8374-4bf8-9b40-9c1eac392a7d', NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
