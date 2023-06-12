-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: signature
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absence`
--

DROP TABLE IF EXISTS `absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence` (
  `code_absence` int(11) NOT NULL AUTO_INCREMENT,
  `justificatif` char(128) DEFAULT NULL,
  `justifier` tinyint(1) DEFAULT 0,
  `code_cours` int(11) DEFAULT NULL,
  `code_utilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_absence`),
  KEY `code_cours` (`code_cours`),
  KEY `code_utilisateur` (`code_utilisateur`),
  CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`code_cours`) REFERENCES `cours` (`code_cours`),
  CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`code_utilisateur`) REFERENCES `utilisateur` (`code_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence`
--

LOCK TABLES `absence` WRITE;
/*!40000 ALTER TABLE `absence` DISABLE KEYS */;
INSERT INTO `absence` VALUES (1,NULL,0,1,1);
/*!40000 ALTER TABLE `absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cours`
--

DROP TABLE IF EXISTS `cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cours` (
  `code_cours` int(11) NOT NULL AUTO_INCREMENT,
  `date_cours` date DEFAULT NULL,
  `code_creneau` int(11) DEFAULT NULL,
  `code_promotion` int(11) DEFAULT NULL,
  `num_salle` int(11) DEFAULT NULL,
  `code_matiere` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_cours`),
  KEY `code_creneau` (`code_creneau`),
  KEY `code_promotion` (`code_promotion`),
  KEY `num_salle` (`num_salle`),
  KEY `code_matiere` (`code_matiere`),
  CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`code_creneau`) REFERENCES `creneau` (`code_creneau`),
  CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`code_promotion`) REFERENCES `promotion` (`code_promotion`),
  CONSTRAINT `cours_ibfk_3` FOREIGN KEY (`num_salle`) REFERENCES `salle` (`num_salle`),
  CONSTRAINT `cours_ibfk_4` FOREIGN KEY (`code_matiere`) REFERENCES `matiere` (`code_matiere`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours`
--

LOCK TABLES `cours` WRITE;
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` VALUES (1,'2023-06-05',1,2,509,1),(2,'2023-06-05',2,2,509,1),(3,'2023-06-05',3,2,509,3),(4,'2023-06-05',4,2,509,3),(5,'2023-06-05',5,2,509,9),(6,'2023-06-06',2,2,310,4),(7,'2023-06-06',3,2,310,4),(8,'2023-06-06',4,2,310,4),(9,'2023-06-06',5,2,310,4),(10,'2023-06-06',6,2,310,4),(11,'2023-06-07',1,2,405,6),(12,'2023-06-07',2,2,405,8),(13,'2023-06-07',3,2,310,16),(14,'2023-06-07',4,2,310,16),(15,'2023-06-07',5,2,509,1),(16,'2023-06-08',1,2,512,10),(17,'2023-06-08',2,2,512,10),(18,'2023-06-08',3,2,512,3),(19,'2023-06-08',4,2,310,16),(20,'2023-06-08',5,2,512,6),(21,'2023-06-09',2,2,510,8),(22,'2023-06-09',3,2,510,8),(23,'2023-06-09',4,2,510,4),(24,'2023-06-09',5,2,510,4);
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creneau`
--

DROP TABLE IF EXISTS `creneau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creneau` (
  `code_creneau` int(11) NOT NULL AUTO_INCREMENT,
  `desc_creneau` char(11) DEFAULT NULL,
  PRIMARY KEY (`code_creneau`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creneau`
--

LOCK TABLES `creneau` WRITE;
/*!40000 ALTER TABLE `creneau` DISABLE KEYS */;
INSERT INTO `creneau` VALUES (1,'08h00-09h30'),(2,'09h45-11h15'),(3,'11h30-13h00'),(4,'14h00-15h30'),(5,'15h45-17h15'),(6,'17h30-19h00');
/*!40000 ALTER TABLE `creneau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `droit`
--

DROP TABLE IF EXISTS `droit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `droit` (
  `code_droit` int(11) NOT NULL AUTO_INCREMENT,
  `desc_droit` char(20) DEFAULT NULL,
  PRIMARY KEY (`code_droit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `droit`
--

LOCK TABLES `droit` WRITE;
/*!40000 ALTER TABLE `droit` DISABLE KEYS */;
INSERT INTO `droit` VALUES (1,'DETU'),(2,'DINT'),(3,'DRP'),(4,'DDIR'),(5,'DAP');
/*!40000 ALTER TABLE `droit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecole` (
  `code_ecole` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ecole` char(50) DEFAULT NULL,
  `acronyme_ecole` char(10) DEFAULT NULL,
  `logo_ecole` char(128) DEFAULT NULL,
  PRIMARY KEY (`code_ecole`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecole`
--

LOCK TABLES `ecole` WRITE;
/*!40000 ALTER TABLE `ecole` DISABLE KEYS */;
INSERT INTO `ecole` VALUES (1,'Ecole Supérieure de Génie Informatique','ESGI',NULL),(2,'Pôle Paris Alternance Sport Business School','PPAS',NULL),(3,'Pôle Paris Alternance Business School','PPA',NULL),(4,'Ecole Supérieure des métiers de l immobilier','EFAB',NULL),(5,'Maestris BTS','MBTS',NULL),(6,'Ecole Studio Crea','ESC',NULL),(7,'Institut Supérieur de l Audiovisuel','ISA',NULL),(8,'Ecole Internationale de Management du Luxe','EIML',NULL),(9,'Modart International','MI',NULL),(10,'Eductive Digital Business School','EDBS',NULL),(11,'Institut de Création et Animation Numériques','ICAN',NULL),(12,'Institut Supérieur de Formation au Journalisme','ISFJ',NULL),(13,'Esupcom','ESUPCOM',NULL),(14,'Ecole de Gestion Finance et Expertise Comptable','ENGDE',NULL);
/*!40000 ALTER TABLE `ecole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matiere` (
  `code_matiere` int(11) NOT NULL AUTO_INCREMENT,
  `nom_matiere` char(50) DEFAULT NULL,
  `code_utilisateur` int(11) DEFAULT NULL,
  `code_ecole` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_matiere`),
  KEY `code_utilisateur` (`code_utilisateur`),
  KEY `fk_matiere_ecole` (`code_ecole`),
  CONSTRAINT `fk_matiere_ecole` FOREIGN KEY (`code_ecole`) REFERENCES `ecole` (`code_ecole`),
  CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`code_utilisateur`) REFERENCES `utilisateur` (`code_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matiere`
--

LOCK TABLES `matiere` WRITE;
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` VALUES (1,'Theorie des Systèmes d Exploitation',4,1),(2,'Conception et Modélisation de Systèmes',4,1),(3,'Architecture des Logiciels',5,1),(4,'Développement Web Avancé',6,1),(5,'Gestion de Projet Informatique',7,1),(6,'Sécurité des Systèmes d\'Information',8,1),(7,'Cloud Computing',9,1),(8,'Administration Système',10,1),(9,'Réseaux Informatiques',11,1),(10,'Virtualisation et Cloud Computing',12,1),(11,'Sécurité des Réseaux',13,1),(12,'Gestion des Services Cloud',14,1),(13,'Architecture des Systèmes Distribués',15,1),(14,'Conception de Sites Web',16,1),(15,'Développement Front-end',17,1),(16,'Développement Back-end',18,1),(17,'Bases de Données pour le Web',19,1),(18,'UX/UI Design',20,1),(19,'Sécurité des Applications Web',21,1),(20,'Marketing Sportif',22,2),(21,'Gestion des Événements Sportifs',23,2),(22,'Droit du Sport',24,2),(23,'Gestion des Infrastructures Sportives',25,2),(24,'Finance du Sport',26,2),(25,'Stratégie et Management Sportif',27,2),(26,'Marketing du Sport',28,2),(27,'Marketing Digital Sportif',29,2),(28,'Sponsoring et Mécénat',30,2),(29,'Communication Sportive',31,2),(30,'Analyse des Marchés Sportifs',4,2),(31,'Gestion de la Marque Sportive',5,2),(32,'Communication Événementielle',6,2),(33,'Relations Publiques Sportives',7,2),(34,'Médias et Journalisme Sportif',8,2),(35,'Community Management Sportif',9,2),(36,'Image et Identité Visuelle',10,2),(37,'Stratégies de Communication Sportive',11,2),(38,'Organisation d\'Événements Sportifs',12,3),(39,'Logistique Événementielle',13,3),(40,'Gestion de Projets Événementiels',14,3),(41,'Marketing Événementiel',15,3),(42,'Étude et Stratégie de Marché',16,3),(43,'Gestion des Ressources Humaines dans l\'Événementie',17,2),(44,'Droit de l\'Immobilier',18,4),(45,'Économie de l\'Immobilier',19,4),(46,'Gestion Locative',20,4),(47,'Évaluation Immobilière',21,4),(48,'Copropriété et Syndic',22,4),(49,'Gestion de Patrimoine Immobilier',23,4),(50,'Négociation Immobilière',24,4),(51,'Marketing Immobilier',25,4),(52,'Droit de la Vente Immobilière',26,4),(53,'Gestion de la Relation Client',27,4),(54,'Fiscalité Immobilière',28,4),(55,'Financement et Crédit Immobilier',29,4),(56,'Expertise des Valeurs Immobilières',30,4),(57,'Expertise des Biens d\'Exception',31,4),(58,'Expertise des Biens Ruraux',4,4),(59,'Expertise des Biens Commerciaux',5,4),(60,'Méthodologie d\'Expertise Immobilière',6,4),(61,'Réglementation et Normes d\'Expertise Immobilière',7,4),(62,'Droit de l\'Urbanisme',8,4),(63,'Économie de l\'Aménagement',9,4),(64,'Planification et Gestion Urbaine',10,4),(65,'Aménagement du Territoire',11,4),(66,'Diagnostic et Projet Urbain',12,4),(67,'Développement Durable et Environnement',13,4),(68,'Stratégies de Communication',14,5),(69,'Communication Digitale',15,5),(70,'Communication Institutionnelle',16,5),(71,'Communication Interne',17,5),(72,'Communication de Crise',18,5),(73,'Relations Médias',19,5),(74,'Infographie',20,6),(75,'Identité Visuelle',21,6),(76,'Design Éditorial',22,6),(77,'Packaging',23,6),(78,'Design Publicitaire',24,6),(79,'Illustration',25,6),(80,'Réalisation Audiovisuelle',26,6),(81,'Montage Vidéo',27,7),(82,'Scénario et Storyboard',28,7),(83,'Techniques de Prise de Vue',29,7),(84,'Son et Mixage',30,7),(85,'Effets Spéciaux',31,7),(86,'Stratégie de Marketing Digital',4,3),(87,'SEO et Référencement',5,3),(88,'Publicité en Ligne',6,3),(89,'Marketing des Réseaux Sociaux',7,3),(90,'Analyse de Données Marketing',8,3),(91,'E-commerce',9,3),(92,'Stratégie d\'E-commerce',10,3),(93,'Gestion des Commandes en Ligne',11,3),(94,'Logistique et Livraison',12,3),(95,'Paiement Électronique',13,3),(96,'Expérience Utilisateur dans l\'E-commerce',14,3),(97,'Sécurité des Transactions en Ligne',15,3),(98,'Méthodes Statistiques',16,1),(99,'Data Mining',17,1),(100,'Visualisation de Données',18,1),(101,'Analyse Prédictive',19,1),(102,'Big Data',20,1),(103,'Business Intelligence',21,1),(104,'Élaboration de Stratégie Digitale',22,5),(105,'Management de Projet Digital',23,5),(106,'Web Analytics',24,5),(107,'Marketing Mobile',25,5),(108,'Transformation Digitale',26,5),(109,'Veille Stratégique',27,5),(110,'Identité Visuelle',28,7),(111,'Typographie',29,7),(112,'Packaging',30,7),(113,'Design Éditorial',31,7),(114,'Design Publicitaire',4,7),(115,'Infographie',5,7),(116,'Modélisation 3D',6,7),(117,'Animation 3D',7,7),(118,'Texturing et Éclairage',8,7),(119,'Rendu 3D',9,7),(120,'Effets Spéciaux',10,7),(121,'Compositing',11,7),(122,'Modélisation et Animation 3D',12,7),(123,'Compositing',13,7),(124,'Matte Painting',14,7),(125,'Tracking et Rotoscoping',15,7),(126,'Simulation Physique',16,7),(127,'Création de Personnages',17,7),(128,'Animation Graphique',18,7),(129,'Effets Spéciaux',19,7),(130,'Sound Design',20,7),(131,'Montage et Post-Production',21,7),(132,'Storyboarding',22,7),(133,'Direction Artistique',23,7),(134,'Recherche et Enquête Journalistique',24,12),(135,'Techniques d\'Interview',25,12),(136,'Éthique et Déontologie du Journalisme',26,12),(137,'Analyse des Sources d\'Information',27,12),(138,'Rédaction d\'Articles d\'Investigation',28,12),(139,'Journalisme de Données',29,12),(140,'Critique et Analyse Culturelle',30,12),(141,'Journalisme Littéraire',31,12),(142,'Journalisme Cinématographique',4,12),(143,'Journalisme Musical',5,12),(144,'Journalisme Artistique',6,12),(145,'Journalisme de Mode',7,12),(146,'Règles et Éthique du Journalisme Sportif',8,12),(147,'Reportage et Interview Sportive',9,12),(148,'Rédaction d\'Articles Sportifs',10,12),(149,'Commentaire et Analyse Sportive',11,12),(150,'Journalisme d\'Enquête Sportive',12,12),(151,'Journalisme de Télévision Sportive',13,12),(152,'Droit de la Presse Internationale',1,12),(153,'Géopolitique et Relations Internationales',15,12),(154,'Journalisme de Guerre',16,12),(155,'Reportage et Analyse Internationale',17,12),(156,'Journalisme d\'Investigation Internationale',18,12),(157,'Journalisme en Zone de Conflit',19,12),(158,'Stratégie de Communication Globale',20,5),(159,'Communication Institutionnelle',21,5),(160,'Communication Interne',22,5),(161,'Communication de Crise',23,5),(162,'Relations Publiques',24,5),(163,'Communication Politique',25,5),(164,'Gestion des Relations avec les Médias',26,5),(165,'Événementiel et Organisation d\'Actions RP',27,5),(166,'Communication de Crise',28,5),(167,'Relations avec les Influenceurs',29,5),(168,'Communication Interne',30,5),(169,'Stratégie de Marque',31,5),(170,'Analyse Financière',10,5),(171,'Gestion de Trésorerie',11,5),(172,'Évaluation des Investissements',12,5),(173,'Gestion des Risques',13,5),(174,'Gestion de Portefeuille',14,5),(175,'Fusions et Acquisitions',15,5),(176,'Comptabilité Approfondie',16,5),(177,'Contrôle de Gestion',17,5),(178,'Audit Comptable et Financier',18,5),(179,'Droit Fiscal',19,5),(180,'Consolidation des Comptes',20,5),(181,'Normes Comptables Internationales',21,5),(182,'Contrôle Budgétaire',22,5),(183,'Tableaux de Bord',23,5),(184,'Contrôle des Coûts',24,5),(185,'Pilotage de la Performance',25,5),(186,'Contrôle Interne',26,5),(187,'Systèmes d\'Information de Gestion',27,5),(188,'Audit Interne',28,5),(189,'Audit des Systèmes d\'Information',29,5),(190,'Audit Opérationnel',30,5),(191,'Contrôle de Qualité',31,5),(192,'Audit des États Financiers',4,5),(193,'Audit des Risques',5,5),(194,'Comportement du Consommateur de Luxe',6,8),(195,'Marketing Sensoriel',7,8),(196,'Stratégie de Marque de Luxe',8,8),(197,'Communication et Promotion du Luxe',9,8),(198,'Distribution et Merchandising du Luxe',10,8),(199,'E-commerce de Luxe',11,8),(200,'Histoire de la Mode',12,8),(201,'Management des Marques de Mode',13,8),(202,'Stratégie de Distribution dans l\'Industrie de la M',14,8),(203,'Marketing de la Mode',15,8),(204,'Événements et Défilés de Mode',16,8),(205,'Merchandising et Visual Merchandising',17,8),(206,'Stratégie de Communication de Luxe',18,8),(207,'Relations Publiques dans l\'Industrie du Luxe',19,8),(208,'Événements et Lancement de Produits de Luxe',20,8),(209,'Communication Digitale de Luxe',21,8),(210,'Branding de Luxe',22,8),(211,'Publicité et Médias de Luxe',23,8),(212,'Histoire de la Mode',24,9),(213,'Création de Moodboards et de Croquis',25,9),(214,'Patronage et Coupe',26,9),(215,'Techniques de Couture',27,9),(216,'Conception de Collection',28,9),(217,'Tendances et Style de Mode',29,9),(218,'Création de Moodboards et de Croquis',30,9),(219,'Modélisme et Patronage',31,9),(220,'Techniques de Couture',4,9),(221,'Conception de Collection',5,9),(222,'Tendances et Style de Mode',6,9),(223,'Conception de Costumes',7,9),(224,'Marketing Stratégique de la Mode',8,9),(225,'Marketing Opérationnel de la Mode',9,9),(226,'Études de Marché dans l\'Industrie de la Mode',10,9),(227,'Distribution et Vente dans la Mode',11,9),(228,'Communication de Mode',12,9),(229,'Événements et Défilés de Mode',13,9),(230,'Stratégie de Marque',14,10),(231,'Identité de Marque',15,10),(232,'Gestion de Marque',16,10),(233,'Communication de Marque',17,10),(234,'Brand Equity',18,10),(235,'Innovation de Marque',19,10),(236,'Stratégie de Marketing Digital',20,10),(237,'SEO et Optimisation de Contenu',21,10),(238,'Publicité en Ligne',22,10),(239,'Marketing sur les Réseaux Sociaux',23,10),(240,'Analyse de Données et Performance Digitale',24,10),(241,'Email Marketing',25,10),(242,'Stratégie d\'E-commerce',26,10),(243,'Gestion de Plateformes E-commerce',27,10),(244,'Logistique et Supply Chain dans l\'E-commerce',28,10),(245,'Paiement et Sécurité dans l\'E-commerce',29,10),(246,'Marketing pour l\'E-commerce',30,10),(247,'Analyse de Données dans l\'E-commerce',31,10),(248,'Introduction à l\'Analyse de Données',4,11),(249,'Statistiques Appliquées',5,11),(250,'Data Mining',6,11),(251,'Data Visualization',7,11),(252,'Big Data',8,11),(253,'Machine Learning',9,11),(254,'Introduction à la Stratégie Digitale',10,10),(255,'Analyse de l\'Environnement Digital',11,10),(256,'Stratégie de Contenu',12,10),(257,'Social Media Strategy',13,10),(258,'Mobile Marketing',14,10),(259,'Stratégie de Conversion',15,10),(260,'Méthodologie du Journalisme d\'Investigation',16,12),(261,'Recherche et Collecte d\'Informations',17,12),(262,'Analyse et Vérification des Sources',18,12),(263,'Rédaction d\'Articles d\'Investigation',19,12),(264,'Éthique et Responsabilité dans le Journalisme d\'In',20,12),(265,'Protection des Sources et Sécurité Journalistique',21,12),(266,'Critique Cinéma',22,12),(267,'Journalisme Littéraire',23,12),(268,'Journalisme Musical',24,12),(269,'Journalisme Gastronomique',25,12),(270,'Journalisme Artistique',26,12),(271,'Journalisme de Mode',27,12),(272,'Rédaction d\'Articles de Sport',28,12),(273,'Commentaire Sportif',29,12),(274,'Reportage Sportif',30,12),(275,'Interviews et Entretiens Sportifs',31,12),(276,'Éthique et Responsabilité dans le Journalisme Spor',4,12),(277,'Médias et Diffusion Sportive',5,12),(278,'Relations Internationales et Diplomatie',6,12),(279,'Journalisme Politique et Géopolitique',7,12),(280,'Journalisme Économique et Financier',8,12),(281,'Journalisme de Guerre et de Conflits',9,12),(282,'Reportage à l\'International',10,12),(283,'Journalisme en Zone de Crise',11,12),(284,'Stratégie de Communication Globale',12,13),(285,'Communication Interne et RSE',13,13),(286,'Communication de Crise',14,13),(287,'Relations Médias et Relations Publiques',15,13),(288,'Communication Institutionnelle',16,13),(289,'Communication Digitale',17,13),(290,'Fondamentaux des Relations Publiques',18,13),(291,'Stratégies de Relations Publiques',19,13),(292,'Relations Presse et Médias',20,13),(293,'Gestion des Relations Publiques en Ligne',21,13),(294,'Communication de Crise',22,13),(295,'Événements et Communication Publique',23,13),(296,'Stratégie Publicitaire',24,13),(297,'Créativité Publicitaire',25,13),(298,'Copywriting et Storytelling',26,13),(299,'Direction Artistique en Publicité',27,13),(300,'Média Planning',28,13),(301,'Publicité Digitale',29,13),(302,'Stratégie Événementielle',30,13),(303,'Logistique et Gestion d\'Événements',31,13),(304,'Communication Événementielle',4,13),(305,'Marketing Événementiel',5,13),(306,'Gestion des Partenariats et Sponsoring',6,13),(307,'Événements d\'Entreprise et Incentive',7,13),(308,'Analyse Financière',8,14),(309,'Gestion de Trésorerie',9,14),(310,'Évaluation d\'Entreprise',10,14),(311,'Gestion des Investissements',11,14),(312,'Risques et Contrôle Interne',12,14),(313,'Fusion et Acquisition',13,14),(314,'Comptabilité Approfondie',14,14),(315,'Fiscalité des Entreprises',15,14),(316,'Audit et Contrôle',16,14),(317,'Normes Comptables Internationales',17,14),(318,'Droit des Sociétés',18,14),(319,'Éthique et Déontologie Professionnelle',19,14),(320,'Pilotage et Tableau de Bord',20,14),(321,'Analyse des Coûts',21,14),(322,'Budget et Prévisions',22,14),(323,'Contrôle Budgétaire et Reporting',23,14),(324,'Systèmes d\'Information de Gestion',24,14),(325,'Performance et Indicateurs de Gestion',25,14),(326,'Principes de l\'Audit',26,14),(327,'Audit Interne et Contrôle',27,14),(328,'Audit des Systèmes d\'Information',28,14),(329,'Audit des États Financiers',29,14),(330,'Audit Juridique et Fiscal',30,14),(331,'Audit Opérationnel et Stratégique',31,14);
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_bac`
--

DROP TABLE IF EXISTS `post_bac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_bac` (
  `niveau` int(11) NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_bac`
--

LOCK TABLES `post_bac` WRITE;
/*!40000 ALTER TABLE `post_bac` DISABLE KEYS */;
INSERT INTO `post_bac` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `post_bac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `code_promotion` int(11) NOT NULL AUTO_INCREMENT,
  `nom_promotion` char(20) DEFAULT NULL,
  `code_ecole` int(11) DEFAULT NULL,
  `code_specialite` int(11) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_promotion`),
  KEY `code_ecole` (`code_ecole`),
  KEY `code_specialite` (`code_specialite`),
  KEY `niveau` (`niveau`),
  CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`code_ecole`) REFERENCES `ecole` (`code_ecole`),
  CONSTRAINT `promotion_ibfk_2` FOREIGN KEY (`code_specialite`) REFERENCES `specialite` (`code_specialite`),
  CONSTRAINT `promotion_ibfk_3` FOREIGN KEY (`niveau`) REFERENCES `post_bac` (`niveau`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'B1ESGI',1,NULL,1),(2,'B2ESGI',1,NULL,2),(3,'B3ESGI_AL',1,1,3),(4,'B3ESGI_SRC',1,2,3),(5,'B3ESGI_IW',1,3,3),(6,'B3ESGI_IABD',1,4,3),(7,'M1ESGI_AL',1,1,4),(8,'M1ESGI_SRC',1,2,4),(9,'M1ESGI_IW',1,3,4),(10,'M1ESGI_IABD',1,4,4),(11,'M2ESGI_AL',1,1,5),(12,'M2ESGI_SRC',1,2,5),(13,'M2ESGI_IW',1,3,5),(14,'M2ESGI_IABD',1,4,5),(15,'B1PPAS',2,NULL,1),(16,'B2PPAS',2,NULL,2),(17,'B3PPAS_MS',2,5,3),(18,'B3PPAS_MSP',2,6,3),(19,'B3PPAS_CS',2,7,3),(20,'B3PPAS_ES',2,8,3),(21,'M1PPAS_MS',2,5,4),(22,'M1PPAS_MSP',2,6,4),(23,'M1PPAS_CS',2,7,4),(24,'M1PPAS_ES',2,8,4),(25,'M2PPAS_MS',2,5,5),(26,'M2PPAS_MSP',2,6,5),(27,'M2PPAS_CS',2,7,5),(28,'M2PPAS_ES',2,8,5),(29,'B1PPA',3,NULL,1),(30,'B2PPA',3,NULL,2),(31,'B3PPA_GE',3,9,3),(32,'B3PPA_FE',3,10,3),(33,'B3PPA_MKT',3,11,3),(34,'B3PPA_RH',3,12,3),(35,'M1PPA_GE',3,9,4),(36,'M1PPA_FE',3,10,4),(37,'M1PPA_MKT',3,11,4),(38,'M1PPA_RH',3,12,4),(39,'M2PPA_GE',3,9,5),(40,'M2PPA_FE',3,10,5),(41,'M2PPA_MKT',3,11,5),(42,'M2PPA_RH',3,12,5),(43,'B1EFAB',4,NULL,1),(44,'B2EFAB',4,NULL,2),(45,'B3EFAB_GI',4,13,3),(46,'B3EFAB_TI',4,14,3),(47,'B3EFAB_EI',4,15,3),(48,'B3EFAB_UA',4,16,3),(49,'M1EFAB_GI',4,13,4),(50,'M1EFAB_TI',4,14,4),(51,'M1EFAB_EI',4,15,4),(52,'M1EFAB_UA',4,16,4),(53,'M2EFAB_GI',4,13,5),(54,'M2EFAB_TI',4,14,5),(55,'M2EFAB_EI',4,15,5),(56,'M2EFAB_UA',4,16,5),(57,'B1MTBS',5,NULL,1),(58,'B2MTBS',5,NULL,2),(59,'B3MTBS_COM',5,17,3),(60,'B3MTBS_DG',5,18,3),(61,'B3MTBS_AV',5,19,3),(62,'B3MTBS_MD',5,20,3),(63,'M1MTBS_COM',5,17,4),(64,'M1MTBS_DG',5,18,4),(65,'M1MTBS_AV',5,19,4),(66,'M1MTBS_MD',5,20,4),(67,'M2MTBS_COM',5,17,5),(68,'M2MTBS_DG',5,18,5),(69,'M2MTBS_AV',5,19,5),(70,'M2MTBS_MD',5,20,5),(71,'B1ESC',6,NULL,1),(72,'B2ESC',6,NULL,2),(73,'B3ESC_A3D',6,21,3),(74,'B3ESC_GD',6,22,3),(75,'B3ESC_DI',6,23,3),(76,'B3ESC_DP',6,24,3),(77,'M1ESC_A3D',6,21,4),(78,'M1ESC_GD',6,22,4),(79,'M1ESC_DI',6,23,4),(80,'M1ESC_DP',6,24,4),(81,'M2ESC_A3D',6,21,5),(82,'M2ESC_GD',6,22,5),(83,'M2ESC_DI',6,23,5),(84,'M2ESC_DP',6,24,5),(85,'B1ISA',7,NULL,1),(86,'B2ISA',7,NULL,2),(87,'B3ISA_RA',7,25,3),(88,'B3ISA_MPP',7,26,3),(89,'B3ISA_JA',7,27,3),(90,'B3ISA_PC',7,28,3),(91,'M1ISA_RA',7,25,4),(92,'M1ISA_MPP',7,26,4),(93,'M1ISA_JA',7,27,4),(94,'M1ISA_PC',7,28,4),(95,'M2ISA_RA',7,25,5),(96,'M2ISA_MPP',7,26,5),(97,'M2ISA_JA',7,27,5),(98,'M2ISA_PC',7,28,5),(99,'B1EIML',8,NULL,1),(100,'B2EIML',8,NULL,2),(101,'B3EIML_ML',8,29,3),(102,'B3EIML_MM',8,30,3),(103,'B3EIML_CL',8,31,3),(104,'B3EIML_DPL',8,32,3),(105,'M1EIML_ML',8,29,4),(106,'M1EIML_MM',8,30,4),(107,'M1EIML_CL',8,31,4),(108,'M1EIML_DPL',8,32,4),(109,'M2EIML_ML',8,29,5),(110,'M2EIML_MM',8,30,5),(111,'M2EIML_CL',8,31,5),(112,'M2EIML_DPL',8,32,5),(113,'B1MI',9,NULL,1),(114,'B2MI',9,NULL,2),(115,'B3MI_DM',9,33,3),(116,'B3MI_SM',9,34,3),(117,'B3MI_MM',9,35,3),(118,'B3MI_MMA',9,36,3),(119,'M1MI_DM',9,33,4),(120,'M1MI_SM',9,34,4),(121,'M1MI_MM',9,35,4),(122,'M1MI_MMA',9,36,4),(123,'M2MI_DM',9,33,5),(124,'M2MI_SM',9,34,5),(125,'M2MI_MM',9,35,5),(126,'M2MI_MMA',9,36,5),(127,'B1EDBS',10,NULL,1),(128,'B2EDBS',10,NULL,2),(129,'B3EDBS_MD',10,37,3),(130,'B3EDBS_EC',10,38,3),(131,'B3EDBS_DA',10,39,3),(132,'B3EDBS_SD',10,40,3),(133,'M1EDBS_MD',10,37,4),(134,'M1EDBS_EC',10,38,4),(135,'M1EDBS_DA',10,39,4),(136,'M1EDBS_SD',10,40,4),(137,'M2EDBS_MD',10,37,5),(138,'M2EDBS_EC',10,38,5),(139,'M2EDBS_DA',10,39,5),(140,'M2EDBS_SD',10,40,5),(141,'B1ICAN',11,NULL,1),(142,'B2ICAN',11,NULL,2),(143,'B3ICAN_DG',11,41,3),(144,'B3ICAN_A3D',11,42,3),(145,'B3ICAN_ES',11,43,3),(146,'B3ICAN_MD',11,44,3),(147,'M1ICAN_DG',11,41,4),(148,'M1ICAN_A3D',11,42,4),(149,'M1ICAN_ES',11,43,4),(150,'M1ICAN_MD',11,44,4),(151,'M2ICAN_DG',11,41,5),(152,'M2ICAN_A3D',11,42,5),(153,'M2ICAN_ES',11,43,5),(154,'M2ICAN_MD',11,44,5),(155,'B1ISFJ',12,NULL,1),(156,'B2ISFJ',12,NULL,2),(157,'B3ISFJ_JI',12,45,3),(158,'B3ISFJ_JC',12,46,3),(159,'B3ISFJ_JS',12,47,3),(160,'B3ISFJ_JIN',12,48,3),(161,'M1ISFJ_JI',12,45,4),(162,'M1ISFJ_JC',12,46,4),(163,'M1ISFJ_JS',12,47,4),(164,'M1ISFJ_JIN',12,48,4),(165,'M2ISFJ_JI',12,45,5),(166,'M2ISFJ_JC',12,46,5),(167,'M2ISFJ_JS',12,47,5),(168,'M2ISFJ_JIN',12,48,5),(169,'B1ESUPCOM',13,NULL,1),(170,'B2ESUPCOM',13,NULL,2),(171,'B3ESUPCOM_CG',13,49,3),(172,'B3ESUPCOM_RP',13,50,3),(173,'B3ESUPCOM_PUB',13,51,3),(174,'B3ESUPCOM_EVE',13,52,3),(175,'M1ESUPCOM_CG',13,49,4),(176,'M1ESUPCOM_RP',13,50,4),(177,'M1ESUPCOM_PUB',13,51,4),(178,'M1ESUPCOM_EVE',13,52,4),(179,'M2ESUPCOM_CG',13,49,5),(180,'M2ESUPCOM_RP',13,50,5),(181,'M2ESUPCOM_PUB',13,51,5),(182,'M2ESUPCOM_EVE',13,52,5),(183,'B1ENGDE',14,NULL,1),(184,'B2ENGDE',14,NULL,2),(185,'B3ENGDE_GF',14,53,3),(186,'B3ENGDE_EC',14,54,3),(187,'B3ENGDE_CG',14,55,3),(188,'B3ENGDE_AUD',14,56,3),(189,'M1ENGDE_GF',14,53,4),(190,'M1ENGDE_EC',14,54,4),(191,'M1ENGDE_CG',14,55,4),(192,'M1ENGDE_AUD',14,56,4),(193,'M2ENGDE_GF',14,53,5),(194,'M2ENGDE_EC',14,54,5),(195,'M2ENGDE_CG',14,55,5),(196,'M2ENGDE_AUD',14,56,5);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_utilisateur`
--

DROP TABLE IF EXISTS `role_utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_utilisateur` (
  `code_role` int(11) NOT NULL AUTO_INCREMENT,
  `nom_role` char(20) DEFAULT NULL,
  PRIMARY KEY (`code_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_utilisateur`
--

LOCK TABLES `role_utilisateur` WRITE;
/*!40000 ALTER TABLE `role_utilisateur` DISABLE KEYS */;
INSERT INTO `role_utilisateur` VALUES (1,'étudiant'),(2,'administratif'),(3,'intervenant');
/*!40000 ALTER TABLE `role_utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salle` (
  `num_salle` int(11) NOT NULL,
  `etage` int(11) DEFAULT NULL,
  `num_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_salle`),
  KEY `num_type` (`num_type`),
  CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`num_type`) REFERENCES `type_salle` (`num_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES (-102,-1,1),(-101,-1,1),(101,1,1),(102,1,1),(103,1,1),(104,1,1),(105,1,1),(106,1,1),(107,1,1),(108,1,5),(201,2,1),(202,2,1),(203,2,1),(204,2,1),(205,2,1),(206,2,1),(207,2,1),(301,3,1),(302,3,1),(303,3,1),(304,3,1),(305,3,1),(306,3,1),(307,3,1),(308,3,1),(309,3,1),(310,3,1),(311,3,1),(312,3,4),(401,4,1),(402,4,1),(403,4,1),(404,4,1),(405,4,1),(406,4,1),(407,4,1),(408,4,1),(409,4,1),(410,4,1),(411,4,1),(412,4,1),(413,4,1),(414,4,1),(415,4,1),(416,4,1),(417,4,1),(418,4,1),(501,5,1),(502,5,1),(503,5,1),(504,5,1),(505,5,1),(506,5,1),(507,5,1),(508,5,1),(509,5,1),(510,5,1),(511,5,1),(512,5,1),(513,5,1),(514,5,1),(601,6,4),(602,6,4),(603,6,4),(604,6,4),(605,6,4),(606,6,4),(607,6,4),(608,6,4),(609,6,4),(610,6,4),(611,6,1),(612,6,1),(613,6,1),(614,6,1),(701,7,1),(702,7,1),(703,7,4),(704,7,1),(705,7,4),(706,7,4),(707,7,4),(708,7,1),(709,7,1),(710,7,1),(711,7,1),(712,7,1),(713,7,1);
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialite` (
  `code_specialite` int(11) NOT NULL AUTO_INCREMENT,
  `nom_specialite` char(50) DEFAULT NULL,
  `acronyme_specialite` char(10) DEFAULT '-',
  `code_ecole` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_specialite`),
  KEY `code_ecole` (`code_ecole`),
  CONSTRAINT `specialite_ibfk_1` FOREIGN KEY (`code_ecole`) REFERENCES `ecole` (`code_ecole`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialite`
--

LOCK TABLES `specialite` WRITE;
/*!40000 ALTER TABLE `specialite` DISABLE KEYS */;
INSERT INTO `specialite` VALUES (1,'Architecture Logicielle','AL',1),(2,'Système Réseau et Cloud','SRC',1),(3,'Ingenierie du Web','IW',1),(4,'Intelligence Artificielle et Big Data','IABD',1),(5,'Management du Sport','MS',2),(6,'Marketing Sportif','MSp',2),(7,'Communication Sportive','CS',2),(8,'Evénementiel Sportif','ES',2),(9,'Gestion des Entreprises','GE',3),(10,'Finance dEntreprise','FE',3),(11,'Marketing','MKT',3),(12,'Ressources Humaines','RH',3),(13,'Gestion Immobilière','GI',4),(14,'Transaction Immobilière','TI',4),(15,'Expertise Immobilière','EI',4),(16,'Urbanisme et Aménagement','UA',4),(17,'Communication','Com',5),(18,'Design Graphique','DG',5),(19,'Audiovisuel','AV',5),(20,'Marketing Digital','MD',5),(21,'Animation 3D','A3D',6),(22,'Game Design','GD',6),(23,'Design dIntérieur','DI',6),(24,'Design de Produit','DP',6),(25,'Réalisation Audiovisuelle','RA',7),(26,'Montage et Post-Production','MPP',7),(27,'Journalisme Audiovisuel','JA',7),(28,'Production Cinématographique','PC',7),(29,'Marketing du Luxe','ML',8),(30,'Management de la Mode','MM',8),(31,'Communication de Luxe','CL',8),(32,'Design de Produits de Luxe','DPL',8),(33,'Design de Mode','DM',9),(34,'Stylisme et Modélisme','SM',9),(35,'Marketing de la Mode','MM',9),(36,'Management de Marque','MMA',9),(37,'Marketing Digital','MD',10),(38,'E-commerce','EC',10),(39,'Data Analytics','DA',10),(40,'Stratégie Digitale','SD',10),(41,'Design Graphique','DG',11),(42,'Animation 3D','A3D',11),(43,'Effets Spéciaux','ES',11),(44,'Motion Design','MD',11),(45,'Journalisme dInvestigation','JI',12),(46,'Journalisme Culturel','JC',12),(47,'Journalisme Sportif','JS',12),(48,'Journalisme International','JIN',12),(49,'Communication Globale','CG',13),(50,'Relations Publiques','RP',13),(51,'Publicité','Pub',13),(52,'Evénementiel','Eve',13),(53,'Gestion Financière','GF',14),(54,'Expertise Comptable','EC',14),(55,'Contrôle de Gestion','CG',14),(56,'Audit','Aud',14);
/*!40000 ALTER TABLE `specialite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_salle`
--

DROP TABLE IF EXISTS `type_salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_salle` (
  `num_type` int(11) NOT NULL AUTO_INCREMENT,
  `desc_type` char(20) DEFAULT NULL,
  PRIMARY KEY (`num_type`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_salle`
--

LOCK TABLES `type_salle` WRITE;
/*!40000 ALTER TABLE `type_salle` DISABLE KEYS */;
INSERT INTO `type_salle` VALUES (1,'salle de cours'),(2,'amphithéâtre'),(3,'distanciel'),(4,'bureau'),(5,'atelier');
/*!40000 ALTER TABLE `type_salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `code_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `mail` char(64) DEFAULT NULL,
  `chp_motPasSe_CY` char(64) DEFAULT NULL,
  `etu_nb_retard` int(11) DEFAULT NULL,
  `etu_nb_absence` int(11) DEFAULT NULL,
  `adm_service` char(30) DEFAULT NULL,
  `int_societe` char(30) DEFAULT NULL,
  `code_role` int(11) DEFAULT NULL,
  `code_droit` int(11) DEFAULT NULL,
  `code_promotion` int(11) DEFAULT NULL,
  `code_ecole` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_utilisateur`),
  KEY `code_role` (`code_role`),
  KEY `code_droit` (`code_droit`),
  KEY `code_promotion` (`code_promotion`),
  KEY `code_ecole` (`code_ecole`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`code_role`) REFERENCES `role_utilisateur` (`code_role`),
  CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`code_droit`) REFERENCES `droit` (`code_droit`),
  CONSTRAINT `utilisateur_ibfk_3` FOREIGN KEY (`code_promotion`) REFERENCES `promotion` (`code_promotion`),
  CONSTRAINT `utilisateur_ibfk_4` FOREIGN KEY (`code_ecole`) REFERENCES `ecole` (`code_ecole`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'Verstappen','Max','mverstappen@myges.fr','etu',0,0,NULL,NULL,1,1,1,1),(2,'Horner','Christian','chorner@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,1),(4,'Depp','Johny','jdepp@myges.fr','inter',NULL,NULL,NULL,'Pirate des caraibes',3,2,NULL,NULL),(5,'Marion','Cottillard','mcotillard@myges.fr','inter',NULL,NULL,NULL,'Rock n Roll',3,2,NULL,NULL),(6,'Guillaume','Canet','gcanet@myges.fr','inter',NULL,NULL,NULL,'Jappeloup',3,2,NULL,NULL),(7,'François','Cluzet','fcluzet@myges.fr','inter',NULL,NULL,NULL,'Ne le dis a personne',3,2,NULL,NULL),(8,'Gilles','Lellouche','glellouche@myges.fr','inter',NULL,NULL,NULL,'La french connection',3,2,NULL,NULL),(9,'Jean','Dujardin','jdujardin@myges.fr','inter',NULL,NULL,NULL,'Un balcon sur la mer',3,2,NULL,NULL),(10,'Jason','Statham','jstatham@myges.fr','inter',NULL,NULL,NULL,'Braquage a l\'anglaise',3,2,NULL,NULL),(11,'Lea','Seydoux','lseydoux@myges.fr','inter',NULL,NULL,NULL,'Spectre',3,2,NULL,NULL),(12,'Daniel','Graig','dcraig@myges.fr','inter',NULL,NULL,NULL,'Skyfall',3,2,NULL,NULL),(13,'Paul','Walker','pwalker@myges.fr','inter',NULL,NULL,NULL,'Tokyo drift',3,2,NULL,NULL),(14,'Rami','Mallek','rmallek@myges.fr','inter',NULL,NULL,NULL,'Bohemian Rhabsody',3,2,NULL,NULL),(15,'François','Damien','fdamien@myges.fr','inter',NULL,NULL,NULL,'Mon ket',3,2,NULL,NULL),(16,'Omar','Sy','osy@myges.fr','inter',NULL,NULL,NULL,'Intouchable',3,2,NULL,NULL),(17,'David','Marsai','dmarsai@myges.fr','inter',NULL,NULL,NULL,'Max et Leon',3,2,NULL,NULL),(18,'Silverstone','Stalone','sstalone@myges.fr','inter',NULL,NULL,NULL,'The Expandables',3,2,NULL,NULL),(19,'Will','Smith','wsmith@myges.fr','inter',NULL,NULL,NULL,'Bad Boy',3,2,NULL,NULL),(20,'Matt','Damon','mdamon@myges.fr','inter',NULL,NULL,NULL,'Seul sur Mars',3,2,NULL,NULL),(21,'Steven','Seagal','sseagal@myges.fr','inter',NULL,NULL,NULL,'L arme fatale',3,2,NULL,NULL),(22,'Bruce','Lee','blee@myges.fr','inter',NULL,NULL,NULL,'La fureur du dragon',3,2,NULL,NULL),(23,'Jackie','Chan','jchan@myges.fr','inter',NULL,NULL,NULL,'Rush Hour',3,2,NULL,NULL),(24,'Samuel','Eljackson','seljackson@myges.fr','inter',NULL,NULL,NULL,'Star Wars',3,2,NULL,NULL),(25,'Keanu','Rees','krees@myges.fr','inter',NULL,NULL,NULL,'Matrix',3,2,NULL,NULL),(26,'Tom','Holland','tholland@myges.fr','inter',NULL,NULL,NULL,'Spider Man',3,2,NULL,NULL),(27,'Jessica','Chastain','jchastain@myges.fr','inter',NULL,NULL,NULL,'Interstellar',3,2,NULL,NULL),(28,'Ken','Samura','kamura@myges.fr','inter',NULL,NULL,NULL,'Les étoiles vagabondes',3,2,NULL,NULL),(29,'Catherine','Deneuve','cdeneuve@myges.fr','inter',NULL,NULL,NULL,'Mauvaise herbes',3,2,NULL,NULL),(30,'François','Civil','fcivil@myges.fr','inter',NULL,NULL,NULL,'Le chant du loup',3,2,NULL,NULL),(31,'Virginie','Efira','vefira@myges.fr','inter',NULL,NULL,NULL,'Benedetta',3,2,NULL,NULL),(32,'Leclerc','Charles','cleclerc@myges.fr','etu',0,0,NULL,NULL,1,1,1,1),(33,'Norris','Lando','lnorris@myges.fr','etu',0,0,NULL,NULL,1,1,1,1),(34,'Vattanen','Harry','hvatannen@myges.fr','etu',0,0,NULL,NULL,1,1,2,1),(35,'Raikonnen','Kimi','kraikonnen@myges.fr','etu',0,0,NULL,NULL,1,1,2,1),(36,'Vettel','Sebastian','svettel@myges.fr','etu',0,0,NULL,NULL,1,1,2,1),(37,'Prost','Alain','aprost@myges.fr','etu',0,0,NULL,NULL,1,1,3,1),(38,'Hamilton','Lewis','lhamilton@myges.fr','etu',0,0,NULL,NULL,1,1,3,1),(39,'Giovinazzi','Antonio','agiovinazzi@myges.fr','etu',0,0,NULL,NULL,1,1,3,1),(40,'Kvyat','Danil','dkvyat@myges.fr','etu',0,0,NULL,NULL,1,1,4,1),(41,'Mazepin','Nikita','nmazepin@myges.fr','etu',0,0,NULL,NULL,1,1,4,1),(42,'Nasr','Felipe','fnasr@myges.fr','etu',0,0,NULL,NULL,1,1,4,1),(43,'Alonso','Ferando','falonso@myges.fr','etu',0,0,NULL,NULL,1,1,5,1),(44,'Sainz','Carlos','csainz@myges.fr','etu',0,0,NULL,NULL,1,1,5,1),(45,'Vandoorne','Stoffel','svandoorne@myges.fr','etu',0,0,NULL,NULL,1,1,5,1),(46,'Ickx','Jacky','jyckx@myges.fr','etu',0,0,NULL,NULL,1,1,6,1),(47,'Senna','Ayrton','asenna@myges.fr','etu',0,0,NULL,NULL,1,1,6,1),(48,'Ocon','Esteban','svettel@myges.fr','etu',0,0,NULL,NULL,1,1,6,1),(49,'Russel','Georges','grussel@myges.fr','etu',0,0,NULL,NULL,1,1,7,1),(50,'Hulkenberg','Nico','nhulkenberg@myges.fr','etu',0,0,NULL,NULL,1,1,7,1),(51,'Schumacher','Mick','mschumacher','etu',0,0,NULL,NULL,1,1,7,1),(52,'Rosberg','Nico','nrosberg@myges.fr','etu',0,0,NULL,NULL,1,1,8,1),(53,'Erricson','Marcus','merricson@myges.fr','etu',0,0,NULL,NULL,1,1,8,1),(54,'Ricciardo','Daniel','dricciardo@myges.fr','etu',0,0,NULL,NULL,1,1,8,1),(55,'Webber','Marc','mwebber@myges.fr','etu',0,0,NULL,NULL,1,1,9,1),(56,'Piastri','Oscar','opiastri@myges.fr','etu',0,0,NULL,NULL,1,1,9,1),(57,'Gasly','Pierre','pgasly@myges.fr','etu',0,0,NULL,NULL,1,1,9,1),(58,'Grosjean','Romain','rgrosjean@myges.fr','etu',0,0,NULL,NULL,1,1,10,1),(59,'Pourchaire','Thibault','tpourchaire@myges.fr','etu',0,0,NULL,NULL,1,1,10,1),(60,'Loeb','Sebastian','sloeb@myges.fr','etu',0,0,NULL,NULL,1,1,10,1),(61,'Sargeant','Logan','lsargeant@myges.fr','etu',0,0,NULL,NULL,1,1,11,1),(62,'Latifi','Nicolas','llatifi@myges.fr','etu',0,0,NULL,NULL,1,1,11,1),(63,'Stroll','Lance','lstroll@myges.fr','etu',0,0,NULL,NULL,1,1,11,1),(64,'Chiron','Louis','lchiron@myges.fr','etu',0,0,NULL,NULL,1,1,12,1),(65,'Ascari','Pietro','pascai@myges.fr','etu',0,0,NULL,NULL,1,1,12,1),(66,'Helena','Daniel','dhelena@myges.fr','etu',0,0,NULL,NULL,1,1,12,1),(67,'Tsunoda','Yuki','ytsunoda@myges.fr','etu',0,0,NULL,NULL,1,1,13,1),(68,'Kobayashi','Kamui','kkobayashi@myges.fr','etu',0,0,NULL,NULL,1,1,13,1),(69,'Kubica','Robert','rkubica@myges.fr','etu',0,0,NULL,NULL,1,1,13,1),(70,'Villeneuve','Gilles','gvilleneuve@myges.fr','etu',0,0,NULL,NULL,1,1,14,1),(71,'Rossi','Valentino','vrossi@myges.fr','etu',0,0,NULL,NULL,1,1,14,1),(72,'Quartararo','Fabio','fquartararo@myges.fr','etu',0,0,NULL,NULL,1,1,14,1),(73,'DeVries','Nick','ndevries@myges.fr','etu',0,0,NULL,NULL,1,1,15,2),(74,'Abecassis','Georges','gabecassis@myges.fr','etu',0,0,NULL,NULL,1,1,15,2),(75,'Acheson','Kenny','kacheson@myges.fr','etu',0,0,NULL,NULL,1,1,15,2),(76,'Adams','Philippe','padams@myges.fr','etu',0,0,NULL,NULL,1,1,16,2),(77,'Ader','Walt','wader@myges.fr','etu',0,0,NULL,NULL,1,1,16,2),(78,'Kurt','Adolff','akurt@myges.fr','etu',0,0,NULL,NULL,1,1,16,2),(79,'Agabashian','Fred','fagabashian@myges.fr','etu',0,0,NULL,NULL,1,1,17,2),(80,'Ahrens','Kurt','kahrens@myges.fr','etu',0,0,NULL,NULL,1,1,17,2),(81,'Aitken','Jack','jaitken@myges.fr','etu',0,0,NULL,NULL,1,1,17,2),(82,'Albert','Christian','calbert@myges.fr','etu',0,0,NULL,NULL,1,1,18,2),(83,'Albon','Alexander','aalbon@myges.fr','etu',0,0,NULL,NULL,1,1,18,2),(84,'Alboreto','Michele','malboreto@myges.fr','etu',0,0,NULL,NULL,1,1,18,2),(85,'Alesi','Jean','jalesi@myges.fr','etu',0,0,NULL,NULL,1,1,19,2),(86,'Alliot','Philippe','palliot@myges.fr','etu',0,0,NULL,NULL,1,1,19,2),(87,'Allison','Cliff','acliff@myges.fr','etu',0,0,NULL,NULL,1,1,19,2),(88,'Amick','Georges','gamick@myges.fr','etu',0,0,NULL,NULL,1,1,20,2),(89,'Amick','Red','ramick@myges.fr','etu',0,0,NULL,NULL,1,1,20,2),(90,'Amon','Christ','camon@myges.fr','etu',0,0,NULL,NULL,1,1,20,2),(91,'Anderson','Bob','banderson@myges.fr','etu',0,0,NULL,NULL,1,1,21,2),(92,'Anderson','Conny','ramick@myges.fr','etu',0,0,NULL,NULL,1,1,21,2),(93,'Andretti','Mario','mandretti@myges.fr','etu',0,0,NULL,NULL,1,1,21,2),(94,'Andretti','Michael','mandretti@myges.fr','etu',0,0,NULL,NULL,1,1,22,2),(95,'Andrews','Keith','kandrews@myges.fr','etu',0,0,NULL,NULL,1,1,22,2),(96,'Apicella','Marco','mapicella@myges.fr','etu',0,0,NULL,NULL,1,1,22,2),(97,'Army','Franck','farmy@myges.fr','etu',0,0,NULL,NULL,1,1,23,2),(98,'Arnold','Chuck','carnold@myges.fr','etu',0,0,NULL,NULL,1,1,23,2),(99,'Arnoux','René','rarnoux@myges.fr','etu',0,0,NULL,NULL,1,1,23,2),(100,'Belmondo','Paul','pbelmondo@myges.fr','etu',0,0,NULL,NULL,1,1,24,2),(101,'Berg','Allen','aberg@myges.fr','etu',0,0,NULL,NULL,1,1,24,2),(102,'Gerhart','Berger','gberger@myges.fr','etu',0,0,NULL,NULL,1,1,24,2),(103,'Vasseur','Fred','fvasseur@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,2),(104,'Binoto','Matia','mbinoto@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,3),(105,'Steiner','Ghunter','gsteiner@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,4),(106,'Williams','Frank','fwilliams@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,5),(107,'Tost','Frantz','ftost@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,6),(108,'Wolf','Toto','twolf@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,7),(109,'Mclaren','Bruce','bmclaren@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,8),(110,'Krack','Mike','mkrack@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,9),(111,'Brawn','Ross','rbrawn@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,10),(112,'Newey','Adrian','anewey@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,11),(113,'Alison','James','jalison@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,12),(114,'Seidl','Andreas','aseidl@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,13),(115,'Vowles','James','jvowles@myges.fr','admin',NULL,NULL,'Responsable Pédagogique',NULL,2,3,NULL,14),(116,'Lenard','Pillip','plenard@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,1),(117,'Henry','William','hwilliam@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,2),(118,'Rolland','Romain','rrolland@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,3),(119,'Haber','Fritz','fhaber@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,4),(120,'Barany','Robert','rbarany@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,5),(121,'Urey','Arnold','aurey@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,6),(122,'Spemann','Hans','hspemann@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,7),(123,'Debye','Peter','pdebye@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,8),(124,'Francis','Victor','vfrancis@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,9),(125,'Cori','Gerty','cgerty@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,10),(126,'Giauque','William','gwilliam@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,11),(127,'Hull','Cordel','hcordell@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,12),(128,'Born','Max','mborn@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,13),(129,'Vigneaud','Vincent','vvigneaud@myges.fr','admin',NULL,NULL,'Attaché de promotion',NULL,2,5,NULL,14);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'signature'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-12 22:33:29
