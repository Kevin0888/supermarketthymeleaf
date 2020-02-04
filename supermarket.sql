/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : supermarket

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 04/02/2020 15:36:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_commodity
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity`;
CREATE TABLE `tb_commodity`  (
  `id` int(11) NOT NULL COMMENT '商品编码',
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `specification` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `units` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `stock` int(5) NULL DEFAULT NULL COMMENT '库存',
  `is_delete` bigint(1) NULL DEFAULT NULL COMMENT '是否删除，0在售，1下架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_commodity
-- ----------------------------
INSERT INTO `tb_commodity` VALUES (1901, '可乐', '350ml', '瓶', 5.00, 41, 0);
INSERT INTO `tb_commodity` VALUES (1902, '雪碧', '300ml', '瓶', 5.00, 68, 0);
INSERT INTO `tb_commodity` VALUES (1903, '红茶', '500ml', '瓶', 3.00, 12, 0);
INSERT INTO `tb_commodity` VALUES (1904, '牛奶', '240ml', '袋', 2.50, 20, 0);
INSERT INTO `tb_commodity` VALUES (1905, '青岛啤酒', '350ml', '瓶', 5.00, 20, 0);
INSERT INTO `tb_commodity` VALUES (1906, '红星二锅头', '500ml', '瓶', 30.00, 10, 0);
INSERT INTO `tb_commodity` VALUES (1907, '牛栏山二锅头', '500ml', '瓶', 11.00, 20, 0);
INSERT INTO `tb_commodity` VALUES (1908, '农夫山泉', '500ml', '瓶', 3.50, 10, 0);
INSERT INTO `tb_commodity` VALUES (1909, '康师傅矿泉水', '500ml', '瓶', 2.00, 20, 0);
INSERT INTO `tb_commodity` VALUES (1910, '燕京啤酒', '350ml', '瓶', 3.00, 20, 0);
INSERT INTO `tb_commodity` VALUES (1911, '百岁山矿泉水', '500ml', '瓶', 5.00, 20, 0);

-- ----------------------------
-- Table structure for tb_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `points` int(11) NULL DEFAULT NULL COMMENT '返点',
  `total` double(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `register_time` datetime(3) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_member
-- ----------------------------
INSERT INTO `tb_member` VALUES (1001, '张七', '18613800886', 65, 35.00, NULL, '2020-02-03 11:42:38.624');
INSERT INTO `tb_member` VALUES (1002, '张六', '18613800886', 14, 86.00, NULL, '2020-02-03 11:48:35.327');
INSERT INTO `tb_member` VALUES (1003, '张四', '18613800886', 0, 100.00, NULL, '2020-02-02 21:55:32.848');
INSERT INTO `tb_member` VALUES (1004, '红茶', '18613800886', 10, 100.00, NULL, '2020-02-02 21:58:06.084');
INSERT INTO `tb_member` VALUES (1005, '小萌', '18889897788', 0, 100.00, NULL, '2020-02-02 21:57:59.724');
INSERT INTO `tb_member` VALUES (1006, '张八', '18613800886', 0, 100.00, NULL, '2020-02-02 21:55:56.848');
INSERT INTO `tb_member` VALUES (1007, '张二', '18613800886', 0, 100.00, NULL, '2020-02-02 21:56:20.930');
INSERT INTO `tb_member` VALUES (1008, '张九', '18613800886', 0, 100.00, NULL, '2020-02-02 21:56:06.428');
INSERT INTO `tb_member` VALUES (1009, '张三', '18978738787', 0, 100.00, NULL, '2020-02-02 21:57:18.745');
INSERT INTO `tb_member` VALUES (1010, '小兰', '15799908989', 400, 400.00, '2020-01-15 23:20:02.000', '2020-02-02 21:57:28.595');
INSERT INTO `tb_member` VALUES (1011, '小明', '19934324343', 300, 300.00, '2020-01-16 11:53:00.000', '2020-02-02 21:57:39.920');
INSERT INTO `tb_member` VALUES (1012, '小红', '18612301256', 226, 174.00, '2020-01-09 19:13:31.000', '2020-02-02 21:56:53.213');
INSERT INTO `tb_member` VALUES (1013, '小米', '18801200221', 200, 200.00, '2020-01-09 19:13:25.000', '2020-02-02 21:56:56.763');

-- ----------------------------
-- Table structure for tb_member_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_record`;
CREATE TABLE `tb_member_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员Id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '管理员Id',
  `order_number` int(11) NULL DEFAULT NULL COMMENT '订单号',
  `sum` double(10, 2) NULL DEFAULT NULL COMMENT '消费总金额',
  `balance` double(10, 2) NULL DEFAULT NULL COMMENT '余额',
  `received_points` int(11) NULL DEFAULT NULL COMMENT '返积分数',
  `checkout_time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '结账时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_member_record
-- ----------------------------
INSERT INTO `tb_member_record` VALUES (1, 22, 0, 1161101860, 16.00, 0.00, 16, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (2, 22, 0, 1162301505, 10.00, 0.00, 10, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (3, 1001, 0, 1171201663, 6.00, 0.00, 6, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (4, 1001, 0, 1171201663, 6.00, 0.00, 6, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (5, 1002, 0, 1171201896, 4.00, 0.00, 4, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (6, 1001, 0, 1312201607, 4.00, 0.00, 4, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (7, 1001, 0, 1312201851, 4.00, 0.00, 4, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (8, 1001, 0, 203000226, 10.00, 0.00, 10, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (9, 1001, 0, 2031102257, 35.00, 0.00, 35, '0000-00-00 00:00:00.000');
INSERT INTO `tb_member_record` VALUES (10, 1002, 0, 2031102909, 10.00, 0.00, 10, '0000-00-00 00:00:00.000');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `order_number` int(11) NULL DEFAULT NULL COMMENT '订单号',
  `sum` double(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '管理员Id',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员Id',
  `checkout_type` int(2) NULL DEFAULT NULL COMMENT '0：未结算；1;已结算；2取消订单',
  `checkout_time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '状态变化时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (2, 1101301237, 0.00, 0, 0, 0, '0000-00-00 00:00:00.000');
INSERT INTO `tb_order` VALUES (3, 1101301109, 0.00, 0, 0, 0, '0000-00-00 00:00:00.000');
INSERT INTO `tb_order` VALUES (4, 110130184, 0.00, 0, 0, 0, '0000-00-00 00:00:00.000');
INSERT INTO `tb_order` VALUES (5, 1101301921, 0.00, 0, 0, 0, '0000-00-00 00:00:00.000');
INSERT INTO `tb_order` VALUES (136, 2031102532, 0.00, 0, 0, 0, '0000-00-00 00:00:00.000');
INSERT INTO `tb_order` VALUES (137, 2031102524, 10.00, 0, 0, 1, '2020-02-03 11:29:38.032');
INSERT INTO `tb_order` VALUES (138, 2031102978, 10.00, 0, 0, 1, '2020-02-03 11:41:41.492');
INSERT INTO `tb_order` VALUES (139, 2031102257, 35.00, 0, 1001, 1, '2020-02-03 11:42:38.601');
INSERT INTO `tb_order` VALUES (140, 2031102909, 10.00, 0, 1002, 1, '2020-02-03 11:48:35.303');
INSERT INTO `tb_order` VALUES (141, 2031702512, 10.00, 0, 0, 1, '2020-02-03 17:29:23.152');
INSERT INTO `tb_order` VALUES (142, 2032302267, 0.00, 0, 0, 2, '2020-02-04 00:13:55.726');
INSERT INTO `tb_order` VALUES (143, 2040002118, 0.00, 0, 0, 2, '2020-02-04 00:15:03.476');
INSERT INTO `tb_order` VALUES (144, 2040002545, 0.00, 0, 0, 2, '2020-02-04 00:28:20.782');
INSERT INTO `tb_order` VALUES (145, 2041102848, 0.00, 0, 0, 2, '2020-02-04 11:35:20.949');
INSERT INTO `tb_order` VALUES (146, 204110205, 50.00, 0, 0, 1, '2020-02-04 11:49:45.174');
INSERT INTO `tb_order` VALUES (147, 2041102278, 50.00, 0, 0, 1, '2020-02-04 11:52:03.533');
INSERT INTO `tb_order` VALUES (148, 2041202923, 0.00, 0, 0, 2, '2020-02-04 12:10:05.230');
INSERT INTO `tb_order` VALUES (149, 2041402280, 10.00, 0, 0, 1, '2020-02-04 14:45:33.896');
INSERT INTO `tb_order` VALUES (150, 204140243, 10.00, 0, 0, 1, '2020-02-04 14:47:26.491');
INSERT INTO `tb_order` VALUES (151, 2041402465, 10.00, 0, 0, 1, '2020-02-04 14:52:40.574');

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) NULL DEFAULT NULL COMMENT '订单号',
  `commodity_id` int(11) NULL DEFAULT NULL COMMENT '商品编码',
  `commodity_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `total` double(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `is_checked` int(2) NULL DEFAULT NULL COMMENT '结账状态，0未结账；1已结账',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commodityID`(`commodity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------
INSERT INTO `tb_order_item` VALUES (1, 1101301109, 1901, '可乐', 5.00, 2, 10.00, 0);
INSERT INTO `tb_order_item` VALUES (2, 110130184, 1901, '可乐', 5.00, 2, 10.00, 0);
INSERT INTO `tb_order_item` VALUES (3, 1101301921, 1901, '可乐', 5.00, 2, 10.00, 0);
INSERT INTO `tb_order_item` VALUES (4, 1101301359, 1901, '可乐', 5.00, 2, 10.00, 0);
INSERT INTO `tb_order_item` VALUES (5, 1101401220, 1901, '可乐', 5.00, 2, 10.00, 0);
INSERT INTO `tb_order_item` VALUES (151, 2021802227, 33, '红茶', 3.00, 1, 3.00, 0);
INSERT INTO `tb_order_item` VALUES (152, 2021802227, 11, '可乐', 5.00, 4, 20.00, 0);
INSERT INTO `tb_order_item` VALUES (153, 2021802202, 33, '红茶', 3.00, 0, 3.00, 1);
INSERT INTO `tb_order_item` VALUES (160, 2022202571, 1902, '雪碧', 5.00, 0, 20.00, 1);
INSERT INTO `tb_order_item` VALUES (161, 2022202926, 1901, '可乐', 5.00, 0, 0.00, 1);
INSERT INTO `tb_order_item` VALUES (162, 2022202926, 1902, '雪碧', 5.00, 2, 10.00, 1);
INSERT INTO `tb_order_item` VALUES (198, 2031102909, 1901, '可乐', 5.00, 2, 10.00, 1);
INSERT INTO `tb_order_item` VALUES (199, 2031702512, 1902, '雪碧', 5.00, 2, 10.00, 1);
INSERT INTO `tb_order_item` VALUES (200, 2032302267, 1901, '可乐', 5.00, 2, 10.00, 2);
INSERT INTO `tb_order_item` VALUES (201, 2040002118, 1902, '雪碧', 5.00, 2, 10.00, 2);
INSERT INTO `tb_order_item` VALUES (202, 2040002545, 1901, '可乐', 5.00, 2, 10.00, 2);
INSERT INTO `tb_order_item` VALUES (203, 2041102848, 1901, '可乐', 5.00, 2, 10.00, 2);
INSERT INTO `tb_order_item` VALUES (204, 2041102848, 1902, '雪碧', 5.00, 2, 10.00, 2);
INSERT INTO `tb_order_item` VALUES (205, 204110205, 1901, '可乐', 5.00, 5, 25.00, 1);
INSERT INTO `tb_order_item` VALUES (206, 204110205, 1902, '雪碧', 5.00, 5, 25.00, 1);
INSERT INTO `tb_order_item` VALUES (207, 2041102278, 1901, '可乐', 5.00, 5, 25.00, 1);
INSERT INTO `tb_order_item` VALUES (208, 2041102278, 1902, '雪碧', 5.00, 5, 25.00, 1);
INSERT INTO `tb_order_item` VALUES (209, 2041202923, 1902, '雪碧', 5.00, 5, 25.00, 2);
INSERT INTO `tb_order_item` VALUES (210, 2041402280, 1901, '可乐', 5.00, 2, 10.00, 1);
INSERT INTO `tb_order_item` VALUES (211, 204140243, 1901, '可乐', 5.00, 2, 10.00, 1);
INSERT INTO `tb_order_item` VALUES (212, 2041402465, 1901, '可乐', 5.00, 2, 10.00, 1);

-- ----------------------------
-- Table structure for tb_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `order_number` int(11) NULL DEFAULT NULL COMMENT '订单号',
  `frequency` int(4) NULL DEFAULT NULL COMMENT '执行次数',
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `status` int(4) NULL DEFAULT NULL COMMENT '1未执行，2执行中，3成功，4失败，5取消',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `data_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task
-- ----------------------------
INSERT INTO `tb_task` VALUES (1, 2032302267, 2, '{\"count\":2,\"commodityId\":1901}', 3, 'pre', 'commodity', '2020-02-03 15:47:27', '2020-02-04 00:12:59');
INSERT INTO `tb_task` VALUES (2, 2040002118, 0, '{\"count\":2,\"commodityId\":1902}', 3, 'pre', 'commodity', '2020-02-03 16:12:03', '2020-02-04 00:15:03');
INSERT INTO `tb_task` VALUES (3, 2040002545, 0, '{\"count\":2,\"commodityId\":1901}', 3, 'pre', 'commodity', '2020-02-04 00:25:17', '2020-02-04 00:28:20');
INSERT INTO `tb_task` VALUES (4, 2041102848, 0, '{\"count\":2,\"commodityId\":1901}', 3, 'pre', 'commodity', '2020-02-04 11:32:17', '2020-02-04 11:35:20');
INSERT INTO `tb_task` VALUES (5, 2041102848, 0, '{\"count\":2,\"commodityId\":1902}', 3, 'pre', 'commodity', '2020-02-04 11:32:23', '2020-02-04 11:35:30');
INSERT INTO `tb_task` VALUES (8, 2041102278, NULL, '{\"count\":5,\"commodityId\":1901}', 5, 'order', 'commodity', '2020-02-04 11:51:00', '2020-02-04 11:52:03');
INSERT INTO `tb_task` VALUES (9, 2041102278, NULL, '{\"count\":5,\"commodityId\":1902}', 5, 'order', 'commodity', '2020-02-04 11:51:36', '2020-02-04 11:52:03');
INSERT INTO `tb_task` VALUES (10, 2041202923, 0, '{\"count\":5,\"commodityId\":1902}', 3, 'order', 'commodity', '2020-02-04 12:07:00', '2020-02-04 12:10:05');
INSERT INTO `tb_task` VALUES (11, 2041402280, NULL, '{\"count\":2,\"commodityId\":1901}', 5, 'order', 'commodity', '2020-02-04 14:45:26', '2020-02-04 14:45:33');
INSERT INTO `tb_task` VALUES (12, 204140243, NULL, '{\"count\":2,\"commodityId\":1901}', 5, 'order', 'commodity', '2020-02-04 14:47:16', '2020-02-04 14:47:26');
INSERT INTO `tb_task` VALUES (13, 2041402465, NULL, '{\"count\":2,\"commodityId\":1901}', 5, 'order', 'commodity', '2020-02-04 14:52:38', '2020-02-04 14:52:40');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` int(2) NOT NULL COMMENT '角色1：管理员；2收银员，3库管',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '张三', '1', 1);
INSERT INTO `tb_user` VALUES (2, '李四', '2', 2);
INSERT INTO `tb_user` VALUES (3, '王二', '3', 3);

SET FOREIGN_KEY_CHECKS = 1;
