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

-- Dumping structure for table cdr.address_hierarchy_entry
CREATE TABLE IF NOT EXISTS `address_hierarchy_entry` (
  `address_hierarchy_entry_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `level_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `user_generated_id` varchar(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `elevation` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_hierarchy_entry_id`),
  KEY `parent_name` (`parent_id`,`name`(20)),
  KEY `level_name` (`level_id`,`name`(20)),
  KEY `address_hierarchy_entry_name_idx` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=10339 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.address_hierarchy_level
CREATE TABLE IF NOT EXISTS `address_hierarchy_level` (
  `address_hierarchy_level_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `parent_level_id` int DEFAULT NULL,
  `address_field` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_hierarchy_level_id`),
  UNIQUE KEY `parent_level_id_unique` (`parent_level_id`),
  KEY `address_field_unique` (`address_field`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.biometricinfo
CREATE TABLE IF NOT EXISTS `biometricinfo` (
  `biometricInfo_Id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_id` int NOT NULL,
  `template` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `imageWidth` int DEFAULT NULL,
  `imageHeight` int DEFAULT NULL,
  `imageDPI` int DEFAULT NULL,
  `imageQuality` int DEFAULT NULL,
  `fingerPosition` varchar(50) DEFAULT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `new_template` longblob,
  PRIMARY KEY (`biometricInfo_Id`,`datim_code`),
  KEY `patient_id` (`patient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.biometricverificationinfo
CREATE TABLE IF NOT EXISTS `biometricverificationinfo` (
  `biometricInfo_Id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_Id` int NOT NULL,
  `template` text,
  `imageWidth` int DEFAULT NULL,
  `imageHeight` int DEFAULT NULL,
  `imageDPI` int DEFAULT NULL,
  `imageQuality` int DEFAULT NULL,
  `fingerPosition` varchar(50) DEFAULT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `new_template` longblob,
  `salt` text,
  `encoded_template` text,
  `hashed` text,
  `recapture_count` int DEFAULT '1',
  PRIMARY KEY (`biometricInfo_Id`,`datim_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.biometricverificationinfo_match_trail
CREATE TABLE IF NOT EXISTS `biometricverificationinfo_match_trail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `patient_id` int NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `match_status` varchar(20) DEFAULT NULL,
  `encoded_template` text,
  `hashed` text,
  `finger_position` varchar(100) NOT NULL,
  `brstatus` int DEFAULT '0',
  `brstatus_recapturecount` int DEFAULT NULL,
  PRIMARY KEY (`id`,`datim_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cdr_treatment_linelist_runs
CREATE TABLE IF NOT EXISTS `cdr_treatment_linelist_runs` (
  `reporting_date` date NOT NULL,
  `status` enum('running','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `row_count` int unsigned NOT NULL DEFAULT '0',
  `error_message` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`reporting_date`),
  KEY `ix_linelist_run_status` (`status`,`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cdr_treatment_snapshot
CREATE TABLE IF NOT EXISTS `cdr_treatment_snapshot` (
  `facility_datim_code` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `reporting_date` date NOT NULL,
  `run_id` bigint unsigned NOT NULL,
  `IP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SurgeCommand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LGA` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FacilityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pepid_datim` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  `Pepid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HospitalNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sex` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KP_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Enrolled` datetime DEFAULT NULL,
  `AgeAtStartofART` int DEFAULT NULL,
  `AgeAtStart_InMonth` int DEFAULT NULL,
  `CurrentAge` int DEFAULT NULL,
  `ARTStartDate` datetime DEFAULT NULL,
  `LastPickupDate` datetime DEFAULT NULL,
  `NextAppmt` datetime DEFAULT NULL,
  `DaysOfARVRefill` int DEFAULT NULL,
  `RegLineAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ARTRegAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentRegLine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentARTReg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PregStatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentVL` double DEFAULT NULL,
  `DateOfCurrentVL` datetime DEFAULT NULL,
  `ViralLoadIndication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Result_Received` datetime DEFAULT NULL,
  `Last_VL_Sample_Date` datetime DEFAULT NULL,
  `Initial_CD4_Date` datetime DEFAULT NULL,
  `initial_CD4` double DEFAULT NULL,
  `Last_CD4_Date` datetime DEFAULT NULL,
  `Last_CD4` double DEFAULT NULL,
  `CurrentARTStatus_28Days` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DaysInterval` int DEFAULT NULL,
  `TI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone_No` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci,
  `Pill_Balance` double DEFAULT NULL,
  `Next_Pickup_Date` datetime DEFAULT NULL,
  `DATIMCode` varchar(20) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `MonthOnART` int DEFAULT NULL,
  `Last_Weight` double DEFAULT NULL,
  `Last_Weight_Date` datetime DEFAULT NULL,
  `Biometrics_Captured` datetime DEFAULT NULL,
  `Recapture_Count` int DEFAULT NULL,
  `Date_Last_Recaptured` datetime DEFAULT NULL,
  `Eligible_For_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_IPT_start` datetime DEFAULT NULL,
  `Outcome_of_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Outcome` datetime DEFAULT NULL,
  `Last_Clinic_Visit_Date` datetime DEFAULT NULL,
  `Systolic_BP` double DEFAULT NULL,
  `Diastolic_BP` double DEFAULT NULL,
  `Next_Clinical_Appt_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TB_Investigations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Investig_Result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_TB_Investig` datetime DEFAULT NULL,
  `Reason_for_Tracking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tracking_Date` datetime DEFAULT NULL,
  `Reason_for_Defaulting1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason_for_Termination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Termination` datetime DEFAULT NULL,
  `Facility_Transferred_To` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Last_EAC_Session_Date` datetime DEFAULT NULL,
  `EAC_Session_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EAC_ARV_Plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_VL_Before_EAC` datetime DEFAULT NULL,
  `VL_Before_EAC` double DEFAULT NULL,
  `Date_VL_After_EAC` datetime DEFAULT NULL,
  `VL_After_EAC` double DEFAULT NULL,
  `List_Parameters` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_List_Gen` datetime DEFAULT NULL,
  `refreshed_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`facility_datim_code`,`reporting_date`,`patient_id`),
  UNIQUE KEY `ux_snapshot_pepid_datim` (`facility_datim_code`,`reporting_date`,`Pepid_datim`),
  KEY `ix_snapshot_run` (`run_id`),
  KEY `ix_snapshot_reporting_status` (`reporting_date`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_state_status` (`State`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_facility_status` (`facility_datim_code`,`reporting_date`,`CurrentARTStatus_28Days`),
  CONSTRAINT `fk_snapshot_run` FOREIGN KEY (`run_id`) REFERENCES `cdr_treatment_snapshot_runs` (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cdr_treatment_snapshot_runs
CREATE TABLE IF NOT EXISTS `cdr_treatment_snapshot_runs` (
  `run_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `facility_datim_code` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `reporting_date` date NOT NULL,
  `status` enum('queued','running','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queued',
  `started_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `row_count` int unsigned NOT NULL DEFAULT '0',
  `error_message` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`run_id`),
  KEY `ix_snapshot_run_facility_date` (`facility_datim_code`,`reporting_date` DESC),
  KEY `ix_snapshot_run_status_created` (`status`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cdr_treatment_snapshot_stage
CREATE TABLE IF NOT EXISTS `cdr_treatment_snapshot_stage` (
  `facility_datim_code` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `reporting_date` date NOT NULL,
  `run_id` bigint unsigned NOT NULL,
  `IP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SurgeCommand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LGA` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FacilityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pepid_datim` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  `Pepid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HospitalNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sex` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KP_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Enrolled` datetime DEFAULT NULL,
  `AgeAtStartofART` int DEFAULT NULL,
  `AgeAtStart_InMonth` int DEFAULT NULL,
  `CurrentAge` int DEFAULT NULL,
  `ARTStartDate` datetime DEFAULT NULL,
  `LastPickupDate` datetime DEFAULT NULL,
  `NextAppmt` datetime DEFAULT NULL,
  `DaysOfARVRefill` int DEFAULT NULL,
  `RegLineAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ARTRegAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentRegLine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentARTReg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PregStatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentVL` double DEFAULT NULL,
  `DateOfCurrentVL` datetime DEFAULT NULL,
  `ViralLoadIndication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Result_Received` datetime DEFAULT NULL,
  `Last_VL_Sample_Date` datetime DEFAULT NULL,
  `Initial_CD4_Date` datetime DEFAULT NULL,
  `initial_CD4` double DEFAULT NULL,
  `Last_CD4_Date` datetime DEFAULT NULL,
  `Last_CD4` double DEFAULT NULL,
  `CurrentARTStatus_28Days` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DaysInterval` int DEFAULT NULL,
  `TI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone_No` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci,
  `Pill_Balance` double DEFAULT NULL,
  `Next_Pickup_Date` datetime DEFAULT NULL,
  `DATIMCode` varchar(20) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `MonthOnART` int DEFAULT NULL,
  `Last_Weight` double DEFAULT NULL,
  `Last_Weight_Date` datetime DEFAULT NULL,
  `Biometrics_Captured` datetime DEFAULT NULL,
  `Recapture_Count` int DEFAULT NULL,
  `Date_Last_Recaptured` datetime DEFAULT NULL,
  `Eligible_For_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_IPT_start` datetime DEFAULT NULL,
  `Outcome_of_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Outcome` datetime DEFAULT NULL,
  `Last_Clinic_Visit_Date` datetime DEFAULT NULL,
  `Systolic_BP` double DEFAULT NULL,
  `Diastolic_BP` double DEFAULT NULL,
  `Next_Clinical_Appt_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TB_Investigations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Investig_Result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_TB_Investig` datetime DEFAULT NULL,
  `Reason_for_Tracking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tracking_Date` datetime DEFAULT NULL,
  `Reason_for_Defaulting1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason_for_Termination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Termination` datetime DEFAULT NULL,
  `Facility_Transferred_To` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Last_EAC_Session_Date` datetime DEFAULT NULL,
  `EAC_Session_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EAC_ARV_Plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_VL_Before_EAC` datetime DEFAULT NULL,
  `VL_Before_EAC` double DEFAULT NULL,
  `Date_VL_After_EAC` datetime DEFAULT NULL,
  `VL_After_EAC` double DEFAULT NULL,
  `List_Parameters` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_List_Gen` datetime DEFAULT NULL,
  `refreshed_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`run_id`,`facility_datim_code`,`reporting_date`,`patient_id`),
  KEY `ix_snapshot_run` (`run_id`),
  KEY `ix_snapshot_reporting_status` (`reporting_date`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_state_status` (`State`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_facility_status` (`facility_datim_code`,`reporting_date`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_stage_facility` (`facility_datim_code`,`reporting_date`,`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_assessments
CREATE TABLE IF NOT EXISTS `cihp_ayp_assessments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int NOT NULL,
  `center_id` int NOT NULL,
  `program_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assessment_round` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assessment_date` date NOT NULL,
  `assessor_name` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_score` decimal(8,2) DEFAULT NULL,
  `percent_score` decimal(6,2) DEFAULT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_ci,
  `source_row_id` bigint DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voided` tinyint NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_assessment_source_row` (`source_row_id`),
  KEY `idx_cihp_ayp_assessment_center_program` (`center_id`,`program_type`),
  KEY `idx_cihp_ayp_assessment_date` (`assessment_date`),
  KEY `idx_cihp_ayp_assessment_beneficiary` (`beneficiary_id`),
  CONSTRAINT `fk_cihp_ayp_assessment_beneficiary` FOREIGN KEY (`beneficiary_id`) REFERENCES `cihp_ayp_beneficiaries` (`id`),
  CONSTRAINT `fk_cihp_ayp_assessment_center` FOREIGN KEY (`center_id`) REFERENCES `cihp_ayp_centers` (`id`),
  CONSTRAINT `fk_cihp_ayp_assessment_source_row` FOREIGN KEY (`source_row_id`) REFERENCES `cihp_ayp_source_rows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_assessment_responses
CREATE TABLE IF NOT EXISTS `cihp_ayp_assessment_responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment_id` int NOT NULL,
  `question_code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_section` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `answer_score` decimal(8,2) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_cihp_ayp_response_assessment` (`assessment_id`),
  KEY `idx_cihp_ayp_response_question` (`question_code`),
  CONSTRAINT `fk_cihp_ayp_response_assessment` FOREIGN KEY (`assessment_id`) REFERENCES `cihp_ayp_assessments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_beneficiaries
CREATE TABLE IF NOT EXISTS `cihp_ayp_beneficiaries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age_at_enrollment` int DEFAULT NULL,
  `phone_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lga` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `community` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cohort` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_id` int NOT NULL,
  `program_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_track` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrollment_date` date NOT NULL,
  `referral_source` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ovc_program_status` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hiv_program_status` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mentor_assigned` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enrolled',
  `notes` mediumtext COLLATE utf8mb4_unicode_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voided` tinyint NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_beneficiary_unique_id` (`unique_id`),
  KEY `idx_cihp_ayp_beneficiary_center_program` (`center_id`,`program_type`),
  KEY `idx_cihp_ayp_beneficiary_enrollment` (`enrollment_date`),
  KEY `idx_cihp_ayp_beneficiary_status` (`status`),
  KEY `idx_cihp_ayp_beneficiary_cohort` (`cohort`),
  CONSTRAINT `fk_cihp_ayp_beneficiary_center` FOREIGN KEY (`center_id`) REFERENCES `cihp_ayp_centers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_beneficiary_attributes
CREATE TABLE IF NOT EXISTS `cihp_ayp_beneficiary_attributes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int NOT NULL,
  `source_row_id` bigint NOT NULL,
  `attribute_code` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_attribute_source` (`source_row_id`,`attribute_code`),
  KEY `idx_cihp_ayp_attribute_beneficiary` (`beneficiary_id`),
  KEY `idx_cihp_ayp_attribute_code` (`attribute_code`),
  CONSTRAINT `fk_cihp_ayp_attribute_beneficiary` FOREIGN KEY (`beneficiary_id`) REFERENCES `cihp_ayp_beneficiaries` (`id`),
  CONSTRAINT `fk_cihp_ayp_attribute_source_row` FOREIGN KEY (`source_row_id`) REFERENCES `cihp_ayp_source_rows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222591 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_beneficiary_services
CREATE TABLE IF NOT EXISTS `cihp_ayp_beneficiary_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int NOT NULL,
  `reporting_month` date NOT NULL,
  `mental_health_screened` tinyint NOT NULL DEFAULT '0',
  `mental_health_issue_identified` tinyint NOT NULL DEFAULT '0',
  `mental_health_referred` tinyint NOT NULL DEFAULT '0',
  `mental_health_service_received` tinyint NOT NULL DEFAULT '0',
  `gbv_screened` tinyint NOT NULL DEFAULT '0',
  `gbv_referred` tinyint NOT NULL DEFAULT '0',
  `post_gbv_service_received` tinyint NOT NULL DEFAULT '0',
  `hiv_prevention_received` tinyint NOT NULL DEFAULT '0',
  `hiv_srh_received` tinyint NOT NULL DEFAULT '0',
  `hts_received` tinyint NOT NULL DEFAULT '0',
  `new_hiv_diagnosis` tinyint NOT NULL DEFAULT '0',
  `linked_to_treatment` tinyint NOT NULL DEFAULT '0',
  `attended_classes` tinyint NOT NULL DEFAULT '0',
  `attendance_90_percent` tinyint NOT NULL DEFAULT '0',
  `capstone_completed` tinyint NOT NULL DEFAULT '0',
  `internship_linked` tinyint NOT NULL DEFAULT '0',
  `internship_completed` tinyint NOT NULL DEFAULT '0',
  `notes` mediumtext COLLATE utf8mb4_unicode_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voided` tinyint NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_service_beneficiary_month` (`beneficiary_id`,`reporting_month`),
  KEY `idx_cihp_ayp_service_month` (`reporting_month`),
  CONSTRAINT `fk_cihp_ayp_service_beneficiary` FOREIGN KEY (`beneficiary_id`) REFERENCES `cihp_ayp_beneficiaries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_centers
CREATE TABLE IF NOT EXISTS `cihp_ayp_centers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `center_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lga` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_programs` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'STEM,Vocational',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voided` tinyint NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_centers_name` (`center_name`),
  KEY `idx_cihp_ayp_centers_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_cohorts
CREATE TABLE IF NOT EXISTS `cihp_ayp_cohorts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cohort_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `expected_end_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `is_current` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `notes` mediumtext COLLATE utf8mb4_unicode_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voided` tinyint NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_cohort_name` (`cohort_name`),
  KEY `idx_cihp_ayp_cohort_current` (`is_current`),
  KEY `idx_cihp_ayp_cohort_active` (`is_active`),
  KEY `idx_cihp_ayp_cohort_dates` (`start_date`,`expected_end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_import_batches
CREATE TABLE IF NOT EXISTS `cihp_ayp_import_batches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `batch_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_directory` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` datetime DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `files_seen` int NOT NULL DEFAULT '0',
  `source_rows_seen` int NOT NULL DEFAULT '0',
  `beneficiaries_created` int NOT NULL DEFAULT '0',
  `assessments_created` int NOT NULL DEFAULT '0',
  `notes` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_import_batch_key` (`batch_key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_monthly_summaries
CREATE TABLE IF NOT EXISTS `cihp_ayp_monthly_summaries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reporting_month` date NOT NULL,
  `center_id` int DEFAULT NULL,
  `program_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dhis_aggregate_total` int DEFAULT NULL,
  `prepared_by` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voided` tinyint NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cihp_ayp_monthly_reporting_month` (`reporting_month`),
  KEY `idx_cihp_ayp_monthly_center_program` (`center_id`,`program_type`),
  CONSTRAINT `fk_cihp_ayp_monthly_center` FOREIGN KEY (`center_id`) REFERENCES `cihp_ayp_centers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_monthly_summary_items
CREATE TABLE IF NOT EXISTS `cihp_ayp_monthly_summary_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `summary_id` int NOT NULL,
  `indicator_code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indicator_value` int NOT NULL DEFAULT '0',
  `value_source` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_monthly_item` (`summary_id`,`indicator_code`),
  CONSTRAINT `fk_cihp_ayp_monthly_item_summary` FOREIGN KEY (`summary_id`) REFERENCES `cihp_ayp_monthly_summaries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_ayp_source_rows
CREATE TABLE IF NOT EXISTS `cihp_ayp_source_rows` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `import_batch_id` bigint NOT NULL,
  `source_file` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_sheet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source_row_number` int NOT NULL,
  `source_kind` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_record` json NOT NULL,
  `source_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beneficiary_id` int DEFAULT NULL,
  `import_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `import_notes` mediumtext COLLATE utf8mb4_unicode_ci,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cihp_ayp_source_row_hash` (`source_hash`),
  KEY `idx_cihp_ayp_source_row_batch` (`import_batch_id`),
  KEY `idx_cihp_ayp_source_row_beneficiary` (`beneficiary_id`),
  CONSTRAINT `fk_cihp_ayp_source_row_batch` FOREIGN KEY (`import_batch_id`) REFERENCES `cihp_ayp_import_batches` (`id`),
  CONSTRAINT `fk_cihp_ayp_source_row_beneficiary` FOREIGN KEY (`beneficiary_id`) REFERENCES `cihp_ayp_beneficiaries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_cdr_facility_tokens
CREATE TABLE IF NOT EXISTS `cihp_cdr_facility_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(64) NOT NULL,
  `state` varchar(16) NOT NULL,
  `label` varchar(100) NOT NULL,
  `token_hash` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `revoked_by` varchar(255) DEFAULT NULL,
  `last_used_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_facility_token_hash` (`token_hash`),
  KEY `ix_cihp_cdr_facility_tokens_datim_code` (`datim_code`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_cdr_uploads
CREATE TABLE IF NOT EXISTS `cihp_cdr_uploads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `batch` varchar(255) NOT NULL,
  `total_file_count` varchar(255) NOT NULL,
  `failed_files` int NOT NULL,
  `status` int NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `datim_code` varchar(255) NOT NULL,
  `processed` int DEFAULT NULL,
  `uploaded_by` varchar(255) DEFAULT NULL,
  `last_success_node` varchar(255) DEFAULT NULL,
  `retry_count` int DEFAULT '0',
  `date_updated` datetime DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_cdr_users
CREATE TABLE IF NOT EXISTS `cihp_cdr_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `is_staff` int DEFAULT NULL,
  `password_hash` varchar(500) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `voided` int DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_cit_dashboard
CREATE TABLE IF NOT EXISTS `cihp_cit_dashboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quater` varchar(10) NOT NULL,
  `year` int NOT NULL,
  `label_name` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `voided` tinyint(1) DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT '0',
  `url` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_jolly_users
CREATE TABLE IF NOT EXISTS `cihp_jolly_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nmrs_id` int NOT NULL,
  `datim_code` varchar(50) DEFAULT NULL,
  `pepfar_id` varchar(50) NOT NULL,
  `pin` varchar(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pepfar_id` (`pepfar_id`),
  KEY `fk_jolly_user_patient` (`nmrs_id`),
  CONSTRAINT `fk_jolly_user_patient` FOREIGN KEY (`nmrs_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_listoffacility
CREATE TABLE IF NOT EXISTS `cihp_listoffacility` (
  `FacilityID` double DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `SurgeCommand` varchar(255) DEFAULT NULL,
  `LGA` varchar(255) DEFAULT NULL,
  `Datim_Code` varchar(255) DEFAULT NULL,
  UNIQUE KEY `myIndex` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_site
CREATE TABLE IF NOT EXISTS `cihp_site` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'NAme of the site/facility',
  `LGA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'LGA where site/facility is located',
  `StateCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'State code from the State table',
  `SiteId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Assigned site id',
  `StateId` int NOT NULL COMMENT 'Primary key state ID from the State table',
  PRIMARY KEY (`Id`),
  KEY `FK_Site_State` (`StateId`),
  CONSTRAINT `FK_Site_State` FOREIGN KEY (`StateId`) REFERENCES `cihp_state` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table cdr.cihp_state
CREATE TABLE IF NOT EXISTS `cihp_state` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept
CREATE TABLE IF NOT EXISTS `concept` (
  `concept_id` int NOT NULL AUTO_INCREMENT,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `short_name` varchar(255) DEFAULT NULL,
  `description` text,
  `form_text` text,
  `datatype_id` int NOT NULL DEFAULT '0',
  `class_id` int NOT NULL DEFAULT '0',
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` varchar(50) DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_id`),
  UNIQUE KEY `concept_uuid_index` (`uuid`),
  KEY `concept_classes` (`class_id`),
  KEY `concept_creator` (`creator`),
  KEY `concept_datatypes` (`datatype_id`),
  KEY `user_who_changed_concept` (`changed_by`),
  KEY `concept_code` (`version`),
  KEY `concept_ndx` (`version`),
  KEY `user_who_retired_concept` (`retired_by`),
  CONSTRAINT `concept_classes` FOREIGN KEY (`class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `concept_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_datatypes` FOREIGN KEY (`datatype_id`) REFERENCES `concept_datatype` (`concept_datatype_id`),
  CONSTRAINT `user_who_changed_concept` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167252 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_answer
CREATE TABLE IF NOT EXISTS `concept_answer` (
  `concept_answer_id` int NOT NULL AUTO_INCREMENT,
  `concept_id` int NOT NULL DEFAULT '0',
  `answer_concept` int DEFAULT NULL,
  `answer_drug` int DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  `sort_weight` double DEFAULT NULL,
  PRIMARY KEY (`concept_answer_id`),
  UNIQUE KEY `concept_answer_uuid_index` (`uuid`),
  KEY `answer_creator` (`creator`),
  KEY `answer` (`answer_concept`),
  KEY `answers_for_concept` (`concept_id`),
  KEY `answer_answer_drug_fk` (`answer_drug`),
  CONSTRAINT `answer` FOREIGN KEY (`answer_concept`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_answer_drug_fk` FOREIGN KEY (`answer_drug`) REFERENCES `openmrs`.`drug` (`drug_id`),
  CONSTRAINT `answer_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `answers_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9364 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_attribute
CREATE TABLE IF NOT EXISTS `concept_attribute` (
  `concept_attribute_id` int NOT NULL AUTO_INCREMENT,
  `concept_id` int NOT NULL,
  `attribute_type_id` int NOT NULL,
  `value_reference` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uuid` char(38) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`concept_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `concept_attribute_concept_fk` (`concept_id`),
  KEY `concept_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `concept_attribute_creator_fk` (`creator`),
  KEY `concept_attribute_changed_by_fk` (`changed_by`),
  KEY `concept_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `concept_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `concept_attribute_type` (`concept_attribute_type_id`),
  CONSTRAINT `concept_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_concept_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `concept_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_attribute_type
CREATE TABLE IF NOT EXISTS `concept_attribute_type` (
  `concept_attribute_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `datatype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `datatype_config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `preferred_handler` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `handler_config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `min_occurs` int NOT NULL,
  `max_occurs` int DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uuid` char(38) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`concept_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `concept_attribute_type_creator_fk` (`creator`),
  KEY `concept_attribute_type_changed_by_fk` (`changed_by`),
  KEY `concept_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `concept_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_class
CREATE TABLE IF NOT EXISTS `concept_class` (
  `concept_class_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  PRIMARY KEY (`concept_class_id`),
  UNIQUE KEY `concept_class_uuid_index` (`uuid`),
  KEY `concept_class_creator` (`creator`),
  KEY `user_who_retired_concept_class` (`retired_by`),
  KEY `concept_class_retired_status` (`retired`),
  KEY `concept_class_name_index` (`name`),
  KEY `concept_class_changed_by` (`changed_by`),
  CONSTRAINT `concept_class_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_class_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_class` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_complex
CREATE TABLE IF NOT EXISTS `concept_complex` (
  `concept_id` int NOT NULL,
  `handler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `concept_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_datatype
CREATE TABLE IF NOT EXISTS `concept_datatype` (
  `concept_datatype_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hl7_abbreviation` varchar(3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_datatype_id`),
  UNIQUE KEY `concept_datatype_uuid_index` (`uuid`),
  KEY `concept_datatype_creator` (`creator`),
  KEY `user_who_retired_concept_datatype` (`retired_by`),
  KEY `concept_datatype_retired_status` (`retired`),
  KEY `concept_datatype_name_index` (`name`),
  CONSTRAINT `concept_datatype_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_datatype` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_description
CREATE TABLE IF NOT EXISTS `concept_description` (
  `concept_description_id` int NOT NULL AUTO_INCREMENT,
  `concept_id` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_description_id`),
  UNIQUE KEY `concept_description_uuid_index` (`uuid`),
  KEY `concept_being_described` (`concept_id`),
  KEY `user_who_created_description` (`creator`),
  KEY `user_who_changed_description` (`changed_by`),
  CONSTRAINT `description_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_description` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_description` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18788 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_map_type
CREATE TABLE IF NOT EXISTS `concept_map_type` (
  `concept_map_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uuid` char(38) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`concept_map_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `name` (`name`),
  KEY `mapped_user_creator_concept_map_type` (`creator`),
  KEY `mapped_user_changed_concept_map_type` (`changed_by`),
  KEY `mapped_user_retired_concept_map_type` (`retired_by`),
  CONSTRAINT `mapped_user_changed_concept_map_type` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_concept_map_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired_concept_map_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_name
CREATE TABLE IF NOT EXISTS `concept_name` (
  `concept_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(50) NOT NULL DEFAULT '',
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `concept_name_id` int NOT NULL AUTO_INCREMENT,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `concept_name_type` varchar(50) DEFAULT NULL,
  `locale_preferred` tinyint(1) DEFAULT '0',
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  PRIMARY KEY (`concept_name_id`),
  UNIQUE KEY `concept_name_id` (`concept_name_id`),
  UNIQUE KEY `concept_name_uuid_index` (`uuid`),
  KEY `user_who_created_name` (`creator`),
  KEY `name_of_concept` (`name`),
  KEY `concept_id` (`concept_id`),
  KEY `unique_concept_name_id` (`concept_id`),
  KEY `user_who_voided_name` (`voided_by`),
  KEY `concept_name_changed_by` (`changed_by`),
  CONSTRAINT `concept_name_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `name_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_this_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144103 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_name_tag
CREATE TABLE IF NOT EXISTS `concept_name_tag` (
  `concept_name_tag_id` int NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `description` text,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  PRIMARY KEY (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_id` (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_id_2` (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_unique_tags` (`tag`),
  UNIQUE KEY `concept_name_tag_uuid_index` (`uuid`),
  KEY `user_who_created_name_tag` (`creator`),
  KEY `user_who_voided_name_tag` (`voided_by`),
  KEY `concept_name_tag_changed_by` (`changed_by`),
  CONSTRAINT `concept_name_tag_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_name_tag_map
CREATE TABLE IF NOT EXISTS `concept_name_tag_map` (
  `concept_name_id` int NOT NULL,
  `concept_name_tag_id` int NOT NULL,
  KEY `map_name` (`concept_name_id`),
  KEY `map_name_tag` (`concept_name_tag_id`),
  CONSTRAINT `mapped_concept_name` FOREIGN KEY (`concept_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `mapped_concept_name_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_numeric
CREATE TABLE IF NOT EXISTS `concept_numeric` (
  `concept_id` int NOT NULL DEFAULT '0',
  `hi_absolute` double DEFAULT NULL,
  `hi_critical` double DEFAULT NULL,
  `hi_normal` double DEFAULT NULL,
  `low_absolute` double DEFAULT NULL,
  `low_critical` double DEFAULT NULL,
  `low_normal` double DEFAULT NULL,
  `units` varchar(50) DEFAULT NULL,
  `allow_decimal` tinyint(1) DEFAULT NULL,
  `display_precision` int DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `numeric_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_proposal
CREATE TABLE IF NOT EXISTS `concept_proposal` (
  `concept_proposal_id` int NOT NULL AUTO_INCREMENT,
  `concept_id` int DEFAULT NULL,
  `encounter_id` int DEFAULT NULL,
  `original_text` varchar(255) NOT NULL DEFAULT '',
  `final_text` varchar(255) DEFAULT NULL,
  `obs_id` int DEFAULT NULL,
  `obs_concept_id` int DEFAULT NULL,
  `state` varchar(32) NOT NULL DEFAULT 'UNMAPPED',
  `comments` varchar(255) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_proposal_id`),
  UNIQUE KEY `concept_proposal_uuid_index` (`uuid`),
  KEY `user_who_changed_proposal` (`changed_by`),
  KEY `concept_for_proposal` (`concept_id`),
  KEY `user_who_created_proposal` (`creator`),
  KEY `encounter_for_proposal` (`encounter_id`),
  KEY `proposal_obs_concept_id` (`obs_concept_id`),
  KEY `proposal_obs_id` (`obs_id`),
  CONSTRAINT `concept_for_proposal` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `encounter_for_proposal` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `proposal_obs_concept_id` FOREIGN KEY (`obs_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `proposal_obs_id` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_changed_proposal` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_proposal` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_proposal_tag_map
CREATE TABLE IF NOT EXISTS `concept_proposal_tag_map` (
  `concept_proposal_id` int NOT NULL,
  `concept_name_tag_id` int NOT NULL,
  KEY `mapped_concept_proposal_tag` (`concept_name_tag_id`),
  KEY `mapped_concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal` FOREIGN KEY (`concept_proposal_id`) REFERENCES `concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_reference_map
CREATE TABLE IF NOT EXISTS `concept_reference_map` (
  `concept_map_id` int NOT NULL AUTO_INCREMENT,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `concept_id` int NOT NULL DEFAULT '0',
  `uuid` char(38) NOT NULL,
  `concept_reference_term_id` int NOT NULL,
  `concept_map_type_id` int NOT NULL DEFAULT '1',
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`concept_map_id`),
  UNIQUE KEY `concept_map_uuid_index` (`uuid`),
  KEY `map_creator` (`creator`),
  KEY `map_for_concept` (`concept_id`),
  KEY `mapped_concept_map_type` (`concept_map_type_id`),
  KEY `mapped_user_changed_ref_term` (`changed_by`),
  KEY `mapped_concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `map_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `mapped_concept_map_type` FOREIGN KEY (`concept_map_type_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_concept_reference_term` FOREIGN KEY (`concept_reference_term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=285336 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_reference_source
CREATE TABLE IF NOT EXISTS `concept_reference_source` (
  `concept_source_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hl7_code` varchar(50) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `unique_id` varchar(250) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  PRIMARY KEY (`concept_source_id`),
  UNIQUE KEY `concept_source_uuid_index` (`uuid`),
  UNIQUE KEY `concept_source_unique_hl7_codes` (`hl7_code`),
  UNIQUE KEY `concept_reference_source_unique_id_unique` (`unique_id`),
  KEY `concept_source_creator` (`creator`),
  KEY `user_who_voided_concept_source` (`retired_by`),
  KEY `unique_hl7_code` (`hl7_code`,`retired`),
  KEY `concept_reference_source_changed_by` (`changed_by`),
  CONSTRAINT `concept_reference_source_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_reference_term
CREATE TABLE IF NOT EXISTS `concept_reference_term` (
  `concept_reference_term_id` int NOT NULL AUTO_INCREMENT,
  `concept_source_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uuid` char(38) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`concept_reference_term_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator` (`creator`),
  KEY `mapped_user_changed` (`changed_by`),
  KEY `mapped_user_retired` (`retired_by`),
  KEY `mapped_concept_source` (`concept_source_id`),
  KEY `idx_code_concept_reference_term` (`code`),
  CONSTRAINT `mapped_concept_source` FOREIGN KEY (`concept_source_id`) REFERENCES `concept_reference_source` (`concept_source_id`),
  CONSTRAINT `mapped_user_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=285336 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_reference_term_map
CREATE TABLE IF NOT EXISTS `concept_reference_term_map` (
  `concept_reference_term_map_id` int NOT NULL AUTO_INCREMENT,
  `term_a_id` int NOT NULL,
  `term_b_id` int NOT NULL,
  `a_is_to_b_id` int NOT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`concept_reference_term_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_term_a` (`term_a_id`),
  KEY `mapped_term_b` (`term_b_id`),
  KEY `mapped_concept_map_type_ref_term_map` (`a_is_to_b_id`),
  KEY `mapped_user_creator_ref_term_map` (`creator`),
  KEY `mapped_user_changed_ref_term_map` (`changed_by`),
  CONSTRAINT `mapped_concept_map_type_ref_term_map` FOREIGN KEY (`a_is_to_b_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_term_a` FOREIGN KEY (`term_a_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_term_b` FOREIGN KEY (`term_b_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_ref_term_map` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_set
CREATE TABLE IF NOT EXISTS `concept_set` (
  `concept_set_id` int NOT NULL AUTO_INCREMENT,
  `concept_id` int NOT NULL DEFAULT '0',
  `concept_set` int NOT NULL DEFAULT '0',
  `sort_weight` double DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_set_id`),
  UNIQUE KEY `concept_set_uuid_index` (`uuid`),
  KEY `has_a` (`concept_set`),
  KEY `user_who_created` (`creator`),
  KEY `idx_concept_set_concept` (`concept_id`),
  CONSTRAINT `has_a` FOREIGN KEY (`concept_set`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `is_a` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3219 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_state_conversion
CREATE TABLE IF NOT EXISTS `concept_state_conversion` (
  `concept_state_conversion_id` int NOT NULL AUTO_INCREMENT,
  `concept_id` int DEFAULT '0',
  `program_workflow_id` int DEFAULT '0',
  `program_workflow_state_id` int DEFAULT '0',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_state_conversion_id`),
  UNIQUE KEY `concept_state_conversion_uuid_index` (`uuid`),
  UNIQUE KEY `unique_workflow_concept_in_conversion` (`program_workflow_id`,`concept_id`),
  KEY `triggering_concept` (`concept_id`),
  KEY `affected_workflow` (`program_workflow_id`),
  KEY `resulting_state` (`program_workflow_state_id`),
  CONSTRAINT `concept_triggers_conversion` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conversion_involves_workflow` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`),
  CONSTRAINT `conversion_to_state` FOREIGN KEY (`program_workflow_state_id`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.concept_stop_word
CREATE TABLE IF NOT EXISTS `concept_stop_word` (
  `concept_stop_word_id` int NOT NULL AUTO_INCREMENT,
  `word` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `locale` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uuid` char(38) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`concept_stop_word_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `Unique_StopWord_Key` (`word`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.encounter
CREATE TABLE IF NOT EXISTS `encounter` (
  `encounter_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `encounter_type` int NOT NULL,
  `patient_id` int NOT NULL DEFAULT '0',
  `location_id` int DEFAULT NULL,
  `form_id` int DEFAULT NULL,
  `encounter_datetime` datetime NOT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `visit_id` int DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_id`,`datim_code`),
  UNIQUE KEY `encounter_uuid_index` (`uuid`),
  KEY `encounter_datetime_idx` (`encounter_datetime`),
  KEY `encounter_ibfk_1` (`creator`),
  KEY `encounter_type_id` (`encounter_type`),
  KEY `encounter_form` (`form_id`),
  KEY `encounter_location` (`location_id`),
  KEY `encounter_patient` (`patient_id`),
  KEY `user_who_voided_encounter` (`voided_by`),
  KEY `encounter_changed_by` (`changed_by`),
  KEY `encounter_visit_id_fk` (`visit_id`),
  CONSTRAINT `encounter_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_form` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `encounter_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `encounter_type_id` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `encounter_visit_id_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `user_who_voided_encounter` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.encounter_diagnosis
CREATE TABLE IF NOT EXISTS `encounter_diagnosis` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `diagnosis_coded` int DEFAULT NULL,
  `diagnosis_non_coded` varchar(255) DEFAULT NULL,
  `diagnosis_coded_name` int DEFAULT NULL,
  `encounter_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `condition_id` int DEFAULT NULL,
  `certainty` varchar(255) NOT NULL,
  `rank` int NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`,`datim_code`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `encounter_diagnosis_encounter_id_fk` (`encounter_id`),
  KEY `encounter_diagnosis_condition_id_fk` (`condition_id`),
  KEY `encounter_diagnosis_creator_fk` (`creator`),
  KEY `encounter_diagnosis_voided_by_fk` (`voided_by`),
  KEY `encounter_diagnosis_changed_by_fk` (`changed_by`),
  KEY `encounter_diagnosis_coded_fk` (`diagnosis_coded`),
  KEY `encounter_diagnosis_coded_name_fk` (`diagnosis_coded_name`),
  KEY `encounter_diagnosis_patient_fk` (`patient_id`),
  CONSTRAINT `encounter_diagnosis_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_diagnosis_coded_fk` FOREIGN KEY (`diagnosis_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `encounter_diagnosis_coded_name_fk` FOREIGN KEY (`diagnosis_coded_name`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `encounter_diagnosis_condition_id_fk` FOREIGN KEY (`condition_id`) REFERENCES `openmrs`.`conditions` (`condition_id`),
  CONSTRAINT `encounter_diagnosis_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_diagnosis_encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `encounter_diagnosis_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `encounter_diagnosis_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `encounter_diagnosis_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.encounter_provider
CREATE TABLE IF NOT EXISTS `encounter_provider` (
  `encounter_provider_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(45) NOT NULL,
  `encounter_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `encounter_role_id` int NOT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_provider_id`,`datim_code`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `encounter_id_fk` (`encounter_id`),
  KEY `provider_id_fk` (`provider_id`),
  KEY `encounter_role_id_fk` (`encounter_role_id`),
  KEY `encounter_provider_creator` (`creator`),
  KEY `encounter_provider_changed_by` (`changed_by`),
  KEY `encounter_provider_voided_by` (`voided_by`),
  CONSTRAINT `encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `encounter_provider_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_id_fk` FOREIGN KEY (`encounter_role_id`) REFERENCES `encounter_role` (`encounter_role_id`),
  CONSTRAINT `provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.encounter_role
CREATE TABLE IF NOT EXISTS `encounter_role` (
  `encounter_role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_role_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `encounter_role_unique_name` (`name`),
  KEY `encounter_role_creator_fk` (`creator`),
  KEY `encounter_role_changed_by_fk` (`changed_by`),
  KEY `encounter_role_retired_by_fk` (`retired_by`),
  CONSTRAINT `encounter_role_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table cdr.form
CREATE TABLE IF NOT EXISTS `form` (
  `form_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `build` int DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `xslt` text,
  `template` text,
  `description` text,
  `encounter_type` int DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_uuid_index` (`uuid`),
  KEY `form_published_index` (`published`),
  KEY `form_retired_index` (`retired`),
  KEY `form_published_and_retired_index` (`published`,`retired`),
  KEY `user_who_last_changed_form` (`changed_by`),
  KEY `user_who_created_form` (`creator`),
  KEY `form_encounter_type` (`encounter_type`),
  KEY `user_who_retired_form` (`retired_by`),
  CONSTRAINT `form_encounter_type` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `user_who_created_form` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.formfilter_filter_property
CREATE TABLE IF NOT EXISTS `formfilter_filter_property` (
  `filter_property_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(200) DEFAULT NULL,
  `properties` varchar(500) DEFAULT NULL,
  `filter_name` varchar(50) DEFAULT NULL,
  `filter_description` varchar(500) DEFAULT NULL,
  `form_filter_id` int DEFAULT NULL,
  `uuid` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`filter_property_id`),
  KEY `fk_form_filter_id` (`form_filter_id`),
  CONSTRAINT `fk_form_filter_id` FOREIGN KEY (`form_filter_id`) REFERENCES `formfilter_form_filter` (`form_filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.formfilter_form_filter
CREATE TABLE IF NOT EXISTS `formfilter_form_filter` (
  `form_filter_id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `uuid` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`form_filter_id`),
  UNIQUE KEY `form_id` (`form_id`),
  CONSTRAINT `fk_form_id` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.form_field
CREATE TABLE IF NOT EXISTS `form_field` (
  `form_field_id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL DEFAULT '0',
  `field_id` int NOT NULL DEFAULT '0',
  `field_number` int DEFAULT NULL,
  `field_part` varchar(5) DEFAULT NULL,
  `page_number` int DEFAULT NULL,
  `parent_form_field` int DEFAULT NULL,
  `min_occurs` int DEFAULT NULL,
  `max_occurs` int DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_field_id`),
  UNIQUE KEY `form_field_uuid_index` (`uuid`),
  KEY `user_who_last_changed_form_field` (`changed_by`),
  KEY `user_who_created_form_field` (`creator`),
  KEY `field_within_form` (`field_id`),
  KEY `form_containing_field` (`form_id`),
  KEY `form_field_hierarchy` (`parent_form_field`),
  CONSTRAINT `field_within_form` FOREIGN KEY (`field_id`) REFERENCES `openmrs`.`field` (`field_id`),
  CONSTRAINT `form_containing_field` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `form_field_hierarchy` FOREIGN KEY (`parent_form_field`) REFERENCES `form_field` (`form_field_id`),
  CONSTRAINT `user_who_created_form_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.form_resource
CREATE TABLE IF NOT EXISTS `form_resource` (
  `form_resource_id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `value_reference` longtext,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  PRIMARY KEY (`form_resource_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `unique_form_and_name` (`form_id`,`name`),
  KEY `form_resource_changed_by` (`changed_by`),
  CONSTRAINT `form_resource_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `form_resource_form_fk` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.lims_manifest
CREATE TABLE IF NOT EXISTS `lims_manifest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `manifest_id` varchar(255) NOT NULL,
  `sample_space` varchar(255) NOT NULL,
  `test_type` varchar(255) NOT NULL,
  `referring_lab_state` varchar(255) NOT NULL,
  `referring_lab_lga` varchar(255) NOT NULL,
  `date_schedule_for_pickup` datetime DEFAULT NULL,
  `sample_pick_up_on_time` varchar(32) DEFAULT NULL,
  `rider_total_samples_picked` int DEFAULT NULL,
  `rider_temp_at_pick_up` varchar(32) DEFAULT NULL,
  `rider_name` varchar(255) NOT NULL,
  `rider_phone_number` varchar(255) DEFAULT NULL,
  `pcr_lab_name` varchar(255) NOT NULL,
  `pcr_lab_code` varchar(255) NOT NULL,
  `result_status` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `feedback` longtext,
  PRIMARY KEY (`id`,`datim_code`),
  UNIQUE KEY `manifest_id` (`manifest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.lims_manifest_result
CREATE TABLE IF NOT EXISTS `lims_manifest_result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `manifest_id` varchar(255) NOT NULL,
  `patient_id` varchar(1024) NOT NULL,
  `sample_id` varchar(255) NOT NULL,
  `pcr_lab_samplenumber` varchar(255) NOT NULL,
  `date_sample_receieved_at_pcrlab` datetime NOT NULL,
  `test_result` varchar(255) NOT NULL,
  `result_date` varchar(255) NOT NULL,
  `assay_date` varchar(255) NOT NULL,
  `approval_date` varchar(255) DEFAULT NULL,
  `date_result_dispatched` datetime NOT NULL,
  `sample_status` int NOT NULL,
  `sample_testable` varchar(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `rejection_reason` int DEFAULT '0',
  `tested_by` varchar(200) DEFAULT NULL,
  `approved_by` varchar(200) DEFAULT NULL,
  `transfer_status` int DEFAULT NULL,
  `date_transferred_out` varchar(50) DEFAULT NULL,
  `other_rejection_reason` text,
  `sending_pcr_lab_name` varchar(255) DEFAULT NULL,
  `sending_pcr_lab_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`datim_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.lims_manifest_samples
CREATE TABLE IF NOT EXISTS `lims_manifest_samples` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `manifest_id` varchar(255) NOT NULL,
  `patient_id` varchar(1024) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `pregnantBreastFeedingStatus` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `sample_id` varchar(255) NOT NULL,
  `sample_type` varchar(255) NOT NULL,
  `indication_vl_test` int DEFAULT NULL,
  `art_commencement_date` datetime DEFAULT NULL,
  `drugregimen` varchar(255) DEFAULT NULL,
  `sample_ordered_by` varchar(255) DEFAULT NULL,
  `sample_ordered_date` datetime DEFAULT NULL,
  `sample_collected_by` varchar(255) NOT NULL,
  `sample_collected_date` datetime NOT NULL,
  `sample_collection_time` datetime NOT NULL,
  `date_sample_sent` datetime DEFAULT NULL,
  `ageInMonths` int DEFAULT NULL,
  `reasonForPCR` int DEFAULT NULL,
  `rapidTestDone` tinyint(1) DEFAULT NULL,
  `artAdministeredToMother` varchar(1024) DEFAULT NULL,
  `babyReceived` varchar(1024) DEFAULT NULL,
  `babyEverBreastFed` varchar(20) DEFAULT NULL,
  `babyBreastFeedingNow` varchar(20) DEFAULT NULL,
  `cotrimoxazoleGiven` varchar(20) DEFAULT NULL,
  `dateRapidTestDone` varchar(50) DEFAULT NULL,
  `ageBreastFeedingStoppedMonths` int DEFAULT NULL,
  `resultOfRapidTest` varchar(50) DEFAULT NULL,
  `motherANC` varchar(100) DEFAULT NULL,
  `guardianPhoneNo` varchar(50) DEFAULT NULL,
  `motherEntryPoint` varchar(100) DEFAULT NULL,
  `motherPepfarID` varchar(100) DEFAULT NULL,
  `encounter_id` int NOT NULL,
  `sample_status` varchar(255) DEFAULT NULL,
  `rejection_reason` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `priorityReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`datim_code`),
  KEY `sample_encounter_id_fkk` (`encounter_id`),
  KEY `result_sample_manifest_id_fkk` (`manifest_id`),
  CONSTRAINT `result_sample_manifest_id_fkk` FOREIGN KEY (`manifest_id`) REFERENCES `lims_manifest` (`manifest_id`),
  CONSTRAINT `sample_encounter_id_fkk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `sample_manifest_id_fkk` FOREIGN KEY (`manifest_id`) REFERENCES `lims_manifest` (`manifest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.obs
CREATE TABLE IF NOT EXISTS `obs` (
  `obs_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `person_id` int NOT NULL,
  `concept_id` int NOT NULL DEFAULT '0',
  `encounter_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `obs_datetime` datetime NOT NULL,
  `location_id` int DEFAULT NULL,
  `obs_group_id` int DEFAULT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `value_group_id` int DEFAULT NULL,
  `value_coded` int DEFAULT NULL,
  `value_coded_name_id` int DEFAULT NULL,
  `value_drug` int DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_numeric` double DEFAULT NULL,
  `value_modifier` varchar(2) DEFAULT NULL,
  `value_text` text,
  `value_complex` varchar(1000) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `previous_version` int DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'FINAL',
  `interpretation` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`obs_id`,`datim_code`),
  UNIQUE KEY `obs_uuid_index` (`uuid`),
  KEY `obs_datetime_idx` (`obs_datetime`),
  KEY `obs_concept` (`concept_id`),
  KEY `obs_enterer` (`creator`),
  KEY `encounter_observations` (`encounter_id`),
  KEY `obs_location` (`location_id`),
  KEY `obs_grouping_id` (`obs_group_id`),
  KEY `obs_order` (`order_id`),
  KEY `person_obs` (`person_id`),
  KEY `answer_concept` (`value_coded`),
  KEY `obs_name_of_coded_value` (`value_coded_name_id`),
  KEY `answer_concept_drug` (`value_drug`),
  KEY `user_who_voided_obs` (`voided_by`),
  KEY `previous_version` (`previous_version`),
  KEY `index_obs_date_created` (`date_created`),
  CONSTRAINT `answer_concept` FOREIGN KEY (`value_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_concept_drug` FOREIGN KEY (`value_drug`) REFERENCES `openmrs`.`drug` (`drug_id`),
  CONSTRAINT `encounter_observations` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `obs_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `obs_enterer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_grouping_id` FOREIGN KEY (`obs_group_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `obs_name_of_coded_value` FOREIGN KEY (`value_coded_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `obs_order` FOREIGN KEY (`order_id`) REFERENCES `openmrs`.`orders` (`order_id`),
  CONSTRAINT `person_obs` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `previous_version` FOREIGN KEY (`previous_version`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_voided_obs` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patient
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `allergy_status` varchar(50) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`patient_id`,`datim_code`),
  KEY `user_who_changed_pat` (`changed_by`),
  KEY `user_who_created_patient` (`creator`),
  KEY `user_who_voided_patient` (`voided_by`),
  CONSTRAINT `person_id_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_pat` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_patient` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patientflags_displaypoint
CREATE TABLE IF NOT EXISTS `patientflags_displaypoint` (
  `displaypoint_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`displaypoint_id`,`datim_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patientflags_flag
CREATE TABLE IF NOT EXISTS `patientflags_flag` (
  `flag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `criteria` varchar(5000) NOT NULL,
  `message` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `evaluator` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `priority_id` int DEFAULT NULL,
  PRIMARY KEY (`flag_id`),
  UNIQUE KEY `patientflags_flag_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patientflags_flag_tag
CREATE TABLE IF NOT EXISTS `patientflags_flag_tag` (
  `flag_id` int NOT NULL,
  `tag_id` int NOT NULL,
  KEY `flag_id` (`flag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `patientflags_flag_tag_ibfk_1` FOREIGN KEY (`flag_id`) REFERENCES `patientflags_flag` (`flag_id`),
  CONSTRAINT `patientflags_flag_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patientflags_priority
CREATE TABLE IF NOT EXISTS `patientflags_priority` (
  `priority_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL,
  `rank` int NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `patientflags_priority_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patientflags_tag
CREATE TABLE IF NOT EXISTS `patientflags_tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `patientflags_tag_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patientflags_tag_displaypoint
CREATE TABLE IF NOT EXISTS `patientflags_tag_displaypoint` (
  `tag_id` int NOT NULL,
  `displaypoint_id` int NOT NULL,
  KEY `tag_displaypoint_id` (`tag_id`),
  KEY `patientflags_tag_displaypoint_ibfk_2` (`displaypoint_id`),
  CONSTRAINT `patientflags_tag_displaypoint_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`),
  CONSTRAINT `patientflags_tag_displaypoint_ibfk_2` FOREIGN KEY (`displaypoint_id`) REFERENCES `patientflags_displaypoint` (`displaypoint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patientflags_tag_role
CREATE TABLE IF NOT EXISTS `patientflags_tag_role` (
  `tag_id` int NOT NULL,
  `role` varchar(50) NOT NULL,
  KEY `role` (`role`),
  KEY `tag_role_id` (`tag_id`),
  CONSTRAINT `patientflags_tag_role_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`),
  CONSTRAINT `patientflags_tag_role_ibfk_2` FOREIGN KEY (`role`) REFERENCES `openmrs`.`role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patient_identifier
CREATE TABLE IF NOT EXISTS `patient_identifier` (
  `patient_identifier_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_id` int NOT NULL DEFAULT '0',
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `identifier_type` int NOT NULL DEFAULT '0',
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `location_id` int DEFAULT '0',
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `patient_program_id` int DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_id`,`datim_code`),
  UNIQUE KEY `patient_identifier_uuid_index` (`uuid`),
  KEY `identifier_name` (`identifier`),
  KEY `idx_patient_identifier_patient` (`patient_id`),
  KEY `identifier_creator` (`creator`),
  KEY `defines_identifier_type` (`identifier_type`),
  KEY `patient_identifier_ibfk_2` (`location_id`),
  KEY `identifier_voider` (`voided_by`),
  KEY `patient_identifier_changed_by` (`changed_by`),
  CONSTRAINT `defines_identifier_type` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `fk_patient_id_patient_identifier` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `identifier_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patient_identifier_type
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patient_program
CREATE TABLE IF NOT EXISTS `patient_program` (
  `patient_program_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_id` int NOT NULL DEFAULT '0',
  `program_id` int NOT NULL DEFAULT '0',
  `date_enrolled` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `outcome_concept_id` int DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`patient_program_id`,`datim_code`),
  UNIQUE KEY `patient_program_uuid_index` (`uuid`),
  KEY `user_who_changed` (`changed_by`),
  KEY `patient_program_creator` (`creator`),
  KEY `patient_in_program` (`patient_id`),
  KEY `program_for_patient` (`program_id`),
  KEY `user_who_voided_patient_program` (`voided_by`),
  KEY `patient_program_location_id` (`location_id`),
  KEY `patient_program_outcome_concept_id_fk` (`outcome_concept_id`),
  CONSTRAINT `patient_in_program` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `patient_program_outcome_concept_id_fk` FOREIGN KEY (`outcome_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_for_patient` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `user_who_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient_program` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patient_program_attribute
CREATE TABLE IF NOT EXISTS `patient_program_attribute` (
  `patient_program_attribute_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_program_id` int NOT NULL,
  `attribute_type_id` int NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_program_attribute_id`,`datim_code`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `patient_program_attribute_programid_fk` (`patient_program_id`),
  KEY `patient_program_attribute_attributetype_fk` (`attribute_type_id`),
  KEY `patient_program_attribute_creator_fk` (`creator`),
  KEY `patient_program_attribute_changed_by_fk` (`changed_by`),
  KEY `patient_program_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `patient_program_attribute_attributetype_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `program_attribute_type` (`program_attribute_type_id`),
  CONSTRAINT `patient_program_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_attribute_programid_fk` FOREIGN KEY (`patient_program_id`) REFERENCES `patient_program` (`patient_program_id`),
  CONSTRAINT `patient_program_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patient_queue
CREATE TABLE IF NOT EXISTS `patient_queue` (
  `patient_queue_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_id` int DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `location_from` int DEFAULT NULL,
  `location_to` int DEFAULT NULL,
  `encounter_id` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `visit_number` varchar(255) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `priority_comment` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `uuid` varchar(38) DEFAULT NULL,
  `service_area_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`patient_queue_id`,`datim_code`),
  UNIQUE KEY `patient_queue_id` (`patient_queue_id`),
  KEY `patient_queue_encounter_id_index` (`encounter_id`),
  KEY `patient_queue_location_location_id_fk` (`location_from`),
  KEY `patient_queue_location_location_id_fk1` (`location_to`),
  KEY `patient_queue_patient_patient_id_fk` (`patient_id`),
  KEY `patient_queue_provider_provider_id_fk` (`provider_id`),
  KEY `patient_queue_users__fk1` (`changed_by`),
  KEY `patient_queue_users__fk2` (`voided_by`),
  KEY `patient_queue_users_user_id_fk` (`creator`),
  CONSTRAINT `patient_queue_encounter_encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `patient_queue_location_location_id_fk` FOREIGN KEY (`location_from`) REFERENCES `location` (`location_id`),
  CONSTRAINT `patient_queue_location_location_id_fk1` FOREIGN KEY (`location_to`) REFERENCES `location` (`location_id`),
  CONSTRAINT `patient_queue_patient_patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `patient_queue_provider_provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `patient_queue_users__fk1` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_queue_users__fk2` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_queue_users_user_id_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.patient_state
CREATE TABLE IF NOT EXISTS `patient_state` (
  `patient_state_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_program_id` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`patient_state_id`,`datim_code`),
  UNIQUE KEY `patient_state_uuid_index` (`uuid`),
  KEY `patient_state_changer` (`changed_by`),
  KEY `patient_state_creator` (`creator`),
  KEY `patient_program_for_state` (`patient_program_id`),
  KEY `state_for_patient` (`state`),
  KEY `patient_state_voider` (`voided_by`),
  CONSTRAINT `patient_program_for_state` FOREIGN KEY (`patient_program_id`) REFERENCES `patient_program` (`patient_program_id`),
  CONSTRAINT `patient_state_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_for_patient` FOREIGN KEY (`state`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.person
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `birthdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `death_date` datetime DEFAULT NULL,
  `cause_of_death` int DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `deathdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `birthtime` time DEFAULT NULL,
  `cause_of_death_non_coded` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`,`datim_code`),
  UNIQUE KEY `person_uuid_index` (`uuid`),
  KEY `person_birthdate` (`birthdate`),
  KEY `person_death_date` (`death_date`),
  KEY `person_died_because` (`cause_of_death`),
  KEY `user_who_changed_person` (`changed_by`),
  KEY `user_who_created_person` (`creator`),
  KEY `user_who_voided_person` (`voided_by`),
  CONSTRAINT `person_died_because` FOREIGN KEY (`cause_of_death`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_person` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_person` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_person` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9089 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.person_address
CREATE TABLE IF NOT EXISTS `person_address` (
  `person_address_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `person_id` int DEFAULT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `address7` varchar(255) DEFAULT NULL,
  `address8` varchar(255) DEFAULT NULL,
  `address9` varchar(255) DEFAULT NULL,
  `address10` varchar(255) DEFAULT NULL,
  `address11` varchar(255) DEFAULT NULL,
  `address12` varchar(255) DEFAULT NULL,
  `address13` varchar(255) DEFAULT NULL,
  `address14` varchar(255) DEFAULT NULL,
  `address15` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_address_id`,`datim_code`),
  UNIQUE KEY `person_address_uuid_index` (`uuid`),
  KEY `patient_address_creator` (`creator`),
  KEY `address_for_person` (`person_id`),
  KEY `patient_address_void` (`voided_by`),
  KEY `person_address_changed_by` (`changed_by`),
  CONSTRAINT `address_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_address_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_address_void` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_address_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.person_attribute
CREATE TABLE IF NOT EXISTS `person_attribute` (
  `person_attribute_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `person_id` int NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '',
  `person_attribute_type_id` int NOT NULL DEFAULT '0',
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_attribute_id`,`datim_code`),
  UNIQUE KEY `person_attribute_uuid_index` (`uuid`),
  KEY `attribute_changer` (`changed_by`),
  KEY `attribute_creator` (`creator`),
  KEY `defines_attribute_type` (`person_attribute_type_id`),
  KEY `identifies_person` (`person_id`),
  KEY `attribute_voider` (`voided_by`),
  CONSTRAINT `attribute_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `defines_attribute_type` FOREIGN KEY (`person_attribute_type_id`) REFERENCES `person_attribute_type` (`person_attribute_type_id`),
  CONSTRAINT `identifies_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.person_attribute_type
CREATE TABLE IF NOT EXISTS `person_attribute_type` (
  `person_attribute_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(50) DEFAULT NULL,
  `foreign_key` int DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `person_attribute_type_uuid_index` (`uuid`),
  KEY `attribute_is_searchable` (`searchable`),
  KEY `name_of_attribute` (`name`),
  KEY `person_attribute_type_retired_status` (`retired`),
  KEY `attribute_type_changer` (`changed_by`),
  KEY `attribute_type_creator` (`creator`),
  KEY `user_who_retired_person_attribute_type` (`retired_by`),
  KEY `privilege_which_can_edit` (`edit_privilege`),
  CONSTRAINT `attribute_type_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit` FOREIGN KEY (`edit_privilege`) REFERENCES `openmrs`.`privilege` (`privilege`),
  CONSTRAINT `user_who_retired_person_attribute_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.person_merge_log
CREATE TABLE IF NOT EXISTS `person_merge_log` (
  `person_merge_log_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `winner_person_id` int NOT NULL,
  `loser_person_id` int NOT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `merged_data` longtext NOT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_merge_log_id`,`datim_code`),
  UNIQUE KEY `person_merge_log_unique_uuid` (`uuid`),
  KEY `person_merge_log_winner` (`winner_person_id`),
  KEY `person_merge_log_loser` (`loser_person_id`),
  KEY `person_merge_log_creator` (`creator`),
  KEY `person_merge_log_changed_by_fk` (`changed_by`),
  KEY `person_merge_log_voided_by_fk` (`voided_by`),
  CONSTRAINT `person_merge_log_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_loser` FOREIGN KEY (`loser_person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_merge_log_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_winner` FOREIGN KEY (`winner_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.person_name
CREATE TABLE IF NOT EXISTS `person_name` (
  `person_name_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` int NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `family_name_prefix` varchar(50) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `family_name2` varchar(50) DEFAULT NULL,
  `family_name_suffix` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_name_id`,`datim_code`),
  UNIQUE KEY `person_name_uuid_index` (`uuid`),
  KEY `first_name` (`given_name`),
  KEY `last_name` (`family_name`),
  KEY `middle_name` (`middle_name`),
  KEY `family_name2` (`family_name2`),
  KEY `user_who_made_name` (`creator`),
  KEY `name_for_person` (`person_id`),
  KEY `user_who_voided_name` (`voided_by`),
  CONSTRAINT `name_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_made_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.temp_treatment_linelist
CREATE TABLE IF NOT EXISTS `temp_treatment_linelist` (
  `facility_datim_code` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `reporting_date` date NOT NULL,
  `run_id` bigint unsigned NOT NULL,
  `IP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SurgeCommand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LGA` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FacilityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pepid_datim` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  `Pepid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HospitalNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sex` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KP_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Enrolled` datetime DEFAULT NULL,
  `AgeAtStartofART` int DEFAULT NULL,
  `AgeAtStart_InMonth` int DEFAULT NULL,
  `CurrentAge` int DEFAULT NULL,
  `ARTStartDate` datetime DEFAULT NULL,
  `LastPickupDate` datetime DEFAULT NULL,
  `NextAppmt` datetime DEFAULT NULL,
  `DaysOfARVRefill` int DEFAULT NULL,
  `RegLineAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ARTRegAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentRegLine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentARTReg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PregStatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentVL` double DEFAULT NULL,
  `DateOfCurrentVL` datetime DEFAULT NULL,
  `ViralLoadIndication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Result_Received` datetime DEFAULT NULL,
  `Last_VL_Sample_Date` datetime DEFAULT NULL,
  `Initial_CD4_Date` datetime DEFAULT NULL,
  `initial_CD4` double DEFAULT NULL,
  `Last_CD4_Date` datetime DEFAULT NULL,
  `Last_CD4` double DEFAULT NULL,
  `CurrentARTStatus_28Days` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DaysInterval` int DEFAULT NULL,
  `TI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone_No` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci,
  `Pill_Balance` double DEFAULT NULL,
  `Next_Pickup_Date` datetime DEFAULT NULL,
  `DATIMCode` varchar(20) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `MonthOnART` int DEFAULT NULL,
  `Last_Weight` double DEFAULT NULL,
  `Last_Weight_Date` datetime DEFAULT NULL,
  `Biometrics_Captured` datetime DEFAULT NULL,
  `Recapture_Count` int DEFAULT NULL,
  `Date_Last_Recaptured` datetime DEFAULT NULL,
  `Eligible_For_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_IPT_start` datetime DEFAULT NULL,
  `Outcome_of_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Outcome` datetime DEFAULT NULL,
  `Last_Clinic_Visit_Date` datetime DEFAULT NULL,
  `Systolic_BP` double DEFAULT NULL,
  `Diastolic_BP` double DEFAULT NULL,
  `Next_Clinical_Appt_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TB_Investigations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Investig_Result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_TB_Investig` datetime DEFAULT NULL,
  `Reason_for_Tracking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tracking_Date` datetime DEFAULT NULL,
  `Reason_for_Defaulting1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason_for_Termination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Termination` datetime DEFAULT NULL,
  `Facility_Transferred_To` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Last_EAC_Session_Date` datetime DEFAULT NULL,
  `EAC_Session_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EAC_ARV_Plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_VL_Before_EAC` datetime DEFAULT NULL,
  `VL_Before_EAC` double DEFAULT NULL,
  `Date_VL_After_EAC` datetime DEFAULT NULL,
  `VL_After_EAC` double DEFAULT NULL,
  `List_Parameters` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_List_Gen` datetime DEFAULT NULL,
  `refreshed_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`facility_datim_code`,`reporting_date`,`patient_id`),
  UNIQUE KEY `ux_snapshot_pepid_datim` (`facility_datim_code`,`reporting_date`,`Pepid_datim`),
  KEY `ix_snapshot_run` (`run_id`),
  KEY `ix_snapshot_reporting_status` (`reporting_date`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_state_status` (`State`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_facility_status` (`facility_datim_code`,`reporting_date`,`CurrentARTStatus_28Days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.temp_treatment_linelist_stage
CREATE TABLE IF NOT EXISTS `temp_treatment_linelist_stage` (
  `facility_datim_code` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `reporting_date` date NOT NULL,
  `run_id` bigint unsigned NOT NULL,
  `IP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SurgeCommand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LGA` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FacilityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pepid_datim` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  `Pepid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HospitalNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sex` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KP_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Enrolled` datetime DEFAULT NULL,
  `AgeAtStartofART` int DEFAULT NULL,
  `AgeAtStart_InMonth` int DEFAULT NULL,
  `CurrentAge` int DEFAULT NULL,
  `ARTStartDate` datetime DEFAULT NULL,
  `LastPickupDate` datetime DEFAULT NULL,
  `NextAppmt` datetime DEFAULT NULL,
  `DaysOfARVRefill` int DEFAULT NULL,
  `RegLineAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ARTRegAtStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentRegLine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentARTReg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PregStatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentVL` double DEFAULT NULL,
  `DateOfCurrentVL` datetime DEFAULT NULL,
  `ViralLoadIndication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_Result_Received` datetime DEFAULT NULL,
  `Last_VL_Sample_Date` datetime DEFAULT NULL,
  `Initial_CD4_Date` datetime DEFAULT NULL,
  `initial_CD4` double DEFAULT NULL,
  `Last_CD4_Date` datetime DEFAULT NULL,
  `Last_CD4` double DEFAULT NULL,
  `CurrentARTStatus_28Days` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DaysInterval` int DEFAULT NULL,
  `TI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone_No` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci,
  `Pill_Balance` double DEFAULT NULL,
  `Next_Pickup_Date` datetime DEFAULT NULL,
  `DATIMCode` varchar(20) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `MonthOnART` int DEFAULT NULL,
  `Last_Weight` double DEFAULT NULL,
  `Last_Weight_Date` datetime DEFAULT NULL,
  `Biometrics_Captured` datetime DEFAULT NULL,
  `Recapture_Count` int DEFAULT NULL,
  `Date_Last_Recaptured` datetime DEFAULT NULL,
  `Eligible_For_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_IPT_start` datetime DEFAULT NULL,
  `Outcome_of_IPT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Outcome` datetime DEFAULT NULL,
  `Last_Clinic_Visit_Date` datetime DEFAULT NULL,
  `Systolic_BP` double DEFAULT NULL,
  `Diastolic_BP` double DEFAULT NULL,
  `Next_Clinical_Appt_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Date` datetime DEFAULT NULL,
  `Last_TB_Screening_Status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TB_Investigations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Investig_Result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_TB_Investig` datetime DEFAULT NULL,
  `Reason_for_Tracking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tracking_Date` datetime DEFAULT NULL,
  `Reason_for_Defaulting1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason_for_Termination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_of_Termination` datetime DEFAULT NULL,
  `Facility_Transferred_To` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Last_EAC_Session_Date` datetime DEFAULT NULL,
  `EAC_Session_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EAC_ARV_Plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_VL_Before_EAC` datetime DEFAULT NULL,
  `VL_Before_EAC` double DEFAULT NULL,
  `Date_VL_After_EAC` datetime DEFAULT NULL,
  `VL_After_EAC` double DEFAULT NULL,
  `List_Parameters` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_List_Gen` datetime DEFAULT NULL,
  `refreshed_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`facility_datim_code`,`reporting_date`,`patient_id`),
  UNIQUE KEY `ux_snapshot_pepid_datim` (`facility_datim_code`,`reporting_date`,`Pepid_datim`),
  KEY `ix_snapshot_run` (`run_id`),
  KEY `ix_snapshot_reporting_status` (`reporting_date`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_state_status` (`State`,`CurrentARTStatus_28Days`),
  KEY `ix_snapshot_facility_status` (`facility_datim_code`,`reporting_date`,`CurrentARTStatus_28Days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table cdr.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `system_id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `secret_question` varchar(255) DEFAULT NULL,
  `secret_answer` varchar(255) DEFAULT NULL,
  `creator` int NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `person_id` int NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`datim_code`),
  UNIQUE KEY `email` (`email`),
  KEY `user_who_changed_user` (`changed_by`),
  KEY `user_creator` (`creator`),
  KEY `user_who_retired_this_user` (`retired_by`),
  KEY `person_id_for_user` (`person_id`),
  CONSTRAINT `person_id_for_user` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_this_user` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.visit
CREATE TABLE IF NOT EXISTS `visit` (
  `visit_id` int NOT NULL AUTO_INCREMENT,
  `datim_code` varchar(255) NOT NULL,
  `patient_id` int NOT NULL,
  `visit_type_id` int NOT NULL,
  `date_started` datetime NOT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `indication_concept_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_id`,`datim_code`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_patient_index` (`patient_id`),
  KEY `visit_type_fk` (`visit_type_id`),
  KEY `visit_location_fk` (`location_id`),
  KEY `visit_creator_fk` (`creator`),
  KEY `visit_voided_by_fk` (`voided_by`),
  KEY `visit_changed_by_fk` (`changed_by`),
  KEY `visit_indication_concept_fk` (`indication_concept_id`),
  CONSTRAINT `visit_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_indication_concept_fk` FOREIGN KEY (`indication_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `visit_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `visit_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `visit_type_fk` FOREIGN KEY (`visit_type_id`) REFERENCES `visit_type` (`visit_type_id`),
  CONSTRAINT `visit_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.visit_attribute
CREATE TABLE IF NOT EXISTS `visit_attribute` (
  `visit_attribute_id` int NOT NULL AUTO_INCREMENT,
  `visit_id` int NOT NULL,
  `attribute_type_id` int NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_visit_fk` (`visit_id`),
  KEY `visit_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `visit_attribute_creator_fk` (`creator`),
  KEY `visit_attribute_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `visit_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `visit_attribute_type` (`visit_attribute_type_id`),
  CONSTRAINT `visit_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_visit_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `visit_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.visit_attribute_type
CREATE TABLE IF NOT EXISTS `visit_attribute_type` (
  `visit_attribute_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int NOT NULL,
  `max_occurs` int DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_type_creator_fk` (`creator`),
  KEY `visit_attribute_type_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `visit_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table cdr.visit_type
CREATE TABLE IF NOT EXISTS `visit_type` (
  `visit_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_creator` (`creator`),
  KEY `visit_type_changed_by` (`changed_by`),
  KEY `visit_type_retired_by` (`retired_by`),
  CONSTRAINT `visit_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for trigger cdr.update_location
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `update_location` BEFORE INSERT ON `patient_identifier` FOR EACH ROW BEGIN
	SET NEW.location_id = (SELECT location_id FROM patient_identifier WHERE identifier_type = 6 ORDER BY patient_identifier_id ASC LIMIT 1);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
