/*
 Navicat MySQL Data Transfer

 Source Server         : 2
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : x-admin

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 17/07/2021 14:38:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (2, '1', 11.11);

-- ----------------------------
-- Table structure for frame_menu_tab
-- ----------------------------
DROP TABLE IF EXISTS `frame_menu_tab`;
CREATE TABLE `frame_menu_tab`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `p_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级菜单',
  `m_level` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单级别',
  `m_order` int NULL DEFAULT NULL COMMENT '菜单排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of frame_menu_tab
-- ----------------------------
INSERT INTO `frame_menu_tab` VALUES ('1', '系统设置', '#', NULL, NULL, '0', 1);
INSERT INTO `frame_menu_tab` VALUES ('10', '设备类型管理', '/module/device/devicetype', NULL, '8', '1', 10);
INSERT INTO `frame_menu_tab` VALUES ('11', '设备管理', '/module/device/deviceinfo', NULL, '8', '1', 11);
INSERT INTO `frame_menu_tab` VALUES ('12', '我的工厂', '#', NULL, NULL, '0', 12);
INSERT INTO `frame_menu_tab` VALUES ('13', '我的设备', '/module/device/deviceinfo', NULL, '12', '1', 13);
INSERT INTO `frame_menu_tab` VALUES ('14', '订单管理', '#', NULL, NULL, '0', 14);
INSERT INTO `frame_menu_tab` VALUES ('15', '订单基本信息', '/module/order/orderinfo', NULL, '14', '1', 15);
INSERT INTO `frame_menu_tab` VALUES ('16', '我的订单', '/module/order/orderinfo', NULL, '14', '1', 16);
INSERT INTO `frame_menu_tab` VALUES ('17', '订单接单', '/module/order/orderinfo?orderStatus=2', NULL, '14', '1', 17);
INSERT INTO `frame_menu_tab` VALUES ('18', '订单排产', '/module/order/factoryorderinfo', NULL, '14', '1', 18);
INSERT INTO `frame_menu_tab` VALUES ('2', '云工厂', '#', NULL, NULL, '0', 2);
INSERT INTO `frame_menu_tab` VALUES ('3', '产品管理', '#', NULL, NULL, '0', 3);
INSERT INTO `frame_menu_tab` VALUES ('4', '用户管理', '/module/user/userlist', NULL, '1', '1', 4);
INSERT INTO `frame_menu_tab` VALUES ('6', '云工厂信息', '/module/factory/factorylist', NULL, '2', '1', 6);
INSERT INTO `frame_menu_tab` VALUES ('7', '产品类别管理', '/module/product/producttype', NULL, '3', '1', 7);
INSERT INTO `frame_menu_tab` VALUES ('8', '产能中心', '#', NULL, NULL, '0', 8);
INSERT INTO `frame_menu_tab` VALUES ('9', '产品信息管理', '/module/product/productinfo', NULL, '3', '1', 9);

-- ----------------------------
-- Table structure for frame_role_tab
-- ----------------------------
DROP TABLE IF EXISTS `frame_role_tab`;
CREATE TABLE `frame_role_tab`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `rolename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of frame_role_tab
-- ----------------------------
INSERT INTO `frame_role_tab` VALUES ('1', '超级管理员', '超级管理员');
INSERT INTO `frame_role_tab` VALUES ('2', '云工厂', '云工厂');
INSERT INTO `frame_role_tab` VALUES ('3', '经销商', '经销商');

-- ----------------------------
-- Table structure for frame_user_tab
-- ----------------------------
DROP TABLE IF EXISTS `frame_user_tab`;
CREATE TABLE `frame_user_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `roleid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of frame_user_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_address_mobile_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_address_mobile_tab`;
CREATE TABLE `module_address_mobile_tab`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系地址',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `module_address_mobile_tab_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module_address_mobile_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_bid_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_bid_tab`;
CREATE TABLE `module_bid_tab`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factoryid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bidprice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bidstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_bid_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_device_product_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_device_product_tab`;
CREATE TABLE `module_device_product_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `deviceid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `productid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品id',
  `capacity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产能',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_device_product_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_device_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_device_tab`;
CREATE TABLE `module_device_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typeid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型id',
  `devicename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `norms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `describe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `deviceno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `devicestatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备状态',
  `rentstatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租用状态',
  `factoryid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备所属工厂',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_device_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_device_type_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_device_type_tab`;
CREATE TABLE `module_device_type_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_device_type_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_factory_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_factory_tab`;
CREATE TABLE `module_factory_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `factoryname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工厂名称',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工厂简介',
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员ID',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工厂状态\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_factory_tab
-- ----------------------------
INSERT INTO `module_factory_tab` VALUES (1, '云工厂1', '生产日用品等', '123', '运行');

-- ----------------------------
-- Table structure for module_order_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_order_tab`;
CREATE TABLE `module_order_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `orderno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `productid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品ID',
  `ordernum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单数量',
  `deaddate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截止日期',
  `deliverdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交付日期',
  `orderstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `userid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `factoryid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属工厂',
  `receipt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_order_tab
-- ----------------------------
INSERT INTO `module_order_tab` VALUES (1, 'ono123456789', '1', '1111', '2021-07-11', '2021-07-14', '未安排', '1234567', '云工厂1', '123', '1', '东北大学');

-- ----------------------------
-- Table structure for module_product_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_product_tab`;
CREATE TABLE `module_product_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typeid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型ID',
  `productname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `norms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品规格',
  `describe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  `productno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_product_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_product_type_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_product_type_tab`;
CREATE TABLE `module_product_type_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_product_type_tab
-- ----------------------------

-- ----------------------------
-- Table structure for module_rent_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_rent_tab`;
CREATE TABLE `module_rent_tab`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begindate` date NULL DEFAULT NULL,
  `enddate` date NULL DEFAULT NULL,
  `length` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deviceid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factoryid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_rent_tab
-- ----------------------------
INSERT INTO `module_rent_tab` VALUES ('22b1d37bc4ac485086a32ecbcc05086f', '2019-04-29', '2023-06-29', '50', '56c6b74784504f4290ff6bddab49cff3', 'd2749388131d4ba68fffbff226cc5ec0');
INSERT INTO `module_rent_tab` VALUES ('8c5f9b3f6d154f17ae4d02c1e908465d', '2019-04-29', '2023-06-29', '50', 'bb59a17b865545d5a07bbcfa35a49140', 'd2749388131d4ba68fffbff226cc5ec0');
INSERT INTO `module_rent_tab` VALUES ('a87ff679a2f3e71d9181a67b7542122c', '2021-05-13', '2021-12-13', '7', 'a1c92633659b4219bfc80c57463d5964', 'd2749388131d4ba68fffbff226cc5ec0');
INSERT INTO `module_rent_tab` VALUES ('ab99faee729e1adfa2026f9c3adb3aa4', '2020-07-08', '2023-07-29', '38', 'bb99baeb729e4ddfa2026f9c3adb3aa7', 'd2749388131d4ba68fffbff226cc5ec0');

-- ----------------------------
-- Table structure for module_scheduling_tab
-- ----------------------------
DROP TABLE IF EXISTS `module_scheduling_tab`;
CREATE TABLE `module_scheduling_tab`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deviceid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `begindate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enddate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module_scheduling_tab
-- ----------------------------

-- ----------------------------
-- Table structure for role_menu_tab
-- ----------------------------
DROP TABLE IF EXISTS `role_menu_tab`;
CREATE TABLE `role_menu_tab`  (
  `roleid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `menuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`roleid`, `menuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu_tab
-- ----------------------------
INSERT INTO `role_menu_tab` VALUES ('1', '1');
INSERT INTO `role_menu_tab` VALUES ('1', '10');
INSERT INTO `role_menu_tab` VALUES ('1', '11');
INSERT INTO `role_menu_tab` VALUES ('1', '14');
INSERT INTO `role_menu_tab` VALUES ('1', '15');
INSERT INTO `role_menu_tab` VALUES ('1', '2');
INSERT INTO `role_menu_tab` VALUES ('1', '3');
INSERT INTO `role_menu_tab` VALUES ('1', '4');
INSERT INTO `role_menu_tab` VALUES ('1', '6');
INSERT INTO `role_menu_tab` VALUES ('1', '7');
INSERT INTO `role_menu_tab` VALUES ('1', '8');
INSERT INTO `role_menu_tab` VALUES ('1', '9');
INSERT INTO `role_menu_tab` VALUES ('2', '12');
INSERT INTO `role_menu_tab` VALUES ('2', '13');
INSERT INTO `role_menu_tab` VALUES ('2', '14');
INSERT INTO `role_menu_tab` VALUES ('2', '17');
INSERT INTO `role_menu_tab` VALUES ('2', '18');
INSERT INTO `role_menu_tab` VALUES ('3', '14');
INSERT INTO `role_menu_tab` VALUES ('3', '16');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (80, '用户 admin 登录系统', '2021-05-25 16:42:07', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (81, '更新用户：admin ', '2021-05-25 16:42:19', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (82, '用户 admin 退出系统', '2021-05-25 16:42:29', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (83, '用户 admin 登录系统', '2021-05-25 16:42:31', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (84, '更新用户：jerry ', '2021-05-25 16:49:14', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (85, '用户 admin 登录系统', '2021-05-25 16:49:30', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (86, '用户 admin 登录系统', '2021-05-25 16:50:07', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (87, '更新用户：jerry ', '2021-05-25 16:50:21', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (88, '用户 admin 登录系统', '2021-05-26 16:35:40', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (89, '更新用户：jerry ', '2021-05-26 16:36:16', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (90, '更新用户：jack ', '2021-05-26 16:36:18', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (91, '删除用户 tom ', '2021-05-26 16:36:29', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (92, '删除用户 hello ', '2021-05-26 16:36:30', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (93, '删除用户 jack ', '2021-05-26 16:36:31', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (94, '删除用户 jerry ', '2021-05-26 16:36:32', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (95, '用户 admin 登录系统', '2021-05-31 12:18:16', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (96, '更新用户：admin ', '2021-05-31 12:19:48', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (97, '更新用户：admin ', '2021-05-31 12:19:57', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (98, '用户 admin 登录系统', '2021-06-01 16:46:09', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (99, '新增用户：zhang ', '2021-06-01 16:46:46', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (100, '新增用户：li ', '2021-06-01 16:47:12', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (101, '更新用户：admin ', '2021-06-01 16:47:19', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (102, '用户 admin 退出系统', '2021-06-01 16:47:22', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (103, '用户 admin 登录系统', '2021-06-01 16:47:24', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (104, '更新用户：li ', '2021-06-01 16:47:34', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (105, '更新用户：zhang ', '2021-06-01 16:47:35', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (106, '用户 admin 登录系统', '2021-06-07 12:32:17', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (107, '用户 admin 登录系统', '2021-06-07 14:16:00', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (108, '用户 admin 登录系统', '2021-06-07 14:34:26', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (109, '更新用户：li ', '2021-06-07 14:35:21', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (110, '更新用户：li ', '2021-06-07 14:35:23', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (111, '更新角色：超级管理员', '2021-06-07 14:35:41', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (112, '更新角色：超级管理员', '2021-06-07 14:35:45', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (113, '更新权限菜单：用户管理', '2021-06-07 14:37:58', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (114, '更新权限菜单：用户管理', '2021-06-07 14:38:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (115, '更新权限菜单：用户管理', '2021-06-07 14:38:13', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (116, '更新权限菜单：用户管理', '2021-06-07 14:38:21', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (117, '用户 admin 登录系统', '2021-06-07 14:57:29', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (118, '更新角色：超级管理员', '2021-06-07 14:57:43', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (119, '用户 admin 登录系统', '2021-06-09 23:19:38', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (120, '删除权限菜单：学生管理', '2021-06-09 23:19:50', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (121, '用户 admin 登录系统', '2021-06-12 10:18:54', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (122, '更新角色：超级管理员', '2021-06-12 10:30:15', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (123, '用户 admin 登录系统', '2021-06-12 13:55:01', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (124, '用户 admin 登录系统', '2021-06-27 10:44:12', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (125, '更新角色：超级管理员', '2021-06-27 10:44:26', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (126, '用户 admin 登录系统', '2021-06-27 11:15:11', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (127, '更新角色：超级管理员', '2021-06-27 11:15:17', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (128, '用户 admin 登录系统', '2021-06-27 11:18:36', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (129, '用户 admin 登录系统', '2021-06-27 11:41:59', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (130, '更新角色：超级管理员', '2021-06-27 11:42:04', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (131, '用户 admin 登录系统', '2021-06-27 11:49:27', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (132, '用户 admin 登录系统', '2021-07-15 00:06:19', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (133, '更新用户：li ', '2021-07-15 00:06:51', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (134, '用户 admin 登录系统', '2021-07-15 00:23:18', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (135, '用户 admin 登录系统', '2021-07-15 16:32:49', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (136, '更新角色：超级管理员', '2021-07-15 16:33:25', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (137, '用户 admin 登录系统', '2021-07-15 16:54:42', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (138, '用户 admin 登录系统', '2021-07-15 16:57:43', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (139, '用户 admin 登录系统', '2021-07-15 17:08:23', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (140, '更新角色：超级管理员', '2021-07-15 17:08:50', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (141, '删除权限菜单：订单管理', '2021-07-15 17:10:39', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (142, '删除权限菜单：联系方式管理', '2021-07-15 17:10:42', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (143, '删除权限菜单：图书管理', '2021-07-15 17:10:47', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (144, '更新权限菜单：云工厂管理', '2021-07-15 17:12:51', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (145, '新增角色：云工厂管理员', '2021-07-15 17:14:18', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (146, '新增角色：经销商', '2021-07-15 17:14:45', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (147, '更新角色：云工厂管理员', '2021-07-15 17:15:09', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (148, '用户 admin 登录系统', '2021-07-15 17:54:52', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (149, '更新角色：经销商', '2021-07-15 17:55:36', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (150, '更新角色：云工厂管理员', '2021-07-15 17:58:46', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (151, '更新角色：经销商', '2021-07-15 17:58:48', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (152, '更新角色：超级管理员', '2021-07-15 17:58:53', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (153, '更新角色：超级管理员', '2021-07-15 17:59:00', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (154, '更新角色：超级管理员', '2021-07-15 17:59:17', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (155, '用户 admin 登录系统', '2021-07-15 18:07:33', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (156, '更新角色：超级管理员', '2021-07-15 18:08:01', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (157, '更新角色：云工厂管理员', '2021-07-15 18:08:32', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (158, '更新角色：经销商', '2021-07-15 18:08:37', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (159, '用户 admin 登录系统', '2021-07-15 18:13:04', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (160, '更新权限菜单：设备管理', '2021-07-15 18:16:58', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (161, '更新权限菜单：订单管理', '2021-07-15 18:17:29', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (162, '更新权限菜单：权限管理', '2021-07-15 18:18:07', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (163, '更新权限菜单：云工厂管理', '2021-07-15 18:18:27', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (164, '更新权限菜单：设备类型管理', '2021-07-15 18:19:07', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (165, '新增用户：郭宣伯 ', '2021-07-15 18:20:03', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (166, '更新用户：郭宣伯 ', '2021-07-15 18:20:06', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (167, '用户 admin 退出系统', '2021-07-15 18:20:13', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (168, '用户 admin 登录系统', '2021-07-15 18:20:50', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (169, '用户 admin 登录系统', '2021-07-15 19:07:02', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (170, '更新角色：超级管理员', '2021-07-15 19:07:29', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (171, '更新权限菜单：产品管理', '2021-07-15 19:08:23', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (172, '更新权限菜单：产品类型管理', '2021-07-15 19:08:43', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (173, '更新角色：超级管理员', '2021-07-15 19:11:27', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (174, '更新角色：普通用户', '2021-07-15 19:15:12', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (175, '用户 admin 登录系统', '2021-07-15 19:18:24', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (176, '更新权限菜单：订单排产管理', '2021-07-15 19:18:53', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (177, '更新角色：云工厂管理员', '2021-07-15 19:19:26', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (178, '用户 admin 登录系统', '2021-07-15 19:23:54', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (179, '更新角色：超级管理员', '2021-07-15 19:24:34', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (180, '用户 admin 退出系统', '2021-07-15 19:25:40', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (181, '用户 admin 登录系统', '2021-07-15 19:25:46', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (182, '用户 admin 登录系统', '2021-07-15 20:26:30', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (183, '用户 admin 登录系统', '2021-07-15 20:30:06', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (184, '用户 admin 登录系统', '2021-07-15 20:30:29', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (185, '用户 admin 退出系统', '2021-07-15 20:30:55', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (186, '用户 admin 登录系统', '2021-07-16 08:52:07', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (187, '用户 admin 退出系统', '2021-07-16 08:52:16', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (188, '用户 admin 登录系统', '2021-07-16 08:54:03', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (189, '用户 admin 退出系统', '2021-07-16 08:54:23', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (190, '用户 123456 注册账号成功', '2021-07-16 08:54:44', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (191, '用户 123456 登录系统', '2021-07-16 08:54:52', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (192, '更新用户：123456 ', '2021-07-16 08:55:04', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (193, '用户 123456 退出系统', '2021-07-16 08:55:20', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (194, '用户 admin 登录系统', '2021-07-16 08:55:30', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (195, '更新用户：123456 ', '2021-07-16 08:56:03', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (196, '更新用户：123456 ', '2021-07-16 08:56:37', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (197, '用户 admin 退出系统', '2021-07-16 08:56:43', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (198, '用户 123456 登录系统', '2021-07-16 08:56:50', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (199, '用户 123456 退出系统', '2021-07-16 08:57:14', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (200, '用户 admin 登录系统', '2021-07-16 08:57:23', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (201, '更新用户：123456 ', '2021-07-16 08:57:35', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (202, '用户 admin 退出系统', '2021-07-16 08:57:43', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (203, '用户 admin 登录系统', '2021-07-16 09:50:42', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (204, '用户 admin 登录系统', '2021-07-16 10:04:49', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (205, '更新角色：超级管理员', '2021-07-16 10:07:10', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (206, '用户 admin 退出系统', '2021-07-16 10:08:21', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (207, '用户 123456 登录系统', '2021-07-16 10:08:31', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (208, '用户 123456 退出系统', '2021-07-16 10:09:18', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (209, '用户 admin 登录系统', '2021-07-16 14:42:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (210, '用户 admin 登录系统', '2021-07-16 15:00:03', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (211, '用户 admin 退出系统', '2021-07-16 15:00:37', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (212, '用户 admin 登录系统', '2021-07-17 14:29:32', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (213, '更新用户：admin ', '2021-07-17 14:29:58', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (214, '更新用户：admin ', '2021-07-17 14:30:12', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (215, '更新用户：admin ', '2021-07-17 14:30:19', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (216, '用户 admin 退出系统', '2021-07-17 14:30:38', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (217, '用户 123456 登录系统', '2021-07-17 14:30:45', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (218, '更新用户：123456 ', '2021-07-17 14:31:32', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (219, '用户 123456 退出系统', '2021-07-17 14:31:41', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (220, '用户 123456 登录系统', '2021-07-17 14:31:48', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (221, '用户 123456 退出系统', '2021-07-17 14:31:55', '123456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (222, '用户 789456 注册账号成功', '2021-07-17 14:32:11', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (223, '用户 789456 登录系统', '2021-07-17 14:32:21', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (224, '用户 789456 退出系统', '2021-07-17 14:32:29', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (225, '用户 admin 登录系统', '2021-07-17 14:32:37', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (226, '更新用户：789456 ', '2021-07-17 14:32:50', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (227, '更新用户：789456 ', '2021-07-17 14:33:04', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (228, '用户 admin 退出系统', '2021-07-17 14:33:19', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (229, '用户 789456 登录系统', '2021-07-17 14:33:34', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (230, '更新用户：789456 ', '2021-07-17 14:34:27', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (231, '更新用户：789456 ', '2021-07-17 14:34:32', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (232, '更新用户：789456 ', '2021-07-17 14:34:38', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (233, '更新用户：789456 ', '2021-07-17 14:34:49', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (234, '用户 789456 退出系统', '2021-07-17 14:34:56', '789456', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (235, '用户 admin 登录系统', '2021-07-17 14:35:02', 'admin', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父ID',
  `foreign_id` bigint NULL DEFAULT 0 COMMENT '关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (7, '云工厂1', '云工厂1现已平稳进入营业', '2021-07-15 19:12:23');
INSERT INTO `t_notice` VALUES (8, '云工厂2', '云工厂2由于经营不善被迫关停！', '2021-07-15 19:12:49');
INSERT INTO `t_notice` VALUES (9, '东大智能云平台', '前后端分离版本正在开发中，敬请期待！', '2021-07-15 19:13:24');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 's-data' COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '用户管理', '用户管理', 'user', 'user-solid');
INSERT INTO `t_permission` VALUES (2, '角色管理', '角色管理', 'role', 's-cooperation');
INSERT INTO `t_permission` VALUES (3, '权限管理', '权限管理', 'permission', 'view');
INSERT INTO `t_permission` VALUES (19, '公告管理', '公告管理', 'notice', 'data-board');
INSERT INTO `t_permission` VALUES (24, '日志管理', '日志管理', 'log', 'notebook-2');
INSERT INTO `t_permission` VALUES (25, '在线留言', '在线留言', 'message', 'message');
INSERT INTO `t_permission` VALUES (38, '云工厂管理', '云工厂管理', 'factory', 'office-building');
INSERT INTO `t_permission` VALUES (39, '订单管理', '订单管理', 'order', 'tickets');
INSERT INTO `t_permission` VALUES (40, '设备管理', '设备管理', 'device', 's-tools');
INSERT INTO `t_permission` VALUES (41, '设备类型管理', '设备类型管理', 'deviceType', 's-grid');
INSERT INTO `t_permission` VALUES (42, '产品管理', '产品管理', 'product', 's-goods');
INSERT INTO `t_permission` VALUES (43, '产品类型管理', '产品类型管理', 'productType', 's-grid');
INSERT INTO `t_permission` VALUES (44, '订单排产管理', '订单排产管理', 'scheduling', 's-claim');
INSERT INTO `t_permission` VALUES (45, '产能管理', '产能管理', 'capacity', 's-data');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `permission` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '超级管理员', '所有权限', '[27,30,35,37,1,2,3,38,39,40,41,42,43,45,19,24,25]');
INSERT INTO `t_role` VALUES (2, '普通用户', '浏览应用首页', '[]');
INSERT INTO `t_role` VALUES (3, '云工厂管理员', '对云工厂、竞标、排产等进行管理', '[37,38,40,39,44,25]');
INSERT INTO `t_role` VALUES (4, '经销商', '创建、管理订单', '[39,25]');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', '管理员', '111124444', '13940203129', '1626503419281', '[1]', '北京', 20);
INSERT INTO `t_user` VALUES (2, 'zhang', '123456', '张三', 'zhang@qq.com', '13089897878', NULL, '[2]', '北京', 24);
INSERT INTO `t_user` VALUES (3, 'li', '123456', '李四', 'li@qq.com', '13989897898', NULL, '[2,1]', '南京', 22);
INSERT INTO `t_user` VALUES (4, '郭宣伯', '123456', 'twosugar', '1403222698@qq.com', '13940203129', NULL, '[3]', '创新路195号', 20);
INSERT INTO `t_user` VALUES (5, '123456', '123456', '云admin', '123456', '12345678911', '1626396904763', '[2,3]', '创新路195号', 20);
INSERT INTO `t_user` VALUES (6, '789456', '789456', '经销', '789456', '789456', '1626503689194', '[2,4]', '123456789', 20);

SET FOREIGN_KEY_CHECKS = 1;
