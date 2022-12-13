/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3301
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : yygh_hosp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 13/12/2022 09:09:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hospital_set
-- ----------------------------
DROP TABLE IF EXISTS `hospital_set`;
CREATE TABLE `hospital_set`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `hoscode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院编号',
  `sign_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名秘钥',
  `api_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统一挂号平台api地址',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  `hosname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contacts_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contacts_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医院设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital_set
-- ----------------------------
INSERT INTO `hospital_set` VALUES (1, '1000_0', 'bdf81065012e9e9f7f5ff0460421596e', 'http://localhost:8201', '2022-01-25 16:44:00', '2022-12-12 22:15:44', 0, '11111', '1111', '1111', '1');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL,
  `out_trade_no` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单交易号',
  `hoscode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院编号',
  `hosname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院名称',
  `depcode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室编号',
  `depname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生职称',
  `hos_schedule_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班编号（医院自己的排班主键）',
  `reserve_date` date NULL DEFAULT NULL COMMENT '安排日期',
  `reserve_time` tinyint(3) NULL DEFAULT 0 COMMENT '安排时间（0：上午 1：下午）',
  `patient_id` bigint(20) NULL DEFAULT NULL COMMENT '就诊人id',
  `patient_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就诊人名称',
  `patient_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就诊人手机',
  `hos_record_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约记录唯一标识（医院预约记录主键）',
  `number` int(11) NULL DEFAULT NULL COMMENT '预约号序',
  `fetch_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建议取号时间',
  `fetch_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取号地点',
  `amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '医事服务费',
  `quit_time` datetime(0) NULL DEFAULT NULL COMMENT '退号时间',
  `order_status` tinyint(3) NULL DEFAULT NULL COMMENT '订单状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_hoscode`(`hoscode`) USING BTREE,
  INDEX `idx_hos_schedule_id`(`hos_schedule_id`) USING BTREE,
  INDEX `idx_hos_record_id`(`hos_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (1, 13, '164421691749355', '1000_0', '北京协和医院', '200040878', '多发性硬化专科门诊', '医师', '61f261c986d34a7e49b56a34', '2022-02-08', 0, 1, '张三', '13845046517', '1', 12, '2022-02-0809:00前', '一层114窗口', 100, '2022-02-07 15:30:00', 0, '2022-02-07 14:55:17', '2022-02-07 15:02:41', 0);
INSERT INTO `order_info` VALUES (2, 13, '164421722572912', '1000_0', '北京协和医院', '200040878', '多发性硬化专科门诊', '副主任医师', '61f261c986d34a7e49b56a35', '2022-02-08', 0, 1, '张三', '13845046517', '2', 13, '2022-02-0809:00前', '一层114窗口', 100, '2022-02-07 15:30:00', 0, '2022-02-07 15:00:25', '2022-02-07 15:02:43', 0);
INSERT INTO `order_info` VALUES (3, 13, '164429904140946', '1000_0', '北京协和医院', '200040878', '多发性硬化专科门诊', '医师', '61f261c986d34a7e49b56a37', '2022-02-09', 0, 1, '张三', '13845046517', '4', 15, '2022-02-0909:00前', '一层114窗口', 100, '2022-02-08 15:30:00', 1, '2022-02-08 13:44:01', '2022-02-08 13:44:01', 0);
INSERT INTO `order_info` VALUES (4, 13, '164437094409435', '1000_0', '北京协和医院', '200040878', '多发性硬化专科门诊', '医师', '61f261c986d34a7e49b56a3a', '2022-02-10', 0, 2, '孙丽丽', '13845046517', '5', 16, '2022-02-1009:00前', '一层114窗口', 100, '2022-02-09 15:30:00', -1, '2022-02-09 09:42:24', '2022-02-09 09:42:24', 0);

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `certificates_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certificates_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件编号',
  `sex` tinyint(3) NULL DEFAULT NULL COMMENT '性别',
  `birthdate` date NULL DEFAULT NULL COMMENT '出生年月',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `is_marry` tinyint(3) NULL DEFAULT NULL COMMENT '是否结婚',
  `province_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省code',
  `city_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市code',
  `district_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区code',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情地址',
  `contacts_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contacts_certificates_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人证件类型',
  `contacts_certificates_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人证件号',
  `contacts_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就诊卡号',
  `is_insure` tinyint(3) NULL DEFAULT 0 COMMENT '是否有医保',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：默认 1：已认证）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '就诊人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (1, 13, '张三', '10', '230281200202023715', 1, '2022-02-01', '13845046517', 0, '110000', '110100', '110105', '大望路114号', '', '', '', '', NULL, 0, 0, '2022-02-06 09:18:06', '2022-02-06 09:18:06', 0);
INSERT INTO `patient` VALUES (2, 13, '孙丽丽', '10', '230281200202023715', 0, '2022-02-01', '13845046517', 0, '110000', '110100', '110102', '古城村', '', '', '', '', NULL, 0, 0, '2022-02-06 09:18:48', '2022-02-06 09:18:48', 0);

-- ----------------------------
-- Table structure for payment_info
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_trade_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对外业务编号',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `payment_type` tinyint(1) NULL DEFAULT NULL COMMENT '支付类型（微信 支付宝）',
  `trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易编号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易内容',
  `payment_status` tinyint(3) NULL DEFAULT NULL COMMENT '支付状态',
  `callback_time` datetime(0) NULL DEFAULT NULL COMMENT '回调时间',
  `callback_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调信息',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_info
-- ----------------------------
INSERT INTO `payment_info` VALUES (1, '164429904140946', 3, 2, '4200001323202202083379857060', 100.00, '2022-02-09|北京协和医院|多发性硬化专科门诊|医师', 2, '2022-02-08 13:50:07', '{transaction_id=4200001323202202083379857060, nonce_str=8UzTkRGKQzKcm7Yp, trade_state=SUCCESS, bank_type=OTHERS, openid=oHwsHuFJML39xfpy4armetXTJKnI, sign=30A625B40D8D09F51F9B330FC7B5DFCF, return_msg=OK, fee_type=CNY, mch_id=1558950191, cash_fee=1, out_trade_no=164429904140946, cash_fee_type=CNY, appid=wx74862e0dfcf69954, total_fee=1, trade_state_desc=支付成功, trade_type=NATIVE, result_code=SUCCESS, attach=, time_end=20220208135007, is_subscribe=N, return_code=SUCCESS}', '2022-02-08 13:44:10', '2022-02-08 13:44:10', 0);
INSERT INTO `payment_info` VALUES (2, '164437094409435', 4, 2, '4200001318202202099943987809', 100.00, '2022-02-10|北京协和医院|多发性硬化专科门诊|医师', 2, '2022-02-09 09:42:43', '{transaction_id=4200001318202202099943987809, nonce_str=jUKpRyD0FIcA6U8Q, trade_state=SUCCESS, bank_type=OTHERS, openid=oHwsHuFJML39xfpy4armetXTJKnI, sign=B0D2C72E17F9E99D88F10D9A887E5F9D, return_msg=OK, fee_type=CNY, mch_id=1558950191, cash_fee=1, out_trade_no=164437094409435, cash_fee_type=CNY, appid=wx74862e0dfcf69954, total_fee=1, trade_state_desc=支付成功, trade_type=NATIVE, result_code=SUCCESS, attach=, time_end=20220209094245, is_subscribe=N, return_code=SUCCESS}', '2022-02-09 09:42:31', '2022-02-09 09:42:30', 0);

-- ----------------------------
-- Table structure for refund_info
-- ----------------------------
DROP TABLE IF EXISTS `refund_info`;
CREATE TABLE `refund_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对外业务编号',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `payment_type` tinyint(3) NULL DEFAULT NULL COMMENT '支付类型（微信 支付宝）',
  `trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易编号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易内容',
  `refund_status` tinyint(3) NULL DEFAULT NULL COMMENT '退款状态',
  `callback_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调信息',
  `callback_time` datetime(0) NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退款信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refund_info
-- ----------------------------
INSERT INTO `refund_info` VALUES (1, '164437094409435', 4, 2, '50302100922022020917184947108', 100.00, '2022-02-10|北京协和医院|多发性硬化专科门诊|医师', 2, '{\"transaction_id\":\"4200001318202202099943987809\",\"nonce_str\":\"2E32fBLVLEd02RvH\",\"out_refund_no\":\"tk164437094409435\",\"sign\":\"06F0C9A4228BFB105B6817BEA3DEEEAB\",\"return_msg\":\"OK\",\"mch_id\":\"1558950191\",\"refund_id\":\"50302100922022020917184947108\",\"cash_fee\":\"1\",\"out_trade_no\":\"164437094409435\",\"coupon_refund_fee\":\"0\",\"refund_channel\":\"\",\"appid\":\"wx74862e0dfcf69954\",\"refund_fee\":\"1\",\"total_fee\":\"1\",\"result_code\":\"SUCCESS\",\"coupon_refund_count\":\"0\",\"cash_refund_fee\":\"1\",\"return_code\":\"SUCCESS\"}', '2022-02-09 09:43:59', '2022-02-09 09:43:58', '2022-02-09 09:43:58', 0);

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` bigint(20) NOT NULL DEFAULT 0 COMMENT '编号',
  `hoscode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院编号',
  `depcode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室编号',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `docname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生名称',
  `skill` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '擅长技能',
  `work_date` date NULL DEFAULT NULL COMMENT '安排日期',
  `work_time` tinyint(3) NULL DEFAULT 0 COMMENT '安排时间（0：上午 1：下午）',
  `reserved_number` int(11) NULL DEFAULT 0 COMMENT '可预约数',
  `available_number` int(11) NULL DEFAULT 0 COMMENT '剩余预约数',
  `amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '挂号费',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '排班状态（-1：停诊 0：停约 1：可约）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医生日程安排表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-13', 0, 33, 16, 100, 1, '2022-01-27 16:37:22', '2022-01-27 16:37:22', 0);
INSERT INTO `schedule` VALUES (2, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-22', 0, 40, 6, 100, 1, '2022-01-27 17:11:35', '2022-01-27 17:11:35', 0);
INSERT INTO `schedule` VALUES (3, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-22', 1, 27, 10, 100, 1, '2022-01-27 17:11:35', '2022-01-27 17:11:35', 0);
INSERT INTO `schedule` VALUES (4, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-14', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (5, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-23', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (6, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-23', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (7, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-15', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (8, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-24', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (9, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-24', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (10, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-16', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (11, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-25', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (12, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-25', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (13, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-17', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (14, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-26', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (15, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-26', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (16, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-18', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (17, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-27', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (18, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-27', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (19, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-19', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (20, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-28', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (21, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-28', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (22, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-20', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (23, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-29', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (24, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-29', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (25, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2020-12-21', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (26, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-30', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (27, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-30', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (29, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2020-12-30', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (30, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2020-12-30', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (31, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-01', 0, 33, 22, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (32, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-01', 0, 40, 6, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (33, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-01', 1, 27, 10, 100, 1, '2022-01-27 17:11:36', '2022-01-27 17:11:36', 0);
INSERT INTO `schedule` VALUES (34, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2021-01-02', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (35, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-02', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (36, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-02', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (37, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2021-01-03', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (38, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-03', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (39, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-03', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (40, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2021-01-04', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (41, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-04', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (42, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-04', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (43, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2021-01-05', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (44, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-05', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (45, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-05', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (46, '1000_0', '200040878', '医师', '邵迎红', '内分泌科常见病。', '2021-01-06', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (47, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-06', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (48, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-06', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (49, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-07', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (50, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-07', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (51, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-07', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (52, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-08', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (53, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-08', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (54, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-08', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (55, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-09', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (56, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-09', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (57, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-09', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (58, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-10', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (59, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-10', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (60, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-10', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (61, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-11', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (62, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-11', 0, 40, 6, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (63, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-11', 1, 27, 10, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (64, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-12', 0, 33, 22, 100, 1, '2022-01-27 17:11:37', '2022-01-27 17:11:37', 0);
INSERT INTO `schedule` VALUES (65, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-12', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (66, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-12', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (67, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-13', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (68, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-13', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (69, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-13', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (70, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-14', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (71, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-14', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (72, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-14', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (73, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-15', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (74, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-15', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (75, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-15', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (76, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-16', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (77, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-16', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (78, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-16', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (79, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-17', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (80, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-17', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (81, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-17', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (82, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-18', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (83, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-18', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (84, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-18', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (85, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-19', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (86, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-19', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (87, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-19', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (88, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-20', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (89, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-20', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (90, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-20', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (91, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-21', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (92, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-21', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (93, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-21', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (94, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-22', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (95, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-22', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (96, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-22', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (97, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-23', 0, 33, 22, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (98, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-23', 0, 40, 6, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (99, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-23', 1, 27, 10, 100, 1, '2022-01-27 17:11:38', '2022-01-27 17:11:38', 0);
INSERT INTO `schedule` VALUES (100, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-24', 0, 33, 22, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (101, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-24', 0, 40, 6, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (102, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-24', 1, 27, 10, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (103, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-25', 0, 33, 22, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (104, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-25', 0, 40, 6, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (105, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-25', 1, 27, 10, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (106, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-26', 0, 33, 22, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (107, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-26', 0, 40, 6, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (108, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-26', 1, 27, 10, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (109, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-27', 0, 33, 22, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (110, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-27', 0, 40, 6, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (111, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-27', 1, 27, 10, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (112, '1000_0', '200040878', '医师', '', '内分泌科常见病。', '2021-01-28', 0, 33, 22, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (113, '1000_0', '200040878', '副主任医师', '裴育', '骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。', '2021-01-28', 0, 40, 6, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);
INSERT INTO `schedule` VALUES (114, '1000_0', '200040878', '副主任医师', '邵迎红', '内分泌与代谢性疾病。', '2021-01-28', 1, 27, 10, 100, 1, '2022-01-27 17:11:39', '2022-01-27 17:11:39', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `nick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `certificates_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certificates_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件编号',
  `certificates_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件路径',
  `auth_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '认证状态（0：未认证 1：认证中 2：认证成功 -1：认证失败）',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态（0：锁定 1：正常）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_mobile`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (8, NULL, NULL, '18846186583', '测试', NULL, NULL, NULL, 0, 1, '2022-02-03 15:37:36', '2022-02-07 10:45:13', 0);
INSERT INTO `user_info` VALUES (13, 'o3_SC57EClyClYfmHUm3uhz2mcDB', '星辰海', '18846106518', '张小斐', '身份证', '230281200202023715', 'https://xinguan-2021.oss-cn-beijing.aliyuncs.com/2022/02/06/264392c5cb7d44f9a89672cc9d131895default.jpg', 2, 1, '2022-02-06 09:14:40', '2022-02-06 09:14:40', 0);

-- ----------------------------
-- Table structure for user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `user_login_record`;
CREATE TABLE `user_login_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login_record
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
