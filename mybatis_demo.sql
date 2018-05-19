/*
 Navicat Premium Data Transfer

 Source Server         : Mysql57_3357
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3357
 Source Schema         : mybatis_demo

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 17/05/2018 21:31:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` float(10, 1) NOT NULL COMMENT '商品定价',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime(0) NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, '台式机', 3000.0, '该电脑质量非常好！！！！', NULL, '2015-02-03 13:22:53');
INSERT INTO `items` VALUES (2, '笔记本', 6000.0, '笔记本性能好，质量好！！！！！', NULL, '2015-02-09 13:22:57');
INSERT INTO `items` VALUES (3, '背包', 200.0, '名牌背包，容量大质量好！！！！', NULL, '2015-02-06 13:23:02');
INSERT INTO `items` VALUES (4, '手机', 999.0, NULL, NULL, '2018-05-16 22:28:05');
INSERT INTO `items` VALUES (5, '手机', 999.0, NULL, NULL, '2018-05-16 22:31:18');

-- ----------------------------
-- Table structure for my_test
-- ----------------------------
DROP TABLE IF EXISTS `my_test`;
CREATE TABLE `my_test`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_test
-- ----------------------------
INSERT INTO `my_test` VALUES (1, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (2, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (3, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (4, '手机', NULL);
INSERT INTO `my_test` VALUES (5, '手机', NULL);
INSERT INTO `my_test` VALUES (6, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (7, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (8, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (9, '手机', NULL);
INSERT INTO `my_test` VALUES (10, '手机', NULL);
INSERT INTO `my_test` VALUES (11, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (12, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (13, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (14, '手机', NULL);
INSERT INTO `my_test` VALUES (15, '手机', NULL);
INSERT INTO `my_test` VALUES (16, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (17, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (18, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (19, '手机', NULL);
INSERT INTO `my_test` VALUES (20, '手机', NULL);
INSERT INTO `my_test` VALUES (21, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (22, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (23, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (24, '手机', NULL);
INSERT INTO `my_test` VALUES (25, '手机', NULL);
INSERT INTO `my_test` VALUES (26, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (27, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (28, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (29, '手机', NULL);
INSERT INTO `my_test` VALUES (30, '手机', NULL);
INSERT INTO `my_test` VALUES (31, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (32, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (33, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (34, '手机', NULL);
INSERT INTO `my_test` VALUES (35, '手机', NULL);
INSERT INTO `my_test` VALUES (36, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (37, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (38, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (39, '手机', NULL);
INSERT INTO `my_test` VALUES (40, '手机', NULL);
INSERT INTO `my_test` VALUES (41, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (42, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (43, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (44, '手机', NULL);
INSERT INTO `my_test` VALUES (45, '手机', NULL);
INSERT INTO `my_test` VALUES (46, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (47, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (48, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (49, '手机', NULL);
INSERT INTO `my_test` VALUES (50, '手机', NULL);
INSERT INTO `my_test` VALUES (51, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (52, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (53, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (54, '手机', NULL);
INSERT INTO `my_test` VALUES (55, '手机', NULL);
INSERT INTO `my_test` VALUES (56, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (57, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (58, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (59, '手机', NULL);
INSERT INTO `my_test` VALUES (60, '手机', NULL);
INSERT INTO `my_test` VALUES (61, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (62, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (63, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (64, '手机', NULL);
INSERT INTO `my_test` VALUES (65, '手机', NULL);
INSERT INTO `my_test` VALUES (66, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (67, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (68, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (69, '手机', NULL);
INSERT INTO `my_test` VALUES (70, '手机', NULL);
INSERT INTO `my_test` VALUES (71, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (72, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (73, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (74, '手机', NULL);
INSERT INTO `my_test` VALUES (75, '手机', NULL);
INSERT INTO `my_test` VALUES (76, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (77, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (78, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (79, '手机', NULL);
INSERT INTO `my_test` VALUES (80, '手机', NULL);
INSERT INTO `my_test` VALUES (81, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (82, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (83, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (84, '手机', NULL);
INSERT INTO `my_test` VALUES (85, '手机', NULL);
INSERT INTO `my_test` VALUES (86, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (87, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (88, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (89, '手机', NULL);
INSERT INTO `my_test` VALUES (90, '手机', NULL);
INSERT INTO `my_test` VALUES (91, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (92, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (93, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (94, '手机', NULL);
INSERT INTO `my_test` VALUES (95, '手机', NULL);
INSERT INTO `my_test` VALUES (96, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (97, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (98, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (99, '手机', NULL);
INSERT INTO `my_test` VALUES (100, '手机', NULL);
INSERT INTO `my_test` VALUES (101, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (102, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (103, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (104, '手机', NULL);
INSERT INTO `my_test` VALUES (105, '手机', NULL);
INSERT INTO `my_test` VALUES (106, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (107, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (108, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (109, '手机', NULL);
INSERT INTO `my_test` VALUES (110, '手机', NULL);
INSERT INTO `my_test` VALUES (111, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (112, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (113, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (114, '手机', NULL);
INSERT INTO `my_test` VALUES (115, '手机', NULL);
INSERT INTO `my_test` VALUES (116, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (117, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (118, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (119, '手机', NULL);
INSERT INTO `my_test` VALUES (120, '手机', NULL);
INSERT INTO `my_test` VALUES (121, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (122, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (123, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (124, '手机', NULL);
INSERT INTO `my_test` VALUES (125, '手机', NULL);
INSERT INTO `my_test` VALUES (126, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (127, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (128, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (129, '手机', NULL);
INSERT INTO `my_test` VALUES (130, '手机', NULL);
INSERT INTO `my_test` VALUES (131, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (132, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (133, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (134, '手机', NULL);
INSERT INTO `my_test` VALUES (135, '手机', NULL);
INSERT INTO `my_test` VALUES (136, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (137, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (138, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (139, '手机', NULL);
INSERT INTO `my_test` VALUES (140, '手机', NULL);
INSERT INTO `my_test` VALUES (141, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (142, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (143, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (144, '手机', NULL);
INSERT INTO `my_test` VALUES (145, '手机', NULL);
INSERT INTO `my_test` VALUES (146, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (147, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (148, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (149, '手机', NULL);
INSERT INTO `my_test` VALUES (150, '手机', NULL);
INSERT INTO `my_test` VALUES (151, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (152, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (153, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (154, '手机', NULL);
INSERT INTO `my_test` VALUES (155, '手机', NULL);
INSERT INTO `my_test` VALUES (156, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (157, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (158, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (159, '手机', NULL);
INSERT INTO `my_test` VALUES (160, '手机', NULL);
INSERT INTO `my_test` VALUES (161, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (162, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (163, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (164, '手机', NULL);
INSERT INTO `my_test` VALUES (165, '手机', NULL);
INSERT INTO `my_test` VALUES (166, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (167, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (168, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (169, '手机', NULL);
INSERT INTO `my_test` VALUES (170, '手机', NULL);
INSERT INTO `my_test` VALUES (171, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (172, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (173, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (174, '手机', NULL);
INSERT INTO `my_test` VALUES (175, '手机', NULL);
INSERT INTO `my_test` VALUES (176, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (177, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (178, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (179, '手机', NULL);
INSERT INTO `my_test` VALUES (180, '手机', NULL);
INSERT INTO `my_test` VALUES (181, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (182, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (183, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (184, '手机', NULL);
INSERT INTO `my_test` VALUES (185, '手机', NULL);
INSERT INTO `my_test` VALUES (186, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (187, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (188, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (189, '手机', NULL);
INSERT INTO `my_test` VALUES (190, '手机', NULL);
INSERT INTO `my_test` VALUES (191, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (192, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (193, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (194, '手机', NULL);
INSERT INTO `my_test` VALUES (195, '手机', NULL);
INSERT INTO `my_test` VALUES (196, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (197, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (198, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (199, '手机', NULL);
INSERT INTO `my_test` VALUES (200, '手机', NULL);
INSERT INTO `my_test` VALUES (201, '台式机', '该电脑质量非常好！！！！');
INSERT INTO `my_test` VALUES (202, '笔记本', '笔记本性能好，质量好！！！！！');
INSERT INTO `my_test` VALUES (203, '背包', '名牌背包，容量大质量好！！！！');
INSERT INTO `my_test` VALUES (204, '手机', NULL);
INSERT INTO `my_test` VALUES (205, '手机', NULL);

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单id',
  `items_id` int(11) NOT NULL COMMENT '商品id',
  `items_num` int(11) NULL DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orderdetail_1`(`orders_id`) USING BTREE,
  INDEX `FK_orderdetail_2`(`items_id`) USING BTREE,
  CONSTRAINT `FK_orderdetail_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderdetail_2` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (1, 3, 1, 1);
INSERT INTO `orderdetail` VALUES (2, 3, 2, 3);
INSERT INTO `orderdetail` VALUES (3, 4, 3, 4);
INSERT INTO `orderdetail` VALUES (4, 4, 2, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '下单用户id',
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `createtime` datetime(0) NOT NULL COMMENT '创建订单时间',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orders_1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 1, '1000010', '2015-02-04 13:22:35', NULL);
INSERT INTO `orders` VALUES (4, 1, '1000011', '2015-02-03 13:22:41', NULL);
INSERT INTO `orders` VALUES (5, 10, '1000012', '2015-02-12 16:13:23', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `sex` enum('男','女','未知') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未知' COMMENT '性别',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '昆明王五', NULL, '女', '云南省');
INSERT INTO `user` VALUES (10, '张三', '2014-07-10', '男', '北京市');
INSERT INTO `user` VALUES (16, '张小明', NULL, '男', '云南省昆明');
INSERT INTO `user` VALUES (22, '王小明', NULL, '女', '云南昆明五华区');
INSERT INTO `user` VALUES (24, '张三丰', NULL, '男', '四川成都');
INSERT INTO `user` VALUES (25, '陈小明', NULL, '男', '云南省昆明');
INSERT INTO `user` VALUES (26, '深圳王五', NULL, '未知', '广东深圳');
INSERT INTO `user` VALUES (27, '王子', '2018-05-13', '男', '云南曲靖');
INSERT INTO `user` VALUES (28, '小胖子', '2018-05-12', '男', '云南昆明市盘龙区');
INSERT INTO `user` VALUES (30, '小胖子3', '2018-05-12', '男', '云南昆明市五华区');
INSERT INTO `user` VALUES (31, '张媛媛', '2018-05-12', '女', '云南昆明市五华区');
INSERT INTO `user` VALUES (32, '李小明', '2016-06-15', '男', '北京市');
INSERT INTO `user` VALUES (33, '张媛媛', '2018-05-12', '女', '云南昆明市五华区');
INSERT INTO `user` VALUES (34, '张媛媛', '2018-05-12', '女', '云南昆明市五华区');
INSERT INTO `user` VALUES (35, '张媛媛', '2018-05-13', '女', '云南昆明市五华区');

SET FOREIGN_KEY_CHECKS = 1;
