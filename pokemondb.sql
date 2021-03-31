-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pokemondatabase
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `ability`
--

DROP TABLE IF EXISTS `ability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ability` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ability` varchar(50) DEFAULT NULL,
  `MoTa` varchar(500) DEFAULT NULL,
  `Generation` int DEFAULT NULL,
  `MoTaChiTiet` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Ability_Generation` (`Generation`),
  CONSTRAINT `FK_Ability_Generation` FOREIGN KEY (`Generation`) REFERENCES `generation` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ability`
--

LOCK TABLES `ability` WRITE;
/*!40000 ALTER TABLE `ability` DISABLE KEYS */;
INSERT INTO `ability` VALUES (1,'Overgrow','Tăng sát thương cho kỹ năng hệ Grass',3,'Overgrow tăng sát thương của các kỹ năng hệ Grass lên 50%(x1.5) khi Pokemon sở hữu ability này còn ít hơn 1/3 HP tối đa'),(2,'Chlorophyll','Tăng Speed cho pokemon khi trời nắng',3,'Chlorophyll tăng gấp đôi tốc độ của pokemon khi trời nắng'),(3,'Blaze','Tăng sát thương cho kỹ năng hệ Fire',3,'Blaze tăng sát thương của các kỹ năng hệ Fire lên 50%(x1.5) khi Pokemon sở hữu ability này còn ít hơn 1/3 HP tối đa'),(4,'Solar Power','Khi trời nắng tăng SpAtk cho pokemon nhưng giảm HP',3,'Khi trời nắng, Solar Power tăng spAtk của pokemon lên 50% nhưng đồng thời mất 1/8 HP tối đa mỗi lượt'),(5,'Torrent','Tăng sát thương cho kỹ năng hệ Water',3,'Torrent tăng sát thương của các kỹ năng hệ Water lên 50%(x1.5) khi Pokemon sở hữu ability này còn ít hơn 1/3 HP tối đa'),(6,'Rain Dish','Pokemon được hồi phục HP khi trời mưa',3,'Pokemon với Rain Dish sẽ được hồi phục 1/16 HP tối đa mỗi lượt khi trời mưa'),(7,'Shield Dust','Loại bỏ hiệu ứng đi kèm của các đòn tấn công',3,NULL),(8,'Shed Skin','Loại bỏ các trạng thái có hại',3,NULL),(9,'Compound Eyes','Tăng chính xác',3,NULL),(10,'Tinted Lens','Tăng sát thương cho các kỹ năng \"not effective\"',3,NULL),(11,'Swarm','Tăng sát thương cho kỹ năng hệ Bug',3,NULL),(12,'Sniper','Tăng sát thương cho kỹ năng nếu chí mạng',3,NULL),(13,'Tough Claws','Tăng sát thương cho kỹ năng tấn công chạm vào đối thủ',6,'Tough Claw tăng sát thương cho các kĩ năng chạm vào đối thủ. Hầu hết các kỹ năng Physical đều chạm vào đối thủ'),(14,'Thick Fat','Giảm sát thương nhận vào từ kỹ năng hệ Ice hoặc Fire',6,'Thick Fat giảm sát thương nhận vào từ các kỹ năng hệ Fire hoặc Ice đi 50%. Tất nhiên các Pokemon sở hữu ability này cũng có tác dụng đồng thời với giảm sát thương từ chính Hệ của nó. Ví dụ như 1 con Dewgong với Thick Fat chỉ nhận 1/8 sát thương từ kỹ năng hệ Ice'),(15,'Mega Launcher','Tăng sát thương của các kỹ năng \"aura\" hoặc \"pulse\"',6,'Mega Launcher tăng sát thương cho các kỹ năng \"aura\" hoặc \"pulse\" lên 50%. Đặc biệt kỹ năng Heal Pulse sẽ tăng lượng HP hồi phục lên 50%'),(16,'Drought','Thời tiết chuyển nắng khi pokemon xuất hiện',3,'Drought tạo trời nắng khi Pokemon sở hữu xuất hiện. Hiệu ứng kéo dài trong 5 lượt trừ khi bị hoá giải bởi Air Lock hoặc Cloud Nine hoặc bị thay thế bởi hiệu ứng thời tiết khác. Nếu có nhiều Pokemon thay đối thời tiết xuất hiện cùng lúc, hiệu ứng thời tiết sẽ là của Pokemon có tốc độ chậm nhất ( tức là xuất hiện sau cùng)'),(17,'Run Away','Chạy trốn khỏi pokemon hoang dã',3,NULL),(18,'Adaptability','Tăng sát thương cho kỹ năng cùng hệ',3,NULL),(19,'Tanged Feet','Tăng né tránh khi pokemon bị choáng váng',3,NULL),(20,'Big Pecks','Pokemon không bị ảnh hưởng bởi các kỹ năng làm giảm chỉ số Defense',3,NULL),(21,'Keen Eye','Pokemon không bị ảnh hưởng bởi các kỹ năng làm giảm chính xác',3,NULL),(22,'Guts','Tăng chỉ số Attack cho pokemon khi bị trúng các hiệu ứng trạng thái',3,NULL),(23,'Hustle','Tăng chỉ số Attack nhưng giảm chính xác',3,NULL),(24,'No Guard','Đảm bảo tất cả đòn tất công không thể bị tránh né',3,NULL),(25,'Intimidate','Giảm chỉ số tấn công của đối thủ',3,NULL),(26,'Unnerve','Làm kẻ địch lo lắng và không thể sử dụng berries',3,NULL),(27,'Synchronize','Chuyển trạng thái bỏng, trúng độc hoặc tê liệt cho đối thủ',3,NULL),(28,'Inner Focus','Bảo vệ Pokemon khỏi trạng thái trói buộc',3,NULL),(29,'Magic Guard','Bảo vệ Pokemon khỏi những sát thương gián tiếp',3,NULL),(30,'Trace','Pokemon có khả năng sao chép ability từ đối thủ',3,NULL),(31,'Leviate','Pokemon miễn nhiễm với các đòn đánh hệ Ground',3,NULL),(32,'Curse Body','Có khả năng vô hiệu hoá kỹ năng của đối thủ',3,NULL),(33,'Shadow Tag','Ngăn chặn kẻ địch chạy trốn',3,NULL),(34,'Moxie','Tăng chỉ số Atk khi hạ gục 1 Pokemon',3,NULL),(35,'Mold Breaker','Loại bỏ sự ảnh hưởng của ability trong mối tương quan giữa các hệ',3,NULL),(36,'Rock Head','Bảo vệ Pokemon khỏi sát thương phản lại',3,NULL),(37,'Pressure','Tăng PP sử dụng mỗi kỹ năng của kẻ địch',3,NULL),(38,'Snow Cloak','Tăng tỉ lệ né đòn trong môi trường thời tiết bão',3,NULL),(39,'Static','Tấn công Pokemon sở hữu ability này có tỉ lệ bị tê liệt',3,NULL),(40,'Flame Body','Tấn công Pokemon sở hữu ability này có tỉ lệ bị bỏng',3,NULL),(41,'Berserk','Tăng Special Atk khi HP giảm xuống dưới 1 nửa',3,NULL);
/*!40000 ALTER TABLE `ability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `QuestionID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Answer` blob,
  `NgayTao` varchar(50) DEFAULT NULL,
  `vote` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Answer_UserID` (`UserID`),
  KEY `FK_Answer_Question` (`QuestionID`),
  CONSTRAINT `FK_Answer_Question` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`Id`),
  CONSTRAINT `FK_Answer_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,1,2,_binary '<p>best for Charizard</p>\r\n\r\n<p>- 252 spAtk</p>\r\n\r\n<p>- 252 spd</p>\r\n\r\n<p>Nature : Timid</p>\r\n','2021-03-22',0),(2,1,2,_binary '<p>Charizard l&ecirc;n Mega X chơi damage vật l&yacute; &ocirc;ng ơi, 252 atk 252 spd, nature jolly</p>\r\n','2021-03-23',0),(4,1,2,_binary '<p>Charizard with Dragon Claw is imbalanced</p>\r\n','2021-03-24',0),(5,7,7,_binary '<p>bạn c&oacute; thể xem ở đ&acirc;y :&nbsp;<a href=\"https://pokemon-planet.fandom.com/wiki/Kanto_Walkthrough#Route_23\">Kanto Walkthrough | Pokemon Planet Wikia | Fandom</a></p>\r\n','2021-03-24',0),(6,13,2,_binary '<p>dạ v&acirc;ng ạ</p>\r\n','25/03/2021 12:03:45',0),(7,14,1,_binary '<p>test</p>\r\n','26/03/2021 09:38:43',NULL),(8,14,1,_binary '<p>demo</p>\r\n','26/03/2021 09:39:51',NULL),(9,15,1,_binary '<p>chắc chắn l&agrave; kh&ocirc;ng, đ&oacute; l&agrave; t&iacute;nh năng của thế hệ 6, cũng như Z-moves của thế hệ 7, dynamax&amp;gigatamax của thế hệ 8</p>\r\n\r\n<p>thế hệ 9 sẽ ra mắt t&iacute;nh năng mới&nbsp;</p>\r\n','30/03/2021 00:31:01',NULL);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answervote`
--

DROP TABLE IF EXISTS `answervote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answervote` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AnswerID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `isVote` tinyint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_AnswerVote_Answer` (`AnswerID`),
  KEY `FK_AnswerVote_User` (`UserID`),
  CONSTRAINT `FK_AnswerVote_Answer` FOREIGN KEY (`AnswerID`) REFERENCES `answer` (`Id`),
  CONSTRAINT `FK_AnswerVote_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answervote`
--

LOCK TABLES `answervote` WRITE;
/*!40000 ALTER TABLE `answervote` DISABLE KEYS */;
/*!40000 ALTER TABLE `answervote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleID` int DEFAULT NULL,
  `PermissionID` int DEFAULT NULL,
  `XemDanhSach` tinyint DEFAULT NULL,
  `Sua` tinyint DEFAULT NULL,
  `Xoa` tinyint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_RoleID_Role` (`RoleID`),
  KEY `FK_PermissionID_Permission` (`PermissionID`),
  CONSTRAINT `FK_PermissionID_Permission` FOREIGN KEY (`PermissionID`) REFERENCES `permission` (`Id`),
  CONSTRAINT `FK_RoleID_Role` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,1,1,1,1,1),(2,1,2,1,1,1),(3,1,3,1,1,1),(4,1,4,1,1,1),(5,1,5,1,1,1),(6,2,2,1,0,0),(7,2,3,1,1,1),(8,2,4,1,1,1),(10,4,2,1,1,1),(14,4,5,1,1,1),(15,1,6,1,1,1),(19,1,7,0,0,0),(27,1,11,0,0,0),(31,1,12,0,0,0),(32,1,9,0,0,0),(34,1,8,0,0,0),(38,1,10,0,0,0),(39,1,14,0,0,0),(40,1,13,0,0,0),(41,1,15,0,0,0);
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evolution`
--

DROP TABLE IF EXISTS `evolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evolution` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `pkm1` int DEFAULT NULL,
  `required1` varchar(100) DEFAULT NULL,
  `pkm2` int DEFAULT NULL,
  `Required2` varchar(100) DEFAULT NULL,
  `pkm3` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_pkm1_Pokemon` (`pkm1`),
  KEY `FK_pkm2_Pokemon` (`pkm2`),
  KEY `FK_pkm3_Pokemon` (`pkm3`),
  CONSTRAINT `FK_pkm1_Pokemon` FOREIGN KEY (`pkm1`) REFERENCES `pokemon` (`Id`),
  CONSTRAINT `FK_pkm2_Pokemon` FOREIGN KEY (`pkm2`) REFERENCES `pokemon` (`Id`),
  CONSTRAINT `FK_pkm3_Pokemon` FOREIGN KEY (`pkm3`) REFERENCES `pokemon` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolution`
--

LOCK TABLES `evolution` WRITE;
/*!40000 ALTER TABLE `evolution` DISABLE KEYS */;
INSERT INTO `evolution` VALUES (1,1,'Level 16',2,'Level 32',3),(2,4,'Level 16',5,'Level 36',6),(3,7,'Level 16',8,'Level 36',9),(4,10,'Level 7',11,'Level 10',12),(5,13,'Level 7',14,'Level 10',15);
/*!40000 ALTER TABLE `evolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Form` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `PokemonID` int DEFAULT NULL,
  `HP` int DEFAULT NULL,
  `Attack` int DEFAULT NULL,
  `Def` int DEFAULT NULL,
  `SpAtk` int DEFAULT NULL,
  `SpDef` int DEFAULT NULL,
  `Speed` int DEFAULT NULL,
  `TypeID1` int DEFAULT NULL,
  `TypeID2` int DEFAULT NULL,
  `FormType` int DEFAULT NULL,
  `Icon` varchar(100) DEFAULT NULL,
  `NormalImg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Form_PkmType` (`TypeID1`),
  KEY `FK_Form_PkmType2` (`TypeID2`),
  KEY `FK_Form_FormType` (`FormType`),
  KEY `FK_Form_Pokemon` (`PokemonID`),
  CONSTRAINT `FK_Form_FormType` FOREIGN KEY (`FormType`) REFERENCES `formtype` (`Id`),
  CONSTRAINT `FK_Form_PkmType` FOREIGN KEY (`TypeID1`) REFERENCES `pkmtype` (`TypeId`),
  CONSTRAINT `FK_Form_PkmType2` FOREIGN KEY (`TypeID2`) REFERENCES `pkmtype` (`TypeId`),
  CONSTRAINT `FK_Form_Pokemon` FOREIGN KEY (`PokemonID`) REFERENCES `pokemon` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (1,'Charizard','charizard.jpg',6,78,84,78,109,85,100,2,10,1,'charizard.png','charizard.png'),(2,'Mega Charizard X','charizard-mega-x.jpg',6,78,130,111,130,85,100,2,15,2,'charizard-mega-x.png',NULL),(3,'Mega Charizard Y','charizard-mega-y.jpg',6,78,104,78,159,115,100,2,10,2,'charizard-mega-y.png',NULL),(4,'Venusaur','venusaur.jpg',3,80,82,83,100,100,80,5,8,1,'venusaur.png','venusaur.png'),(5,'Mega Venusaur','venusaur-mega.jpg',3,80,100,123,122,120,80,5,8,2,'venusaur-mega.png',NULL),(6,'Blastoise','blastoise.jpg',9,79,83,100,85,105,78,3,0,1,'blastoise.png','blastoise.png'),(7,'Mega Blastoise','blastoise-mega.jpg',9,79,103,120,135,115,78,3,0,2,'blastoise-mega.png',NULL),(8,'Bulbasaur','bulbasaur.jpg',1,45,49,49,65,65,45,5,8,1,'bulbasaur.png','bulbasaur.png'),(9,'Ivysaur','ivysaur.jpg',2,60,62,63,80,80,60,5,8,1,'ivysaur.png','ivysaur.png'),(10,'Charmander','charmander.jpg',4,39,52,43,60,50,65,2,0,1,'charmander.png','charmander.png'),(11,'Charmeleon','charmeleon.jpg',5,58,64,58,80,65,80,2,0,1,'charmeleon.png','charmeleon.png'),(12,'Squirtle','squirtle.jpg',7,44,48,65,50,64,43,3,0,1,'squirtle.png','squirtle.png'),(13,'Wartortle','wartortle.jpg',8,59,63,80,65,80,58,3,0,1,'wartortle.png','wartortle.png'),(14,'Caterpie','caterpie.jpg',10,45,30,35,20,20,45,12,0,1,'caterpie.png','caterpie.png'),(15,'Metapod','metapod.jpg',11,50,20,55,25,25,30,12,0,1,'metapod.png','metapod.png'),(16,'Butterfree','butterfree.jpg',12,60,45,50,90,80,70,12,10,1,'butterfree.png','butterfree.png'),(17,'Weedle','weedle.jpg',13,40,35,30,20,20,50,12,8,1,'weedle.png','weedle.png'),(18,'Kakuna','kakuna.jpg',14,45,25,50,25,25,35,12,8,1,'kakuna.png','kakuna.png'),(19,'Beedrill','beedrill.jpg',15,65,90,40,45,80,75,12,8,1,'beedrill.png','beedrill.png'),(20,'Mega Beedrill','beedrill-mega.jpg',15,65,150,40,15,80,145,12,8,2,'beedrill-mega.png','beedrill-mega.png'),(21,'Pidgey','pidgey.jpg',16,40,45,40,35,35,56,1,10,1,'pidgey.png','pidgey.png'),(22,'Pidgeotto','pidgeotto.jpg',17,63,60,55,50,50,71,1,10,1,'pidgeotto.png','pidgeotto.png'),(23,'Pidgeot','pidgeot.jpg',18,83,80,75,70,70,101,1,10,1,'pidgeot.png','pidgeot.png'),(24,'Mega Pidgeot','pidgeot-mega.jpg',18,83,80,80,135,80,121,1,10,2,'pidgeot-mega.png','pidgeot-mega.png'),(25,'Rattata','rattata.jpg',19,30,56,35,25,35,72,1,0,1,'rattata.png','rattata.png'),(26,'Raticate','raticate.jpg',20,55,81,60,50,70,97,1,0,1,'raticate.png','raticate.png'),(27,'Spearow','spearow.jpg',21,40,60,30,31,31,70,1,10,1,'spearow.png','spearow.png'),(28,'Fearow','fearow.jpg',22,65,90,65,61,61,100,1,10,1,'fearow.png','fearow.png'),(29,'Ekans','ekans.jpg',23,35,60,44,40,54,55,8,0,1,'ekans.png','ekans.png'),(30,'Arbok','arbok.jpg',24,60,95,69,65,79,80,8,0,1,'arbok.png','arbok.png'),(31,'Pikachu','pikachu.jpg',25,35,55,40,50,50,90,4,0,1,'pikachu.png','pikachu.png'),(32,'Raichu','raichu.jpg',26,60,90,55,90,80,110,4,0,1,'raichu.png','raichu.png'),(33,'Sandshrew','sandshrew.jpg',27,50,75,85,20,30,40,9,0,1,'sandshrew.png','sandshrew.png'),(34,'Sandslash','sandslash.jpg',28,75,100,110,45,55,65,9,0,1,'sandslash.png','sandslash.png'),(35,'Nidoran♀','nidoran-f.jpg',29,55,47,52,40,40,41,8,0,1,'nidoran-f.png','nidoran-f.png'),(36,'Nidorina','nidorina.jpg',30,70,62,67,55,55,56,8,0,1,'nidorina.png','nidorina.png'),(37,'Nidoqueen','nidoqueen.jpg',31,90,92,87,75,85,76,8,9,1,'nidoqueen.png','nidoqueen.png'),(38,'Nidoran♂','nidoran-m.jpg',32,46,57,40,40,40,50,8,0,1,'nidoran-m.png','nidoran-m.png'),(39,'Nidorino','nidorino.jpg',33,61,72,57,55,55,65,8,0,1,'nidorino.png','nidorino.png'),(40,'Nidoking','nidoking.jpg',34,81,102,77,85,75,85,8,9,1,'nidoking.png','nidoking.png'),(41,'Clefairy','clefairy.jpg',35,70,45,48,60,65,35,18,0,1,'clefairy.png','clefairy.png'),(42,'Clefable','clefable.jpg',36,95,70,73,95,90,60,18,0,1,'clefable.png','clefable.png'),(43,'Vulpix','vulpix.jpg',37,38,41,40,50,65,65,2,0,1,'vulpix.png','vulpix.png'),(44,'Ninetales','ninetales.jpg',38,73,76,75,81,100,100,2,0,1,'ninetales.png','ninetales.png'),(45,'Jigglypuff','jigglypuff.jpg',39,115,45,20,45,25,20,1,18,1,'jigglypuff.png','jigglypuff.png'),(46,'Wigglytuff','wigglytuff.jpg',40,140,70,45,85,50,45,1,18,1,'wigglytuff.png','wigglytuff.png'),(47,'Zubat','zubat.jpg',41,40,45,35,30,40,55,8,10,1,'zubat.png','zubat.png'),(48,'Golbat','golbat.jpg',42,75,80,70,65,75,90,8,10,1,'golbat.png','golbat.png'),(49,'Oddish','oddish.jpg',43,45,50,55,75,65,30,5,8,1,'oddish.png','oddish.png'),(50,'Gloom','gloom.jpg',44,60,65,70,85,75,40,5,8,1,'gloom.png','gloom.png'),(51,'Vileplume','vileplume.jpg',45,75,80,85,110,90,50,5,8,1,'vileplume.png','vileplume.png'),(52,'Paras','paras.jpg',46,35,70,55,45,55,25,12,5,1,'paras.png','paras.png'),(53,'Parasect','parasect.jpg',47,60,95,80,60,80,30,12,5,1,'parasect.png','parasect.png'),(54,'Venonat','venonat.jpg',48,60,55,50,40,55,45,12,8,1,'venonat.png','venonat.png'),(55,'Venomoth','venomoth.jpg',49,70,65,60,90,75,90,12,8,1,'venomoth.png','venomoth.png'),(56,'Diglett','diglett.jpg',50,10,55,25,35,45,95,9,0,1,'diglett.png','diglett.png'),(57,'Dugtrio','dugtrio.jpg',51,35,100,50,50,70,120,9,0,1,'dugtrio.png','dugtrio.png'),(58,'Meowth','meowth.jpg',52,40,45,35,40,40,90,1,0,1,'meowth.png','meowth.png'),(59,'Persian','persian.jpg',53,65,70,60,65,65,115,1,0,1,'persian.png','persian.png'),(60,'Psyduck','psyduck.jpg',54,50,52,48,65,50,55,3,0,1,'psyduck.png','psyduck.png'),(61,'Golduck','golduck.jpg',55,80,82,78,95,80,85,3,0,1,'golduck.png','golduck.png'),(62,'Mankey','mankey.jpg',56,40,80,35,35,45,70,7,0,1,'mankey.png','mankey.png'),(63,'Primeape','primeape.jpg',57,65,105,60,60,70,95,7,0,1,'primeape.png','primeape.png'),(64,'Growlithe','growlithe.jpg',58,55,70,45,70,50,60,2,0,1,'growlithe.png','growlithe.png'),(65,'Arcanine','arcanine.jpg',59,90,110,80,100,80,95,2,0,1,'arcanine.png','arcanine.png'),(66,'Poliwag','poliwag.jpg',60,40,50,40,40,40,90,3,0,1,'poliwag.png','poliwag.png'),(67,'Poliwhirl','poliwhirl.jpg',61,65,65,65,50,50,90,3,0,1,'poliwhirl.png','poliwhirl.png'),(68,'Poliwrath','poliwrath.jpg',62,90,95,95,70,90,70,3,7,1,'poliwrath.png','poliwrath.png'),(69,'Abra','abra.jpg',63,25,20,15,105,55,90,11,0,1,'abra.png','abra.png'),(70,'Kadabra','kadabra.jpg',64,40,35,30,120,70,105,11,0,1,'kadabra.png','kadabra.png'),(71,'Alalakazam','alakazam.jpg',65,55,50,45,135,90,120,11,0,1,'alakazam.png','alakazam.png'),(72,'Mega Alakazam','alakazam-mega.jpg',65,55,50,65,175,105,150,11,0,2,'alakazam-mega.png','alakazam-mega.png'),(73,'Machop','machop.jpg',66,70,80,50,35,35,35,7,0,1,'machop.png','machop.png'),(74,'Machoke','machoke.jpg',67,80,100,70,50,60,45,7,0,1,'machoke.png','machoke.png'),(75,'Machamp','machamp.jpg',68,90,130,80,65,85,55,7,0,1,'machamp.png','machamp.png'),(76,'Bellsprout','bellsprout.jpg',69,50,75,35,70,30,40,5,8,1,'bellsprout.png','bellsprout.png'),(77,'Weepinbell','weepinbell.jpg',70,65,90,50,85,40,55,5,8,1,'weepinbell.png','weepinbell.png'),(78,'Victreebel','victreebel.jpg',71,80,105,65,100,70,70,5,8,1,'victreebel.png','victreebel.png'),(79,'Tentacool','tentacool.jpg',72,40,40,35,50,100,70,3,8,1,'tentacool.png','tentacool.png'),(80,'Tentacruel','tentacruel.jpg',73,80,70,65,80,120,100,3,8,1,'tentacruel.png','tentacruel.png'),(81,'Geodude','geodude.jpg',74,40,80,100,30,30,20,13,9,1,'geodude.png','geodude.png'),(82,'Graveler','graveler.jpg',75,55,95,115,45,45,35,13,9,1,'graveler.png','graveler.png'),(83,'Golem','golem.jpg',76,80,120,130,55,65,45,13,9,1,'golem.png','golem.png'),(84,'Ponyta','ponyta.jpg',77,50,85,55,65,65,90,2,0,1,'ponyta.png','ponyta.png'),(85,'Rapidash','rapidash.jpg',78,65,100,70,80,80,105,2,0,1,'rapidash.png','rapidash.png'),(86,'Slowpoke','slowpoke.jpg',79,90,65,65,40,40,15,3,11,1,'slowpoke.png','slowpoke.png'),(87,'Slowbro','slowbro.jpg',80,95,75,110,100,80,30,3,11,1,'slowbro.png','slowbro.png'),(88,'Magnemite','magnemite.jpg',81,25,35,70,95,55,45,4,17,1,'magnemite.png','magnemite.png'),(89,'Magneton','magneton.jpg',82,50,60,95,120,70,70,4,17,1,'magneton.png','magneton.png'),(90,'Farfetch\'d','farfetchd.jpg',83,52,90,55,58,62,60,1,10,1,'farfetchd.png','farfetchd.png'),(91,'doduo','doduo.jpg',84,35,85,45,35,35,75,1,10,1,'doduo.png','doduo.png'),(92,'Dodrio','dodrio.jpg',85,60,110,70,60,60,110,1,10,1,'dodrio.png','dodrio.png'),(93,'Seel','seel.jpg',86,65,45,55,45,70,45,3,0,1,'seel.png','seel.png'),(94,'Dewgong','dewgong.jpg',87,90,70,80,70,95,70,3,6,1,'dewgong.png','dewgong.png'),(95,'Grimer','grimer.jpg',88,80,80,50,40,50,25,8,0,1,'grimer.png','grimer.png'),(96,'Muk','muk.jpg',89,105,105,75,65,100,50,8,0,1,'muk.png','muk.png'),(97,'Shellder','shellder.jpg',90,30,65,100,45,25,40,3,0,1,'shellder.png','shellder.png'),(98,'Cloyster','cloyster.jpg',91,50,95,180,85,45,70,3,6,1,'cloyster.png','cloyster.png'),(99,'Gastly','gastly.jpg',92,30,35,30,100,35,80,14,8,1,'gastly.png','gastly.png'),(100,'Haunter','haunter.jpg',93,45,50,45,115,55,95,14,8,1,'haunter.png','haunter.png'),(101,'Gengar','gengar.jpg',94,60,65,60,130,75,110,14,8,1,'gengar.png','gengar.png'),(102,'Mega Gengar','gengar-mega.jpg',94,60,65,80,170,95,130,14,8,2,'gengar-mega.png','gengar-mega.png'),(103,'Onix','onix.jpg',95,35,45,160,30,45,70,13,9,1,'onix.png','onix.png'),(104,'Drowzee','drowzee.jpg',96,60,48,45,43,90,42,11,0,1,'drowzee.png','drowzee.png'),(105,'Hypno','hypno.jpg',97,85,73,70,73,115,67,11,0,1,'hypno.png','hypno.png'),(106,'Krabby','krabby.jpg',98,30,105,90,25,25,50,3,0,1,'krabby.png','krabby.png'),(107,'Kingler','kingler.jpg',99,55,130,115,50,50,75,3,0,1,'kingler.png','kingler.png'),(108,'Voltorb','voltorb.jpg',100,40,30,50,55,55,100,4,0,1,'voltorb.png','voltorb.png'),(109,'Electrode','electrode.jpg',101,60,50,70,80,80,150,4,0,1,'electrode.png','electrode.png'),(110,'Exeggcute','exeggcute.jpg',102,60,40,80,60,45,40,5,11,1,'exeggcute.png','exeggcute.png'),(111,'Exeggutor','exeggutor.jpg',103,95,95,85,125,75,55,5,11,1,'exeggutor.png','exeggutor.png'),(112,'Cubone','cubone.jpg',104,50,50,95,40,50,35,9,0,1,'cubone.png','cubone.png'),(113,'Marowak','marowak.jpg',105,60,80,110,50,80,45,9,0,1,'marowak.png','marowak.png'),(114,'Hitmonlee','hitmonlee.jpg',106,50,120,53,35,110,87,7,0,1,'hitmonlee.png','hitmonlee.png'),(115,'Hitmonchan','hitmonchan.jpg',107,50,105,79,35,110,76,7,0,1,'hitmonchan.png','hitmonchan.png'),(116,'Lickitung','lickitung.jpg',108,90,55,75,60,75,30,1,0,1,'lickitung.png','lickitung.png'),(117,'Koffing','koffing.jpg',109,40,65,95,60,45,35,8,0,1,'koffing.png','koffing.png'),(118,'Weezing','weezing.jpg',110,65,90,120,85,70,60,8,0,1,'weezing.png','weezing.png'),(119,'Rhyhorn','rhyhorn.jpg',111,80,85,95,30,30,25,13,9,1,'rhyhorn.png','rhyhorn.png'),(120,'Rhydon','rhydon.jpg',112,105,130,120,45,45,40,13,9,1,'rhydon.png','rhydon.png'),(121,'Chansey','chansey.jpg',113,250,5,5,35,105,50,1,0,1,'chansey.png','chansey.png'),(122,'Tangela','tangela.jpg',114,65,55,115,100,40,60,5,0,1,'tangela.png','tangela.png'),(123,'Kangaskhan','kangaskhan.jpg',115,105,95,80,40,80,90,1,0,1,'kangaskhan.png','kangaskhan.png'),(124,'Mega Kangaskhan','kangaskhan-mega.jpg',115,105,125,100,60,100,100,1,0,2,'kangaskhan-mega.png','kangaskhan-mega.png'),(125,'Horsea','horsea.jpg',116,30,40,70,70,25,60,3,0,1,'horsea.png','horsea.png'),(126,'Seadra','seadra.jpg',117,55,65,95,95,45,85,3,0,1,'seadra.png','seadra.png'),(127,'Goldeen','goldeen.jpg',118,45,67,60,35,50,63,3,0,1,'goldeen.png','goldeen.png'),(128,'Seaking','seaking.jpg',119,80,92,65,65,80,68,3,0,1,'seaking.png','seaking.png'),(129,'Staryu','staryu.jpg',120,30,45,55,70,55,85,3,0,1,'staryu.png','staryu.png'),(130,'Starmie','starmie.jpg',121,60,75,85,100,85,115,3,11,1,'starmie.png','starmie.png'),(131,'Mr.Mime','mr-mime.jpg',122,40,45,65,100,120,90,11,18,1,'mr-mime.png','mr-mime.png'),(132,'Scyther','scyther.jpg',123,70,110,80,55,80,105,12,10,1,'scyther.png','scyther.png'),(133,'Jynx','jynx.jpg',124,65,50,35,115,95,95,6,11,1,'jynx.png','jynx.png'),(134,'Electabuzz','electabuzz.jpg',125,65,83,57,95,85,105,4,0,1,'electabuzz.png','electabuzz.png'),(135,'Magmar','magmar.jpg',126,65,95,57,100,85,93,2,0,1,'magmar.png','magmar.png'),(136,'Pinsir','pinsir.jpg',127,65,125,100,55,70,85,12,0,1,'pinsir.png','pinsir.png'),(137,'Mega Pinsir','pinsir-mega.jpg',127,65,155,120,65,90,105,12,10,2,'pinsir-mega.png','pinsir-mega.png'),(138,'Tauros','tauros.jpg',128,75,100,95,40,70,110,1,0,1,'tauros.png','tauros.png'),(139,'Magikarp','magikarp.jpg',129,20,10,55,15,20,80,3,0,1,'magikarp.png','magikarp.png'),(140,'Gyarados','gyarados.jpg',130,95,125,79,60,100,81,3,10,1,'gyarados.png','gyarados.png'),(141,'Mega Gyarados','gyarados-mega.jpg',130,95,155,109,70,130,81,3,16,2,'gyarados-mega.png','gyarados-mega.png'),(142,'Lapras','lapras.jpg',131,130,85,80,85,95,60,3,6,1,'lapras.png','lapras.png'),(143,'Ditto','ditto.jpg',132,48,48,48,48,48,48,1,0,1,'ditto.png','ditto.png'),(144,'Eevee','eevee.jpg',133,55,55,50,45,65,55,1,0,1,'eevee.png','eevee.png'),(145,'Vaporeon','vaporeon.jpg',134,130,65,60,110,95,65,3,0,1,'vaporeon.png','vaporeon.png'),(146,'Jolteon','jolteon.jpg',135,65,65,60,110,95,130,4,0,1,'jolteon.png','jolteon.png'),(147,'Flareon','flareon.jpg',136,65,130,60,95,110,65,2,0,1,'flareon.png','flareon.png'),(148,'Porygon','porygon.jpg',137,65,60,70,85,75,50,1,0,1,'porygon.png','porygon.png'),(149,'Omanyte','omanyte.jpg',138,35,40,100,90,55,35,13,3,1,'omanyte.png','omanyte.png'),(150,'Omastar','omastar.jpg',139,70,60,125,115,70,55,13,3,1,'omastar.png','omastar.png'),(151,'Kabuto','kabuto.jpg',140,60,115,105,65,70,80,13,3,1,'kabuto.png','kabuto.png'),(152,'Kabutops','kabutops.jpg',141,60,115,105,65,70,80,13,3,1,'kabutops.png','kabutops.png'),(153,'Aerodactyl','aerodactyl.jpg',142,80,105,65,60,75,130,13,10,1,'aerodactyl.png','aerodactyl.png'),(154,'Mega Aerodactyl','aerodactyl-mega.jpg',142,80,135,85,70,95,150,13,10,2,'aerodactyl-mega.png','aerodactyl-mega.png'),(155,'Snorlax','snorlax.jpg',143,160,110,65,65,110,30,1,0,1,'snorlax.png','snorlax.png'),(156,'Articuno','articuno.jpg',144,90,85,100,95,125,85,6,10,1,'articuno.png','articuno.png'),(157,'Galarian Articuno','articuno-galarian.jpg',144,90,85,85,125,100,95,11,10,4,'articuno-galarian.png','articuno-galarian.png'),(158,'Zapdos','zapdos.jpg',145,90,90,85,125,90,100,4,10,1,'zapdos.png','zapdos.png'),(159,'Galarian Zapdos','zapdos-galarian.jpg',145,90,125,90,85,90,100,7,10,4,'zapdos-galarian.png','zapdos-galarian.png'),(160,'Moltres','moltres.jpg',146,90,100,90,125,85,90,2,10,1,'moltres.png','moltres.png'),(161,'Galarian Moltres','moltres-galarian.jpg',146,90,85,90,100,125,90,16,10,4,'moltres-galarian.png','moltres-galarian.png'),(162,'Dratini','dratini.jpg',147,41,64,45,50,50,50,15,0,1,'dratini.png','dratini.png'),(163,'Dragonair','dragonair.jpg',148,61,84,65,70,70,70,15,0,1,'dragonair.png','dragonair.png'),(164,'Dragonite','dragonite.jpg',149,91,134,95,100,100,80,15,10,1,'dragonite.png','dragonite.png'),(165,'Mewtwo','mewtwo.jpg',150,106,110,90,154,90,130,11,0,1,'mewtwo.png','mewtwo.png'),(166,'Mega Mewtwo X','mewtwo-mega-x.jpg',150,106,190,100,154,100,130,11,7,2,'mewtwo-mega-x.png','mewtwo-mega-x.png'),(167,'Mega Mewtwo Y','mewtwo-mega-y.jpg',150,106,150,70,194,120,140,11,0,2,'mewtwo-mega-y.png','mewtwo-mega-y.png'),(168,'Mew','mew.jpg',151,100,100,100,100,100,100,11,0,1,'mew.png','mew.png'),(169,'Chikoritaaaaaa','chikorita.jpg',152,45,49,65,49,65,45,5,0,1,'chikorita.png',NULL);
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_ability`
--

DROP TABLE IF EXISTS `form_ability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_ability` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FormID` int DEFAULT NULL,
  `AbilityID` int DEFAULT NULL,
  `AbiType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_FormAbi_Form` (`FormID`),
  KEY `FK_FormAbi_Ability` (`AbilityID`),
  CONSTRAINT `FK_FormAbi_Ability` FOREIGN KEY (`AbilityID`) REFERENCES `ability` (`Id`),
  CONSTRAINT `FK_FormAbi_Form` FOREIGN KEY (`FormID`) REFERENCES `form` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_ability`
--

LOCK TABLES `form_ability` WRITE;
/*!40000 ALTER TABLE `form_ability` DISABLE KEYS */;
INSERT INTO `form_ability` VALUES (1,1,3,'popular'),(2,1,4,'hidden'),(3,2,13,'popular'),(4,3,16,'popular'),(5,4,1,'popular'),(6,4,2,'hidden'),(7,5,14,'popular'),(8,6,5,'popular'),(9,6,6,'hidden'),(10,7,15,'popular'),(11,8,1,'popular'),(12,8,2,'hidden'),(13,9,1,'popular'),(14,9,2,'hidden'),(15,10,3,'popular'),(16,10,4,'hidden'),(17,11,3,'popular'),(18,11,4,'hidden'),(19,12,5,'popular'),(20,12,6,'hidden'),(21,13,5,'popular'),(22,13,6,'hidden'),(23,14,7,'popular'),(24,14,17,'hidden'),(25,15,8,'popular'),(26,16,9,'popular'),(27,16,10,'hidden'),(28,17,7,'popular'),(29,17,17,'hidden'),(30,18,8,'popular'),(31,19,11,'popular'),(32,19,12,'hidden'),(33,20,18,'popular'),(34,21,19,'popular'),(35,21,20,'hidden'),(36,21,21,'popular'),(37,22,19,'popular'),(38,22,20,'hidden'),(39,22,21,'popular'),(40,23,19,'popular'),(41,23,20,'hidden'),(42,23,21,'popular'),(43,24,24,'popular'),(44,25,17,'popular'),(45,25,22,'popular'),(46,25,23,'hidden'),(47,26,17,'popular'),(48,26,22,'popular'),(49,26,23,'hidden'),(50,27,21,'popular'),(51,27,12,'hidden'),(52,28,21,'popular'),(53,28,12,'hidden'),(54,29,8,'popular'),(55,29,25,'popular'),(56,29,26,'hidden'),(57,30,8,'popular'),(58,30,25,'popular'),(59,30,26,'hidden'),(60,69,27,'popular'),(61,69,28,'popular'),(62,69,29,'hidden'),(63,70,27,'popular'),(64,70,28,'popular'),(65,70,29,'hidden'),(66,71,27,'popular'),(67,71,28,'popular'),(68,71,29,'hidden'),(69,72,30,'popular'),(70,99,31,'popular'),(71,100,31,'popular'),(72,101,32,'popular'),(73,102,33,'popular'),(74,140,25,'popular'),(75,141,35,'popular'),(76,140,34,'hidden'),(77,153,36,'popular'),(78,153,37,'popular'),(79,153,26,'hidden'),(80,154,13,'popular'),(81,156,37,'popular'),(82,156,NULL,'hidden'),(83,158,37,'popular'),(84,158,37,'hidden'),(85,160,37,'popular'),(86,160,NULL,'hidden');
/*!40000 ALTER TABLE `form_ability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formtype`
--

DROP TABLE IF EXISTS `formtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formtype` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FormType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formtype`
--

LOCK TABLES `formtype` WRITE;
/*!40000 ALTER TABLE `formtype` DISABLE KEYS */;
INSERT INTO `formtype` VALUES (1,'Normal'),(2,'Mega'),(3,'Alolan'),(4,'Galar'),(5,'Primal');
/*!40000 ALTER TABLE `formtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generation`
--

DROP TABLE IF EXISTS `generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generation` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Generation` int DEFAULT NULL,
  `main_region` varchar(20) DEFAULT NULL,
  `abilities` int DEFAULT NULL,
  `moves` int DEFAULT NULL,
  `pokemon_species` int DEFAULT NULL,
  `pkmTypes` int DEFAULT NULL,
  `version_group` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generation`
--

LOCK TABLES `generation` WRITE;
/*!40000 ALTER TABLE `generation` DISABLE KEYS */;
INSERT INTO `generation` VALUES (1,1,'Kanto',0,165,151,15,NULL),(2,2,'Johto',0,86,100,17,NULL),(3,3,'Hoenn',76,121,135,17,NULL),(4,4,'Sinnoh',47,113,107,17,NULL),(5,5,'Unova',101,92,156,17,NULL),(6,6,'Kalos',27,62,72,18,NULL),(7,7,'Alola',42,121,88,18,NULL),(8,8,'Galar',34,83,89,18,NULL);
/*!40000 ALTER TABLE `generation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagegallery`
--

DROP TABLE IF EXISTS `imagegallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagegallery` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AlbumID` int DEFAULT NULL,
  `Image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ImageGallery_PkmVersion` (`AlbumID`),
  CONSTRAINT `FK_ImageGallery_PkmVersion` FOREIGN KEY (`AlbumID`) REFERENCES `pkmversion` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagegallery`
--

LOCK TABLES `imagegallery` WRITE;
/*!40000 ALTER TABLE `imagegallery` DISABLE KEYS */;
INSERT INTO `imagegallery` VALUES (1,18,'chalk-hill-figure.jpg'),(2,18,'galar-route-1.jpg'),(3,18,'industrial-town.jpg'),(4,18,'library.jpg'),(5,18,'misty-forest.jpg'),(6,18,'pokemon-wild-encounter.jpg'),(7,18,'railway-bridge.jpg'),(8,18,'rolling-hills.jpg'),(9,18,'snowy-town.jpg'),(10,18,'stadium.jpg'),(11,18,'stadium-outside.jpg'),(12,18,'trainer-battle.jpg'),(13,18,'underground-mine.jpg'),(14,18,'wild-battle.jpg');
/*!40000 ALTER TABLE `imagegallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo`
--

DROP TABLE IF EXISTS `logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VersionID` int DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Logo_PkmVersion` (`VersionID`),
  CONSTRAINT `FK_Logo_PkmVersion` FOREIGN KEY (`VersionID`) REFERENCES `pkmversion` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo`
--

LOCK TABLES `logo` WRITE;
/*!40000 ALTER TABLE `logo` DISABLE KEYS */;
INSERT INTO `logo` VALUES (1,1,'red.jpg'),(2,1,'blue.jpg'),(3,2,'yellow.jpg'),(4,3,'gold.jpg'),(5,3,'silver.jpg'),(6,4,'crystal.jpg'),(7,5,'ruby.jpg'),(8,5,'sapphire.jpg'),(9,6,'firered.jpg'),(10,6,'leafgreen.jpg'),(11,7,'emerald.jpg'),(12,8,'diamond.jpg'),(13,8,'pearl.jpg'),(14,9,'platinum.jpg'),(15,10,'heartgold.jpg'),(16,10,'soulsilver.jpg'),(17,11,'black.jpg'),(18,11,'white.jpg'),(19,12,'black-2.jpg'),(20,12,'white-2.jpg'),(21,13,'x.jpg'),(22,13,'y.jpg'),(23,14,'omega-ruby.jpg'),(24,14,'alpha-sapphire.jpg'),(25,15,'sun.jpg'),(26,15,'moon.jpg'),(27,16,'ultra-sun.jpg'),(28,16,'ultra-moon.jpg'),(29,17,'lets-go-pikachu.jpg'),(30,17,'lets-go-eevee.jpg'),(31,18,'sword-logo.jpg'),(32,18,'shield-logo.jpg');
/*!40000 ALTER TABLE `logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `move`
--

DROP TABLE IF EXISTS `move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `move` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MoveName` varchar(50) DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `MoveType` int DEFAULT NULL,
  `Power` int DEFAULT NULL,
  `Accuracy` int DEFAULT NULL,
  `PP` int DEFAULT NULL,
  `Effect` varchar(500) DEFAULT NULL,
  `Gen` int DEFAULT NULL,
  `probChange` int DEFAULT NULL,
  `TM` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Move_pkmType` (`TypeID`),
  KEY `FK_move_movecategory` (`MoveType`),
  KEY `FK_Move_Generation` (`Gen`),
  CONSTRAINT `FK_Move_Generation` FOREIGN KEY (`Gen`) REFERENCES `generation` (`Id`),
  CONSTRAINT `FK_move_movecategory` FOREIGN KEY (`MoveType`) REFERENCES `movecategory` (`Id`),
  CONSTRAINT `FK_Move_pkmType` FOREIGN KEY (`TypeID`) REFERENCES `pkmtype` (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `move`
--

LOCK TABLES `move` WRITE;
/*!40000 ALTER TABLE `move` DISABLE KEYS */;
INSERT INTO `move` VALUES (1,'Absorb',5,2,20,100,25,'Hồi phục HP bằng 50% sát thương gây ra',1,0,NULL),(52,'Acid',8,2,40,100,30,'Có tỉ lệ khiến đối thủ trúng độc',1,10,NULL),(53,'Acid Armor',8,3,0,100,20,'Tăng mạnh chỉ số Defense',1,0,NULL),(54,'Agility',11,3,0,100,30,'Tăng mạnh chỉ số Speed',1,0,NULL),(55,'Aurora Beam',6,2,65,100,20,'Có tỉ lệ làm giảm Atk của kẻ địch',1,10,NULL),(56,'Barrage',1,1,15,85,20,'Tấn công liên hoàn từ 2-5 lần trong một lượt',1,0,NULL),(57,'Barrier',11,3,0,100,20,'Tăng mạnh chỉ số Defense',1,0,NULL),(58,'Bind',1,1,15,85,20,'Đặt bẫy tấn công đối thủ trong 4 đến 5 lượt',1,100,NULL),(59,'Bite',16,1,60,100,25,'Có thể làm đối thủ bị trói',1,30,NULL),(60,'Blizzard',6,2,110,70,5,'Có thể làm đối thủ đóng băng',1,10,NULL),(61,'Body Slam',1,1,85,100,15,'Có thể làm đối thủ tê liệt',1,30,NULL),(62,'Bone Club',9,1,65,85,20,'Có thể làm đối thủ bị trói',1,10,NULL),(63,'Boomerang',9,1,50,90,10,'Tấn công 2 lần trong 1 lượt',1,0,NULL),(64,'Bubble',3,2,40,100,30,'Có thể làm giảm chỉ số Speed của đối thủ',1,10,NULL),(65,'Bubble Beam',3,2,65,100,20,'Có thể làm giảm chỉ số Speed của đối thủ',1,10,NULL),(66,'Clamp',3,1,35,85,15,'Đặt bẫy tấn công đối thủ trong 4 đến 5 lượt',1,100,NULL),(67,'Confuse Ray',14,3,0,100,10,'Làm đối thủ choáng váng',1,0,NULL),(68,'Confusion',11,2,50,100,25,'Có thể làm đối thủ choáng váng',1,10,NULL),(69,'Constrict',1,1,10,100,35,'Làm giảm Speed của đối thủ đi 1 bậc',1,10,NULL),(70,'Counter',7,1,0,100,20,'Khi bị tấn công bởi chiêu thức vật lý, phản đòn lại bằng 2 lần sát thương',1,0,NULL),(71,'Crabhammer',3,1,100,90,10,'Tăng cao tỉ lệ chí mạng',1,0,NULL),(72,'Cut',1,1,50,95,30,' ',1,0,NULL),(73,'Dig',9,1,80,100,10,'Chui xuống lòng đất ở lượt đầu và tấn công ở lượt tiếp theo, có thể sử dụng để thoát khỏi các hang động',1,0,'TM15'),(74,'Disable',1,3,0,100,20,'Đối thủ sẽ không thể sử dụng chiêu thức vừa dùng trong vài lượt',1,0,NULL),(75,'Dizzy Punch',1,1,70,100,10,'Có thể làm đối thủ choáng váng',1,20,NULL),(76,'Double Kick',7,1,30,100,30,'Tấn công 2 lần trong 1 lượt',1,0,NULL),(77,'Double Slap',1,1,15,85,10,'Tấn công từ 2-5 lần trong 1 lượt',1,0,NULL),(78,'Double-Edge',1,1,120,100,15,'Pokemon sử dụng cũng nhận sát thương phản lại',1,0,NULL),(79,'Dragon Rage',15,2,0,100,10,'Luôn làm đối thủ mất 40HP',1,0,NULL),(80,'Dream Eater',11,2,100,100,15,'Hồi phục 1 nửa HP khi đối thủ ngủ',1,0,NULL),(81,'Drill Peck',10,1,80,100,20,' ',1,0,NULL),(82,'Earthquake',9,1,100,100,10,'Sát thương gấp đôi khi đối thủ đang sử dụng Dig',1,0,NULL),(83,'Egg Bomb',1,1,100,75,10,' ',1,0,NULL),(84,'Ember',2,2,40,100,25,'Có thể làm đối thủ bỏng',1,10,NULL),(85,'Expolosion',1,1,250,100,5,'Tự sát',1,0,NULL),(86,'Fire Blast',2,2,110,85,5,'Có thể làm đối thủ bỏng',1,10,NULL),(87,'Fire Punch',2,1,75,100,15,'Có thể làm đối thủ bỏng',1,10,'TM03'),(88,'Fire Spin',2,2,35,85,15,'Đặt bẫy gây sát thương trong 4-5 lượt',1,100,'TM13'),(89,'Fissure',9,1,0,30,5,'Kết liễu đối thủ nếu trúng đòn',1,0,NULL),(90,'Flamethrower',2,2,90,100,15,'Có thể làm đối thủ bỏng',1,10,NULL),(91,'Flash',1,3,0,100,20,'Giảm chính xác',1,0,NULL),(92,'Fly',1,1,90,95,15,'Bay lên trong lượt đầu và tấn công ở lượt tiếp theo',1,0,'TM06'),(93,'Focus Energy',7,3,0,100,30,'Tăng tỉ lệ chí mạng',1,0,NULL),(94,'Fury Attack',1,1,15,85,20,'Tấn công 2-5 lần trong 1 lượt',1,0,NULL),(95,'Fury Swipes',1,1,18,80,15,'Tấn công 2-5 lần trong 1 lượt',1,0,NULL),(96,'Growth',1,3,0,100,20,'Tăng Atk và SpAtk',1,0,NULL),(97,'Gust',10,2,40,100,35,'Tấn công pokemon đang Bay hoặc Nhảy với gấp đôi sát thương',1,0,NULL),(98,'Harden',1,3,0,100,30,'Tăng Defense',1,0,NULL),(99,'Haze',6,3,0,100,30,'Loại bỏ mọi thay đổi về chỉ số',1,0,NULL),(100,'Headbutt',1,1,70,100,15,'Có thể làm đối thủ bị trói',1,30,NULL),(101,'High Jump Kick',7,1,130,90,10,'Nếu pokemon sử dụng miss thì sẽ mất 50% HP',1,0,NULL),(102,'Hydro Pump',3,2,110,80,5,' ',1,0,NULL),(103,'Hyper Beam',1,2,150,90,5,'Nghỉ 1 lượt sau khi sử dụng',1,0,'TM08'),(104,'Hyper Fang',1,1,80,90,15,'Có thể làm đối thủ bị trói',1,10,NULL),(105,'Hypnosis',11,3,0,60,20,'Đặt đối thủ vào trạng thái ngủ mê',1,0,NULL),(106,'Ice Beam',6,2,90,100,10,'Có thể làm đối thủ đóng băng',1,10,NULL),(107,'Ice Punch',6,1,75,100,15,'Có thể làm đối thủ đóng băng',1,10,'TM04'),(108,'Karate Chop',7,1,50,100,25,'Tăng tỉ lệ chí mạng',1,0,NULL),(109,'Life Leech',5,2,80,100,10,'Hồi phục HP bằng 1 nửa sát thương gây ra',1,0,NULL),(110,'Leech Seed',5,3,0,90,10,'Hút máu mỗi lượt',1,0,NULL),(111,'Leer',1,3,0,100,30,'Giảm chỉ số Defense của đối thủ',1,0,NULL),(112,'Lick',14,1,30,100,30,'Có thể làm đối thủ tê liệt',1,30,NULL),(113,'Low Kick',7,1,0,100,20,'Đối thủ càng nhẹ, sát thương càng lớn',1,0,NULL),(114,'Meditate',11,3,0,100,40,'Tăng Atk của pokemon sử dụng',1,0,NULL),(115,'Mega Drain',5,2,40,100,15,'Hồi phục HP bằng 1 nửa sát thương gây ra',1,0,NULL),(116,'Mega Kick',1,1,120,75,5,' ',1,0,'TM01'),(117,'Mega Punch',1,1,80,85,20,' ',1,0,NULL),(118,'Night Shade',14,2,0,100,15,'Gây sát thương bằng level pkm sử dụng',1,0,NULL),(119,'Peck',10,1,35,100,35,' ',1,0,NULL),(120,'Petal Dance',5,2,120,100,10,'Tấn công trong 2 lượt sau đó choáng váng',1,0,NULL),(121,'Future Sight',11,2,120,100,10,'Sát thương gây ra ở lượt thứ 2',2,0,NULL),(122,'Energy Ball',5,2,90,100,10,'Có tỉ lệ làm giảm SpDef của đối thủ',3,10,NULL),(123,'Outrage',15,1,120,100,10,'Tấn công liên tục bằng kĩ năng này 2-3 lượt sau đó Pokemon sử dụng sẽ bị choáng',1,0,NULL),(124,'Poison Jab',8,1,80,100,20,'Có tỉ lệ làm đối thủ trúng độc',2,30,NULL),(125,'Precipice Blades',9,1,120,85,10,'Tấn công tất cả các đối thủ',3,0,NULL);
/*!40000 ALTER TABLE `move` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movecategory`
--

DROP TABLE IF EXISTS `movecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movecategory` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MoveType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movecategory`
--

LOCK TABLES `movecategory` WRITE;
/*!40000 ALTER TABLE `movecategory` DISABLE KEYS */;
INSERT INTO `movecategory` VALUES (1,'physical'),(2,'special'),(3,'status');
/*!40000 ALTER TABLE `movecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `NguoiTaoID` int DEFAULT NULL,
  `NguoiDuyetID` int DEFAULT NULL,
  `TieuDe` varchar(500) DEFAULT NULL,
  `MoTa` blob,
  `avatar` varchar(50) DEFAULT NULL,
  `NoiDung` blob,
  `TacGia` varchar(50) DEFAULT NULL,
  `NgayTao` date DEFAULT NULL,
  `NgayDuyet` date DEFAULT NULL,
  `TrangThai` tinyint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_NguoiTaoID_UserID` (`NguoiTaoID`),
  KEY `FK_NguoiDuyetID_UserID` (`NguoiDuyetID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (4,1,NULL,'Ra mắt phiên bản mới : Pokemon Brilliant Diamond, Shining Pearl and Pokemon Legends : Arceus',_binary '<p><img alt=\"Pokemon Brilliant Diamond, Shining Pearl, Legends Arceus\" src=\"https://img.pokemondb.net/news/2021/brilliant-diamond-shining-pearl-legends-arceus.jpg\" /></p>\r\n\r\n<p>Pokemon Present vừa ph&aacute;t s&oacute;ng đ&atilde; c&ocirc;ng bố 2 phi&ecirc;n bản pokemon mới! Đầu ti&ecirc;n l&agrave; <a href=\"https://pokemondb.net/brilliant-diamond-shining-pearl\"><strong>Pok&eacute;mon Brilliant Diamond &amp; Pok&eacute;mon Shining Pearl</strong></a>, một phi&ecirc;n bản l&agrave;m lại từ Pokemon Sinnoh gốc. Ch&uacute;ng được thiết kế ở dạng 3D chibi, gần giống với phi&ecirc;n bản Pokemon Let&#39;s Go, hoặc c&oacute; thể hiểu l&agrave; theo tỉ lệ nhất định của Zelda Game, Link&#39;s Awakening. Tuy nhi&ecirc;n, lối chơi vẫn theo c&aacute;c phi&ecirc;n bản gốc (hơn l&agrave; Let&#39;s Go).</p>\r\n',NULL,_binary '<p><img alt=\"Pokemon Brilliant Diamond, Shining Pearl, Legends Arceus\" src=\"https://img.pokemondb.net/news/2021/brilliant-diamond-shining-pearl-legends-arceus.jpg\" /></p>\r\n\r\n<p>A new Pok&eacute;mon Presents has just finished airing and announced two new games! The first is <a href=\"https://pokemondb.net/brilliant-diamond-shining-pearl\"><strong>Pok&eacute;mon Brilliant Diamond &amp; Pok&eacute;mon Shining Pearl</strong></a>, remakes of the original Sinnoh games. They are in isometric 3D with a cartoony chibi style similar to Pok&eacute;mon Let&#39;s Go, or the recent remake of the Zelda game, Link&#39;s Awakening. The gameplay, however, is faithful to the original games (rather than Let&#39;s Go).</p>\r\n\r\n<p>Brilliant Diamond &amp; Shining Pearl are being made by ILCA rather than Game Freak, but is co-directed by Junichi Masuda from Game Freak (alongside Yuichi Ueda of ILCA). The games will be released in late 2021.</p>\r\n\r\n<p>The second game announced was <a href=\"https://pokemondb.net/legends-arceus\"><strong>Pok&eacute;mon Legends: Arceus</strong></a>. It&#39;s also set in the Sinnoh region but a very long time ago, when the Sinnoh regions was still a vast wilderness. The graphical style is similar to Pok&eacute;mon Sword &amp; Shield and the gameplay appears similar to the Wild Area in those games.</p>\r\n\r\n<p>In this game the starters you can choose from are Rowlet, Cyndaquil, or Oshawott - previously from separate generations. The aim of the game is to create the region&#39;s first Pok&eacute;dex. Players will study Pok&eacute;mon&#39;s behaviours and can seamlessly enter battle, to provide Trainers with an immersive experience. It will be released in early 2022.</p>\r\n\r\n<p>Here is the full announcement video, which also features a great retrospective of the last 25 years of Pok&eacute;mon!</p>\r\n\r\n<p>&nbsp;</p>\r\n<iframe width=\"853\" height=\"480\" src=\"https://www.youtube.com/embed/iTZeVNwAmkk\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>\r\n<h2><strong>Pok&eacute;mon Brilliant Diamond &amp; Shining Pearl screenshots</strong></h2>\r\n\r\n<p>Click to enlarge</p>\r\n\r\n<p><img alt=\"Pokemon Brilliant Diamond and Shining Pearl screenshot\" src=\"https://img.pokemondb.net/news/2021/brilliant-diamond-shining-pearl-1.jpg\" /></p>\r\n\r\n<p><img alt=\"Pokemon Brilliant Diamond and Shining Pearl screenshot\" src=\"https://img.pokemondb.net/news/2021/brilliant-diamond-shining-pearl-2.jpg\" /></p>\r\n\r\n<p><img alt=\"Pokemon Brilliant Diamond and Shining Pearl screenshot\" src=\"https://img.pokemondb.net/news/2021/brilliant-diamond-shining-pearl-3.jpg\" /></p>\r\n\r\n<h2><strong>Pok&eacute;mon Legends: Arceus screenshots</strong></h2>\r\n\r\n<p>Click to enlarge</p>\r\n\r\n<p><img alt=\"Pokemon Legends Arceus screenshot\" src=\"https://img.pokemondb.net/news/2021/pokemon-legends-arceus-1.jpg\" /></p>\r\n\r\n<p><img alt=\"Pokemon Legends Arceus screenshot\" src=\"https://img.pokemondb.net/news/2021/pokemon-legends-arceus-2.jpg\" /></p>\r\n\r\n<p><img alt=\"Pokemon Legends Arceus screenshot\" src=\"https://img.pokemondb.net/news/2021/pokemon-legends-arceus-3.jpg\" /></p>\r\n','General News',NULL,NULL,0),(5,1,NULL,'Chào mừng sinh nhật 25 tuổi Pokemon',_binary '<figure class=\"image\"><img src=\"https://img.pokemondb.net/news/2021/pokemon-25-logo-sm.jpg\" alt=\"Pokemon 25 logo\"></figure><p>Năm nay, Pokemon đã đi được một quãng hành trình dài 25 năm. Mọi thứ bắt đầu vào tháng 2 năm 1996 với sự ra mắt của 2 phiên bản game Pokemon Red &amp; Green ở Nhật Bản. Hôm nay, The Pokemon Company đã bắt đầu lễ kỉ niệm của mình. Một video vui nhộn được phát hành vẽ lại cuộc hành trình với trái PokeBall qua từng giai đoạn, và từng bản game với các điểm nổi bật của chúng.<br>Họ cũng thông báo rằng sẽ hợp tác với Universal Music Group trong 1 năm đuọc gọi là ‘P25 Music’, dẫn dắt bởi ngôi sao nhạc Pop Katy Perry. Có một gợi ý nhỏ ở cuối video dưới dây.</p>',NULL,_binary '<figure class=\"image\"><img src=\"https://img.pokemondb.net/news/2021/pokemon-25-logo-sm.jpg\" alt=\"Pokemon 25 logo\"></figure><p>Năm nay, Pokemon đã đi được một quãng hành trình dài 25 năm. Mọi thứ bắt đầu vào tháng 2 năm 1996 với sự ra mắt của 2 phiên bản game Pokemon Red &amp; Green ở Nhật Bản. Hôm nay, The Pokemon Company đã bắt đầu lễ kỉ niệm của mình. Một video vui nhộn được phát hành vẽ lại cuộc hành trình với trái PokeBall qua từng giai đoạn, và từng bản game với các điểm nổi bật của chúng.<br>Họ cũng thông báo rằng sẽ hợp tác với Universal Music Group trong 1 năm đuọc gọi là ‘P25 Music’, dẫn dắt bởi ngôi sao nhạc Pop Katy Perry. Có một gợi ý nhỏ ở cuối video dưới dây.</p><figure class=\"media\"><oembed url=\"https://www.youtube.com/watch?v=l_ZHajviuAY&amp;feature=emb_imp_woyt\"></oembed></figure><p><br>&nbsp;Một logo mới được ra mắt với tiêu đề ‘Regional Journey’, bao gồm 8 bộ Pokemon khởi đầu của tất cả phiên bản Pokemon kèm vài tính năng nổi bật trong bản game của chúng</p><figure class=\"image\"><img src=\"https://img.pokemondb.net/news/2021/pokemon-25-journey-logo-sm.jpg\" alt=\"Pokemon Regional Journey logo\"></figure>','General News',NULL,NULL,0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Permission` varchar(100) DEFAULT NULL,
  `Module` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'Quản lí phân quyền','authorities'),(2,'Quản lí thông tin Pokedex','dsPokedex'),(3,'Quản lí phiên bản','dsPkmVersion'),(4,'Quản lí tin tức','dsPkmNews'),(5,'Hỗ trợ phản hồi','Support'),(6,'Kiểm duyệt bài viết','forumPost'),(7,'Cập nhật Pokedex','pokedexAdd'),(8,'Cập nhật phiên bản','versionAdd'),(9,'Cập nhật stat','pkmFormAdd'),(10,'Cập nhật ability','abilityAdd'),(11,'Cập nhật Move','moveAdd'),(12,'Quản lí thông tin Form/Stat','dsPkmForm'),(13,'Quản lí thông tin Ability','dsAbility'),(14,'Quản lí thông tin Move','dsPkmMove'),(15,'Cập nhật tin tức','newsAdd');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkmtype`
--

DROP TABLE IF EXISTS `pkmtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkmtype` (
  `TypeId` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) DEFAULT NULL,
  `VietTat` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkmtype`
--

LOCK TABLES `pkmtype` WRITE;
/*!40000 ALTER TABLE `pkmtype` DISABLE KEYS */;
INSERT INTO `pkmtype` VALUES (0,'none','-'),(1,'normal','NOR'),(2,'fire','FIR'),(3,'water','WAT'),(4,'electric','ELE'),(5,'grass','GRA'),(6,'ice','ICE'),(7,'fighting','FIG'),(8,'poison','POI'),(9,'ground','GRO'),(10,'flying','FLY'),(11,'psychic','PSY'),(12,'bug','BUG'),(13,'rock','ROC'),(14,'ghost','GHO'),(15,'dragon','DRA'),(16,'dark','DAR'),(17,'steel','STE'),(18,'fairy','FAI');
/*!40000 ALTER TABLE `pkmtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pkmversion`
--

DROP TABLE IF EXISTS `pkmversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pkmversion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(100) DEFAULT NULL,
  `releaseDate` varchar(50) DEFAULT NULL,
  `Platform` varchar(50) DEFAULT NULL,
  `Director` varchar(50) DEFAULT NULL,
  `gamePlay` blob,
  `keyword` varchar(50) DEFAULT NULL,
  `Map` varchar(50) DEFAULT NULL,
  `Intro` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pkmversion`
--

LOCK TABLES `pkmversion` WRITE;
/*!40000 ALTER TABLE `pkmversion` DISABLE KEYS */;
INSERT INTO `pkmversion` VALUES (1,'Red & Blue','27th February 1996','Game Boy','Satoshi Tajiri',NULL,'red-blue','kanto-map.jpg',NULL),(2,'Yellow','12th September 1998','Game Boy','Satoshi Tajiri',NULL,'yellow','kanto-map.jpg',NULL),(3,'Gold & Silver','21st November 1999','Game Boy Color','Satoshi Tajiri',NULL,'gold-silver',NULL,NULL),(4,'Crystal','14th December 2000','Game Boy Color','Satoshi Tajiri',NULL,'crystal',NULL,NULL),(5,'Ruby & Sapphire','21st November 2002','Game Boy Advance','Junichi Masuda',NULL,'ruby-sapphire',NULL,NULL),(6,'Fire Red & Leaf Green','29th January 2004','Game Boy Advance','Junichi Masuda',NULL,'firered-leafgreen',NULL,NULL),(7,'Emerald','16th September 2004','Game Boy Advance','Shigeki Morimoto',NULL,'emerald',NULL,NULL),(8,'Diamond & Pearl','28th September 2006','Nintendo DS','Junichi Masuda',NULL,'diamond-pearl',NULL,'Thế hệ thứ tư của Pokemon bắt đầu với Pokemon Diamond & Pearl mang theo những thay đổi lớn về lối chơi, đặc biệt là hệ thống chiến đấu'),(9,'Platinum','13th September 2008','Nintendo DS','Takeshi Kawachimaru',NULL,'platinum',NULL,'Thế hệ thứ tư tiếp tục với bản game thứ ba như thường lệ, lặp lại từ Pokemon Diamon/Pearl nhưng với Pokedex theo vùng được cập nhật, hành trình mới và tính năng mới'),(10,'HeartGold & SoulSilver','12th September 2009','Nintendo DS','	Shigeki Morimoto',NULL,'heartgold-soulsilver',NULL,'Thế hệ thứ tư tiếp tục với Pokemon HearGold & SoulSilver, các phiên bản được làm lại của Pokemon Gold & Silver từ thế hệ thứ hai, và một vài thứ từ Pokemon Crystal'),(11,'Black & White','18th September 2010','Nintendo DS','Junichi Masuda',NULL,'black-white','unova-region.jpg','Thế hệ thứ năm của Pokemon được chờ đợi từ lâu bắt đầu với hai phiên bản Pokemon Black & White . Có 156 Pokemon hoàn toàn mới, bao gồm 13 Legendaries Pokemon mới, nâng tổng số Pokemon lên 649'),(12,'Black 2 & White 2','23rd June 2012','Nintendo DS','Takao Unno',NULL,'black-white-2','unova-region-bw2.jpg','Thế hệ thứ năm của Pokemon tiếp tục với hai phiên bản Black 2 & White 2. Tuy không có Pokemon mới so với 2 bản gốc của nó nhưng Pokedex được mở rộng bao gồm các Pokemon của thế hệ trước, với tổng số 330 Pokemon'),(13,'X & Y','12th October 2013','3DS','Junichi Masuda',NULL,'x-y','kalos-map.jpg','Thế hệ thứ sáu bắt đầu với hai phiên bản hoàn toàn mới, Pokemon X & Y. Như thường lệ, với các thế hệ mới sẽ có các Pokemon mới, địa điểm mới và các tính năng mới để khám phá'),(14,'Omega Ruby & Alpha Sapphire','	21st November 2014','3DS','Shigeru Ohmori',NULL,'omega-ruby-alpha-sapphire','hoenn-region-oras-th.jpg','Thế hệ thứ sáu của Pokemon tiếp tục ra mắt 2 phiên bản Pokemon Omega Ruby & Pokemon Alpha Sapphire, là phiên bản làm lại của Pokemon Ruby & Sapphire từ năm 2003. Cũng như X & Y, Omega Ruby & Alpha Sapphire cũng gồm các tính năng của thế hệ 6'),(15,'Sun & Moon','18th November 2016','3DS','Shigeru Ohmori',NULL,'sun-moon','alola-region.jpg','Pokemon đánh dấu kỷ niệm 20 năm thành lập của mình bằng thế hệ Pokemon thứ 7, Pokemon Sun & Pokemon Moon. Đây là một cuộc phiêu lưu hoàn toàn mới ở vùng Alola, mang đến nhiều Pokemon mới và nhiều thứ để khám phá'),(16,'Ultra Sun & Ultra Moon','17th November 2017','3DS','Kazumasa Iwao',_binary '<h2>New features</h2>\r\n\r\n<p>Một cốt truyện mới ở v&ugrave;ng Alola, li&ecirc;n quan nhiều hơn đến Ultra Beasts v&agrave; Necrozma.</p>\r\n\r\n<p>Một Alola Pok&eacute;dex mở rộng với hơn 400 Pok&eacute;mon c&oacute; sẵn.</p>\r\n\r\n<p>C&aacute;c khu vực mới để kh&aacute;m ph&aacute; ở v&ugrave;ng Alola, bao gồm một b&atilde;i biển lướt s&oacute;ng v&agrave; một thung lũng đầy Pikachu.</p>\r\n\r\n<p>Island Challenge trở lại nhưng c&oacute; c&aacute;c thử nghiệm kh&aacute;c nhau, bao gồm cả một thử nghiệm mới từ Mina.</p>\r\n\r\n<p>Rotom Dex được cải tiến bao gồm c&aacute;c t&iacute;nh năng tương tự như O-Powers như trứng nở nhanh hơn, tăng EXP v&agrave; cho ph&eacute;p sử dụng Z-Moves nhiều hơn một lần trong mỗi trận chiến.</p>\r\n\r\n<p>&quot;Mantine Surf&quot; cho ph&eacute;p lướt s&oacute;ng giữa c&aacute;c đảo Alola ở mặt sau Mantine. Đ&acirc;y cũng l&agrave; một tr&ograve; chơi nhỏ, nơi bạn c&oacute; thể ghi điểm khi thực hiện c&aacute;c động t&aacute;c lật v&agrave; đ&aacute;nh lừa.</p>\r\n\r\n<p><q>Alola Photo Club</q>&nbsp;cho ph&eacute;p người chơi chụp ảnh với Pok&eacute;mon của họ. Bao gồm nhiều trang phục v&agrave; đồ trang tr&iacute;. H&igrave;nh ảnh c&oacute; thể được chia sẻ với bạn b&egrave;.</p>\r\n','ultra-sun-ultra-moon','alola-region.jpg','Sau sự ra mắt thành công của Sun & Moon, Pokemon Ultra Sun & Ultra Moon mang đến cho chúng ta một phiên bản mở rộng hơn kèm theo cốt truyện mới ở vùng Alola và các hình dạng mới cho Solgaleo & Lunala'),(17,'Let\'s Go, Pikachu & Let\'s Go Eevee','	16th November 2018','Switch','Junichi Masuda',NULL,'lets-go-pikachu-eevee',NULL,'Pokemon tiếp tục phát triển tới những thứ chưa từng được khám phá, khi mà Nintendo ngừng việc phát hành các thiết bị chơi game \'handhled console\' để chuyển sang \'hybrid console\', là Nintendo Switch. Pokemon Let\'s Go Pikachu/Eevee là hai phiên bản làm lại từ Pokemon Yellow và bao gồm một số tính năng từ trò chơi trên smartphone là Pokemon GO.'),(18,'Sword & Shield','15th November 2019','Switch','Shigeru Ohmori',_binary '<h2><strong>Gameplay</strong></h2>\r\n\r\n<p>Pok&eacute;mon Sword &amp; Shield bắt đầu ở v&ugrave;ng đất t&ecirc;n l&agrave; Galar, nơi được lấy bối cảnh v&agrave; cảm hứng từ Vương quốc Anh.</p>\r\n\r\n<p>Tr&ograve; chơi gần như giống với c&aacute;c phi&ecirc;n bản Pokemon cầm tay như trước đ&acirc;y hơn l&agrave; phi&ecirc;n bản Let&#39;s Go Pikachu &amp; Let&#39;s Go Eevee v&agrave;o năm 2018. Pok&eacute;mon hoang d&atilde; chiến đấu giống như c&aacute;c phi&ecirc;n bản game trước, v&agrave; ch&uacute;ng sẽ xuất hiện ngẫu nhi&ecirc;n ở c&aacute;c b&atilde;i cỏ. Tuy nhi&ecirc;n cũng c&oacute; một số điểm tương đồng - Pokemon hoang d&atilde; cũng c&oacute; thể xuất hiện trong c&aacute;c khu vực kh&aacute;c</p>\r\n\r\n<p><img alt=\"Pokémon Sword &amp; Shield starters - Grookey, Scorbunny and Sobble\" src=\"https://img.pokemondb.net/images/sword-shield/galar-starters.jpg\" /></p>\r\n\r\n<p><br />\r\nBộ 3 <em>Pok&eacute;mon Sword &amp; Shield</em> khởi đầu: Grookey, Scorbunny v&agrave; Sobble</p>\r\n\r\n<p>Chế độ Gyms trở lại v&agrave; giờ đ&acirc;y ch&uacute;ng nằm trong c&aacute;c s&acirc;n vận động lớn, nơi được thiết kế để tạo điều kiện cho t&iacute;nh năng mới, Dynamax ( th&ocirc;ng tin về t&iacute;nh năng ở dưới). Việc đầu ti&ecirc;n khi bước v&agrave;o gym l&agrave; người chơi phải trả lời một v&agrave;i c&acirc;u đố hoặc thử th&aacute;ch, trước khi th&aacute;ch đấu với Gym Leader. Hai gym đầu ti&ecirc;n được x&aacute;c nhận l&agrave; Water v&agrave; Grass.</p>\r\n\r\n<p>C&oacute; một t&iacute;nh năng giao tiếp mới được gọi l&agrave; Y-Comm, tương tự như PSS từ Pokemon X&amp;Y.C&aacute;c biểu tượng được hiển thị b&ecirc;n tr&aacute;i m&agrave;n h&igrave;nh cho biết người chơi hoặc bạn b&egrave; gần đ&oacute; c&oacute; muốn giao dịch hoặc chiến đấu hay kh&ocirc;ng.</p>\r\n\r\n<p>Thiết bị ngoại vi Pok&eacute; Ball Plus được tạo ra để sử dụng với Pok&eacute;mon Let&#39;s Go Pikachu / Eevee cũng hoạt động với Sword &amp; Shield. Pok&eacute;mon c&oacute; thể được đưa v&agrave;o b&oacute;ng v&agrave; đi dạo. Tuy nhi&ecirc;n, n&oacute; kh&ocirc;ng thể được sử dụng để điều khiển tr&ograve; chơi.</p>\r\n\r\n<p>Dịch vụ Pok&eacute;mon Home mới c&oacute; thể được sử dụng để chuyển Pok&eacute;mon v&agrave;o Sword / Shield - tuy nhi&ecirc;n c&oacute; một điểm kh&aacute;c biệt quan trọng l&agrave; chỉ những Pok&eacute;mon c&oacute; trong <a href=\"https://pokemondb.net/pokedex/game/sword-shield\">Galar Pok&eacute;dex</a> mới c&oacute; thể được đưa v&agrave;o.</p>\r\n\r\n<h2><strong>Wild Area</strong></h2>\r\n\r\n<p>Giữa c&aacute;c thị trấn v&agrave; th&agrave;nh phố của Galar l&agrave; một v&ugrave;ng đất rộng lớn được gọi l&agrave; Khu vực hoang d&atilde;. N&oacute; được chia th&agrave;nh nhiều phần được đặt t&ecirc;n nhưng vẫn l&agrave; một thế giới mở ở một mức độ lớn. Pok&eacute;mon mạnh mẽ cư ngụ ở một số khu vực nhất định v&agrave; một số kh&ocirc;ng thể truy cập được cho đến phần sau n&agrave;y&nbsp;trong tr&ograve; chơi.</p>\r\n\r\n<p>Thời tiết thay đổi tr&ecirc;n c&aacute;c khu vực kh&aacute;c nhau v&agrave; c&aacute;c Pok&eacute;mon kh&aacute;c nhau sẽ xuất hiện dựa tr&ecirc;n thời tiết v&agrave; thời gian trong ng&agrave;y. M&aacute;y ảnh cũng c&oacute; thể điều khiển ho&agrave;n to&agrave;n trong Khu vực hoang d&atilde;, cho ph&eacute;p người chơi quan s&aacute;t xung quanh v&agrave; t&igrave;m kiếm Pok&eacute;mon.</p>\r\n\r\n<h2><strong>Dynamax</strong></h2>\r\n\r\n<p>Một hiện tượng mới được gọi l&agrave; Dynamax hiện diện ở v&ugrave;ng Galar. Pok&eacute;mon sử dụng Dynamax tăng k&iacute;ch thước h&agrave;ng loạt v&agrave; tăng sức mạnh của ch&uacute;ng. N&oacute; chỉ c&oacute; thể được sử dụng một lần trong mỗi trận chiến, nhưng Pok&eacute;mon sẽ trở lại b&igrave;nh thường sau 3 lượt.</p>\r\n\r\n<p>Trong suốt Khu vực hoang d&atilde; c&oacute; c&aacute;c Tổ Pok&eacute;mon được biểu thị bằng &aacute;nh s&aacute;ng m&agrave;u đỏ chiếu l&ecirc;n bầu trời. Tại c&aacute;c mật độ n&agrave;y, Max Raid Battles diễn ra, cho ph&eacute;p tối đa bốn người chơi chiến đấu với một Pok&eacute;mon Dynamaxed.</p>\r\n','sword-shield','galar-map-sm.jpg','Pokemon tiếp tục phát triển đến thế hệ thứ tám với Pokemon Sword và Pokemon Shield trên hệ máy Nintendo Switch. Ishihara trước đây đã công bố rằng Let\'s Go Pikachu/Eevee dự định sẽ được chơi dưới dạng \'home console game\' và Sword&Shield là trò chơi \'handheld game\' như các phiên bản trước trong Core Series');
/*!40000 ALTER TABLE `pkmversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `pkmName` varchar(50) DEFAULT NULL,
  `moTa` varchar(500) DEFAULT NULL,
  `Species` varchar(50) DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  `CatchRate` int DEFAULT NULL,
  `EVyield` varchar(20) DEFAULT NULL,
  `FriendShip` int DEFAULT NULL,
  `BaseEXP` int DEFAULT NULL,
  `GrowthRate` varchar(50) DEFAULT NULL,
  `MaleRate` float DEFAULT NULL,
  `FemaleRate` float DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'Bulbasaur ','Bulbasaur is a Grass/Poison type Pokémon introduced in Generation 1. It is known as the Seed Pokémon','	Seed Pokémon',0.7,6.9,45,'1 spAtk',70,64,'Medium Slow',87.5,12.5),(2,'Ivysaur ','Ivysaur is a Grass/Poison type Pokémon introduced in Generation 1. It is known as the Seed Pokémon','Seed Pokémon',1,13,15,'1 spAtk, 1spDef',70,142,'Medium Slow',87.5,12.5),(3,'Venusaur','Venusaur is a Grass/Poison type Pokémon introduced in Generation 1. It is known as the Seed Pokémon.','Seed Pokémon',2,100,45,'2 spAtk, 1spDef',70,236,'Medium Slow',87.5,12.5),(4,'Charmander','Charmander is a Fire type Pokémon introduced in Generation 1. It is known as the Lizard Pokémon.','Lizard Pokémon',0.6,8.5,45,'1 spd',70,62,'Medium Slow',87.5,12.5),(5,'Charmeleon','Charmeleon is a Fire type Pokémon introduced in Generation 1. It is known as the Flame Pokémon.','Flame Pokemon',1.1,19,45,'1 spAtk, 1 spd',70,142,'Medium Slow',87.5,12.5),(6,'Charizard','Charizard is a Fire/Flying type Pokémon introduced in Generation 1. It is known as the Flame Pokémon.','Flame Pokémon',1.7,90.5,45,'3 spAtk',70,240,'Medium Slow',87.5,12.5),(7,'Squirtle','Squirtle is a Water type Pokémon introduced in Generation 1. It is known as the Tiny Turtle Pokémon.','	Tiny Turtle Pokémon',0.5,9,45,'1 def',70,63,'Medium Slow',87.5,12.5),(8,'Wartortle','Wartortle is a Water type Pokémon introduced in Generation 1. It is known as the Turtle Pokémon.','	Turtle Pokémon',1,22.5,45,'1 def, 1 spDef',70,142,'Medium Slow',87.5,12.5),(9,'Blastoise','Blastoise is a Water type Pokémon introduced in Generation 1. It is known as the Shellfish Pokémon.','Shellfish Pokémon',1.6,85.5,45,'3 spDef',70,239,'Medium Slow',87.5,12.5),(10,'Caterpie','Language','Worm Pokémon',0.3,2.9,255,'1 HP',70,39,'Medium Fast',50,50),(11,'Metapod','Metapod is a Bug type Pokémon introduced in Generation 1. It is known as the Cocoon Pokémon.','Cocoon Pokémon',0.7,9.9,120,'2 def',70,72,'Medium Fast',50,50),(12,'Butterfree','Butterfree is a Bug/Flying type Pokémon introduced in Generation 1. It is known as the Butterfly Pokémon.','Butterfly Pokémon',1.1,32,45,'2 spAtk, 1 spDef',70,178,'Medium Fast',50,50),(13,'Weedle','Weedle is a Bug/Poison type Pokémon introduced in Generation 1. It is known as the Hairy Bug Pokémon.','Hairy Bug Pokémon',0.3,3.2,255,'1 spd',70,39,'	Medium Fast',50,50),(14,'Kakuna','Kakuna is a Bug/Poison type Pokémon introduced in Generation 1. It is known as the Cocoon Pokémon.','	Cocoon Pokémon',0.6,10,120,'2 def',70,72,'	Medium Fast',50,50),(15,'Beedrill','Beedrill is a Bug/Poison type Pokémon introduced in Generation 1. It is known as the Poison Bee Pokémon.','Poison Bee Pokémon',1,29.5,45,'2 atk, 1 spDef',70,178,'	Medium Fast',50,50),(16,'Pidgey','Pidgey là một Pokemon mang song hệ Normal/Flying được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Tiny Bird Pokemon\'','Tiny Bird Pokémon',0.3,1.8,255,'1 spd',50,50,'Hơi chậm',50,50),(17,'Pidgeotto','Pidgeotto là một Pokemon mang song hệ Normal/Flying được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Bird Pokemon\'','Bird Pokemon',1.1,30,120,'2 spd',50,122,'Hơi chậm',50,50),(18,'Pidgeot','Pidgeot là một Pokemon mang song hệ Normal/Flying được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Bird Pokemon\'','Bird Pokemon',1.5,39.5,45,'3 spd',50,216,'Hơi chậm',50,50),(19,'Rattata','Rattata là một Pokemon mang hệ Normal được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Mouse Pokemon\'','Mouse Pokemon',0.3,3.5,255,'1 spd',50,51,'Khá nhanh',50,50),(20,'Raticate','Raticate là một Pokemon mang hệ Normal được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Mouse Pokemon\'','Mouse Pokemon',0.7,18.5,127,'2 spd',50,145,'Khá nhanh',50,50),(21,'Spearow','Spearow là một Pokemon mang song hệ Normal/Flying được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Tiny Bird Pokemon\'','Bird Pokemon',0.3,2,255,'1 spd',50,52,'Khá nhanh',50,50),(22,'Fearow','Fearow là một Pokemon mang song hệ Normal/Flying được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Beak Pokemon\'','Beak Pokemon',1.2,38,90,'2 spd',50,155,'Khá nhanh',50,50),(23,'Ekans','Ekans là một Pokemon mang hệ Poison được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Snake Pokemon\'','Snake Pokemon',2,6.9,255,'1 atk',50,58,'Khá nhanh',50,50),(24,'Arbok','Arbok là một Pokemon mang hệ Poison được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Cobra Pokemon\'','Cobra Pokemon',3.5,65,90,'2 atk',50,157,'Khá nhanh',50,50),(25,'Pikachu','Pikachu là một Pokemon mang hệ Electric được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Mouse Pokemon\'','Mouse Pokemon',0.4,6,190,'2 spd',50,112,'Khá nhanh',50,50),(26,'Raichu','Raichu là một Pokemon mang hệ Electric được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Mouse Pokemon\'','Mouse Pokemon',0.8,30,75,'3 spd',50,218,'Khá nhanh',50,50),(27,'Sandshrew','Sandshrew là một Pokemon mang hệ Ground được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Mouse Pokemon\'','Mouse Pokemon',0.6,12,255,'1 def',50,60,'Khá nhanh',50,50),(28,'Sandslash','Sandslash là một Pokemon mang hệ Ground được giới thiệu ở thế hệ thứ 1. Nó còn đc biết đến với cái tên \'Mouse Pokemon\'','Mouse Pokemon',1,26.5,90,'2 def ',50,158,'Khá nhanh',50,50),(29,'Nidoran♀','Nidoran♀ là Pokemon mang hệ Poison được giới thiệu ở thế hệ thứ 1. Nó còn được biết đến với cái tên \'Poison Pin Pokemon\'','Poison Pin Pokemon',0.4,7,235,'1 HP',50,55,'Hơi chậm',0,100),(30,'Nidorina','Nidorina là Pokemon mang hệ Poison được giới thiệu ở thế hệ thứ 1. Nó còn được biết đến với cái tên \'Poison Pin Pokemon\'','Poison Pin Pokemon',0.8,20,120,'2 HP',50,128,'Hơi chậm',0,100),(31,'Nidqueen','Nidoqueen là Pokemon mang song hệ Poison/Ground được giới thiệu ở thế hệ thứ 1. Nó còn được biết đến với cái tên \'Drill Pokemon\'','Drill Pokemon',1.3,60,45,'3 HP',50,227,'Hơi chậm',0,100),(32,'Nidoran♂','Nidoran♂ là Pokemon mang hệ Poison được giới thiệu ở thế hệ thứ 1. Nó còn được biết đến với cái tên \'Poison Pin Pokemon\'','Poison Pin Pokemon',0.5,9,235,'1 atk',50,55,'Hơi chậm',100,0),(33,'Nidorino','Nidorino là Pokemon mang hệ Poison được giới thiệu ở thế hệ thứ 1. Nó còn được biết đến với cái tên \'Poison Pin Pokemon\'','Poison Pin Pokemon',0.9,19.5,120,'2 atk',50,128,'Hơi chậm',100,0),(34,'Nidoking','Nidoking là Pokemon mang song hệ Poison/Ground được giới thiệu ở thế hệ thứ 1. Nó còn được biết đến với cái tên \'Drill Pokemon\'','Drill Pokemon',1.4,62,45,'3 atk',50,227,'Hơi chậm',100,0),(35,'Clefairy','Clefairy là Pokemon mang hệ Fairy được giới thiệu ở thế hệ thứ 1. Nó còn được biết đến với cái tên \'Fairy Pokemon\'','Fairy Pokemon',0.6,7.5,150,'2 HP',140,113,'Nhanh',25,75),(36,'Clefable',NULL,'Fairy Pokemon',1.3,40,25,'3 HP',140,217,'Nhanh',25,75),(37,'Vulpix',NULL,'Fox Pokemon',0.6,9.9,190,'1 spd',50,60,'Khá nhanh',25,75),(38,'Ninetales',NULL,'Fox Pokemon',1.1,19.9,75,'1 spDef, 1 spd',50,177,'Khá nhanh',25,75),(39,'Jigglypuff',NULL,'Baloon Pokemon',0.5,5.5,170,'2 HP',50,95,'Nhanh',25,75),(40,'Wigglytuff',NULL,'Baloon Pokemon',1,12,50,'3 HP',50,196,'Nhanh',25,75),(41,'Zubat',NULL,'Bat Pokemon',0.8,7.5,255,'1 spd',50,49,'Khá nhanh',50,50),(42,'Golbat',NULL,'Bat Pokemon',1.6,55,90,'2 spd',50,159,'Khá nhanh',50,50),(43,'Oddish',NULL,'Weed Pokemon',0.5,5.4,255,'1 spAtk',50,64,'Khá chậm',50,50),(44,'Gloom',NULL,'Weed Pokemon',0.8,8.6,120,'2 spAtk',50,138,'Khá chậm',50,50),(45,'Vileplume',NULL,'Flower Pokemon',1.2,18.6,45,'3 spAtk',50,221,'Khá chậm',50,50),(46,'Paras',NULL,'Mushroom Pokemon',0.3,5.4,190,'1 atk',50,57,'Khá nhanh',50,50),(47,'Parasect',NULL,'Mushroom Pokemon',1,29.5,75,'2 atk, 1 def',50,142,'Khá nhanh',50,50),(48,'Venonat',NULL,'Insect Pokemon',1,30,190,'1 spDef',50,61,'Khá nhanh',50,50),(49,'Venomoth',NULL,'Poison Moth Pokemon',1.5,12.5,75,'1 spAtk, 1 spd',50,158,'Khá nhanh',50,50),(50,'Diglett',NULL,'Mole Pokemon',0.2,0.8,255,'1 spd',50,53,'Khá nhanh',50,50),(51,'Dugtrio',NULL,'Mole Pokemon',0.7,33.3,50,'2 spd',50,149,'Khá nhanh',50,50),(52,'Meowth',NULL,'Scratch Cat Pokemon',0.4,4.2,255,'1 spd',50,58,'Khá nhanh',50,50),(53,'Persian',NULL,'Classy Cat Pokemon',1,32,90,'2 spd',50,154,'Khá nhanh',50,50),(54,'Psyduck',NULL,'Duck Pokemon',0.8,19.6,190,'1 spAtk',50,64,'Khá nhanh',50,50),(55,'Golduck',NULL,'Duck Pokemon',1.7,76.6,75,'2 spAtk',50,175,'Khá nhanh',50,50),(56,'Mankey',NULL,'Pig Monkey Pokemon',0.5,28.8,190,'1 atk',50,61,'Khá nhanh',50,50),(57,'Primeape',NULL,'Pig Monkey Pokemon',1,32,75,'2 atk',50,159,'Khá nhanh',50,50),(58,'Growlithe',NULL,'Puppy Pokemon',0.7,19,190,'1 atk',50,70,'Chậm',75,25),(59,'Arcanine',NULL,'Legendary Pokemon',1.9,155,75,'2 atk',50,194,'Chậm',75,25),(60,'Poliwag',NULL,'Tadpole Pokemon',0.6,12.4,255,'1 spd',50,60,'Hơi chậm',50,50),(61,'Poliwhirl',NULL,'Tadpole Pokemon',1,20,120,'2 spd',50,135,'Hơi chậm',50,50),(62,'Poliwrath',NULL,'Tadpole Pokemon',1.3,54,45,'3 def',50,230,'Hơi chậm',50,50),(63,'Abra',NULL,'Psi Pokemon',0.9,19.5,200,'1 spAtk',50,62,'Hơi chậm',75,25),(64,'Kadabra',NULL,'Psi Pokemon',1.3,56.4,100,'2 spAtk',50,140,'Hơi chậm',75,25),(65,'Alakazam',NULL,'Psi Pokemon',1.5,48,50,'3 spAtk',50,225,'Hơi chậm',75,25),(66,'Machop',NULL,'Superpower Pokemon',0.8,19.5,180,'1 atk',50,61,'Hơi chậm',75,25),(67,'Machoke',NULL,'Superpower Pokemon',1.5,70.5,90,'2 atk',50,142,'Hơi chậm',75,25),(68,'Machamp',NULL,'Superpower Pokemon',1.6,130,45,'3 atk',50,227,'Hơi chậm',75,25),(69,'Bellsprout',NULL,'Flower Pokemon',0.7,4,255,'1 atk',50,60,'Hơi chậm',50,50),(70,'Weepinbell',NULL,'Flycatcher Pokemon',1,6.4,120,'2 atk',50,137,'Hơi chậm',50,50),(71,'Victreebel',NULL,'Flycatcher Pokemon',1.7,15.5,45,'3 atk',50,221,'Hơi chậm',50,50),(72,'Tentacool',NULL,'Jellyfish Pokemon',0.9,45.5,190,'1 spDef',50,67,'Chậm',50,50),(73,'Tentacruel',NULL,'Jellyfish Pokemon',1.6,55,60,'2 spDef',50,180,'Chậm',50,50),(74,'Geodude',NULL,'Rock Pokemon',0.4,20,255,'1 def',50,60,'Hơi chậm',50,50),(75,'Graveler',NULL,'Rock Pokemon',1,105,120,'2 def',50,137,'Hơi chậm',50,50),(76,'Golem',NULL,'Rock Pokemon',1.4,300,45,'3 def',50,223,'Hơi chậm',50,50),(77,'Ponyta',NULL,'Fire Horse Pokemon',1,30,190,'1 spd',50,82,'Khá nhanh',50,50),(78,'Rapidash',NULL,'Fire Horse Pokemon',1.7,95,60,'2 spd',50,175,'Khá nhanh',50,50),(79,'Slowpoke',NULL,'Dopey Pokemon',1.2,36,190,'1 HP',50,63,'Khá nhanh',50,50),(80,'Slowbro',NULL,'Hermit Crab Pokemon',1.6,78.5,75,'2 def',50,172,'Khá nhanh',50,50),(81,'Magnemite',NULL,'Magnet Pokemon',0.3,6,190,'1 spAtk',50,65,'Khá nhanh',50,50),(82,'Magneton',NULL,'Magnet Pokemon',1,60,60,'2 spAtk',50,163,'Khá nhanh',50,50),(83,'Farfetch\'d',NULL,'Wild Duck Pokemon',0.8,15,45,'1 atk',50,132,'Khá nhanh',50,50),(84,'Dodou',NULL,'Twin Bird Pokemon',1.4,39.2,190,'1 atk',50,62,'Khá nhanh',50,50),(85,'Dodrio',NULL,'Triple Bird Pokemon',1.8,85.2,45,'2 atk',50,165,'Khá nhanh',50,50),(86,'Seel ',NULL,'Sea Lion Pokemon',1.1,90,190,'1 spDef',50,65,'Khá nhanh',50,50),(87,'Dewgong',NULL,'Sea Lion Pokemon',1.7,120,75,'2 spDef',50,166,'Khá nhanh',50,50),(88,'Grimer',NULL,'Sludge Pokemon',0.9,30,190,'1 HP',50,65,'Khá nhanh',50,50),(89,'Muk',NULL,'Sludge Pokemon',1.2,30,75,'1 HP, 1 atk',50,175,'Khá nhanh',50,50),(90,'Shellder',NULL,'Bivalve Pokemon',0.3,4,190,'1 def',50,61,'Chậm',50,50),(91,'Cloyster',NULL,'Bivalve Pokemon',1.5,132.5,60,'2 def',50,184,'Chậm',50,50),(92,'Gastly',NULL,'Gas Pokemon',1.3,0.1,190,'1 spAtk',50,62,'Khá chậm',50,50),(93,'Haunter',NULL,'Gas Pokemon',1.6,0.1,90,'2 spAtk',50,142,'Khá chậm',50,50),(94,'Gengar',NULL,'Shadow Pokemon',1.5,40.5,45,'3 spAtk',50,225,'Khá chậm',50,50),(95,'Onix',NULL,'Rock Snake Pokemon',8.8,210,45,'1 def',50,77,'Khá nhanh',50,50),(96,'Drowzee',NULL,'Hypnosis Pokemon',1,32.4,190,'1 spDef',50,66,'Khá nhanh',50,50),(97,'Hypno',NULL,'Hypnosis Pokemon',1.6,75.6,75,'2 spDef',50,169,'Khá nhanh',50,50),(98,'Krabby',NULL,'River Crab Pokemon',0.4,6.5,225,'1 atk',50,65,'Khá nhanh',50,50),(99,'Kingler',NULL,'Pincer Pokemon',1.3,60,60,'2 atk',50,166,'Khá nhanh',50,50),(100,'Voltorb',NULL,'Ball Pokemon',0.5,10.4,190,'1 spd',50,66,'Khá nhanh',50,50),(101,'Electrode',NULL,'Ball Pokemon',1.2,66.6,60,'2 spd',50,172,'Khá nhanh',50,50),(102,'Exeggcute',NULL,'Egg Pokemon',0.4,2.5,90,'1 def',50,65,'Chậm',50,50),(103,'Exeggutor',NULL,'Coconut Pokemon',10.9,415.6,45,'2 spAtk',50,186,'Chậm',50,50),(104,'Cubone',NULL,'Lonely Pokemon',0.4,6.5,190,'1 def',50,64,'Khá nhanh',50,50),(105,'Marowak',NULL,'Bone Keeper Pokemon',1,45,75,'2 def',50,149,'Khá nhanh',50,50),(106,'Hitmonlee',NULL,'Kicking Pokemon',1.5,49.8,45,'2 atk',50,159,'Khá nhanh',100,0),(107,'Hitmonchan',NULL,'Punching Pokemon',1.4,50.2,45,'2 spDef',50,159,'Khá nhanh',100,0),(108,'Lickitung',NULL,'Licking Pokemon',1.2,65.5,45,'2 HP',50,77,'Khá nhanh',50,50),(109,'Koffing',NULL,'Poison Gas Pokemon',0.6,1,190,'1 def',50,68,'Khá nhanh',50,50),(110,'Weezing',NULL,'Poison Gas Pokemon',1.2,9.5,60,'2 def',50,172,'Khá nhanh',50,50),(111,'Rhyhorn',NULL,'Spikes Pokemon',1,115,120,'1 def',50,69,'Chậm',50,50),(112,'Rhydon',NULL,'Drill Pokemon',1.9,120,60,'2 atk',50,170,'Chậm',50,50),(113,'Chansey',NULL,'Egg Pokemon',1.1,34.6,30,'2 HP',140,395,'Nhanh',50,50),(114,'Tangela',NULL,'Vine Pokemon',1,35,45,'1 def',50,87,'Khá nhanh',50,50),(115,'Kangaskhan',NULL,'Parent Pokemon',2.2,80,45,'2 HP',50,172,'Khá nhanh',0,100),(116,'Horsee',NULL,'Dragon Pokemon',0.4,8,225,'1 spAtk',50,59,'Khá nhanh',50,50),(117,'Seadra',NULL,'Dragon Pokemon',1.2,25,75,'1 def, 1 spAtk',50,154,'Khá nhanh',50,50),(118,'Golden',NULL,'Goldfish Pokemon',0.6,15,225,'1 atk',50,64,'Khá nhanh',50,50),(119,'Seeking',NULL,'Goldfish Pokemon',1.3,39,60,'2 atk',50,158,'Khá nhanh',50,50),(120,'Staryu',NULL,'Star Shape Pokemon',0.8,34.5,225,'1 spd',50,68,'Chậm',50,50),(121,'Starmie',NULL,'Mysterious Pokemon',1.1,80,60,'2 spd',50,182,'Chậm',50,50),(122,'Mr. Mine',NULL,'Barrier Pokemon',1.3,54.5,45,'2 spDef',50,161,'Khá nhanh',50,50),(123,'Scyther',NULL,'Mantis Pokemon',1.5,56,45,'1 atk',50,100,'Khá nhanh',50,50),(124,'Jynx',NULL,'Human Shape Pokemon',1.4,40.6,45,'2 spAtk',50,159,'Khá nhanh',0,100),(125,'Electabuzz',NULL,'Electric Pokemon',1.1,30,45,'2 spd',50,172,'Khá nhanh',75,25),(126,'Magmar',NULL,'Spitfire Pokemon',1.3,44.5,45,'2 spAtk',50,173,'Khá nhanh',75,25),(127,'Pinsir',NULL,'Stag Beetle Pokemon',1.5,55,45,'2 atk',50,175,'Chậm',50,50),(128,'Tauros',NULL,'Wild Bull Pokemon',1.4,88.4,45,'1 atk, 1 spd',50,172,'Chậm',100,0),(129,'Magikarp',NULL,'Fish Pokemon',0.9,10,255,'1 spd',50,40,'Chậm',50,50),(130,'Gyarados',NULL,'Atrocious Pokémon',6.5,235,45,'2 atk',50,189,'Chậm',50,50),(131,'Lapras',NULL,'Transport Pokemon',2.5,220,45,'2 HP',50,187,'Chậm',50,50),(132,'Ditto',NULL,'Transform Pokemon',0.3,4,35,'1 HP',50,101,'Khá nhanh',0,0),(133,'Eevee',NULL,'Evolution Pokemon',0.3,6.5,45,'1 spDef',50,65,'Khá nhanh',87.5,12.5),(134,'Vaporeon',NULL,'Bubble Jet Pokemon',1,29,45,'2 HP',50,184,'Khá nhanh',87.5,12.5),(135,'Jolteon',NULL,'Lightning Pokemon',0.8,24.5,45,'2 spd',50,184,'Khá nhanh',87.5,12.5),(136,'Flareon',NULL,'Flame Pokemon',0.9,25,45,'2 atk',50,184,'Khá nhanh',87.5,12.5),(137,'Porygon',NULL,'Virtual Pokemon',0.8,36.5,45,'1 spAtk',50,79,'Khá nhanh',0,0),(138,'Omanyte',NULL,'Spiral Pokemon',0.4,7.5,45,'1 def',50,71,'Khá nhanh',87.5,12.5),(139,'Omastar',NULL,'Spiral Pokemon',1,35,45,'2 def',50,173,'Khá nhanh',87.5,12.5),(140,'Kabuto',NULL,'Shellfish Pokemon',0.5,11.5,45,'1 def',50,71,'Khá nhanh',87.5,12.5),(141,'Kabutops',NULL,'Shellfish Pokemon',1.3,40.5,45,'2 atk',50,173,'Khá nhanh',87.5,12.5),(142,'Aerodactyl',NULL,'Fossil Pokemon',1.8,59,45,'2 spd',50,180,'Chậm',87.5,12.5),(143,'Snorlax',NULL,'Sleeping Pokemon',2.1,460,25,'2 HP',50,189,'Chậm',87.5,12.5),(144,'Articuno',NULL,'Freeze Pokemon',1.7,55.4,3,'3 spDef',35,261,'Chậm',0,0),(145,'Zapdos',NULL,'Electric Pokemon',1.6,52.6,3,'3 spAtk',35,261,'Chậm',0,0),(146,'Moltres',NULL,'Flame Pokemon',2,60,3,'3 spAtk',35,261,'Chậm',0,0),(147,'Dratini',NULL,'Dragon Pokemon',1.8,3.3,45,'1 atk',35,60,'Chậm',50,50),(148,'Dragonair',NULL,'Dragon Pokemon',4,16.5,45,'2 atk',35,147,'Chậm',50,50),(149,'Dragonite',NULL,'Dragon Pokemon',2.2,210,45,'3 atk',35,270,'Chậm',50,50),(150,'Mewtwo',NULL,'Genetic Pokemon',2,122,3,'3 spAtk',0,306,'Chậm',0,0),(151,'Mew',NULL,'New Species Pokemon',0.4,4,45,'3 HP',100,270,'Hơi chậm',0,0),(152,'Chikorita',NULL,'Leaf Pokemon',0.9,6.4,45,'1 spDef',50,64,'Hơi chậm',87.5,12.5),(153,'Bayleef',NULL,'Leaf Pokemon',1.2,15.8,45,'1 def, 1 spDef',50,142,'Hơi chậm',87.5,12.5),(165,'Meganium',NULL,'Herb Pokémon',1.8,100.5,45,'1 def, 2 spDef',50,236,'Hơi chậm',87.5,12.5);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_move`
--

DROP TABLE IF EXISTS `pokemon_move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_move` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PokemonID` int DEFAULT NULL,
  `MoveID` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PokemonMove_Move` (`MoveID`),
  KEY `FK_PokemonMove_Pokemon` (`PokemonID`),
  CONSTRAINT `FK_PokemonMove_Move` FOREIGN KEY (`MoveID`) REFERENCES `move` (`Id`),
  CONSTRAINT `FK_PokemonMove_Pokemon` FOREIGN KEY (`PokemonID`) REFERENCES `pokemon` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_move`
--

LOCK TABLES `pokemon_move` WRITE;
/*!40000 ALTER TABLE `pokemon_move` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemon_move` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postvote`
--

DROP TABLE IF EXISTS `postvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postvote` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `QuestionID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `isVote` tinyint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PostVote_Question` (`QuestionID`),
  KEY `FK_PostVote_User` (`UserID`),
  CONSTRAINT `FK_PostVote_Question` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`Id`),
  CONSTRAINT `FK_PostVote_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postvote`
--

LOCK TABLES `postvote` WRITE;
/*!40000 ALTER TABLE `postvote` DISABLE KEYS */;
INSERT INTO `postvote` VALUES (1,1,2,1),(8,1,1,1),(11,1,3,-1),(17,15,1,1),(18,15,7,1),(19,15,2,1),(21,15,4,1);
/*!40000 ALTER TABLE `postvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Title` varchar(500) DEFAULT NULL,
  `Question` blob,
  `NgayTao` varchar(50) DEFAULT NULL,
  `NgayDuyet` varchar(50) DEFAULT NULL,
  `NguoiDuyetID` int DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `Vote` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Question_UserID` (`UserID`),
  CONSTRAINT `FK_Question_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'What is good moveset for Charizard?',_binary '<p>abc???</p>\r\n\r\n<p>xyz</p>\r\n\r\n<p><img alt=\"\" src=\"E:\\eclipse setup\\PokemonDatabase\\src\\main\\webapp\\images\\abra.jpg\" /><img alt=\"\" src=\"https://img.pokemondb.net/artwork/large/charizard.jpg\" /></p>\r\n','2021-03-22',NULL,0,1,0),(4,7,'Làm thế nào để đi qua được con Snorlax chặn đường?',_binary '<p><img alt=\"\" src=\"https://heavy.com/wp-content/uploads/2018/11/how-to-move-snorlax-in-pokemon-lets-go.jpg?quality=65&amp;strip=all&amp;w=780\" style=\"height:439px; width:780px\" /></p>\r\n','2021-03-24',NULL,0,1,0),(5,7,'Đội hình tốt nhất để đánh bại Mossdeep Gym là gì',_binary '<p><img alt=\"\" src=\"https://cdn.bulbagarden.net/upload/1/17/Mossdeep_Gym_RS.png\" /></p>\r\n','2021-03-24',NULL,0,1,0),(7,7,'Victory Road Kanto',_binary '<p>Ai c&oacute; bản đồ Victory Road map Kanto cho m&igrave;nh xin với ạ</p>\r\n','2021-03-24',NULL,0,1,0),(10,1,'test tags',_binary '<p>test</p>\r\n','06/11/2017 12:26:18',NULL,0,0,0),(11,1,'test feature',_binary '<p>test</p>\r\n','2021-03-24',NULL,0,0,0),(12,1,'test tags',_binary '<p>test</p>\r\n','2021-03-25',NULL,0,0,0),(13,1,'Đọc luật trước khi post',_binary '<p>1. Admin l&agrave; bố</p>\r\n\r\n<p>2. Trước khi l&agrave;m g&igrave; nhớ xem lại (1)</p>\r\n','25/03/2021 11:58:02',NULL,0,1,0),(14,1,'demo',_binary '<p>demo</p>\r\n','26/03/2021 09:36:49',NULL,0,1,NULL),(15,4,'Khi nào thì Mega Evolution sẽ quay lại? Đó gần như là 1 tính năng hay nhất của game ',_binary '<p>gen 6 ra mắt với Mega Evolution c&aacute;ch đ&acirc;y 7 năm, liệu c&oacute; cơ hội n&agrave;o cho n&oacute; quay lại v&agrave;o gen 9 kế tiếp kh&ocirc;ng?</p>\r\n\r\n<p><img alt=\"\" src=\"https://i.redd.it/8cisgb2qnj551.jpg\" /></p>\r\n','30/03/2021 00:26:07',NULL,0,1,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questiontag`
--

DROP TABLE IF EXISTS `questiontag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questiontag` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TagID` int DEFAULT NULL,
  `QuestionID` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_QuestionTag_Tags` (`TagID`),
  KEY `FK_QuestionTag_Question` (`QuestionID`),
  CONSTRAINT `FK_QuestionTag_Question` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`Id`),
  CONSTRAINT `FK_QuestionTag_Tags` FOREIGN KEY (`TagID`) REFERENCES `tags` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questiontag`
--

LOCK TABLES `questiontag` WRITE;
/*!40000 ALTER TABLE `questiontag` DISABLE KEYS */;
INSERT INTO `questiontag` VALUES (1,14,12),(2,8,12),(3,1,1),(4,7,1),(5,11,1),(6,3,5),(7,7,5),(8,28,13),(9,11,14),(10,8,14),(11,7,14),(12,2,15),(13,5,15);
/*!40000 ALTER TABLE `questiontag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AnswerID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Reply` varchar(1000) DEFAULT NULL,
  `NgayTao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reply_UserID` (`UserID`),
  KEY `FK_Reply_Answer` (`AnswerID`),
  CONSTRAINT `FK_Reply_Answer` FOREIGN KEY (`AnswerID`) REFERENCES `answer` (`Id`),
  CONSTRAINT `FK_Reply_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,1,3,'test1',NULL),(2,1,3,'test2',NULL),(3,1,3,'test3',NULL),(4,2,2,'abc',NULL),(8,1,2,'thong cho','2021-03-24'),(9,4,2,'just with Mega X','2021-03-24'),(10,7,1,'tesst','26/03/2021 09:38:54'),(11,7,1,'test','26/03/2021 09:39:21'),(12,9,2,'biết đâu Mega sẽ quay lại ở trong phiên bản mở rộng?','30/03/2021 00:32:18');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin'),(2,'Admin'),(3,'Mod'),(4,'Supporter'),(5,'Member');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Tag` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'charizard'),(2,'mega-evolution'),(3,'pokedex'),(4,'venusaur'),(5,'mega-stone'),(6,'legendary'),(7,'move'),(8,'ability'),(9,'groundon'),(10,'normal'),(11,'fire'),(12,'water'),(13,'grass'),(14,'eletric'),(15,'poison'),(16,'fighting'),(17,'ghost'),(18,'dragon'),(19,'dark'),(20,'fairy'),(21,'psychic'),(22,'ice'),(23,'rock'),(24,'ground'),(25,'flying'),(26,'steel'),(27,'bug'),(28,'rules');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typechartatk`
--

DROP TABLE IF EXISTS `typechartatk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typechartatk` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AtkType` int DEFAULT NULL,
  `DefType` int DEFAULT NULL,
  `Result` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_atktype_type` (`AtkType`),
  KEY `FK_deftype_type` (`DefType`),
  CONSTRAINT `FK_atktype_type` FOREIGN KEY (`AtkType`) REFERENCES `pkmtype` (`TypeId`),
  CONSTRAINT `FK_deftype_type` FOREIGN KEY (`DefType`) REFERENCES `pkmtype` (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typechartatk`
--

LOCK TABLES `typechartatk` WRITE;
/*!40000 ALTER TABLE `typechartatk` DISABLE KEYS */;
INSERT INTO `typechartatk` VALUES (1,1,1,'1.0'),(2,1,2,'1.0'),(3,1,3,'1.0'),(4,1,4,'1.0'),(5,1,5,'1.0'),(6,1,6,'1.0'),(7,1,7,'1.0'),(8,1,8,'1.0'),(9,1,9,'1.0'),(10,1,10,'1.0'),(11,1,11,'1.0'),(12,1,12,'1.0'),(13,1,13,'0.5'),(14,1,14,'0.0'),(15,1,15,'1.0'),(16,1,16,'1.0'),(17,1,17,'0.5'),(18,1,18,'1.0'),(19,2,1,'1.0'),(20,2,2,'0.5'),(21,2,3,'0.5'),(22,2,4,'1.0'),(23,2,5,'2.0'),(24,2,6,'2.0'),(25,2,7,'1.0'),(26,2,8,'1.0'),(27,2,9,'1.0'),(28,2,10,'1.0'),(29,2,11,'1.0'),(30,2,12,'2.0'),(31,2,13,'0.5'),(32,2,14,'1.0'),(33,2,15,'0.5'),(34,2,16,'1.0'),(35,2,17,'2.0'),(36,2,18,'1.0'),(37,3,1,'1.0'),(38,3,2,'2.0'),(39,3,3,'0.5'),(40,3,4,'1.0'),(41,3,5,'0.5'),(42,3,6,'1.0'),(43,3,7,'1.0'),(44,3,8,'1.0'),(45,3,9,'2.0'),(46,3,10,'1.0'),(47,3,11,'1.0'),(48,3,12,'1.0'),(49,3,13,'2.0'),(50,3,14,'1.0'),(51,3,15,'0.5'),(52,3,16,'1.0'),(53,3,17,'1.0'),(54,3,18,'1.0'),(55,4,1,'1.0'),(56,4,2,'1.0'),(57,4,3,'2.0'),(58,4,4,'0.5'),(59,4,5,'0.5'),(60,4,6,'1.0'),(61,4,7,'1.0'),(62,4,8,'1.0'),(63,4,9,'0.0'),(64,4,10,'2.0'),(65,4,11,'1.0'),(66,4,12,'1.0'),(67,4,13,'1.0'),(68,4,14,'1.0'),(69,4,15,'0.5'),(70,4,16,'1.0'),(71,4,17,'1.0'),(72,4,18,'1.0'),(73,5,1,'1.0'),(74,5,2,'0.5'),(75,5,3,'2.0'),(76,5,4,'1.0'),(77,5,5,'0.5'),(78,5,6,'1.0'),(79,5,7,'1.0'),(80,5,8,'0.5'),(81,5,9,'2.0'),(82,5,10,'0.5'),(83,5,11,'1.0'),(84,5,12,'0.5'),(85,5,13,'2.0'),(86,5,14,'1.0'),(87,5,15,'0.5'),(88,5,16,'1.0'),(89,5,17,'0.5'),(90,5,18,'1.0'),(91,6,1,'1.0'),(92,6,2,'0.5'),(93,6,3,'0.5'),(94,6,4,'1.0'),(95,6,5,'2.0'),(96,6,6,'0.5'),(97,6,7,'1.0'),(98,6,8,'1.0'),(99,6,9,'2.0'),(100,6,10,'2.0'),(101,6,11,'1.0'),(102,6,12,'1.0'),(103,6,13,'1.0'),(104,6,14,'1.0'),(105,6,15,'2.0'),(106,6,16,'1.0'),(107,6,17,'0.5'),(108,6,18,'1.0'),(109,7,1,'2.0'),(110,7,2,'1.0'),(111,7,3,'1.0'),(112,7,4,'1.0'),(113,7,5,'1.0'),(114,7,6,'2.0'),(115,7,7,'1.0'),(116,7,8,'0.5'),(117,7,9,'1.0'),(118,7,10,'0.5'),(119,7,11,'0.5'),(120,7,12,'0.5'),(121,7,13,'2.0'),(122,7,14,'0.0'),(123,7,15,'1.0'),(124,7,16,'2.0'),(125,7,17,'2.0'),(126,7,18,'0.5'),(127,8,1,'1.0'),(128,8,2,'1.0'),(129,8,3,'1.0'),(130,8,4,'1.0'),(131,8,5,'2.0'),(132,8,6,'1.0'),(133,8,7,'1.0'),(134,8,8,'0.5'),(135,8,9,'0.5'),(136,8,10,'1.0'),(137,8,11,'1.0'),(138,8,12,'1.0'),(139,8,13,'0.5'),(140,8,14,'0.5'),(141,8,15,'1.0'),(142,8,16,'1.0'),(143,8,17,'0.0'),(144,8,18,'2.0'),(145,9,1,'1.0'),(146,9,2,'2.0'),(147,9,3,'1.0'),(148,9,4,'2.0'),(149,9,5,'0.5'),(150,9,6,'1.0'),(151,9,7,'1.0'),(152,9,8,'2.0'),(153,9,9,'1.0'),(154,9,10,'0.0'),(155,9,11,'1.0'),(156,9,12,'0.5'),(157,9,13,'2.0'),(158,9,14,'1.0'),(159,9,15,'1.0'),(160,9,16,'1.0'),(161,9,17,'2.0'),(162,9,18,'1.0'),(163,10,1,'1.0'),(164,10,2,'1.0'),(165,10,3,'1.0'),(166,10,4,'0.5'),(167,10,5,'2.0'),(168,10,6,'1.0'),(169,10,7,'2.0'),(170,10,8,'1.0'),(171,10,9,'1.0'),(172,10,10,'1.0'),(173,10,11,'1.0'),(174,10,12,'2.0'),(175,10,13,'0.5'),(176,10,14,'1.0'),(177,10,15,'1.0'),(178,10,16,'1.0'),(179,10,17,'0.5'),(180,10,18,'1.0'),(181,11,1,'1.0'),(182,11,2,'1.0'),(183,11,3,'1.0'),(184,11,4,'1.0'),(185,11,5,'1.0'),(186,11,6,'1.0'),(187,11,7,'2.0'),(188,11,8,'2.0'),(189,11,9,'1.0'),(190,11,10,'1.0'),(191,11,11,'0.5'),(192,11,12,'1.0'),(193,11,13,'1.0'),(194,11,14,'1.0'),(195,11,15,'1.0'),(196,11,16,'0.0'),(197,11,17,'0.5'),(198,11,18,'1.0'),(199,12,1,'1.0'),(200,12,2,'0.5'),(201,12,3,'1.0'),(202,12,4,'1.0'),(203,12,5,'2.0'),(204,12,6,'1.0'),(205,12,7,'0.5'),(206,12,8,'0.5'),(207,12,9,'1.0'),(208,12,10,'0.5'),(209,12,11,'2.0'),(210,12,12,'1.0'),(211,12,13,'1.0'),(212,12,14,'0.5'),(213,12,15,'1.0'),(214,12,16,'2.0'),(215,12,17,'0.5'),(216,12,18,'0.5'),(217,13,1,'1.0'),(218,13,2,'2.0'),(219,13,3,'1.0'),(220,13,4,'1.0'),(221,13,5,'1.0'),(222,13,6,'2.0'),(223,13,7,'0.5'),(224,13,8,'1.0'),(225,13,9,'0.5'),(226,13,10,'2.0'),(227,13,11,'1.0'),(228,13,12,'2.0'),(229,13,13,'1.0'),(230,13,14,'1.0'),(231,13,15,'1.0'),(232,13,16,'1.0'),(233,13,17,'0.5'),(234,13,18,'1.0'),(235,14,1,'0.0'),(236,14,2,'1.0'),(237,14,3,'1.0'),(238,14,4,'1.0'),(239,14,5,'1.0'),(240,14,6,'1.0'),(241,14,7,'1.0'),(242,14,8,'1.0'),(243,14,9,'1.0'),(244,14,10,'1.0'),(245,14,11,'2.0'),(246,14,12,'1.0'),(247,14,13,'1.0'),(248,14,14,'2.0'),(249,14,15,'1.0'),(250,14,16,'0.5'),(251,14,17,'1.0'),(252,14,18,'1.0'),(253,15,1,'1.0'),(254,15,2,'1.0'),(255,15,3,'1.0'),(256,15,4,'1.0'),(257,15,5,'1.0'),(258,15,6,'1.0'),(259,15,7,'1.0'),(260,15,8,'1.0'),(261,15,9,'1.0'),(262,15,10,'1.0'),(263,15,11,'1.0'),(264,15,12,'1.0'),(265,15,13,'1.0'),(266,15,14,'1.0'),(267,15,15,'2.0'),(268,15,16,'1.0'),(269,15,17,'0.5'),(270,15,18,'0.0'),(271,16,1,'1.0'),(272,16,2,'1.0'),(273,16,3,'1.0'),(274,16,4,'1.0'),(275,16,5,'1.0'),(276,16,6,'1.0'),(277,16,7,'0.5'),(278,16,8,'1.0'),(279,16,9,'1.0'),(280,16,10,'1.0'),(281,16,11,'2.0'),(282,16,12,'1.0'),(283,16,13,'1.0'),(284,16,14,'2.0'),(285,16,15,'1.0'),(286,16,16,'0.5'),(287,16,17,'1.0'),(288,16,18,'0.5'),(289,17,1,'1.0'),(290,17,2,'0.5'),(291,17,3,'0.5'),(292,17,4,'0.5'),(293,17,5,'1.0'),(294,17,6,'2.0'),(295,17,7,'1.0'),(296,17,8,'1.0'),(297,17,9,'1.0'),(298,17,10,'1.0'),(299,17,11,'1.0'),(300,17,12,'1.0'),(301,17,13,'2.0'),(302,17,14,'1.0'),(303,17,15,'1.0'),(304,17,16,'1.0'),(305,17,17,'0.5'),(306,17,18,'2.0'),(307,18,1,'1.0'),(308,18,2,'0.5'),(309,18,3,'1.0'),(310,18,4,'1.0'),(311,18,5,'1.0'),(312,18,6,'1.0'),(313,18,7,'2.0'),(314,18,8,'0.5'),(315,18,9,'1.0'),(316,18,10,'1.0'),(317,18,11,'1.0'),(318,18,12,'1.0'),(319,18,13,'1.0'),(320,18,14,'1.0'),(321,18,15,'2.0'),(322,18,16,'2.0'),(323,18,17,'0.5'),(324,18,18,'1.0');
/*!40000 ALTER TABLE `typechartatk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `RoleID` int DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `verifyCode` varchar(10) DEFAULT NULL,
  `ngayTao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Role` (`RoleID`),
  CONSTRAINT `FK_User_Role` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mạc Anh Thanh','thanhma@gmail.com','0942996736','Hà Nội','admin','admin',1,1,NULL,'17/01/2021'),(2,'Phạm Hanh Thông','thongph@gmail.com','0123456789','Hà Nội','thongph','thongph',2,1,NULL,'20/01/2021'),(3,'Nguyễn Thanh Hải','haint@gmail.com','0123456789','Hà Nội','haint','haint',4,1,NULL,'20/01/2021'),(4,'Trần Văn Sơn','sontv@gmail.com','0123456897','Hà Nội','sontv','sontv',5,1,NULL,'20/01/2021'),(7,NULL,'thanh.navi17@gmail.com',NULL,NULL,'ntt','1',5,1,'CYoEsw','20/01/2021'),(8,NULL,'thanh.navi17@gmail.com',NULL,NULL,'thanh123','1',5,1,'fFdtwO','20/01/2021'),(9,NULL,'dangbq84@gmail.com',NULL,NULL,'quangbq','123',5,0,'P2TmFe','20/01/2021'),(10,NULL,'thanh.navi17@gmail.com',NULL,NULL,'thanhma123','thanh',5,1,'ySk0um','20/01/2021');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VersionID` int DEFAULT NULL,
  `Intro` varchar(500) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `NgayTao` date DEFAULT NULL,
  `NgayDuyet` date DEFAULT NULL,
  `NguoiTaoID` int DEFAULT NULL,
  `NguoiDuyetID` int DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Videos_PkmVersion` (`VersionID`),
  CONSTRAINT `FK_Videos_PkmVersion` FOREIGN KEY (`VersionID`) REFERENCES `pkmversion` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 16:49:07
