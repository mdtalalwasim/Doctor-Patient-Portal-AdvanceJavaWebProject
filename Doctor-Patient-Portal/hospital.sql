/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.32 : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hospital`;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `appointmentDate` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `diseases` varchar(45) NOT NULL,
  `doctorId` int NOT NULL,
  `address` varchar(500) NOT NULL,
  `status` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uId_idx` (`userId`),
  KEY `docId_idx` (`doctorId`),
  CONSTRAINT `docId` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uId` FOREIGN KEY (`userId`) REFERENCES `user_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `appointment` */

insert  into `appointment`(`id`,`userId`,`fullName`,`gender`,`age`,`appointmentDate`,`email`,`phone`,`diseases`,`doctorId`,`address`,`status`) values 
(7,1,'Wasim','male','22','2022-11-25','t@gmail.com','111','Cold',8,'Dhaka','1. Tab. Ace 1+ 0 + 1 ------ 5days \r\n\r\n2. Syp. Adril 2 (spoon) + 0 + 2 (spoon) ---7days\r\n\r\n3. Tofen 5mg \r\n    0 + 0 + 1\r\n \r\nMeet me again after 4weeks.'),
(13,1,'Md. Talal Wasim','male','27','2022-12-03','wasim@gmail.com','01770000000','Fever',8,'Dhaka','Pending');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(80) NOT NULL,
  `dateOfBirth` varchar(80) NOT NULL,
  `qualification` varchar(80) NOT NULL,
  `specialist` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctor` */

insert  into `doctor`(`id`,`fullName`,`dateOfBirth`,`qualification`,`specialist`,`email`,`phone`,`password`) values 
(1,'Dr. Binod Khanna','1988-05-05','MBBS','Cardiology','drbinod@gmail.com','01777000001','1234'),
(3,'Dr. Taimur','2022-11-11','MBBS','Orthopedics','drtaimur@gmail.com','01221212111','1234'),
(4,'Dr. SRK','1986-12-12','FCPS','Cardiology','srk@gmail.com','01770000000','1234'),
(5,'Umme Swami Muttu Swami Venu Gopala Aiyara ','1958-12-12','MBBS','Dentist','ummeswamimuttuswamivenugopalaaiyara@gmail.com','01221111000','1234'),
(6,'Dr. Screw wala','1955-10-11','FCPS','Orthopedics','drscrewwala@gmail.com','01221010101','1234'),
(7,'Dr. W. John','2011-11-11','MBBS','Dentist','drw@gmail.com','01770000000','1234'),
(8,'Dr. M','1985-10-10','MBBS','Medicine','drm@gmail.com','01770000000','1234'),
(9,'Devi Shetti','1978-01-02','MBBS, FCPS','Cardiology','drdevishetti@gmail.com','01000041041','1234'),
(10,'Dr. Rana Duggabati','1975-02-05','MBBS','Pediatrician','drranaduggabati@gmail.com','01221212121','1234'),
(11,'Dr. Sahid Kapoor','1980-02-22','MBBS, FCPS','Neurologist','drsahidkapoor@gmail.com','01000121001','1234');

/*Table structure for table `specialist` */

DROP TABLE IF EXISTS `specialist`;

CREATE TABLE `specialist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specialist_name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `specialist` */

insert  into `specialist`(`id`,`specialist_name`) values 
(1,'Dentist'),
(2,'Dermatologist'),
(3,'Anesthesiology'),
(4,'Orthopedics'),
(5,'Cardiology'),
(6,'Onkologist'),
(7,'Medicine'),
(8,'Medicine'),
(9,'Neurologist'),
(10,'Pediatrician'),
(11,'ENT Specialist');

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_details` */

insert  into `user_details`(`id`,`full_name`,`email`,`password`) values 
(1,'Md. Talal Wasim','wasim@gmail.com','1234');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
