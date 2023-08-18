-- Backup hecho de todas las tablas --

-- Tablas --
-- Actas, Alumnos, Comercios, Curso_manipulacion, Datos_personales, Denuncias, Grupo_inspectores, Grupos, Habilitacion_comercios, Habilitacion_vehiculos, Inspecciones, Inspectores, Notas, Profesores, Rubros_comercio, Rubros_vehiculos, Segundo_control, Vehiculos --

-- Tablas Log de los triggers--
-- alumnos_evento_new, alumnos_evento_old, comercio_evento_new, comercio_evento_old, denuncias_evento_new, denuncias_evento_old, vehiculos_evento_new, vehiculos_evento_old --

-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: bromatologia
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `actas`
--

LOCK TABLES `actas` WRITE;
/*!40000 ALTER TABLE `actas` DISABLE KEYS */;
INSERT INTO `actas` VALUES (1,'3466778B','623345',NULL,'345',NULL,'Presencia de ratas'),(2,'3456783B',NULL,NULL,NULL,NULL,'Habilitacion de comercio'),(3,'3466007B',NULL,'997',NULL,NULL,'Inspeccion, comiso'),(4,'3466997C',NULL,NULL,NULL,NULL,'Habilitacion de comercio'),(5,'3783997B',NULL,NULL,NULL,NULL,'Habilitacion de comercio'),(6,'3452223B',NULL,NULL,NULL,NULL,'Habilitacion de comercio');
/*!40000 ALTER TABLE `actas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,NULL,1,'Juan','Perez','34567890','2235678909','perez@gmail.com'),(2,NULL,2,'Pablo','Garcia','43267890','2235238769','garcia@gmail.com'),(3,NULL,NULL,'Horacio','Kan','12367890','2235612769','Kan@gmail.com'),(4,NULL,NULL,'Pepe','Lanzani','42267890','2235228769','Lanzani@gmail.com'),(5,NULL,NULL,'Javier','Perez','34500090','2235678909','perez@gmail.com');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comercios`
--

LOCK TABLES `comercios` WRITE;
/*!40000 ALTER TABLE `comercios` DISABLE KEYS */;
INSERT INTO `comercios` VALUES (1,3,'Los Reseros S.R.L.','Colon 3344','55/S/222','12334'),(2,5,'Los Abuelos S.A','Luro 33','234521/B/08','12312B'),(3,1,'C.S.A S.A.','Gascon 2344','1222/2/23','32123'),(4,1,'Muria','Gascon 45','122/A/23','3123'),(5,4,'Roberto Ruben','Colon 2344','12/Z/23','223'),(6,1,'Maria Laura.','Luro 44','5/2/23','12344'),(7,2,'Los Reseros','Italia 222','1234/2/22','122312A'),(8,3,'Los Reseros S.R.L.','Colon 3344','1222/B/99','12004');
/*!40000 ALTER TABLE `comercios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `curso_manipulacion`
--

LOCK TABLES `curso_manipulacion` WRITE;
/*!40000 ALTER TABLE `curso_manipulacion` DISABLE KEYS */;
INSERT INTO `curso_manipulacion` VALUES (1,1,1,1,'2023-08-17','2023-08-18'),(2,2,2,2,'2023-08-17','2023-08-18'),(3,1,3,NULL,'2023-08-17',NULL),(4,2,4,NULL,'2023-08-17',NULL);
/*!40000 ALTER TABLE `curso_manipulacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `datos_personales`
--

LOCK TABLES `datos_personales` WRITE;
/*!40000 ALTER TABLE `datos_personales` DISABLE KEYS */;
INSERT INTO `datos_personales` VALUES (1,'2236942265','prueba@prueba.com','Calle falsa 123'),(2,'2234567865','prueba2@prueba.com','Calle falsa 234'),(3,'2234343455','prueba3@prueba.com','Rivadavia 4435'),(4,'2234567865','prueba4@prueba.com','Dorrego 13421'),(5,'2234567865','prueba5@prueba.com','Castelli 66'),(6,'2234562365','prueba6@prueba.com','Brown 66');
/*!40000 ALTER TABLE `datos_personales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `denuncias`
--

LOCK TABLES `denuncias` WRITE;
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
INSERT INTO `denuncias` VALUES (1,1,'Brown 1234','Presencia de ratas','2023-08-17',55),(2,NULL,'Falucho 233','Presencia de cucarachas','2023-08-17',58),(3,NULL,'Brown 1895','Presencia de cucarachas','2023-08-17',4323);
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `grupo_inspectores`
--

LOCK TABLES `grupo_inspectores` WRITE;
/*!40000 ALTER TABLE `grupo_inspectores` DISABLE KEYS */;
INSERT INTO `grupo_inspectores` VALUES (1,2,3),(2,2,2),(3,2,4);
/*!40000 ALTER TABLE `grupo_inspectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'grupo 1'),(2,'grupo 2'),(3,'grupo 3');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `habilitacion_comercios`
--

LOCK TABLES `habilitacion_comercios` WRITE;
/*!40000 ALTER TABLE `habilitacion_comercios` DISABLE KEYS */;
INSERT INTO `habilitacion_comercios` VALUES (1,2,1,2,'2023-08-17'),(2,7,1,4,'2023-08-17'),(3,4,1,5,'2023-08-17'),(4,6,1,6,'2023-08-17');
/*!40000 ALTER TABLE `habilitacion_comercios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `habilitacion_vehiculos`
--

LOCK TABLES `habilitacion_vehiculos` WRITE;
/*!40000 ALTER TABLE `habilitacion_vehiculos` DISABLE KEYS */;
INSERT INTO `habilitacion_vehiculos` VALUES (1,1,3,1,1,'2023-08-17',NULL),(2,2,2,NULL,1,'2023-08-17',NULL),(3,3,2,NULL,1,'2023-08-17',NULL),(4,4,1,NULL,1,'2023-08-17',NULL);
/*!40000 ALTER TABLE `habilitacion_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inspecciones`
--

LOCK TABLES `inspecciones` WRITE;
/*!40000 ALTER TABLE `inspecciones` DISABLE KEYS */;
INSERT INTO `inspecciones` VALUES (1,1,1,3,2,'2023-08-17'),(2,NULL,3,1,2,'2023-08-17');
/*!40000 ALTER TABLE `inspecciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inspectores`
--

LOCK TABLES `inspectores` WRITE;
/*!40000 ALTER TABLE `inspectores` DISABLE KEYS */;
INSERT INTO `inspectores` VALUES (1,1,31468,'Tomas','Rave','Mañana','Profesional'),(2,2,31462,'Facundo','Irazabal','Mañana','Profesional'),(3,3,31461,'Javier','Gherbi','Mañana','Profesional'),(4,4,31469,'Julian','Perez','Mañana','Profesional'),(5,5,10897,'Juan','Colombo','Tarde','Tecnico superior');
/*!40000 ALTER TABLE `inspectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_alumnos_evento_new`
--

LOCK TABLES `log_alumnos_evento_new` WRITE;
/*!40000 ALTER TABLE `log_alumnos_evento_new` DISABLE KEYS */;
INSERT INTO `log_alumnos_evento_new` VALUES ('Update datos',1,NULL,1,'Juan','Perez','34567890','2235678909','perez@gmail.com','root@localhost','2023-08-17 11:18:35'),('Insert datos',0,NULL,NULL,'Javier','Perez','34500090','2235678909','perez@gmail.com','root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_alumnos_evento_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_alumnos_evento_old`
--

LOCK TABLES `log_alumnos_evento_old` WRITE;
/*!40000 ALTER TABLE `log_alumnos_evento_old` DISABLE KEYS */;
INSERT INTO `log_alumnos_evento_old` VALUES ('Update datos',1,NULL,1,'Javier','Perez','34567890','2235678909','perez@gmail.com','root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_alumnos_evento_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_comercio_evento_new`
--

LOCK TABLES `log_comercio_evento_new` WRITE;
/*!40000 ALTER TABLE `log_comercio_evento_new` DISABLE KEYS */;
INSERT INTO `log_comercio_evento_new` VALUES ('Update datos',1,3,'Los Reseros S.R.L.','Colon 3344','55/S/222','12334','root@localhost','2023-08-17 11:18:35'),('Insert datos',0,3,'Los Reseros S.R.L.','Colon 3344','1222/B/99','12004','root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_comercio_evento_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_comercio_evento_old`
--

LOCK TABLES `log_comercio_evento_old` WRITE;
/*!40000 ALTER TABLE `log_comercio_evento_old` DISABLE KEYS */;
INSERT INTO `log_comercio_evento_old` VALUES ('Update datos',1,3,'Los Reseros S.R.L.','Colon 3344','123/B/99','12334','root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_comercio_evento_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_denuncias_evento_new`
--

LOCK TABLES `log_denuncias_evento_new` WRITE;
/*!40000 ALTER TABLE `log_denuncias_evento_new` DISABLE KEYS */;
INSERT INTO `log_denuncias_evento_new` VALUES ('Insert datos',2,NULL,'Falucho 233','Presencia de cucarachas','2023-08-17',58,'root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_denuncias_evento_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_denuncias_evento_old`
--

LOCK TABLES `log_denuncias_evento_old` WRITE;
/*!40000 ALTER TABLE `log_denuncias_evento_old` DISABLE KEYS */;
INSERT INTO `log_denuncias_evento_old` VALUES ('Update datos',2,NULL,'Falucho 233','Presencia de cucarachas','2023-08-17',58,'root@localhost','2023-08-17 11:18:35'),('Update datos',2,NULL,'Falucho 233','Presencia de cucarachas','2023-08-17',56,'root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_denuncias_evento_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_vehiculos_evento_new`
--

LOCK TABLES `log_vehiculos_evento_new` WRITE;
/*!40000 ALTER TABLE `log_vehiculos_evento_new` DISABLE KEYS */;
INSERT INTO `log_vehiculos_evento_new` VALUES ('UPDATE datos',1,150987,'VPT123','Rabbione','root@localhost','2023-08-17 11:18:35'),('INSERT datos',0,10030,'VPT100','Rabbione','root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_vehiculos_evento_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_vehiculos_evento_old`
--

LOCK TABLES `log_vehiculos_evento_old` WRITE;
/*!40000 ALTER TABLE `log_vehiculos_evento_old` DISABLE KEYS */;
INSERT INTO `log_vehiculos_evento_old` VALUES ('UPDATE datos',1,14560,'VPT123','Rabbione','root@localhost','2023-08-17 11:18:35');
/*!40000 ALTER TABLE `log_vehiculos_evento_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,1,1,7),(2,2,2,4);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,2),(2,5);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rubros_comercio`
--

LOCK TABLES `rubros_comercio` WRITE;
/*!40000 ALTER TABLE `rubros_comercio` DISABLE KEYS */;
INSERT INTO `rubros_comercio` VALUES (1,'Despensa'),(2,'Fiambreria, panaderia, despensa'),(3,'Carniceria, granja'),(4,'Polleria, elaboracion de milanesas'),(5,'Fabrica de embutidos');
/*!40000 ALTER TABLE `rubros_comercio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rubros_vehiculos`
--

LOCK TABLES `rubros_vehiculos` WRITE;
/*!40000 ALTER TABLE `rubros_vehiculos` DISABLE KEYS */;
INSERT INTO `rubros_vehiculos` VALUES (1,'No perecederos, bebidas'),(2,'Alimentos congelados'),(3,'Carnes vacunas'),(4,'Articulos de limpieza');
/*!40000 ALTER TABLE `rubros_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `segundo_control`
--

LOCK TABLES `segundo_control` WRITE;
/*!40000 ALTER TABLE `segundo_control` DISABLE KEYS */;
INSERT INTO `segundo_control` VALUES (1,'32567B',NULL,NULL,1);
/*!40000 ALTER TABLE `segundo_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,150987,'VPT123','Rabbione'),(2,15678,'AA234CC','Juan Perez'),(3,678,'ASD456','Julian Massilla'),(4,13360,'VPT153','Romagnoli'),(5,10030,'VPT100','Rabbione');
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 11:01:52
