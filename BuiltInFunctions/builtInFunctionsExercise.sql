/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


CREATE DATABASE IF NOT EXISTS `soft_uni1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `soft_uni1`;


CREATE TABLE IF NOT EXISTS `addresses` (
                                           `address_id` int(10) NOT NULL AUTO_INCREMENT,
                                           `address_text` varchar(100) NOT NULL,
                                           `town_id` int(10) DEFAULT NULL,
                                           PRIMARY KEY (`address_id`),
                                           UNIQUE KEY `PK_Addresses` (`address_id`),
                                           KEY `fk_addresses_towns` (`town_id`),
                                           CONSTRAINT `fk_addresses_towns` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8;

