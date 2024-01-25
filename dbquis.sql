/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.19 : Database - dbprojectweb2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbprojectweb2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbprojectweb2`;

/*Table structure for table `kelas` */

DROP TABLE IF EXISTS `kelas`;

CREATE TABLE `kelas` (
  `idkelas` char(7) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `namakelas` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`idkelas`),
  KEY `kelas_ibfk_2` (`username`),
  CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kelas` */

LOCK TABLES `kelas` WRITE;

insert  into `kelas`(`idkelas`,`username`,`namakelas`,`tanggal`) values ('FFJEUND','adit','matematika','2024-01-18'),('RRLFSWI','luthfi','Bahasa Indonesia','2024-01-21');

UNLOCK TABLES;

/*Table structure for table `nilai` */

DROP TABLE IF EXISTS `nilai`;

CREATE TABLE `nilai` (
  `idnilai` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `idquiz` char(7) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `judulquis` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`idnilai`),
  KEY `idquiz` (`idquiz`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

/*Data for the table `nilai` */

LOCK TABLES `nilai` WRITE;

insert  into `nilai`(`idnilai`,`username`,`idquiz`,`nilai`,`judulquis`,`tanggal`) values (96,'habibi','ORTRETJ',100,'pertambahan','2024-01-24'),(97,'habibi','ORTRETJ',200,'pertambahan','2024-01-24'),(98,'luthfi','ORTRETJ',100,'pertambahan','2024-01-24');

UNLOCK TABLES;

/*Table structure for table `pengerjaan` */

DROP TABLE IF EXISTS `pengerjaan`;

CREATE TABLE `pengerjaan` (
  `nopengerjaan` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `idquiz` char(7) DEFAULT NULL,
  `nomorsoal` int(11) DEFAULT NULL,
  `jawaban` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`nopengerjaan`),
  KEY `idquiz` (`idquiz`),
  CONSTRAINT `pengerjaan_ibfk_1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=latin1;

/*Data for the table `pengerjaan` */

LOCK TABLES `pengerjaan` WRITE;

insert  into `pengerjaan`(`nopengerjaan`,`username`,`idquiz`,`nomorsoal`,`jawaban`) values (232,'habibi','ORTRETJ',49,'10'),(233,'habibi','ORTRETJ',50,'7'),(234,'habibi','ORTRETJ',49,'10'),(235,'habibi','ORTRETJ',50,'7'),(236,'luthfi','ORTRETJ',49,'10'),(237,'luthfi','ORTRETJ',50,'7');

UNLOCK TABLES;

/*Table structure for table `peserta` */

DROP TABLE IF EXISTS `peserta`;

CREATE TABLE `peserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas` char(7) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peserta_ibfk_1` (`idkelas`),
  CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `peserta` */

LOCK TABLES `peserta` WRITE;

insert  into `peserta`(`id`,`idkelas`,`username`) values (42,'FFJEUND','luthfi'),(43,'FFJEUND','habibi'),(44,'RRLFSWI','adit'),(45,'RRLFSWI','afdal'),(46,'RRLFSWI','habibi');

UNLOCK TABLES;

/*Table structure for table `quiz` */

DROP TABLE IF EXISTS `quiz`;

CREATE TABLE `quiz` (
  `idquiz` char(7) NOT NULL,
  `idkelas` char(7) DEFAULT NULL,
  `judulquis` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`idquiz`),
  KEY `idkelas` (`idkelas`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quiz` */

LOCK TABLES `quiz` WRITE;

insert  into `quiz`(`idquiz`,`idkelas`,`judulquis`,`tanggal`,`status`) values ('HDQYVHX','RRLFSWI','Antonim','2024-01-21',0),('JYQHLMC','FFJEUND','pola kalimat desu','2024-01-24',0),('ORTRETJ','FFJEUND','pertambahan','2024-01-18',0);

UNLOCK TABLES;

/*Table structure for table `soal` */

DROP TABLE IF EXISTS `soal`;

CREATE TABLE `soal` (
  `nomor` int(11) NOT NULL AUTO_INCREMENT,
  `idquiz` char(7) DEFAULT NULL,
  `judulsoal` varchar(500) DEFAULT NULL,
  `opsi1` varchar(500) DEFAULT NULL,
  `opsi2` varchar(500) DEFAULT NULL,
  `opsi3` varchar(500) DEFAULT NULL,
  `jawaban` varchar(500) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`nomor`),
  KEY `idquiz` (`idquiz`),
  CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Data for the table `soal` */

LOCK TABLES `soal` WRITE;

insert  into `soal`(`nomor`,`idquiz`,`judulsoal`,`opsi1`,`opsi2`,`opsi3`,`jawaban`,`point`) values (49,'ORTRETJ','5 + 5 = ','6','7','8','10',50),(50,'ORTRETJ','2 + 5 = ','4','5','6','7',50),(51,'HDQYVHX','Hitam','Terang','Gelap','Panas','Putih',50),(52,'HDQYVHX','Panas','marah','merah','beku','Dingin',50),(53,'JYQHLMC','5 + 5 = ','1','5','6','10',100);

UNLOCK TABLES;

/*Table structure for table `temp` */

DROP TABLE IF EXISTS `temp`;

CREATE TABLE `temp` (
  `idtem` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas` char(7) DEFAULT NULL,
  `soal` varchar(500) DEFAULT NULL,
  `opsi1` varchar(500) DEFAULT NULL,
  `opsi2` varchar(500) DEFAULT NULL,
  `opsi3` varchar(500) DEFAULT NULL,
  `jawaban` varchar(500) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtem`),
  KEY `idkelas` (`idkelas`),
  CONSTRAINT `temp_ibfk_1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

/*Data for the table `temp` */

LOCK TABLES `temp` WRITE;

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`username`,`nama`,`password`,`email`) values ('adit','adittt','$2y$10$sCJAdQuRXKbKOIFvuQ8Bj.1XGdJPq5DAG6YkCAQQDreE/W/zXzbBi','adit2@gmail.com'),('afdal','afdal','$2y$10$S.vO4MySdQEovKFOItDAgOLRSTsM.KqJr2ZrOTBJiUK9zRbX4C.Ga','afdal2@gmail.com'),('habibi','habib','$2y$10$IesJ5FQqmJ2db8IKu5kGc.Q/QPafRwkXCr1Bgl9pnhKwi73aUak5m','habibi2@gmail.com'),('luthfi','lufii','$2y$10$uepWeetz8HC8cuGjBhuMGOHVa/ELHUnATusUDR2LdQ31n7lRYbrnO','luthfi2@gmail.com');

UNLOCK TABLES;

/*Table structure for table `vpengerjaan` */

DROP TABLE IF EXISTS `vpengerjaan`;

/*!50001 DROP VIEW IF EXISTS `vpengerjaan` */;
/*!50001 DROP TABLE IF EXISTS `vpengerjaan` */;

/*!50001 CREATE TABLE  `vpengerjaan`(
 `username` varchar(100) ,
 `idquiz` char(7) ,
 `judulquis` varchar(100) ,
 `point` int(11) 
)*/;

/*Table structure for table `vpeserta` */

DROP TABLE IF EXISTS `vpeserta`;

/*!50001 DROP VIEW IF EXISTS `vpeserta` */;
/*!50001 DROP TABLE IF EXISTS `vpeserta` */;

/*!50001 CREATE TABLE  `vpeserta`(
 `idkelas` char(7) ,
 `username` varchar(100) ,
 `peserta` varchar(100) ,
 `namakelas` varchar(50) ,
 `tanggal` date 
)*/;

/*Table structure for table `vquiz` */

DROP TABLE IF EXISTS `vquiz`;

/*!50001 DROP VIEW IF EXISTS `vquiz` */;
/*!50001 DROP TABLE IF EXISTS `vquiz` */;

/*!50001 CREATE TABLE  `vquiz`(
 `idkelas` char(7) ,
 `namakelas` varchar(50) ,
 `idquiz` char(7) ,
 `judulquis` varchar(100) ,
 `username` varchar(100) 
)*/;

/*Table structure for table `vrandom` */

DROP TABLE IF EXISTS `vrandom`;

/*!50001 DROP VIEW IF EXISTS `vrandom` */;
/*!50001 DROP TABLE IF EXISTS `vrandom` */;

/*!50001 CREATE TABLE  `vrandom`(
 `koderandom` varbinary(28) 
)*/;

/*Table structure for table `vsoal` */

DROP TABLE IF EXISTS `vsoal`;

/*!50001 DROP VIEW IF EXISTS `vsoal` */;
/*!50001 DROP TABLE IF EXISTS `vsoal` */;

/*!50001 CREATE TABLE  `vsoal`(
 `idquiz` char(7) ,
 `nomor` int(11) ,
 `judulsoal` varchar(500) ,
 `opsi1` varchar(500) ,
 `opsi2` varchar(500) ,
 `opsi3` varchar(500) ,
 `jawaban` varchar(500) ,
 `point` int(11) 
)*/;

/*View structure for view vpengerjaan */

/*!50001 DROP TABLE IF EXISTS `vpengerjaan` */;
/*!50001 DROP VIEW IF EXISTS `vpengerjaan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpengerjaan` AS select `pengerjaan`.`username` AS `username`,`soal`.`idquiz` AS `idquiz`,`quiz`.`judulquis` AS `judulquis`,`soal`.`point` AS `point` from ((`soal` join `quiz` on((`quiz`.`idquiz` = `soal`.`idquiz`))) join `pengerjaan` on((`pengerjaan`.`nomorsoal` = `soal`.`nomor`))) where (`soal`.`jawaban` = `pengerjaan`.`jawaban`) */;

/*View structure for view vpeserta */

/*!50001 DROP TABLE IF EXISTS `vpeserta` */;
/*!50001 DROP VIEW IF EXISTS `vpeserta` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpeserta` AS select `kelas`.`idkelas` AS `idkelas`,`kelas`.`username` AS `username`,`peserta`.`username` AS `peserta`,`kelas`.`namakelas` AS `namakelas`,`kelas`.`tanggal` AS `tanggal` from (`kelas` join `peserta` on((`kelas`.`idkelas` = `peserta`.`idkelas`))) */;

/*View structure for view vquiz */

/*!50001 DROP TABLE IF EXISTS `vquiz` */;
/*!50001 DROP VIEW IF EXISTS `vquiz` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vquiz` AS select `quiz`.`idkelas` AS `idkelas`,`kelas`.`namakelas` AS `namakelas`,`quiz`.`idquiz` AS `idquiz`,`quiz`.`judulquis` AS `judulquis`,`peserta`.`username` AS `username` from ((`quiz` join `peserta` on((`quiz`.`idkelas` = `peserta`.`idkelas`))) join `kelas` on((`quiz`.`idkelas` = `kelas`.`idkelas`))) where (`quiz`.`status` = '1') */;

/*View structure for view vrandom */

/*!50001 DROP TABLE IF EXISTS `vrandom` */;
/*!50001 DROP VIEW IF EXISTS `vrandom` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vrandom` AS select concat(char((round((rand() * 25),0) + 65)),char((round((rand() * 25),0) + 65)),char((round((rand() * 25),0) + 65)),char((round((rand() * 25),0) + 65)),char((round((rand() * 25),0) + 65)),char((round((rand() * 25),0) + 65)),char((round((rand() * 25),0) + 65))) AS `koderandom` */;

/*View structure for view vsoal */

/*!50001 DROP TABLE IF EXISTS `vsoal` */;
/*!50001 DROP VIEW IF EXISTS `vsoal` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsoal` AS select `soal`.`idquiz` AS `idquiz`,`soal`.`nomor` AS `nomor`,`soal`.`judulsoal` AS `judulsoal`,`soal`.`opsi1` AS `opsi1`,`soal`.`opsi2` AS `opsi2`,`soal`.`opsi3` AS `opsi3`,`soal`.`jawaban` AS `jawaban`,`soal`.`point` AS `point` from (`quiz` join `soal` on((`quiz`.`idquiz` = `soal`.`idquiz`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
