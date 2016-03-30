/*
SQLyog Ultimate v8.55 
MySQL - 5.0.41-community-nt : Database - sign
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sign` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sign`;

/*Table structure for table `email_signature` */

DROP TABLE IF EXISTS `email_signature`;

CREATE TABLE `email_signature` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `location` varchar(100) default NULL,
  `industry` varchar(100) default NULL,
  `organisation` varchar(100) default NULL,
  `education` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index 2` (`name`,`location`,`industry`,`organisation`,`education`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_signature` */

insert  into `email_signature`(`id`,`name`,`location`,`industry`,`organisation`,`education`) values (5,'Abhishek Goswami ','Kurukshetra, Haryana, India','Computer Software','GAWDS (Graphics And Web Development Squad), Mozilla India','National Institute of Technology Kurukshetra'),(9,'Kumud Pandey ','Bengaluru Area, India','Pharmaceuticals','Independent Consultant','Personal Website Blog'),(4,'Kunal Khanna ','Kolkata, West Bengal, India','Computer Software','CodeNation, Jadavpur University','National Institute of Technology Kurukshetra'),(10,'Neha Mittal ','India','Computer Software','Essex Lake Group','National Institute of Technology Kurukshetra'),(8,'Pranit Jaiswal ','Mumbai, Maharashtra, India','Information Technology and Services','XDA Developers','Fr. Conceicao Rodrigues Institute Of Technology'),(1,'Pransh Tiwari ','Mumbai, Maharashtra, India','Computer Software','Bhabha Atomic Research Centre','National Institute of Technology Kurukshetra'),(2,'Rishabh Kumar ','Kurukshetra, Haryana, India','Graphic Design','Posterwaale, GAWDS (Graphics And Web Development Squad), Techspardha, NIT Kurukshetra','National Institute of Technology Kurukshetra'),(3,'sunny aggarwal ','South West Delhi, Delhi, India','Computer Software','Google','National Institute of Technology Kurukshetra'),(7,'Suraj Thite ','Mumbai, Maharashtra, India','Electrical/Electronic Manufacturing','VESIT','University of Mumbai'),(6,'Umashankar Tiwari ','Mumbai, Maharashtra, India','Research','BARC','');

/*Table structure for table `twitter_signature` */

DROP TABLE IF EXISTS `twitter_signature`;

CREATE TABLE `twitter_signature` (
  `id` int(30) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `handle` varchar(30) default NULL,
  `link` varchar(100) default NULL,
  `work` varchar(200) default NULL,
  `location` varchar(50) default NULL,
  `dateOfBirth` varchar(50) default NULL,
  `joiningDate` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index 2` (`name`,`handle`,`link`,`work`,`location`,`dateOfBirth`,`joiningDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `twitter_signature` */

insert  into `twitter_signature`(`id`,`name`,`handle`,`link`,`work`,`location`,`dateOfBirth`,`joiningDate`) values (7,'ABHISHEK GOSWAMI','abhishekg785','','Student at NATIONAL INSTITUTE OF TECHNOLOGY,Kurukshetra,Firefox S.A,Web and App Developer,Programmer and yessss CrAzY for developing and learning.','Haryana, India','',''),(6,'Barack Obama','BarackObama','barackobama.com','This account is run by Organizing for Action staff. Tweets from the President are signed -bo.','Washington, DC','August 4, 1961','March 2007'),(3,'Jesse Eisenberg','JesseEisenberg','adventurelandthefilm.com','Come see Adventureland, opening in theaters on 04/03/09','California, USA','','March 2009'),(1,'Narendra Modi','narendramodi','narendramodi.in','Prime Minister of India','India','September 17','January 2009'),(5,'Pransh Tiwari','Pransht','','just a simple Btech guy in NIT Kkr','Mumbai','',''),(2,'sachin tendulkar','sachin_rt','twitter.com','Proud Indian','ÜT: 18.986431,72.823769','','April 2010'),(4,'Sundar Pichai','sundar_pichai','','CEO, @google','United States','','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
