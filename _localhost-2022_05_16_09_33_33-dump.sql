-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: x-admin
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `frame_menu_tab`
--

DROP TABLE IF EXISTS `frame_menu_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frame_menu_tab` (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `p_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上级菜单',
  `m_level` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单级别',
  `m_order` int DEFAULT NULL COMMENT '菜单排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frame_menu_tab`
--

/*!40000 ALTER TABLE `frame_menu_tab` DISABLE KEYS */;
INSERT INTO `frame_menu_tab` VALUES ('1','系统设置','#',NULL,NULL,'0',1),('10','设备类型管理','/module/device/devicetype',NULL,'8','1',10),('11','设备管理','/module/device/deviceinfo',NULL,'8','1',11),('12','我的工厂','#',NULL,NULL,'0',12),('13','我的设备','/module/device/deviceinfo',NULL,'12','1',13),('14','订单管理','#',NULL,NULL,'0',14),('15','订单基本信息','/module/order/orderinfo',NULL,'14','1',15),('16','我的订单','/module/order/orderinfo',NULL,'14','1',16),('17','订单接单','/module/order/orderinfo?orderStatus=2',NULL,'14','1',17),('18','订单排产','/module/order/factoryorderinfo',NULL,'14','1',18),('2','云工厂','#',NULL,NULL,'0',2),('3','产品管理','#',NULL,NULL,'0',3),('4','用户管理','/module/user/userlist',NULL,'1','1',4),('6','云工厂信息','/module/factory/factorylist',NULL,'2','1',6),('7','产品类别管理','/module/product/producttype',NULL,'3','1',7),('8','产能中心','#',NULL,NULL,'0',8),('9','产品信息管理','/module/product/productinfo',NULL,'3','1',9);
/*!40000 ALTER TABLE `frame_menu_tab` ENABLE KEYS */;

--
-- Table structure for table `frame_role_tab`
--

DROP TABLE IF EXISTS `frame_role_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frame_role_tab` (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `rolename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frame_role_tab`
--

/*!40000 ALTER TABLE `frame_role_tab` DISABLE KEYS */;
INSERT INTO `frame_role_tab` VALUES ('1','超级管理员','超级管理员'),('2','云工厂','云工厂'),('3','经销商','经销商');
/*!40000 ALTER TABLE `frame_role_tab` ENABLE KEYS */;

--
-- Table structure for table `frame_user_tab`
--

DROP TABLE IF EXISTS `frame_user_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frame_user_tab` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `roleid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frame_user_tab`
--

/*!40000 ALTER TABLE `frame_user_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `frame_user_tab` ENABLE KEYS */;

--
-- Table structure for table `module_address_mobile_tab`
--

DROP TABLE IF EXISTS `module_address_mobile_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_address_mobile_tab` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系地址',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `module_address_mobile_tab_id_uindex` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_address_mobile_tab`
--

/*!40000 ALTER TABLE `module_address_mobile_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_address_mobile_tab` ENABLE KEYS */;

--
-- Table structure for table `module_bid_tab`
--

DROP TABLE IF EXISTS `module_bid_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_bid_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `factoryid` varchar(255) DEFAULT NULL COMMENT '投标工厂',
  `bidprice` varchar(255) DEFAULT NULL COMMENT '出价',
  `bidstatus` varchar(255) DEFAULT NULL COMMENT '竞标状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_bid_tab`
--

/*!40000 ALTER TABLE `module_bid_tab` DISABLE KEYS */;
INSERT INTO `module_bid_tab` VALUES (1,'OC7156118571142','云工厂1','124076','等待选标'),(2,'OC7156118571142','云工厂2','123111111','等待选标'),(5,'OC6565840315254','云工厂2','1232312','竞标成功'),(6,'OC2789365589689','你好','12332131','等待选标'),(7,'OC2789365589689','云工厂2','123213132','等待选标'),(8,'OC5956453719962','云工厂2','35555','竞标成功'),(9,'OC9332658374714','云工厂2','123123','等待选标'),(10,'OC2257499697920','云工厂2','123','竞标成功'),(11,'OC0164359203856','云工厂2','3000','竞标成功'),(12,'OC2145358495950','云工厂2','3000','竞标成功');
/*!40000 ALTER TABLE `module_bid_tab` ENABLE KEYS */;

--
-- Table structure for table `module_device_product_tab`
--

DROP TABLE IF EXISTS `module_device_product_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_device_product_tab` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `deviceid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `productid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品id',
  `capacity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产能',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_device_product_tab`
--

/*!40000 ALTER TABLE `module_device_product_tab` DISABLE KEYS */;
INSERT INTO `module_device_product_tab` VALUES (1,'1类3号','手机壳2号','123'),(2,'2类1号','手机壳1号','123'),(4,'2类1号','手机壳2号','123'),(5,'2类1号','手机壳2号','12312');
/*!40000 ALTER TABLE `module_device_product_tab` ENABLE KEYS */;

--
-- Table structure for table `module_device_tab`
--

DROP TABLE IF EXISTS `module_device_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_device_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `devicename` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `devicetype` varchar(30) DEFAULT NULL COMMENT '设备类型',
  `norms` varchar(255) DEFAULT NULL COMMENT '设备规格',
  `description` varchar(255) DEFAULT NULL COMMENT '设备描述',
  `devicestatus` varchar(255) DEFAULT NULL COMMENT '设备状态',
  `rentstatus` varchar(255) DEFAULT NULL COMMENT '租用状态',
  `owner` varchar(30) DEFAULT NULL COMMENT '所属工厂\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_device_tab`
--

/*!40000 ALTER TABLE `module_device_tab` DISABLE KEYS */;
INSERT INTO `module_device_tab` VALUES (1,'1类1号','类型1','1111','111','闲置中','未租用','产能中心'),(2,'1类2号','类型1','1234','1123','闲置中','工厂设备','云工厂1'),(3,'1类3号','类型1','12321','12321','闲置中','工厂设备','云工厂2'),(4,'2类1号','类型2','1232','1232','关机','工厂设备','云工厂2'),(5,'2类2号','类型2','1233','1234','闲置中','已租用','产能中心'),(6,'3类1号','类型3','qwer','qwer','闲置中','已租用','产能中心'),(8,'4类1号','类型4','456789','7895646','关机','已租用','产能中心');
/*!40000 ALTER TABLE `module_device_tab` ENABLE KEYS */;

--
-- Table structure for table `module_device_type_tab`
--

DROP TABLE IF EXISTS `module_device_type_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_device_type_tab` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_device_type_tab`
--

/*!40000 ALTER TABLE `module_device_type_tab` DISABLE KEYS */;
INSERT INTO `module_device_type_tab` VALUES (1,'类型1'),(2,'类型2'),(3,'类型3'),(4,'类型4'),(5,'类型5'),(6,'456');
/*!40000 ALTER TABLE `module_device_type_tab` ENABLE KEYS */;

--
-- Table structure for table `module_factory_tab`
--

DROP TABLE IF EXISTS `module_factory_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_factory_tab` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `factoryname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工厂名称',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工厂简介',
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员ID',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工厂状态\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_factory_tab`
--

/*!40000 ALTER TABLE `module_factory_tab` DISABLE KEYS */;
INSERT INTO `module_factory_tab` VALUES (1,'产能中心','产能中心','1','关停'),(2,'云工厂1','生产日用品等','5','关停'),(3,'云工厂2','生产数码配件','7','关停'),(4,'12312312','123123213','9','运行'),(5,'qwewq','qwewqeq','10','运行'),(8,'123456789','123456789','11','运行');
/*!40000 ALTER TABLE `module_factory_tab` ENABLE KEYS */;

--
-- Table structure for table `module_order_tab`
--

DROP TABLE IF EXISTS `module_order_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_order_tab` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `orderno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `productid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品ID',
  `ordernum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单数量',
  `deaddate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '截止日期',
  `deliverdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交付日期',
  `orderstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单状态',
  `userid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户ID',
  `factoryid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属工厂',
  `receipt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账单',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_order_tab`
--

/*!40000 ALTER TABLE `module_order_tab` DISABLE KEYS */;
INSERT INTO `module_order_tab` VALUES (1,'OC7156118571142','手机壳1号','1500','2021-07-11','2021-07-14','未安排','2','无数据','无数据','15151176255','东北大学'),(2,'OC7593496585492','充电器1号','200','2021-09-21','2021-10-21','已收货','3','云工厂2','1230','15151176245','东北大学'),(3,'OC6498553416066','手机壳2号','300','2021-09-21','2021-10-21','已收货','3','云工厂2','5000','15151176245','东北大学'),(5,'OC6565840315254','手机壳2号','156','2021-07-22','2021-08-06','已收货','3','云工厂2','1232312','12312312312','东北大学'),(6,'OC2789365589689','手机壳1号','123','2021-07-23','2021-08-12','已收货','3','云工厂1','50000','12312312312','东北大学'),(7,'OC9332658374714','充电器1号','123231','2021-07-22','2021-07-24','未安排','3','无数据','无数据','15151179289','东北大学'),(8,'OC5956453719962','手机壳2号','123','2021-07-23','2021-07-31','已收货','3','云工厂2','35555','15151179536','东北大学'),(9,'OC0164359203856','手机壳2号','12321','2021-07-31','2021-08-07','竞标完成','3','云工厂2','3000','13212111111','东北大学'),(11,'OC2145358495950','充电器1号','150','2022-05-17','2022-07-22','排产完成','3','云工厂2','3000','15151187398','东北大学');
/*!40000 ALTER TABLE `module_order_tab` ENABLE KEYS */;

--
-- Table structure for table `module_product_tab`
--

DROP TABLE IF EXISTS `module_product_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_product_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `producttype` varchar(255) DEFAULT NULL COMMENT '产品类型',
  `prodcutdescription` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `productnorms` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `productcode` varchar(40) DEFAULT NULL COMMENT '产品编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_product_tab_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_product_tab`
--

/*!40000 ALTER TABLE `module_product_tab` DISABLE KEYS */;
INSERT INTO `module_product_tab` VALUES (1,'手机壳1号','手机壳','123','123','PC4059060201479'),(2,'手机壳2号','手机壳','1234','1234','PC6959821582818'),(3,'充电器1号','充电器','12345','12345','PC1156940314855');
/*!40000 ALTER TABLE `module_product_tab` ENABLE KEYS */;

--
-- Table structure for table `module_product_type_tab`
--

DROP TABLE IF EXISTS `module_product_type_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_product_type_tab` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_product_type_tab`
--

/*!40000 ALTER TABLE `module_product_type_tab` DISABLE KEYS */;
INSERT INTO `module_product_type_tab` VALUES (1,'手机壳'),(2,'充电器'),(3,'钢化膜'),(4,'耳机');
/*!40000 ALTER TABLE `module_product_type_tab` ENABLE KEYS */;

--
-- Table structure for table `module_rent_tab`
--

DROP TABLE IF EXISTS `module_rent_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_rent_tab` (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begindate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `length` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deviceid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `factoryid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_rent_tab`
--

/*!40000 ALTER TABLE `module_rent_tab` DISABLE KEYS */;
INSERT INTO `module_rent_tab` VALUES ('1','2021-07-14','2021-09-14','2','4','2'),('2','2021-06-14','2021-10-14','4','5','2');
/*!40000 ALTER TABLE `module_rent_tab` ENABLE KEYS */;

--
-- Table structure for table `module_scheduling_tab`
--

DROP TABLE IF EXISTS `module_scheduling_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_scheduling_tab` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deviceid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `begindate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enddate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_scheduling_tab`
--

/*!40000 ALTER TABLE `module_scheduling_tab` DISABLE KEYS */;
INSERT INTO `module_scheduling_tab` VALUES (1,'OC6498553416066','1类3号','2021-07-04','2021-07-31'),(2,'OC6498553416066','1类1号','2021-07-04','2021-07-31'),(3,'OC6498553416066','1类1号','2021-07-20','2021-07-31'),(4,'OC6565840315254','4类1号','2021-06-29','2021-07-30'),(5,'OC7593496585492','2类1号','2021-07-30','2021-08-07'),(6,'OC5956453719962','2类1号','2022-05-16','2022-05-19'),(7,'OC2257499697920','3类1号','2022-05-11','2022-05-18'),(8,'OC2145358495950','1类3号','2022-05-17','2022-05-25');
/*!40000 ALTER TABLE `module_scheduling_tab` ENABLE KEYS */;

--
-- Table structure for table `role_menu_tab`
--

DROP TABLE IF EXISTS `role_menu_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menu_tab` (
  `roleid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `menuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`roleid`,`menuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu_tab`
--

/*!40000 ALTER TABLE `role_menu_tab` DISABLE KEYS */;
INSERT INTO `role_menu_tab` VALUES ('1','1'),('1','10'),('1','11'),('1','14'),('1','15'),('1','2'),('1','3'),('1','4'),('1','6'),('1','7'),('1','8'),('1','9'),('2','12'),('2','13'),('2','14'),('2','17'),('2','18'),('3','14'),('3','16');
/*!40000 ALTER TABLE `role_menu_tab` ENABLE KEYS */;

--
-- Table structure for table `t_log`
--

DROP TABLE IF EXISTS `t_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_log`
--

/*!40000 ALTER TABLE `t_log` DISABLE KEYS */;
INSERT INTO `t_log` VALUES (80,'用户 admin 登录系统','2021-05-25 16:42:07','admin','0:0:0:0:0:0:0:1'),(81,'更新用户：admin ','2021-05-25 16:42:19','admin','0:0:0:0:0:0:0:1'),(82,'用户 admin 退出系统','2021-05-25 16:42:29','admin','0:0:0:0:0:0:0:1'),(83,'用户 admin 登录系统','2021-05-25 16:42:31','admin','0:0:0:0:0:0:0:1'),(84,'更新用户：jerry ','2021-05-25 16:49:14','admin','0:0:0:0:0:0:0:1'),(85,'用户 admin 登录系统','2021-05-25 16:49:30','admin','0:0:0:0:0:0:0:1'),(86,'用户 admin 登录系统','2021-05-25 16:50:07','admin','0:0:0:0:0:0:0:1'),(87,'更新用户：jerry ','2021-05-25 16:50:21','admin','0:0:0:0:0:0:0:1'),(88,'用户 admin 登录系统','2021-05-26 16:35:40','admin','0:0:0:0:0:0:0:1'),(89,'更新用户：jerry ','2021-05-26 16:36:16','admin','0:0:0:0:0:0:0:1'),(90,'更新用户：jack ','2021-05-26 16:36:18','admin','0:0:0:0:0:0:0:1'),(91,'删除用户 tom ','2021-05-26 16:36:29','admin','0:0:0:0:0:0:0:1'),(92,'删除用户 hello ','2021-05-26 16:36:30','admin','0:0:0:0:0:0:0:1'),(93,'删除用户 jack ','2021-05-26 16:36:31','admin','0:0:0:0:0:0:0:1'),(94,'删除用户 jerry ','2021-05-26 16:36:32','admin','0:0:0:0:0:0:0:1'),(95,'用户 admin 登录系统','2021-05-31 12:18:16','admin','0:0:0:0:0:0:0:1'),(96,'更新用户：admin ','2021-05-31 12:19:48','admin','0:0:0:0:0:0:0:1'),(97,'更新用户：admin ','2021-05-31 12:19:57','admin','0:0:0:0:0:0:0:1'),(98,'用户 admin 登录系统','2021-06-01 16:46:09','admin','0:0:0:0:0:0:0:1'),(99,'新增用户：zhang ','2021-06-01 16:46:46','admin','0:0:0:0:0:0:0:1'),(100,'新增用户：li ','2021-06-01 16:47:12','admin','0:0:0:0:0:0:0:1'),(101,'更新用户：admin ','2021-06-01 16:47:19','admin','0:0:0:0:0:0:0:1'),(102,'用户 admin 退出系统','2021-06-01 16:47:22','admin','0:0:0:0:0:0:0:1'),(103,'用户 admin 登录系统','2021-06-01 16:47:24','admin','0:0:0:0:0:0:0:1'),(104,'更新用户：li ','2021-06-01 16:47:34','admin','0:0:0:0:0:0:0:1'),(105,'更新用户：zhang ','2021-06-01 16:47:35','admin','0:0:0:0:0:0:0:1'),(106,'用户 admin 登录系统','2021-06-07 12:32:17','admin','0:0:0:0:0:0:0:1'),(107,'用户 admin 登录系统','2021-06-07 14:16:00','admin','0:0:0:0:0:0:0:1'),(108,'用户 admin 登录系统','2021-06-07 14:34:26','admin','0:0:0:0:0:0:0:1'),(109,'更新用户：li ','2021-06-07 14:35:21','admin','0:0:0:0:0:0:0:1'),(110,'更新用户：li ','2021-06-07 14:35:23','admin','0:0:0:0:0:0:0:1'),(111,'更新角色：超级管理员','2021-06-07 14:35:41','admin','0:0:0:0:0:0:0:1'),(112,'更新角色：超级管理员','2021-06-07 14:35:45','admin','0:0:0:0:0:0:0:1'),(113,'更新权限菜单：用户管理','2021-06-07 14:37:58','admin','0:0:0:0:0:0:0:1'),(114,'更新权限菜单：用户管理','2021-06-07 14:38:08','admin','0:0:0:0:0:0:0:1'),(115,'更新权限菜单：用户管理','2021-06-07 14:38:13','admin','0:0:0:0:0:0:0:1'),(116,'更新权限菜单：用户管理','2021-06-07 14:38:21','admin','0:0:0:0:0:0:0:1'),(117,'用户 admin 登录系统','2021-06-07 14:57:29','admin','0:0:0:0:0:0:0:1'),(118,'更新角色：超级管理员','2021-06-07 14:57:43','admin','0:0:0:0:0:0:0:1'),(119,'用户 admin 登录系统','2021-06-09 23:19:38','admin','0:0:0:0:0:0:0:1'),(120,'删除权限菜单：学生管理','2021-06-09 23:19:50','admin','0:0:0:0:0:0:0:1'),(121,'用户 admin 登录系统','2021-06-12 10:18:54','admin','0:0:0:0:0:0:0:1'),(122,'更新角色：超级管理员','2021-06-12 10:30:15','admin','0:0:0:0:0:0:0:1'),(123,'用户 admin 登录系统','2021-06-12 13:55:01','admin','0:0:0:0:0:0:0:1'),(124,'用户 admin 登录系统','2021-06-27 10:44:12','admin','0:0:0:0:0:0:0:1'),(125,'更新角色：超级管理员','2021-06-27 10:44:26','admin','0:0:0:0:0:0:0:1'),(126,'用户 admin 登录系统','2021-06-27 11:15:11','admin','0:0:0:0:0:0:0:1'),(127,'更新角色：超级管理员','2021-06-27 11:15:17','admin','0:0:0:0:0:0:0:1'),(128,'用户 admin 登录系统','2021-06-27 11:18:36','admin','0:0:0:0:0:0:0:1'),(129,'用户 admin 登录系统','2021-06-27 11:41:59','admin','0:0:0:0:0:0:0:1'),(130,'更新角色：超级管理员','2021-06-27 11:42:04','admin','0:0:0:0:0:0:0:1'),(131,'用户 admin 登录系统','2021-06-27 11:49:27','admin','0:0:0:0:0:0:0:1'),(132,'用户 admin 登录系统','2021-07-15 00:06:19','admin','0:0:0:0:0:0:0:1'),(133,'更新用户：li ','2021-07-15 00:06:51','admin','0:0:0:0:0:0:0:1'),(134,'用户 admin 登录系统','2021-07-15 00:23:18','admin','0:0:0:0:0:0:0:1'),(135,'用户 admin 登录系统','2021-07-15 16:32:49','admin','0:0:0:0:0:0:0:1'),(136,'更新角色：超级管理员','2021-07-15 16:33:25','admin','0:0:0:0:0:0:0:1'),(137,'用户 admin 登录系统','2021-07-15 16:54:42','admin','0:0:0:0:0:0:0:1'),(138,'用户 admin 登录系统','2021-07-15 16:57:43','admin','0:0:0:0:0:0:0:1'),(139,'用户 admin 登录系统','2021-07-15 17:08:23','admin','0:0:0:0:0:0:0:1'),(140,'更新角色：超级管理员','2021-07-15 17:08:50','admin','0:0:0:0:0:0:0:1'),(141,'删除权限菜单：订单管理','2021-07-15 17:10:39','admin','0:0:0:0:0:0:0:1'),(142,'删除权限菜单：联系方式管理','2021-07-15 17:10:42','admin','0:0:0:0:0:0:0:1'),(143,'删除权限菜单：图书管理','2021-07-15 17:10:47','admin','0:0:0:0:0:0:0:1'),(144,'更新权限菜单：云工厂管理','2021-07-15 17:12:51','admin','0:0:0:0:0:0:0:1'),(145,'新增角色：云工厂管理员','2021-07-15 17:14:18','admin','0:0:0:0:0:0:0:1'),(146,'新增角色：经销商','2021-07-15 17:14:45','admin','0:0:0:0:0:0:0:1'),(147,'更新角色：云工厂管理员','2021-07-15 17:15:09','admin','0:0:0:0:0:0:0:1'),(148,'用户 admin 登录系统','2021-07-15 17:54:52','admin','0:0:0:0:0:0:0:1'),(149,'更新角色：经销商','2021-07-15 17:55:36','admin','0:0:0:0:0:0:0:1'),(150,'更新角色：云工厂管理员','2021-07-15 17:58:46','admin','0:0:0:0:0:0:0:1'),(151,'更新角色：经销商','2021-07-15 17:58:48','admin','0:0:0:0:0:0:0:1'),(152,'更新角色：超级管理员','2021-07-15 17:58:53','admin','0:0:0:0:0:0:0:1'),(153,'更新角色：超级管理员','2021-07-15 17:59:00','admin','0:0:0:0:0:0:0:1'),(154,'更新角色：超级管理员','2021-07-15 17:59:17','admin','0:0:0:0:0:0:0:1'),(155,'用户 admin 登录系统','2021-07-15 18:07:33','admin','0:0:0:0:0:0:0:1'),(156,'更新角色：超级管理员','2021-07-15 18:08:01','admin','0:0:0:0:0:0:0:1'),(157,'更新角色：云工厂管理员','2021-07-15 18:08:32','admin','0:0:0:0:0:0:0:1'),(158,'更新角色：经销商','2021-07-15 18:08:37','admin','0:0:0:0:0:0:0:1'),(159,'用户 admin 登录系统','2021-07-15 18:13:04','admin','0:0:0:0:0:0:0:1'),(160,'更新权限菜单：设备管理','2021-07-15 18:16:58','admin','0:0:0:0:0:0:0:1'),(161,'更新权限菜单：订单管理','2021-07-15 18:17:29','admin','0:0:0:0:0:0:0:1'),(162,'更新权限菜单：权限管理','2021-07-15 18:18:07','admin','0:0:0:0:0:0:0:1'),(163,'更新权限菜单：云工厂管理','2021-07-15 18:18:27','admin','0:0:0:0:0:0:0:1'),(164,'更新权限菜单：设备类型管理','2021-07-15 18:19:07','admin','0:0:0:0:0:0:0:1'),(165,'新增用户：郭宣伯 ','2021-07-15 18:20:03','admin','0:0:0:0:0:0:0:1'),(166,'更新用户：郭宣伯 ','2021-07-15 18:20:06','admin','0:0:0:0:0:0:0:1'),(167,'用户 admin 退出系统','2021-07-15 18:20:13','admin','0:0:0:0:0:0:0:1'),(168,'用户 admin 登录系统','2021-07-15 18:20:50','admin','0:0:0:0:0:0:0:1'),(169,'用户 admin 登录系统','2021-07-15 19:07:02','admin','0:0:0:0:0:0:0:1'),(170,'更新角色：超级管理员','2021-07-15 19:07:29','admin','0:0:0:0:0:0:0:1'),(171,'更新权限菜单：产品管理','2021-07-15 19:08:23','admin','0:0:0:0:0:0:0:1'),(172,'更新权限菜单：产品类型管理','2021-07-15 19:08:43','admin','0:0:0:0:0:0:0:1'),(173,'更新角色：超级管理员','2021-07-15 19:11:27','admin','0:0:0:0:0:0:0:1'),(174,'更新角色：普通用户','2021-07-15 19:15:12','admin','0:0:0:0:0:0:0:1'),(175,'用户 admin 登录系统','2021-07-15 19:18:24','admin','0:0:0:0:0:0:0:1'),(176,'更新权限菜单：订单排产管理','2021-07-15 19:18:53','admin','0:0:0:0:0:0:0:1'),(177,'更新角色：云工厂管理员','2021-07-15 19:19:26','admin','0:0:0:0:0:0:0:1'),(178,'用户 admin 登录系统','2021-07-15 19:23:54','admin','0:0:0:0:0:0:0:1'),(179,'更新角色：超级管理员','2021-07-15 19:24:34','admin','0:0:0:0:0:0:0:1'),(180,'用户 admin 退出系统','2021-07-15 19:25:40','admin','0:0:0:0:0:0:0:1'),(181,'用户 admin 登录系统','2021-07-15 19:25:46','admin','0:0:0:0:0:0:0:1'),(182,'用户 admin 登录系统','2021-07-15 20:26:30','admin','0:0:0:0:0:0:0:1'),(183,'用户 admin 登录系统','2021-07-15 20:30:06','admin','0:0:0:0:0:0:0:1'),(184,'用户 admin 登录系统','2021-07-15 20:30:29','admin','0:0:0:0:0:0:0:1'),(185,'用户 admin 退出系统','2021-07-15 20:30:55','admin','0:0:0:0:0:0:0:1'),(186,'用户 admin 登录系统','2021-07-16 08:52:07','admin','0:0:0:0:0:0:0:1'),(187,'用户 admin 退出系统','2021-07-16 08:52:16','admin','0:0:0:0:0:0:0:1'),(188,'用户 admin 登录系统','2021-07-16 08:54:03','admin','0:0:0:0:0:0:0:1'),(189,'用户 admin 退出系统','2021-07-16 08:54:23','admin','0:0:0:0:0:0:0:1'),(190,'用户 123456 注册账号成功','2021-07-16 08:54:44','123456','0:0:0:0:0:0:0:1'),(191,'用户 123456 登录系统','2021-07-16 08:54:52','123456','0:0:0:0:0:0:0:1'),(192,'更新用户：123456 ','2021-07-16 08:55:04','123456','0:0:0:0:0:0:0:1'),(193,'用户 123456 退出系统','2021-07-16 08:55:20','123456','0:0:0:0:0:0:0:1'),(194,'用户 admin 登录系统','2021-07-16 08:55:30','admin','0:0:0:0:0:0:0:1'),(195,'更新用户：123456 ','2021-07-16 08:56:03','admin','0:0:0:0:0:0:0:1'),(196,'更新用户：123456 ','2021-07-16 08:56:37','admin','0:0:0:0:0:0:0:1'),(197,'用户 admin 退出系统','2021-07-16 08:56:43','admin','0:0:0:0:0:0:0:1'),(198,'用户 123456 登录系统','2021-07-16 08:56:50','123456','0:0:0:0:0:0:0:1'),(199,'用户 123456 退出系统','2021-07-16 08:57:14','123456','0:0:0:0:0:0:0:1'),(200,'用户 admin 登录系统','2021-07-16 08:57:23','admin','0:0:0:0:0:0:0:1'),(201,'更新用户：123456 ','2021-07-16 08:57:35','admin','0:0:0:0:0:0:0:1'),(202,'用户 admin 退出系统','2021-07-16 08:57:43','admin','0:0:0:0:0:0:0:1'),(203,'用户 admin 登录系统','2021-07-16 09:50:42','admin','0:0:0:0:0:0:0:1'),(204,'用户 admin 登录系统','2021-07-16 10:04:49','admin','0:0:0:0:0:0:0:1'),(205,'更新角色：超级管理员','2021-07-16 10:07:10','admin','0:0:0:0:0:0:0:1'),(206,'用户 admin 退出系统','2021-07-16 10:08:21','admin','0:0:0:0:0:0:0:1'),(207,'用户 123456 登录系统','2021-07-16 10:08:31','123456','0:0:0:0:0:0:0:1'),(208,'用户 123456 退出系统','2021-07-16 10:09:18','123456','0:0:0:0:0:0:0:1'),(209,'用户 admin 登录系统','2021-07-16 14:42:08','admin','0:0:0:0:0:0:0:1'),(210,'用户 admin 登录系统','2021-07-16 15:00:03','admin','0:0:0:0:0:0:0:1'),(211,'用户 admin 退出系统','2021-07-16 15:00:37','admin','0:0:0:0:0:0:0:1'),(212,'用户 admin 登录系统','2021-07-17 14:29:32','admin','0:0:0:0:0:0:0:1'),(213,'更新用户：admin ','2021-07-17 14:29:58','admin','0:0:0:0:0:0:0:1'),(214,'更新用户：admin ','2021-07-17 14:30:12','admin','0:0:0:0:0:0:0:1'),(215,'更新用户：admin ','2021-07-17 14:30:19','admin','0:0:0:0:0:0:0:1'),(216,'用户 admin 退出系统','2021-07-17 14:30:38','admin','0:0:0:0:0:0:0:1'),(217,'用户 123456 登录系统','2021-07-17 14:30:45','123456','0:0:0:0:0:0:0:1'),(218,'更新用户：123456 ','2021-07-17 14:31:32','123456','0:0:0:0:0:0:0:1'),(219,'用户 123456 退出系统','2021-07-17 14:31:41','123456','0:0:0:0:0:0:0:1'),(220,'用户 123456 登录系统','2021-07-17 14:31:48','123456','0:0:0:0:0:0:0:1'),(221,'用户 123456 退出系统','2021-07-17 14:31:55','123456','0:0:0:0:0:0:0:1'),(222,'用户 789456 注册账号成功','2021-07-17 14:32:11','789456','0:0:0:0:0:0:0:1'),(223,'用户 789456 登录系统','2021-07-17 14:32:21','789456','0:0:0:0:0:0:0:1'),(224,'用户 789456 退出系统','2021-07-17 14:32:29','789456','0:0:0:0:0:0:0:1'),(225,'用户 admin 登录系统','2021-07-17 14:32:37','admin','0:0:0:0:0:0:0:1'),(226,'更新用户：789456 ','2021-07-17 14:32:50','admin','0:0:0:0:0:0:0:1'),(227,'更新用户：789456 ','2021-07-17 14:33:04','admin','0:0:0:0:0:0:0:1'),(228,'用户 admin 退出系统','2021-07-17 14:33:19','admin','0:0:0:0:0:0:0:1'),(229,'用户 789456 登录系统','2021-07-17 14:33:34','789456','0:0:0:0:0:0:0:1'),(230,'更新用户：789456 ','2021-07-17 14:34:27','789456','0:0:0:0:0:0:0:1'),(231,'更新用户：789456 ','2021-07-17 14:34:32','789456','0:0:0:0:0:0:0:1'),(232,'更新用户：789456 ','2021-07-17 14:34:38','789456','0:0:0:0:0:0:0:1'),(233,'更新用户：789456 ','2021-07-17 14:34:49','789456','0:0:0:0:0:0:0:1'),(234,'用户 789456 退出系统','2021-07-17 14:34:56','789456','0:0:0:0:0:0:0:1'),(235,'用户 admin 登录系统','2021-07-17 14:35:02','admin','0:0:0:0:0:0:0:1'),(236,'用户 admin 登录系统','2021-07-17 15:30:52','admin','0:0:0:0:0:0:0:1'),(237,'用户 admin 登录系统','2021-07-17 15:57:40','admin','0:0:0:0:0:0:0:1'),(238,'用户 admin 退出系统','2021-07-17 15:58:44','admin','0:0:0:0:0:0:0:1'),(239,'用户 admin 登录系统','2021-07-17 15:58:46','admin','0:0:0:0:0:0:0:1'),(240,'更新角色：云工厂管理员','2021-07-17 16:04:18','admin','0:0:0:0:0:0:0:1'),(241,'更新角色：云工厂管理员','2021-07-17 16:04:48','admin','0:0:0:0:0:0:0:1'),(242,'更新角色：经销商','2021-07-17 16:04:57','admin','0:0:0:0:0:0:0:1'),(243,'更新用户：admin ','2021-07-17 16:06:40','admin','0:0:0:0:0:0:0:1'),(244,'删除权限菜单：日志管理','2021-07-17 16:07:08','admin','0:0:0:0:0:0:0:1'),(245,'删除权限菜单：在线留言','2021-07-18 11:19:50','admin','0:0:0:0:0:0:0:1'),(246,'更新角色：超级管理员','2021-07-18 13:40:22','admin','0:0:0:0:0:0:0:1'),(247,'更新角色：超级管理员','2021-07-18 13:56:13','admin','0:0:0:0:0:0:0:1'),(248,'更新角色：超级管理员','2021-07-18 14:02:16','admin','0:0:0:0:0:0:0:1'),(249,'更新角色：超级管理员','2021-07-18 14:08:29','admin','0:0:0:0:0:0:0:1'),(250,'更新角色：超级管理员','2021-07-18 14:08:49','admin','0:0:0:0:0:0:0:1'),(251,'更新角色：超级管理员','2021-07-18 14:13:11','admin','0:0:0:0:0:0:0:1'),(252,'更新角色：超级管理员','2021-07-18 16:37:04','admin','0:0:0:0:0:0:0:1'),(253,'更新角色：超级管理员','2021-07-18 16:37:17','admin','0:0:0:0:0:0:0:1'),(254,'更新角色：超级管理员','2021-07-18 16:37:51','admin','0:0:0:0:0:0:0:1'),(255,'更新角色：云工厂管理员','2021-07-18 18:22:26','admin','0:0:0:0:0:0:0:1'),(256,'删除权限菜单：公告管理','2021-07-18 23:03:52','admin','0:0:0:0:0:0:0:1'),(257,'更新角色：超级管理员','2021-07-19 10:20:04','admin','0:0:0:0:0:0:0:1'),(258,'更新角色：超级管理员','2021-07-19 10:20:20','admin','0:0:0:0:0:0:0:1'),(259,'删除权限菜单：订单排产管理','2021-07-19 14:59:08','admin','0:0:0:0:0:0:0:1'),(260,'删除权限菜单：产能管理','2021-07-19 14:59:22','admin','0:0:0:0:0:0:0:1'),(261,'更新权限菜单：投标管理','2021-07-19 15:01:32','admin','0:0:0:0:0:0:0:1'),(262,'更新权限菜单：产品管理','2021-07-19 15:01:56','admin','0:0:0:0:0:0:0:1'),(263,'更新权限菜单：云工厂管理','2021-07-19 15:02:22','admin','0:0:0:0:0:0:0:1'),(264,'更新权限菜单：投标管理','2021-07-19 15:03:01','admin','0:0:0:0:0:0:0:1'),(265,'更新权限菜单：产品管理','2021-07-19 15:03:23','admin','0:0:0:0:0:0:0:1'),(266,'更新角色：云工厂管理员','2021-07-19 16:06:29','admin','0:0:0:0:0:0:0:1'),(267,'更新角色：云工厂管理员','2021-07-19 16:14:09','admin','0:0:0:0:0:0:0:1'),(268,'更新角色：云工厂管理员','2021-07-19 21:42:39','admin','0:0:0:0:0:0:0:1'),(269,'更新角色：云工厂管理员','2021-07-19 21:49:53','admin','0:0:0:0:0:0:0:1'),(270,'用户 admin 登录系统','2022-05-09 19:30:24','admin','0:0:0:0:0:0:0:1'),(271,'用户 admin 登录系统','2022-05-09 19:34:07','admin','0:0:0:0:0:0:0:1'),(272,'用户 admin 登录系统','2022-05-09 19:34:42','admin','0:0:0:0:0:0:0:1'),(273,'用户 admin 登录系统','2022-05-09 19:39:19','admin','0:0:0:0:0:0:0:1'),(274,'用户 admin 登录系统','2022-05-09 19:39:39','admin','0:0:0:0:0:0:0:1'),(275,'用户 admin 登录系统','2022-05-10 15:57:19','admin','0:0:0:0:0:0:0:1'),(276,'用户 admin 登录系统','2022-05-10 15:59:12','admin','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `t_log` ENABLE KEYS */;

--
-- Table structure for table `t_message`
--

DROP TABLE IF EXISTS `t_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评论时间',
  `parent_id` bigint DEFAULT NULL COMMENT '父ID',
  `foreign_id` bigint DEFAULT '0' COMMENT '关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message`
--

/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` VALUES (20,'1232312','admin','2021-07-17 15:32:05',NULL,0),(21,'qweqwee','admin','2021-07-17 15:32:10',20,0);
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;

--
-- Table structure for table `t_notice`
--

DROP TABLE IF EXISTS `t_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notice`
--

/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
INSERT INTO `t_notice` VALUES (7,'云工厂1','云工厂1现已平稳进入营业','2021-07-15 19:12:23'),(8,'云工厂2','云工厂2由于经营不善被迫关停！','2021-07-15 19:12:49'),(9,'东大智能云平台','前后端分离版本正在开发中，敬请期待！','2021-07-15 19:13:24');
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 's-data' COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (1,'用户管理','用户管理','user','user-solid'),(2,'角色管理','角色管理','role','s-cooperation'),(3,'权限管理','权限管理','permission','view'),(38,'云工厂管理','云工厂管理','factory','s-home'),(39,'订单管理','订单管理','order','tickets'),(41,'设备类型管理','设备类型管理','deviceType','s-grid'),(43,'产品类型管理','产品类型管理','productType','s-grid'),(52,'设备管理','设备管理','device','s-data'),(53,'产品管理','产品管理','product','mobile'),(56,'产能管理','产能管理','capacity','s-data'),(59,'竞标管理','竞标管理','bid','s-data');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `permission` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'超级管理员','所有权限','[27,30,35,37,1,2,3,38,40,42,48,49,50,51,41,52,43,53,39]'),(2,'普通用户','浏览应用首页','[]'),(3,'云工厂管理员','设备管理、投标、若竞标成功可以排产订单','[37,40,52,55,56,58,59]'),(4,'经销商','创建、管理订单、选标','[39]');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `age` int DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','admin','小川','20195361@stu.neu.edu.cn','15151176276','1626503419281','[1]','沈阳市',19),(2,'111111','123456','dealer','zhang@qq.com','12345678911','1626685729096','[4]','NEU',24),(3,'222222','123456','我是一个经销商','dealer@qq.com','12345678922','1626685828722','[4]','辽宁省',22),(4,'123456','123456','dealer2','theyan277@gmail.com','12345678933',NULL,'[2]','辽宁省',20),(5,'1111111','123456','factoryAdmin1','1111111@qq.com','12345678944','1626396904763','[2,3]','辽宁省',20),(6,'2222222','123456','dealer3','2222222@qq.com','12345678955','1626503689194','[4]','辽宁省',20),(7,'11111111','123456','云工厂管理员','11111111@163.com','12345678945','1626670617974','[2,3]','东北大学',23),(9,'admin1','admin','factoryAdmin3','357991009@qq.com','13245698715',NULL,'[2,3]',NULL,NULL),(10,'admin123','admin','你好','12345@qq.com','15151155987',NULL,'[2,3]',NULL,NULL),(11,'12456789','123456','云工厂管理员','qwer@123.com','151511176286','1626742325289','[2,3]',NULL,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16  9:33:33
