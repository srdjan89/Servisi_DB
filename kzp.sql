CREATE DATABASE  IF NOT EXISTS `kzp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `kzp`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kzp
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `firma`
--

DROP TABLE IF EXISTS `firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firma` (
  `IDFir` int(11) NOT NULL,
  `Naziv` char(20) NOT NULL,
  `Adresa` varchar(60) DEFAULT NULL,
  `Tel1` char(15) DEFAULT NULL,
  `Tel2` char(15) DEFAULT NULL,
  PRIMARY KEY (`IDFir`),
  UNIQUE KEY `Naziv` (`Naziv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firma`
--

LOCK TABLES `firma` WRITE;
/*!40000 ALTER TABLE `firma` DISABLE KEYS */;
INSERT INTO `firma` VALUES (0,'Petrolept','Beograd, Milana Rakica 5','011/258-221','063/223-223'),(1,'Radoje Dakic','Podgorica, Njegoseva 10/1','069/123-123',NULL),(2,'Tropik','Beograd, Dusana Vukasovica 50/1','011/123-1234','064/111-1111'),(3,'Meldovo','Beograd, Dusana Kovacevica 15/bb','064/222-3334',NULL),(4,'Cuker Company','Sopot, Ljubisava Jeremica 11a','011/123-456','063/123-456'),(5,'Srki Trade','Aleksandrovac, Vinogradarska 23','011/1123-456','063/1223-456');
/*!40000 ALTER TABLE `firma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kamion`
--

DROP TABLE IF EXISTS `kamion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kamion` (
  `IDKam` int(11) NOT NULL,
  `Marka` char(15) NOT NULL,
  `Nosivost` int(11) NOT NULL,
  `Godiste` int(11) DEFAULT NULL,
  `BrPopravljanja` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDKam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kamion`
--

LOCK TABLES `kamion` WRITE;
/*!40000 ALTER TABLE `kamion` DISABLE KEYS */;
INSERT INTO `kamion` VALUES (0,'Mercedes',4,1990,8),(1,'Mercedes',6,1994,8),(2,'Mercedes',5,2000,8),(3,'Mercedes',8,2001,8),(4,'Mercedes',15,2005,0),(5,'FAP',5,2002,3),(6,'FAP',3,2000,4),(7,'MAN',12,2004,0),(8,'MAN',10,1999,3),(9,'MAN',8,1997,3);
/*!40000 ALTER TABLE `kamion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mehanicar`
--

DROP TABLE IF EXISTS `mehanicar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mehanicar` (
  `Specijalnost` char(15) DEFAULT NULL,
  `IDZap` int(11) NOT NULL,
  PRIMARY KEY (`IDZap`),
  CONSTRAINT `mehanicar_ibfk_1` FOREIGN KEY (`IDZap`) REFERENCES `zaposlen` (`IDZap`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mehanicar`
--

LOCK TABLES `mehanicar` WRITE;
/*!40000 ALTER TABLE `mehanicar` DISABLE KEYS */;
INSERT INTO `mehanicar` VALUES ('Mercedes',4),('FAP',5),('MAN',6),('MAN',7);
/*!40000 ALTER TABLE `mehanicar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popravlja`
--

DROP TABLE IF EXISTS `popravlja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popravlja` (
  `Dana` int(11) DEFAULT NULL,
  `IDZap` int(11) NOT NULL,
  `IDKam` int(11) NOT NULL,
  PRIMARY KEY (`IDZap`,`IDKam`),
  KEY `IDKam` (`IDKam`),
  CONSTRAINT `popravlja_ibfk_1` FOREIGN KEY (`IDZap`) REFERENCES `mehanicar` (`IDZap`) ON DELETE NO ACTION,
  CONSTRAINT `popravlja_ibfk_2` FOREIGN KEY (`IDKam`) REFERENCES `kamion` (`IDKam`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popravlja`
--

LOCK TABLES `popravlja` WRITE;
/*!40000 ALTER TABLE `popravlja` DISABLE KEYS */;
INSERT INTO `popravlja` VALUES (2,4,0),(3,6,9),(3,7,9);
/*!40000 ALTER TABLE `popravlja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posiljka`
--

DROP TABLE IF EXISTS `posiljka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posiljka` (
  `IDPos` int(11) NOT NULL,
  `Tezina` int(11) NOT NULL,
  `Vrednost` int(11) DEFAULT NULL,
  `MestoOd` char(25) DEFAULT NULL,
  `MestoDo` char(25) DEFAULT NULL,
  `IDFir` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPos`),
  KEY `IDFir` (`IDFir`),
  CONSTRAINT `posiljka_ibfk_1` FOREIGN KEY (`IDFir`) REFERENCES `firma` (`IDFir`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posiljka`
--

LOCK TABLES `posiljka` WRITE;
/*!40000 ALTER TABLE `posiljka` DISABLE KEYS */;
INSERT INTO `posiljka` VALUES (0,1900,2000,'Kragujevac','Kraljevo',2),(1,5000,10000,'Kragujevac','Kraljevo',1),(2,2500,25000,'Beograd','Berlin',0),(3,4150,8000,'Beograd','Sombor',0),(4,1900,4000,'Beograd','Sombor',2),(5,12000,12000,'Beograd','Subotica',3),(6,7500,8000,'Beograd','Arandjelovac',3),(7,2900,4500,'Beograd','Leskovac',2),(8,9000,11400,'Beograd','Niksic',0);
/*!40000 ALTER TABLE `posiljka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `putovanje`
--

DROP TABLE IF EXISTS `putovanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `putovanje` (
  `IDPut` int(11) NOT NULL,
  `Status` char(1) DEFAULT NULL,
  `MestoOd` char(25) DEFAULT NULL,
  `MestoDo` char(25) DEFAULT NULL,
  `IDKam` int(11) DEFAULT NULL,
  `Duzina` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPut`),
  KEY `IDKam` (`IDKam`),
  CONSTRAINT `putovanje_ibfk_1` FOREIGN KEY (`IDKam`) REFERENCES `kamion` (`IDKam`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `putovanje`
--

LOCK TABLES `putovanje` WRITE;
/*!40000 ALTER TABLE `putovanje` DISABLE KEYS */;
INSERT INTO `putovanje` VALUES (0,'T','Beograd','Berlin',6,1500),(1,'O','Beograd','Sombor',1,190),(2,'P','Beograd','Subotica',7,240),(3,'O','Beograd','Arandjelovac',9,80),(4,'O','Beograd','Leskovac',5,300),(5,'O','Beograd','Niksic',4,460);
/*!40000 ALTER TABLE `putovanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seprevozi`
--

DROP TABLE IF EXISTS `seprevozi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seprevozi` (
  `IDPos` int(11) NOT NULL,
  `IDPut` int(11) NOT NULL,
  PRIMARY KEY (`IDPos`,`IDPut`),
  KEY `IDPut` (`IDPut`),
  CONSTRAINT `seprevozi_ibfk_1` FOREIGN KEY (`IDPos`) REFERENCES `posiljka` (`IDPos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seprevozi_ibfk_2` FOREIGN KEY (`IDPut`) REFERENCES `putovanje` (`IDPut`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seprevozi`
--

LOCK TABLES `seprevozi` WRITE;
/*!40000 ALTER TABLE `seprevozi` DISABLE KEYS */;
INSERT INTO `seprevozi` VALUES (2,0),(3,1),(4,1),(5,2),(6,3),(7,4),(8,5);
/*!40000 ALTER TABLE `seprevozi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vozac`
--

DROP TABLE IF EXISTS `vozac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vozac` (
  `Kategorija` char(5) DEFAULT NULL,
  `IDZap` int(11) NOT NULL,
  PRIMARY KEY (`IDZap`),
  CONSTRAINT `vozac_ibfk_1` FOREIGN KEY (`IDZap`) REFERENCES `zaposlen` (`IDZap`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vozac`
--

LOCK TABLES `vozac` WRITE;
/*!40000 ALTER TABLE `vozac` DISABLE KEYS */;
INSERT INTO `vozac` VALUES ('BCDE',0),('BC',1),('BC',2),('BCD',3);
/*!40000 ALTER TABLE `vozac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vozi`
--

DROP TABLE IF EXISTS `vozi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vozi` (
  `IDZap` int(11) NOT NULL,
  `IDPut` int(11) NOT NULL,
  PRIMARY KEY (`IDZap`,`IDPut`),
  KEY `IDPut` (`IDPut`),
  CONSTRAINT `vozi_ibfk_1` FOREIGN KEY (`IDZap`) REFERENCES `vozac` (`IDZap`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vozi_ibfk_2` FOREIGN KEY (`IDPut`) REFERENCES `putovanje` (`IDPut`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vozi`
--

LOCK TABLES `vozi` WRITE;
/*!40000 ALTER TABLE `vozi` DISABLE KEYS */;
INSERT INTO `vozi` VALUES (2,0),(3,0),(3,1),(2,3),(0,4),(1,5),(3,5);
/*!40000 ALTER TABLE `vozi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposlen`
--

DROP TABLE IF EXISTS `zaposlen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaposlen` (
  `IDZap` int(11) NOT NULL,
  `ImePrezime` char(40) NOT NULL,
  `Staz` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDZap`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposlen`
--

LOCK TABLES `zaposlen` WRITE;
/*!40000 ALTER TABLE `zaposlen` DISABLE KEYS */;
INSERT INTO `zaposlen` VALUES (0,'Marko Jagodic',12),(1,'Dusan Petrovic',4),(2,'Dragan Milutinovic',6),(3,'Milos Miljkovic',7),(4,'Dusan Rajic',4),(5,'Marko Pesic',8),(6,'Obrad Zimonjic',7),(7,'Drasko Petkovic',8);
/*!40000 ALTER TABLE `zaposlen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-18 15:58:55
CREATE DATABASE  IF NOT EXISTS `turisticki_portal` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `turisticki_portal`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: turisticki_portal
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `Korisnik_id` int(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`Korisnik_id`),
  CONSTRAINT `fk_Administrator_Korisnik1` FOREIGN KEY (`Korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'Marko','Markovic','marko89@gmail.com');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anketa`
--

DROP TABLE IF EXISTS `anketa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anketa` (
  `anketa_id` int(11) NOT NULL AUTO_INCREMENT,
  `vreme_postavljanja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vreme_isticanja` datetime NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `korisnik_id` int(11) NOT NULL,
  PRIMARY KEY (`anketa_id`),
  KEY `fk_Anketa_Status1_idx` (`status_id`),
  KEY `fk_Anketa_Korisnik1_idx` (`korisnik_id`),
  CONSTRAINT `fk_Anketa_Korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Anketa_Status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anketa`
--

LOCK TABLES `anketa` WRITE;
/*!40000 ALTER TABLE `anketa` DISABLE KEYS */;
/*!40000 ALTER TABLE `anketa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dogadjaj`
--

DROP TABLE IF EXISTS `dogadjaj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dogadjaj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov_dogadjaja` varchar(45) NOT NULL,
  `tekst_dogadjaja` text NOT NULL,
  `uzrast_id` int(11) NOT NULL,
  `Mesto_mesto_id` int(11) NOT NULL,
  `Ulica_ulica_id` int(11) NOT NULL,
  `Kategorija_dogadjaja_id` int(11) NOT NULL,
  `vreme_desavanja` datetime NOT NULL,
  `vreme_postavljanja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vreme_isticanja` datetime NOT NULL,
  `Korisnik_id` int(11) NOT NULL,
  `Status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_Dogadjaji_Uzrast1_idx` (`uzrast_id`),
  KEY `fk_Dogadjaji_Mesto1_idx` (`Mesto_mesto_id`),
  KEY `fk_Dogadjaji_Ulica1_idx` (`Ulica_ulica_id`),
  KEY `fk_Dogadjaji_Kategorija_dogadjaja1_idx` (`Kategorija_dogadjaja_id`),
  KEY `fk_Dogadjaj_Korisnik1_idx` (`Korisnik_id`),
  KEY `fk_Dogadjaj_Status1_idx` (`Status_id`),
  CONSTRAINT `fk_Dogadjaj_Korisnik1` FOREIGN KEY (`Korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dogadjaj_Status1` FOREIGN KEY (`Status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dogadjaji_Kategorija_dogadjaja1` FOREIGN KEY (`Kategorija_dogadjaja_id`) REFERENCES `kategorija_dogadjaja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dogadjaji_Mesto1` FOREIGN KEY (`Mesto_mesto_id`) REFERENCES `mesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dogadjaji_Ulica1` FOREIGN KEY (`Ulica_ulica_id`) REFERENCES `ulica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dogadjaji_Uzrast1` FOREIGN KEY (`uzrast_id`) REFERENCES `uzrast_posetilaca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dogadjaj`
--

LOCK TABLES `dogadjaj` WRITE;
/*!40000 ALTER TABLE `dogadjaj` DISABLE KEYS */;
/*!40000 ALTER TABLE `dogadjaj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dogadjaji_has_karakteristike_prostora`
--

DROP TABLE IF EXISTS `dogadjaji_has_karakteristike_prostora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dogadjaji_has_karakteristike_prostora` (
  `dogadjaj_id` int(11) NOT NULL,
  `prostora_id` int(11) NOT NULL,
  PRIMARY KEY (`dogadjaj_id`,`prostora_id`),
  KEY `fk_Dogadjaji_has_Karakteristike_prostora_Karakteristike_pro_idx` (`prostora_id`),
  KEY `fk_Dogadjaji_has_Karakteristike_prostora_Dogadjaji1_idx` (`dogadjaj_id`),
  CONSTRAINT `fk_Dogadjaji_has_Karakteristike_prostora_Dogadjaji1` FOREIGN KEY (`dogadjaj_id`) REFERENCES `dogadjaj` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dogadjaji_has_Karakteristike_prostora_Karakteristike_prost1` FOREIGN KEY (`prostora_id`) REFERENCES `karakteristike_prostora` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dogadjaji_has_karakteristike_prostora`
--

LOCK TABLES `dogadjaji_has_karakteristike_prostora` WRITE;
/*!40000 ALTER TABLE `dogadjaji_has_karakteristike_prostora` DISABLE KEYS */;
/*!40000 ALTER TABLE `dogadjaji_has_karakteristike_prostora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karakteristike_prostora`
--

DROP TABLE IF EXISTS `karakteristike_prostora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `karakteristike_prostora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stavka` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karakteristike_prostora`
--

LOCK TABLES `karakteristike_prostora` WRITE;
/*!40000 ALTER TABLE `karakteristike_prostora` DISABLE KEYS */;
INSERT INTO `karakteristike_prostora` VALUES (1,'Prilagodjeno invalidima'),(2,'Dozvoljeni kucni ljubimci'),(3,'Besplatan WIFI'),(4,'Placanje karticom');
/*!40000 ALTER TABLE `karakteristike_prostora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorija_dogadjaja`
--

DROP TABLE IF EXISTS `kategorija_dogadjaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorija_dogadjaja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija_dogadjaja`
--

LOCK TABLES `kategorija_dogadjaja` WRITE;
/*!40000 ALTER TABLE `kategorija_dogadjaja` DISABLE KEYS */;
INSERT INTO `kategorija_dogadjaja` VALUES (1,'Kultura'),(2,'Bioskop'),(3,'Izlozba'),(4,'Pozoriste'),(5,'Koncert'),(6,'Knjizevnost');
/*!40000 ALTER TABLE `kategorija_dogadjaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorija_vesti`
--

DROP TABLE IF EXISTS `kategorija_vesti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorija_vesti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stavka` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija_vesti`
--

LOCK TABLES `kategorija_vesti` WRITE;
/*!40000 ALTER TABLE `kategorija_vesti` DISABLE KEYS */;
INSERT INTO `kategorija_vesti` VALUES (1,'Aktuelnosti'),(2,'Desavanja'),(3,'Kultura'),(4,'Turizam');
/*!40000 ALTER TABLE `kategorija_vesti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `korisnicko_ime` varchar(45) NOT NULL,
  `lozinka` varchar(45) NOT NULL,
  `je_admin` int(11) NOT NULL DEFAULT '0',
  `Status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`Status_id`),
  KEY `fk_Korisnik_Status1_idx` (`Status_id`),
  CONSTRAINT `fk_Korisnik_Status1` FOREIGN KEY (`Status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'admin','admin123',1,2),(2,'tos','tos123',0,2),(3,'pozoriste','pozoriste123',0,1);
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesto`
--

DROP TABLE IF EXISTS `mesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `postanski_broj` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesto`
--

LOCK TABLES `mesto` WRITE;
/*!40000 ALTER TABLE `mesto` DISABLE KEYS */;
INSERT INTO `mesto` VALUES (1,'Beograd',11000),(2,'Novi Sad',21000),(3,'Nis',18000);
/*!40000 ALTER TABLE `mesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oblast_delovanja`
--

DROP TABLE IF EXISTS `oblast_delovanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oblast_delovanja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stavka` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oblast_delovanja`
--

LOCK TABLES `oblast_delovanja` WRITE;
/*!40000 ALTER TABLE `oblast_delovanja` DISABLE KEYS */;
INSERT INTO `oblast_delovanja` VALUES (1,'Kultura'),(2,'Turizam'),(3,'Sport');
/*!40000 ALTER TABLE `oblast_delovanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odgovor`
--

DROP TABLE IF EXISTS `odgovor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odgovor` (
  `odgovor_id` int(11) NOT NULL AUTO_INCREMENT,
  `pitanje_id` int(11) NOT NULL,
  `ponudjeni_odgovor` varchar(255) NOT NULL,
  PRIMARY KEY (`odgovor_id`),
  KEY `fk_Odgovor_Pitanje1_idx` (`pitanje_id`),
  CONSTRAINT `fk_Odgovor_Pitanje1` FOREIGN KEY (`pitanje_id`) REFERENCES `pitanje` (`pitanje_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odgovor`
--

LOCK TABLES `odgovor` WRITE;
/*!40000 ALTER TABLE `odgovor` DISABLE KEYS */;
/*!40000 ALTER TABLE `odgovor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oglasi`
--

DROP TABLE IF EXISTS `oglasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oglasi` (
  `oglasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov_oglasa` varchar(45) NOT NULL,
  `tekst_oglasa` text NOT NULL,
  `vreme_postavljanja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vreme_isticanja` datetime NOT NULL,
  `Korisnik_id` int(11) NOT NULL,
  `Status_id` int(11) NOT NULL,
  PRIMARY KEY (`oglasi_id`),
  KEY `fk_Oglasi_Korisnik1_idx` (`Korisnik_id`),
  KEY `fk_Oglasi_Status1_idx` (`Status_id`),
  CONSTRAINT `fk_Oglasi_Korisnik1` FOREIGN KEY (`Korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Oglasi_Status1` FOREIGN KEY (`Status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oglasi`
--

LOCK TABLES `oglasi` WRITE;
/*!40000 ALTER TABLE `oglasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `oglasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacija`
--

DROP TABLE IF EXISTS `organizacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizacija` (
  `Korisnik_id` int(11) NOT NULL,
  `naziv_organizacije` varchar(255) NOT NULL,
  `kontakt_osoba` varchar(255) NOT NULL,
  `kontakt_telefon` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `istorijat` text NOT NULL,
  `oblast_delovanja_id` int(11) NOT NULL,
  `website` varchar(255) NOT NULL,
  `mesto_id` int(11) NOT NULL,
  `ulica_id` int(11) NOT NULL,
  `adresa_broj` int(11) NOT NULL,
  PRIMARY KEY (`Korisnik_id`),
  KEY `fk_Korisnik_Oblast_delovanja1_idx` (`oblast_delovanja_id`),
  KEY `fk_Korisnik_Mesto1_idx` (`mesto_id`),
  KEY `fk_Korisnik_Ulica1_idx` (`ulica_id`),
  CONSTRAINT `fk_Korisnik_Mesto1` FOREIGN KEY (`mesto_id`) REFERENCES `mesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Korisnik_Oblast_delovanja1` FOREIGN KEY (`oblast_delovanja_id`) REFERENCES `oblast_delovanja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Korisnik_Ulica1` FOREIGN KEY (`ulica_id`) REFERENCES `ulica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Organizacija_Korisnik1` FOREIGN KEY (`Korisnik_id`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacija`
--

LOCK TABLES `organizacija` WRITE;
/*!40000 ALTER TABLE `organizacija` DISABLE KEYS */;
INSERT INTO `organizacija` VALUES (2,'Turisticka organizacija Srbije','Pavle Sreckovic','+38111789456','kontakt@tos.rs','Zakonom o turizmu iz 1994. godine osnovana jeTuristička organizacija Srbije (TOS), kao zvanični institucionalni nosilac promocije turizma Republike Srbije na domaćem i inostranom tržištu i obavljanje drugih poslova od značaja za razvoj informativno-propagandne delatnosti u turizmu Republike.',2,'www.tos.rs',1,3,22),(3,'Народно позориште','Јован Ђорђевић','+38164195245','jovan@np.rs','Народно позориште у Београду је позориште у Београду које се налази на Тргу републике, на углу Васине и Француске улице, у самом центру града. Основано је 1868. године, а у садашњу зграду, на месту тадашње Стамбол капије, уселило се 1869. године. У оквиру њега функционишу уметничке јединице Опера, Балет и Драма, а представе се одигравају на Великој сцени и Сцени „Раша Плаовић”. Данас представља једну од најрепрезентативнијих и најзначајнијих културних институција Србије.',1,'www.np.rs',1,1,45);
/*!40000 ALTER TABLE `organizacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pitanje`
--

DROP TABLE IF EXISTS `pitanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pitanje` (
  `pitanje_id` int(11) NOT NULL AUTO_INCREMENT,
  `pitanje` varchar(255) NOT NULL,
  `anketa_id` int(11) NOT NULL,
  PRIMARY KEY (`pitanje_id`),
  KEY `fk_Pitanje_Anketa1_idx` (`anketa_id`),
  CONSTRAINT `fk_Pitanje_Anketa1` FOREIGN KEY (`anketa_id`) REFERENCES `anketa` (`anketa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitanje`
--

LOCK TABLES `pitanje` WRITE;
/*!40000 ALTER TABLE `pitanje` DISABLE KEYS */;
/*!40000 ALTER TABLE `pitanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezultati_ankete`
--

DROP TABLE IF EXISTS `rezultati_ankete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezultati_ankete` (
  `rezultatr_id` int(11) NOT NULL AUTO_INCREMENT,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Odgovor_odgovor_id` int(11) NOT NULL,
  PRIMARY KEY (`rezultatr_id`),
  KEY `fk_Rezultati_ankete_Odgovor1_idx` (`Odgovor_odgovor_id`),
  CONSTRAINT `fk_Rezultati_ankete_Odgovor1` FOREIGN KEY (`Odgovor_odgovor_id`) REFERENCES `odgovor` (`odgovor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezultati_ankete`
--

LOCK TABLES `rezultati_ankete` WRITE;
/*!40000 ALTER TABLE `rezultati_ankete` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezultati_ankete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_statusa` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'neaktivan'),(2,'aktivan'),(3,'za brisanje'),(4,'obrisan'),(5,'javno'),(6,'privatno');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulica`
--

DROP TABLE IF EXISTS `ulica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ulica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) NOT NULL,
  `mesto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Ulica_Mesto1_idx` (`mesto_id`),
  CONSTRAINT `fk_Ulica_Mesto1` FOREIGN KEY (`mesto_id`) REFERENCES `mesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulica`
--

LOCK TABLES `ulica` WRITE;
/*!40000 ALTER TABLE `ulica` DISABLE KEYS */;
INSERT INTO `ulica` VALUES (1,'Knez Mihailova',1),(2,'Kralja Petra',1),(3,'Nemanjina',1),(4,'Krunska',1),(5,'Beogradska',1),(6,'Bulevar oslobodjenja',2),(7,'Cara Dusana',2),(8,'Bulevar Mihajla Pupina',2),(9,'Njegoseva',2),(10,'Dusanova',3),(11,'Jug Bogdanova',3),(12,'Nikole Pasica',3),(13,'Kneginje Ljubice',3);
/*!40000 ALTER TABLE `ulica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzrast_posetilaca`
--

DROP TABLE IF EXISTS `uzrast_posetilaca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzrast_posetilaca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stavka` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzrast_posetilaca`
--

LOCK TABLES `uzrast_posetilaca` WRITE;
/*!40000 ALTER TABLE `uzrast_posetilaca` DISABLE KEYS */;
INSERT INTO `uzrast_posetilaca` VALUES (1,12),(2,14),(3,16),(4,18);
/*!40000 ALTER TABLE `uzrast_posetilaca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vesti`
--

DROP TABLE IF EXISTS `vesti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vesti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov_vesti` varchar(255) NOT NULL,
  `tekst_vesti` text NOT NULL,
  `kategorija_vesti_id` int(11) NOT NULL,
  `vreme_postavljanja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `autor` int(11) NOT NULL,
  `Status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Vesti_Kategorija_vesti1_idx` (`kategorija_vesti_id`),
  KEY `fk_Vesti_Korisnik1_idx` (`autor`),
  KEY `fk_Vesti_Status1_idx` (`Status_id`),
  CONSTRAINT `fk_Vesti_Kategorija_vesti1` FOREIGN KEY (`kategorija_vesti_id`) REFERENCES `kategorija_vesti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vesti_Korisnik1` FOREIGN KEY (`autor`) REFERENCES `korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vesti_Status1` FOREIGN KEY (`Status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vesti`
--

LOCK TABLES `vesti` WRITE;
/*!40000 ALTER TABLE `vesti` DISABLE KEYS */;
INSERT INTO `vesti` VALUES (1,'Концерт Београдске филхармоније на отвореном','Београдска филхармонија припрема музички пикник под звездама заједно са шефом-диригентом Габријелом Фелцом, у недељу 24. јуна, у новобеоградском блоку 13, између ТЦ „Ушће” и Палате Србија, с почетком у 20.30 часова. На овом другом по реду концерту на отвореном, публици из целе земље и региона Филхармонија поклања аудио-визуелни спектакл под називом „ХД Одисеја”.',2,'2018-06-09 18:59:06',2,2),(2,'\"Игра престола\" добија нову серију?','Компанија ХБО наручила је пилот епизоду за серијал о догађајима пре тренутних дешавања у популарном серијалу \"Игра престола\". ББЦ наводи да се овај серијал не очекује пре 2019. године када ће бити емитована последња сезона \"Игре престола\". ХБО је саопштио да би могуће теме могле да буду \"доба хероја\", односно догађаји од 1.000 година, пре дешавања у серијалу \"Игра престола\" који се приказује. Порекло \"белих шетача\" такође је један од тема којом би могао да се бави овај серијал, наводи ББЦ.',1,'2018-06-09 19:57:52',2,2);
/*!40000 ALTER TABLE `vesti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-18 15:58:55
