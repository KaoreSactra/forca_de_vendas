-- /*!999999\- enable the sandbox mode */
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: painel_forca_de_vendas_dev
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `reference` varchar(30) NOT NULL,
  `type` enum('NACIONAL','IMPORTADO') NOT NULL,
  `gender` enum('MASCULINO','FEMININO','INFANTIL','JUVENIL','UNISSEX','FAT','OUTRO') NOT NULL,
  `prompt_delivery` tinyint(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `erp_id` varchar(37) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  `deadline_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `subcategory_id` int(10) unsigned DEFAULT NULL,
  `category_order` tinyint(4) DEFAULT 0,
  `composition_data` varchar(255) DEFAULT NULL,
  `technical_information` varchar(255) DEFAULT NULL,
  `open_grid` tinyint(1) NOT NULL DEFAULT 0,
  `ipi` decimal(10,2) DEFAULT 0.00,
  `is_discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `is_launch` tinyint(1) NOT NULL DEFAULT 0,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  `colection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_erpId_companyId_key` (`erp_id`,`company_id`),
  KEY `products_brandId_fkey` (`brand_id`),
  KEY `products_companyId_fkey` (`company_id`),
  KEY `products_deadlineId_fkey` (`deadline_id`),
  KEY `fk_categories_products` (`category_id`),
  KEY `fk_subcategories_products` (`subcategory_id`),
  CONSTRAINT `fk_brands_company` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_categories_products` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_products_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_products_deadline` FOREIGN KEY (`deadline_id`) REFERENCES `deadlines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subcategories_products` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'Camisola','12.12.33','NACIONAL','FEMININO',1,'Sinta-se sex, leve e solta.',1,NULL,1,1,'2025-02-21 17:01:57','2025-03-18 16:25:01',NULL,4,NULL,0,NULL,NULL,0,0.00,0,0,1,NULL),
(2,'Kit 3x Calça Jeans Minimal','33.12.33','IMPORTADO','MASCULINO',1,'Fique pronto para ir a qualquer lugar',1,NULL,6,8,'2025-02-21 17:51:30','2025-03-20 19:12:07',NULL,2,3,0,NULL,NULL,0,0.00,0,0,1,NULL),
(3,'Camiseta Marrom ','12.12.12','NACIONAL','MASCULINO',1,'Leve e confortavel',1,NULL,1,9,'2025-02-21 18:34:39','2025-03-20 19:12:07',NULL,1,5,0,NULL,NULL,0,0.00,0,0,1,NULL),
(4,'Camiseta Violeta Cinza Urbano','33.33.33','NACIONAL','MASCULINO',1,NULL,1,NULL,1,10,'2025-02-21 19:39:07','2025-03-17 18:23:53',NULL,1,5,0,NULL,NULL,0,0.00,0,0,0,NULL),
(5,'Camiseta azul caneta','33.33.12','NACIONAL','MASCULINO',1,NULL,1,NULL,1,11,'2025-02-21 20:02:43','2025-03-20 19:12:07',NULL,1,NULL,0,NULL,NULL,0,0.00,0,0,0,NULL),
(6,'Bermuda azul caneta','156.127','NACIONAL','MASCULINO',1,NULL,1,NULL,1,12,'2025-02-21 20:43:05','2025-03-17 18:23:55',NULL,3,1,0,NULL,NULL,0,0.00,0,0,0,NULL),
(7,'Calça amarela','12.12.77','IMPORTADO','MASCULINO',1,'Leve com lindas estampas de vaquinha.',1,NULL,1,13,'2025-02-24 15:54:03','2025-03-17 18:23:55',NULL,5,NULL,0,NULL,NULL,0,0.00,0,0,0,NULL),
(8,'Camiseta azul','77.12.1','NACIONAL','FEMININO',0,'Leve com lindas estampas de caneta vermelha.',1,NULL,6,22,'2025-02-24 16:30:28','2025-03-17 18:23:56',NULL,1,5,0,'100% algodão','Feita com os melhores pelos de ovelhas que bebem whisky',0,0.00,0,0,0,NULL),
(9,'Camiseta rosa','77.12.2','IMPORTADO','UNISSEX',0,'Leve com lindas estampas de carrinhos azuis.',1,NULL,6,23,'2025-02-24 16:32:35','2025-03-18 16:50:40',NULL,1,5,0,'100% algodão','Feita com os melhores pelos de ovelhas que bebem whisky',1,0.00,0,0,1,NULL),
(20,'Camiseta Polo Masculina','REF-123','NACIONAL','MASCULINO',1,'Camiseta polo em algodão pima com acabamento premium',1,'1234567890',1,34,'2025-02-28 16:03:39','2025-02-28 16:03:40',NULL,1,2,0,'Tecido externo: 100% Algodão','Composição: 100% Algodão Pima',1,0.00,0,0,1,NULL),
(21,'Jhone Will','12.12.12a','NACIONAL','MASCULINO',1,NULL,1,NULL,6,NULL,'2025-03-04 22:41:27','2025-03-20 19:12:07',NULL,1,12,0,NULL,NULL,1,0.00,0,0,1,NULL),
(22,'Felipe Will','13.13.33','NACIONAL','FEMININO',1,NULL,1,NULL,6,NULL,'2025-03-04 22:44:47','2025-03-20 19:12:07',NULL,1,12,0,NULL,NULL,1,0.00,0,0,1,NULL),
(23,'Teste','Piticas prod.','NACIONAL','UNISSEX',1,'',1,NULL,6,NULL,'2025-03-04 22:57:49','2025-03-27 22:20:31','2025-03-27 19:18:39',4,18,0,'','',1,0.00,0,0,1,''),
(24,'Moleton','moleton','NACIONAL','MASCULINO',1,NULL,1,NULL,6,NULL,'2025-03-05 15:07:41','2025-03-20 19:12:07',NULL,4,18,0,NULL,NULL,1,0.00,0,0,1,NULL),
(25,'Sonic','sonic','NACIONAL','MASCULINO',1,'Confortável e leve',1,NULL,1,1,'2025-03-05 17:54:37','2025-03-14 22:57:08',NULL,6,22,0,'-','-',0,0.00,0,0,0,NULL),
(26,'Nike Shocks','nike_shocks','NACIONAL','MASCULINO',1,'Super elegante',1,NULL,1,1,'2025-03-05 20:33:51','2025-03-17 20:27:23',NULL,6,22,0,'pano e plastico','tem molas',1,10.25,0,0,1,NULL),
(27,'Mizuno Wave Vitality 4','101029029_1-164','NACIONAL','FAT',1,'Mizuno Vitality possui a tecnologia Mizuno Wave, é uma placa WAVE em TPU que proporciona maior estabilidade e absorção de impacto.',1,NULL,6,NULL,'2025-03-05 21:36:21','2025-03-26 18:05:08',NULL,12,25,0,'-','Peso: 332g Ref. núm. 40 (O peso do produto varia de acordo com a numeração)',1,10.25,0,0,1,''),
(28,'Camiseta com bordado \"H\"','H072025HA01XS','IMPORTADO','MASCULINO',1,'Os materiais usados nesta peça foram cuidadosamente selecionados.',1,NULL,1,1,'2025-03-06 19:34:16','2025-03-20 19:12:07',NULL,1,5,0,'100% algodão','- Bolso frontal\n- Bordado \"H\"',1,0.00,1,1,1,NULL),
(29,'Camisa polo de botão com bordado H','H072325HA513XL','IMPORTADO','MASCULINO',1,'Menos é mais: a camisa polo tem um caimento justo ao peito. Não há nada mais simples do que esta peça essencial do guarda-roupa masculino.',1,NULL,1,1,'2025-03-06 20:20:28','2025-03-20 20:30:21',NULL,1,13,0,'Conselho de estilo: quanto mais colorida a camisa polo, mais bronzeado você parecerá; não levante a gola e nem pense em usar uma gravata borboleta com esta camisa.','100% algodão',1,0.00,0,1,1,''),
(30,'Camiseta com bolso bordado','H4H4615DA9038','IMPORTADO','FEMININO',1,'Essa peça é fiel ao tamanho.\nFeito na França',1,NULL,1,1,'2025-03-06 20:37:58','2025-03-14 22:57:01',NULL,1,5,0,'100% algodão','- Gola redonda com acabamento canelado\n- Bolso frontal com bordado \"Mosaïque\"',1,0.00,0,1,1,NULL),
(31,'Sobrecamisa \"Devant cuir empreinte sellier\"','H467310HA01ME','NACIONAL','MASCULINO',1,'Modelo tem 1,88 m / 6\'1\" de altura e veste tamanho M.\n\nOutras peças do look:\n- Suéter com gola redonda \"Détail H\" (H467045HA81)\n- Calça jeans com bolsos sombreados (H465420H602)',1,NULL,1,1,'2025-03-06 21:01:00','2025-03-14 22:57:01',NULL,1,5,0,'100% couro de bezerro Sport','- Bolso de aba frontal com botões e fecho de pressão\n- Parte frontal em couro\n- Um fio finuras 5 e 7',1,0.00,0,1,1,NULL),
(32,'Tênis Trail 2','H191395ZH1W420','IMPORTADO','MASCULINO',1,'Sola em borracha preta\nEntressola em borracha branca\nEnchimentos em borracha preta\nEstabilizador traseiro em couro preto\nPalmilha e forro em couro de carneiro natural',1,NULL,1,1,'2025-03-06 21:39:48','2025-03-20 20:01:47',NULL,6,22,0,'','',1,0.00,1,0,1,''),
(33,'Camiseta gabriel','Hermes prod.','NACIONAL','UNISSEX',1,'Cabelo cacheado',1,NULL,1,1,'2025-03-10 19:20:48','2025-03-26 17:06:00',NULL,1,5,0,'','',1,0.00,0,1,0,''),
(35,'TESTE','teste','NACIONAL','FEMININO',1,NULL,1,NULL,6,NULL,'2025-03-18 22:14:54','2025-03-20 19:12:07',NULL,2,NULL,0,NULL,NULL,1,0.00,0,0,1,NULL),
(36,'TESTE2','15.65.4968','NACIONAL','FEMININO',0,'TESTE B',1,NULL,109,NULL,'2025-03-18 22:27:33','2025-03-20 19:12:07',NULL,1,NULL,0,' TESTE D','TESTE C',0,0.00,0,0,1,'TESTE A'),
(37,'teste','teste2','IMPORTADO','INFANTIL',0,'',1,NULL,109,NULL,'2025-03-19 17:09:27','2025-03-25 22:46:11','2025-03-25 19:40:35',2,NULL,0,'','',0,0.00,0,0,1,''),
(38,'Camisa relampago marquinhos','18.48.4689','NACIONAL','INFANTIL',1,'descrição',1,NULL,6,NULL,'2025-03-19 17:16:01','2025-03-25 21:46:42',NULL,1,NULL,0,'composição','infos',0,0.00,0,0,1,'coleção'),
(40,'TESTE','154798765','IMPORTADO','MASCULINO',0,'',1,NULL,6,NULL,'2025-03-19 18:10:37','2025-03-20 19:12:07',NULL,4,NULL,0,'','',0,0.00,0,0,1,''),
(41,'The Flash','12.4579.45','NACIONAL','MASCULINO',0,'Camiseta the flash',1,NULL,6,NULL,'2025-03-19 20:17:20','2025-03-24 18:24:02',NULL,1,6,0,'poliester','',0,0.00,0,0,1,'Heróis'),
(42,'teste','135468798','NACIONAL','MASCULINO',1,NULL,1,NULL,6,NULL,'2025-03-19 23:02:32','2025-03-20 22:12:23','2025-03-20 19:10:10',4,NULL,0,NULL,NULL,0,0.00,0,0,1,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skus`
--

DROP TABLE IF EXISTS `skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(10) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `code` varchar(13) NOT NULL,
  `min_quantity` int(11) DEFAULT 1,
  `multiple_quantity` int(11) NOT NULL,
  `erpId` varchar(50) DEFAULT NULL,
  `variant_id` int(11) NOT NULL,
  `cest` varchar(50) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `ncm` varchar(50) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skus_erpId_key` (`erpId`),
  KEY `skus_variant_id_fkey` (`variant_id`),
  CONSTRAINT `skus_variant_id_fkey` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skus`
--

LOCK TABLES `skus` WRITE;
/*!40000 ALTER TABLE `skus` DISABLE KEYS */;
INSERT INTO `skus` VALUES
(7,'P',50,79.50,'50',50,1,NULL,3,'50',50,50,'50',50,50,'2025-03-04 19:57:51','2025-03-26 14:04:23',NULL),
(8,'M',50,39.00,'50',50,1,NULL,3,'50',50,50,'50',50,50,'2025-03-04 19:57:51','2025-03-26 14:04:25',NULL),
(9,'G',50,39.00,'50',50,1,NULL,4,'50',50,50,'50',50,50,'2025-03-04 19:57:53','2025-03-26 14:04:26',NULL),
(10,'GG',50,39.00,'50',50,1,NULL,4,'50',50,50,'50',50,50,'2025-03-04 19:57:53','2025-03-26 14:04:27',NULL),
(11,'P',50,39.00,'50',50,1,NULL,5,'50',50,50,'50',50,50,'2025-03-05 12:07:43','2025-03-05 12:07:43',NULL),
(12,'M',50,39.00,'50',50,1,NULL,5,'50',50,50,'50',50,50,'2025-03-05 12:07:43','2025-03-05 12:07:43',NULL),
(13,'G',50,39.00,'50',50,1,NULL,6,'50',50,50,'50',50,50,'2025-03-05 12:07:45','2025-03-05 12:07:45',NULL),
(14,'GG',50,39.00,'50',50,1,NULL,6,'50',50,50,'50',50,50,'2025-03-05 12:07:45','2025-03-05 12:07:45',NULL),
(15,'GG',50,50.00,'50',50,1,NULL,7,'50',50,50,'50',50,50,'2025-03-05 12:07:47','2025-03-05 12:07:47',NULL),
(16,'28',50,50.00,'50',50,1,NULL,8,'50',50,50,'50',50,50,'2025-03-05 14:54:40','2025-03-05 14:54:40',NULL),
(17,'38',50,50.00,'50',50,1,NULL,9,'50',50,50,'50',50,50,'2025-03-05 17:33:54','2025-03-05 17:33:54',NULL),
(18,'38',50,50.00,'50',80,1,NULL,10,'50',50,50,'50',50,50,'2025-03-05 18:36:24','2025-03-26 15:05:03',NULL),
(19,'40',50,50.00,'50',80,1,NULL,10,'50',50,50,'50',50,50,'2025-03-05 18:36:24','2025-03-26 15:05:05',NULL),
(20,'38',50,50.00,'50',80,1,NULL,11,'50',50,50,'50',50,50,'2025-03-05 18:36:26','2025-03-26 15:05:06',NULL),
(21,'40',50,50.00,'50',80,1,NULL,11,'50',50,50,'50',50,50,'2025-03-05 18:36:26','2025-03-26 15:05:07',NULL),
(41,'42',33,33.00,'33',33,1,NULL,20,'33',33,33,'33',33,33,'2025-03-06 19:09:27','2025-03-20 17:01:46','2025-03-20 14:01:46'),
(42,'43',33,33.00,'33',33,1,NULL,20,'33',33,33,'33',33,33,'2025-03-06 19:09:28','2025-03-20 17:01:46','2025-03-20 14:01:46'),
(43,'45',33,33.00,'33',33,1,NULL,20,'33',33,33,'33',33,33,'2025-03-06 19:09:29','2025-03-20 17:01:46','2025-03-20 14:01:46'),
(44,'38',77,77.00,'77',77,1,NULL,20,'77',77,77,'77',7,77,'2025-03-06 19:09:29','2025-03-20 17:01:46','2025-03-20 14:01:46'),
(45,'P',50,1200.00,'50',50,1,NULL,21,'50',50,50,'50',50,60,'2025-03-10 16:20:52','2025-03-26 14:05:57',NULL),
(46,'G',50,1200.00,'50',50,1,NULL,21,'50',50,50,'50',50,70,'2025-03-10 16:20:52','2025-03-26 14:05:59',NULL),
(47,'a',100,50.00,'789456465',2,1,NULL,23,NULL,45,45,NULL,50,45,'2025-03-18 19:14:57','2025-03-18 19:14:57',NULL),
(48,'s',100,50.00,'789456465',2,1,NULL,23,NULL,45,45,NULL,50,45,'2025-03-18 19:14:57','2025-03-18 19:14:57',NULL),
(49,'14',100,50.00,'789456465',2,1,NULL,24,NULL,45,45,NULL,50,45,'2025-03-18 19:14:57','2025-03-18 19:14:57',NULL),
(50,'44',100,50.00,'789456465',2,1,NULL,24,NULL,45,45,NULL,50,45,'2025-03-18 19:14:57','2025-03-18 19:14:57',NULL),
(51,'P',100,50.00,'789456465',2,1,NULL,25,NULL,45,45,NULL,50,45,'2025-03-18 19:14:57','2025-03-18 19:14:57',NULL),
(52,'M',100,50.00,'789456465',2,1,NULL,25,NULL,45,45,NULL,50,45,'2025-03-18 19:14:57','2025-03-18 19:14:57',NULL),
(53,'1',150,35.00,'789456123',2,1,NULL,26,NULL,45,45,NULL,50,45,'2025-03-18 19:27:36','2025-03-18 19:27:36',NULL),
(54,'2',150,35.00,'789456123',2,1,NULL,26,NULL,45,45,NULL,50,45,'2025-03-18 19:27:36','2025-03-18 19:27:36',NULL),
(55,'3',150,35.00,'789456123',2,1,NULL,27,NULL,45,45,NULL,50,45,'2025-03-18 19:27:36','2025-03-18 19:27:36',NULL),
(56,'4',150,35.00,'789456123',2,1,NULL,27,NULL,45,45,NULL,50,45,'2025-03-18 19:27:36','2025-03-18 19:27:36',NULL),
(57,'A',255,25.00,'7894564123',2,1,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-19 14:09:29','2025-03-25 19:44:37','2025-03-25 16:40:35'),
(58,'B',255,25.00,'7894564123',2,1,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-19 14:09:29','2025-03-25 19:44:37','2025-03-25 16:40:35'),
(59,'C',255,25.00,'7894564123',2,1,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-19 14:09:29','2025-03-25 19:44:37','2025-03-25 16:40:35'),
(60,'P',100,25.00,'789456123123',2,1,NULL,29,NULL,15,NULL,NULL,NULL,15,'2025-03-19 14:16:04','2025-03-20 15:30:13','2025-03-20 15:30:13'),
(61,'M',100,25.00,'789456123123',2,1,NULL,29,NULL,15,NULL,NULL,NULL,15,'2025-03-19 14:16:04','2025-03-20 13:56:25','2025-03-20 13:56:25'),
(62,'A',0,0.00,'7894564123',1,1,NULL,31,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-19 15:10:38','2025-03-20 13:18:38','2025-03-20 13:18:38'),
(63,'A',0,0.00,'7894564123',1,1,NULL,31,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-19 15:10:38','2025-03-20 12:42:55','2025-03-20 12:42:55'),
(64,'Marrom',3,20.00,'789456123',3,1,NULL,33,NULL,3,3,NULL,3,3,'2025-03-19 18:09:20','2025-03-19 19:58:23','2025-03-19 19:58:23'),
(65,'Roxo',3,25.00,'456789123',3,1,NULL,40,NULL,3,3,NULL,3,3,'2025-03-19 19:10:44','2025-03-19 19:55:18','2025-03-19 19:55:18'),
(67,'a',1,1.00,'1',1,1,NULL,42,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-19 19:47:38','2025-03-19 19:55:18','2025-03-19 19:55:18'),
(68,'b',1,1.00,'1',1,1,NULL,41,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-19 19:49:23','2025-03-19 19:49:23',NULL),
(69,'teste',2,2.00,'2',2,1,NULL,44,NULL,2,NULL,NULL,NULL,NULL,'2025-03-19 19:57:47','2025-03-20 12:12:20','2025-03-20 12:12:20'),
(70,'teste3',2,2.00,'2',2,1,NULL,45,NULL,2,NULL,NULL,NULL,NULL,'2025-03-19 20:02:35','2025-03-19 20:02:35',NULL),
(71,'fica',2,2.00,'2',2,1,NULL,46,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 13:17:11','2025-03-20 13:18:37',NULL),
(72,'a',5,5.00,'5',5,1,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 15:39:05','2025-03-20 16:42:10','2025-03-20 13:42:10'),
(73,'b',2,2.00,'2',2,1,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 15:39:05','2025-03-20 16:39:02','2025-03-20 13:39:02'),
(74,'c',45,45.00,'45',45,1,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 16:35:51','2025-03-20 16:41:30','2025-03-20 13:41:30'),
(75,'b',5,5.00,'5',5,1,NULL,48,NULL,3,NULL,NULL,NULL,NULL,'2025-03-20 16:40:02','2025-03-20 16:42:10','2025-03-20 13:42:10'),
(76,'teste',5,5.00,'5',5,1,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 16:40:05','2025-03-20 16:42:10','2025-03-20 13:42:10'),
(77,'nova_teste',5,5.00,'5',5,1,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 16:41:25','2025-03-20 16:42:10','2025-03-20 13:42:10'),
(78,'nova_nova',5,5.00,'5',5,1,NULL,48,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 16:41:25','2025-03-20 16:42:10','2025-03-20 13:42:10'),
(79,'M',200,24.99,'789456123',1,1,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:08:07','2025-03-20 17:11:03',NULL),
(80,'G',200,24.99,'789456123',2,1,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:08:07','2025-03-20 17:11:05',NULL),
(81,'GG',200,24.99,'789456123',2,1,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:08:07','2025-03-20 17:11:06',NULL),
(82,'P',145,25.45,'789456123123',2,1,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:09:26','2025-03-20 17:11:08','2025-03-20 14:11:08'),
(83,'P',200,24.99,'789456123',1,1,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:10:59','2025-03-20 17:10:59',NULL),
(84,'M',200,24.99,'789456123',1,1,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:10:59','2025-03-20 17:10:59',NULL),
(85,'G',200,24.99,'789456123',2,1,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:10:59','2025-03-20 17:10:59',NULL),
(86,'001',24,24.00,'24',24,1,NULL,52,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:21:45','2025-03-20 17:30:00','2025-03-20 14:29:24'),
(87,'002',24,24.00,'24',24,1,NULL,52,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-20 17:21:45','2025-03-20 17:30:00','2025-03-20 14:29:24'),
(88,'1',50,50.00,'789456123',2,2,NULL,53,NULL,45,45,NULL,NULL,45,'2025-03-25 18:46:40','2025-03-25 18:46:40',NULL),
(89,'2',50,50.00,'789456123',2,2,NULL,54,NULL,45,45,NULL,NULL,45,'2025-03-25 18:46:40','2025-03-25 18:46:40',NULL),
(90,'2',100,50.00,'789456123',2,2,NULL,55,NULL,45,45,NULL,NULL,45,'2025-03-25 19:44:34','2025-03-25 19:44:34',NULL),
(91,'3',100,50.00,'789456123',2,2,NULL,55,NULL,45,45,NULL,NULL,45,'2025-03-25 19:44:34','2025-03-25 19:44:34',NULL);
/*!40000 ALTER TABLE `skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hex_code` varchar(7) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_variants_products` (`product_id`),
  CONSTRAINT `fk_variants_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES
(3,'Preto','#000000',23,'2025-03-04 19:57:50','2025-03-19 13:38:56',NULL),
(4,'Vermelho',NULL,23,'2025-03-04 19:57:52',NULL,NULL),
(5,'Preto','#000000',24,'2025-03-05 12:07:42','2025-03-19 13:38:56',NULL),
(6,'Vermelho',NULL,24,'2025-03-05 12:07:44',NULL,NULL),
(7,'Novidade',NULL,24,'2025-03-05 12:07:46',NULL,NULL),
(8,'Azul',NULL,25,'2025-03-05 14:54:39',NULL,NULL),
(9,'Azul',NULL,26,'2025-03-05 17:33:52',NULL,NULL),
(10,'teste',NULL,27,'2025-03-05 18:36:23',NULL,NULL),
(11,'teste 2',NULL,27,'2025-03-05 18:36:25',NULL,NULL),
(20,'marron alezan',NULL,32,'2025-03-06 19:09:26','2025-03-20 17:01:45','2025-03-20 20:01:45'),
(21,'Marrom',NULL,33,'2025-03-10 16:20:51',NULL,NULL),
(23,'teste',NULL,35,'2025-03-18 19:14:54',NULL,NULL),
(24,'coer',NULL,35,'2025-03-18 19:14:54',NULL,NULL),
(25,'Exclusão',NULL,35,'2025-03-18 19:14:54',NULL,NULL),
(26,'Preto','#000000',36,'2025-03-18 19:27:33','2025-03-19 13:38:56',NULL),
(27,'Branco',NULL,36,'2025-03-18 19:27:33',NULL,NULL),
(28,'teste',NULL,37,'2025-03-19 17:09:27','2025-03-25 19:44:36','2025-03-25 19:40:35'),
(29,'Vermelho',NULL,38,'2025-03-19 17:16:01','2025-03-20 15:30:13','2025-03-20 18:30:13'),
(31,'TESTE',NULL,40,'2025-03-19 18:10:37','2025-03-20 13:18:36','2025-03-20 16:18:35'),
(33,'Ambar',NULL,41,'2025-03-19 21:09:19','2025-03-19 19:58:19','2025-03-19 22:58:18'),
(40,'Prisma',NULL,41,'2025-03-19 22:10:43','2025-03-19 19:55:15','2025-03-19 22:55:14'),
(41,'Variante',NULL,41,'2025-03-19 22:25:39','2025-03-24 18:30:33',NULL),
(42,'teste',NULL,41,'2025-03-19 22:47:37','2025-03-19 19:55:15','2025-03-19 22:55:14'),
(43,'Variante',NULL,41,'2025-03-19 22:49:23','2025-03-19 19:55:15','2025-03-19 22:55:14'),
(44,'TESTE',NULL,41,'2025-03-19 22:57:46','2025-03-20 16:43:36','2025-03-20 19:43:35'),
(45,'teste2',NULL,42,'2025-03-19 23:02:32',NULL,NULL),
(46,'NOVA',NULL,40,'2025-03-20 16:17:10',NULL,NULL),
(47,'teste',NULL,38,'2025-03-20 18:39:04','2025-03-20 16:42:10','2025-03-20 19:42:09'),
(48,'Nova',NULL,38,'2025-03-20 19:40:01','2025-03-20 16:42:10','2025-03-20 19:42:09'),
(50,'Vermelho',NULL,41,'2025-03-20 20:08:06',NULL,NULL),
(51,'Preto',NULL,41,'2025-03-20 20:10:59',NULL,NULL),
(52,'H07',NULL,29,'2025-03-20 20:21:44','2025-03-20 17:30:00','2025-03-20 17:29:24'),
(53,'Amarelo',NULL,38,'2025-03-25 21:46:39',NULL,NULL),
(54,'Roxo',NULL,38,'2025-03-25 21:46:39',NULL,NULL),
(55,'AMORA',NULL,37,'2025-03-25 22:44:33',NULL,NULL);
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_tables_skus`
--

DROP TABLE IF EXISTS `price_tables_skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_tables_skus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `sku_id` int(11) NOT NULL,
  `price_table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sku_price_table` (`sku_id`,`price_table_id`),
  KEY `fk_price_table` (`price_table_id`),
  CONSTRAINT `fk_price_table` FOREIGN KEY (`price_table_id`) REFERENCES `price_tables` (`id`),
  CONSTRAINT `fk_price_table_sku` FOREIGN KEY (`sku_id`) REFERENCES `skus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_tables_skus`
--

LOCK TABLES `price_tables_skus` WRITE;
/*!40000 ALTER TABLE `price_tables_skus` DISABLE KEYS */;
INSERT INTO `price_tables_skus` VALUES
(2,200.00,'2025-03-19 18:11:57','2025-03-25 17:58:51',7,1),
(4,200.00,'2025-03-25 20:58:52',NULL,7,3),
(5,200.00,'2025-03-25 20:58:52',NULL,7,5),
(6,200.00,'2025-03-25 20:58:52',NULL,7,4),
(7,200.00,'2025-03-25 20:58:52',NULL,7,2),
(8,200.10,'2025-03-25 21:03:56','2025-03-25 18:09:50',8,3),
(10,200.10,'2025-03-25 21:03:56','2025-03-25 18:09:51',8,4),
(11,200.10,'2025-03-25 21:03:56','2025-03-25 18:09:51',8,2),
(26,40.00,'2025-03-25 21:33:16',NULL,45,3),
(27,40.00,'2025-03-25 21:33:16',NULL,45,5),
(28,40.00,'2025-03-25 21:33:16',NULL,45,1),
(29,40.00,'2025-03-25 21:33:16',NULL,45,4),
(31,40.00,'2025-03-25 21:33:44',NULL,46,3),
(32,40.00,'2025-03-25 21:33:44',NULL,46,5),
(33,40.00,'2025-03-25 21:33:44',NULL,46,1),
(34,40.00,'2025-03-25 21:33:44',NULL,46,4),
(46,55.00,'2025-03-25 22:45:36',NULL,90,3),
(47,50.00,'2025-03-25 22:45:36',NULL,90,5),
(48,65.00,'2025-03-25 22:45:50',NULL,91,3),
(49,65.00,'2025-03-25 22:45:50',NULL,91,5),
(51,50.00,'2025-03-26 18:04:17',NULL,88,3),
(52,50.00,'2025-03-26 18:04:17',NULL,88,5),
(53,50.00,'2025-03-26 18:04:17',NULL,88,1),
(54,50.00,'2025-03-26 18:04:17',NULL,88,4),
(55,50.00,'2025-03-26 18:04:17',NULL,88,2),
(56,20.00,'2025-03-26 18:04:31',NULL,89,3),
(57,20.00,'2025-03-26 18:04:31',NULL,89,5),
(58,20.00,'2025-03-26 18:04:31',NULL,89,1),
(59,20.00,'2025-03-26 18:04:31',NULL,89,4),
(60,20.00,'2025-03-26 18:04:31',NULL,89,2),
(61,151.11,'2025-03-26 18:05:40',NULL,18,3),
(62,111.11,'2025-03-26 18:05:40',NULL,18,5),
(63,111.11,'2025-03-26 18:05:40',NULL,18,1),
(64,111.11,'2025-03-26 18:05:40',NULL,18,4),
(65,111.11,'2025-03-26 18:05:40',NULL,18,2),
(66,111.11,'2025-03-26 18:05:50',NULL,19,3),
(67,111.11,'2025-03-26 18:05:50',NULL,19,5),
(68,111.11,'2025-03-26 18:05:50',NULL,19,1),
(69,111.11,'2025-03-26 18:05:50',NULL,19,4),
(70,111.11,'2025-03-26 18:05:50',NULL,19,2),
(71,200.00,'2025-03-26 18:05:59',NULL,20,3),
(72,200.00,'2025-03-26 18:05:59',NULL,20,5),
(73,200.00,'2025-03-26 18:05:59',NULL,20,1),
(74,200.00,'2025-03-26 18:05:59',NULL,20,4),
(75,200.00,'2025-03-26 18:05:59',NULL,20,2),
(76,200.00,'2025-03-26 18:06:08',NULL,21,3),
(77,200.00,'2025-03-26 18:06:08',NULL,21,5),
(78,200.00,'2025-03-26 18:06:08',NULL,21,1),
(79,200.00,'2025-03-26 18:06:08',NULL,21,4),
(80,200.00,'2025-03-26 18:06:08',NULL,21,2),
(81,200.00,'2025-03-26 18:09:23',NULL,53,3),
(82,200.00,'2025-03-26 18:09:23',NULL,53,5),
(83,200.00,'2025-03-26 18:09:23',NULL,53,1),
(84,200.00,'2025-03-26 18:09:23',NULL,53,4),
(85,200.00,'2025-03-26 18:09:32',NULL,54,3),
(86,200.00,'2025-03-26 18:09:32',NULL,54,5),
(87,200.00,'2025-03-26 18:09:32',NULL,54,1),
(88,200.00,'2025-03-26 18:09:32',NULL,54,4),
(89,200.00,'2025-03-26 18:09:38',NULL,55,3),
(90,200.00,'2025-03-26 18:09:38',NULL,55,5),
(91,200.00,'2025-03-26 18:09:38',NULL,55,4),
(92,200.00,'2025-03-26 18:09:38',NULL,55,2),
(93,200.00,'2025-03-26 18:09:48',NULL,56,3),
(94,200.00,'2025-03-26 18:09:48',NULL,56,5),
(95,200.00,'2025-03-26 18:09:48',NULL,56,4),
(96,200.00,'2025-03-26 18:09:48',NULL,56,2),
(100,0.20,'2025-03-26 21:58:42',NULL,9,3),
(101,0.20,'2025-03-26 21:58:42',NULL,9,5),
(102,0.20,'2025-03-26 21:58:42',NULL,9,1),
(103,20.20,'2025-03-26 21:58:42',NULL,9,4),
(104,0.20,'2025-03-26 21:58:42',NULL,9,2),
(108,50.00,'2025-03-27 15:23:17',NULL,10,5),
(109,50.00,'2025-03-27 15:24:12',NULL,10,1);
/*!40000 ALTER TABLE `price_tables_skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(37) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_company_id_key` (`name`,`company_id`),
  KEY `categories_company_id_fkey` (`company_id`),
  CONSTRAINT `categories_company_id_fkey` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Camiseta','2025-02-14 16:25:50',1),
(2,'Calça Jeans','2025-02-14 16:45:18',1),
(3,'Bermuda Jeans','2025-02-14 16:47:50',1),
(4,'Pijamas','2025-02-18 12:25:44',1),
(5,'Calça de moletom','2025-02-24 12:44:00',1),
(6,'Tênis','2025-03-05 14:51:24',1),
(9,'Polos','2025-03-17 11:50:16',1),
(10,'Vestidos','2025-03-17 11:53:59',1),
(12,'Sapatos','2025-03-17 11:54:56',1),
(14,'Jardineira','2025-03-17 11:56:43',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `logo_img` varchar(255) DEFAULT NULL,
  `min_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `min_installments_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `visible` tinyint(1) DEFAULT 1,
  `sku_order` varchar(255) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_name_company_id_key` (`name`,`company_id`),
  UNIQUE KEY `brands_address_id_key` (`address_id`),
  KEY `brands_business_id_fkey` (`business_id`),
  KEY `brands_company_id_fkey` (`company_id`),
  CONSTRAINT `brands_address_id_fkey` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `brands_business_id_fkey` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `brands_company_id_fkey` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES
(1,'Hermès Paris','herms-paris.png',0.00,0.00,1,'',24,23,1,'2025-02-18 19:36:15.585','2025-02-25 15:36:07.265',NULL),
(6,'Piticas','piticas.png',425.99,0.00,1,'',31,29,1,'2025-02-19 13:36:25.241','2025-02-19 13:36:28.422',NULL),
(109,'NovaTech','novatech.png',500.00,120.45,1,'P-M-G-GG',173,163,1,'2025-03-07 13:36:57.810','2025-03-07 13:39:06.943',NULL),
(110,'EliteCorp','elitecorp.png',600.50,150.00,1,'P-M-G',174,164,1,'2025-03-07 13:36:58.643','2025-03-07 13:39:59.265',NULL),
(111,'MaxBrand','maxbrand.jpeg',700.50,200.00,0,'EX-EX1-EX2',175,165,1,'2025-03-07 13:36:58.662','2025-03-07 13:41:50.829',NULL),
(112,'PrimeLux','primelux.png',800.00,150.50,1,'41-42-43-44',176,166,1,'2025-03-07 13:36:58.663','2025-03-07 13:43:44.352',NULL),
(113,'InovaPlus','inovaplus.png',450.99,50.00,0,'P-M-G-GG',177,167,1,'2025-03-07 13:37:01.698','2025-03-07 13:43:56.516',NULL),
(114,'Polo Wear','polo-wear.png',500.00,120.45,1,'P-M-G-GG',183,171,1,'2025-03-07 14:39:43.161','2025-03-07 14:41:41.483',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_tables`
--

DROP TABLE IF EXISTS `price_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `price_adjustment` decimal(5,4) NOT NULL DEFAULT 1.0000,
  `minimum_value` decimal(10,2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `price_table_company_id_fkey` (`companyId`),
  CONSTRAINT `price_table_company_id_fkey` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_tables`
--

LOCK TABLES `price_tables` WRITE;
/*!40000 ALTER TABLE `price_tables` DISABLE KEYS */;
INSERT INTO `price_tables` VALUES
(1,'Norte',1.0500,255.60,1,'2025-02-19 16:13:46','2025-03-27 14:45:00',NULL,1),
(2,'Sudeste',0.9400,450.55,1,'2025-02-19 16:16:40','2025-03-27 14:58:08',NULL,1),
(3,'Leste',1.1500,499.99,1,'2025-02-19 16:21:39','2025-03-27 14:44:26',NULL,1),
(4,'Oeste',1.0000,600.00,1,'2025-02-19 16:23:07','2025-03-27 14:45:09',NULL,1),
(5,'Nordeste',1.1900,350.00,1,'2025-03-21 23:08:05','2025-03-27 14:43:06',NULL,1),
(6,'teste',0.8800,325.50,1,'2025-03-27 17:46:17','2025-03-27 14:56:18','2025-03-27 17:56:18',1),
(7,'teste',0.9878,34.44,1,'2025-03-27 17:58:17','2025-03-27 14:58:24','2025-03-27 17:58:24',1);
/*!40000 ALTER TABLE `price_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(37) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategories_name_category_id_key` (`name`,`category_id`),
  KEY `fk_subcategories_categories` (`category_id`),
  CONSTRAINT `fk_subcategories_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES
(1,'Jeans Claro',3,'2025-02-14 16:47:52'),
(2,'Jeans Médio',3,'2025-02-14 16:47:52'),
(3,'Slim Fit',2,'2025-02-14 16:48:21'),
(4,'Skinny',2,'2025-02-14 16:48:21'),
(5,'Básica',1,'2025-02-14 16:49:08'),
(6,'Slim Fit',1,'2025-02-14 16:49:08'),
(7,'Oversized',1,'2025-02-14 16:52:04'),
(8,'Longline',1,'2025-02-14 16:52:05'),
(9,'Raglan',1,'2025-02-14 16:52:05'),
(10,'Cropped',1,'2025-02-14 16:52:05'),
(11,'Henley',1,'2025-02-14 16:52:07'),
(12,'Bata',1,'2025-02-14 16:52:07'),
(13,'Polo',1,'2025-02-14 16:52:54'),
(14,'Mom Jeans',2,'2025-02-14 16:54:19'),
(15,'Wide Leg',2,'2025-02-14 16:54:19'),
(16,'Reta (Straight)',2,'2025-02-14 16:54:19'),
(18,'bolinha',4,'2025-02-18 12:25:46'),
(22,'Passeio',6,'2025-03-05 14:51:25'),
(25,'Corrida',6,'2025-03-05 18:31:15'),
(26,'Algodão',9,'2025-03-17 11:50:18'),
(28,'Jeans',14,'2025-03-17 12:02:38');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 16:36:37
