/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : admin

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 22/02/2019 18:35:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ac_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ac_carousel`;
CREATE TABLE `ac_carousel`  (
  `carousel_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `carousel_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播标题',
  `carousel_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播描述',
  `carousel_img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片链接',
  `carousel_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址链接',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 显示 1 不显示',
  `carousel_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型 0 pc 1 wap 2 app',
  `orderby` int(10) NOT NULL DEFAULT 0 COMMENT '顺序',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_carousel
-- ----------------------------
INSERT INTO `ac_carousel` VALUES (10, '', '', '/uploads/img/20190222/e2203e355c7dd6234040ea8418f41a57.jpg', '', 1, 1, 2, '2019-02-22 18:32:50');

-- ----------------------------
-- Table structure for ac_manage
-- ----------------------------
DROP TABLE IF EXISTS `ac_manage`;
CREATE TABLE `ac_manage`  (
  `manage_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `manage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员名',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `manage_group_id` int(10) NOT NULL DEFAULT 1 COMMENT '组别ID',
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 正常 1 停用',
  PRIMARY KEY (`manage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_manage
-- ----------------------------
INSERT INTO `ac_manage` VALUES (1, 'admin', '$2y$10$yq70Bqv5DELrtLpg9M.3MOH2HmU4i122tsA1MXkz7Jp.r/FKBlz3u', 1, '珀翡', '2019-02-22 16:09:54', 0);

-- ----------------------------
-- Table structure for ac_manage_group
-- ----------------------------
DROP TABLE IF EXISTS `ac_manage_group`;
CREATE TABLE `ac_manage_group`  (
  `manage_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `manage_group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `manage_group_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `manage_group_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 正常 1 停用',
  PRIMARY KEY (`manage_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_manage_group
-- ----------------------------
INSERT INTO `ac_manage_group` VALUES (1, '超级管理员', '', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', 0);
INSERT INTO `ac_manage_group` VALUES (3, '测试', '测试专员', '1,2,6', 0);

-- ----------------------------
-- Table structure for ac_manage_log
-- ----------------------------
DROP TABLE IF EXISTS `ac_manage_log`;
CREATE TABLE `ac_manage_log`  (
  `manage_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志内容',
  `manage_id` int(10) NOT NULL COMMENT '操作管理员',
  `ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作ip',
  `manage_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型 0 登录 1 删除 2 添加 3 修改 4 其他',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`manage_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ac_menu
-- ----------------------------
DROP TABLE IF EXISTS `ac_menu`;
CREATE TABLE `ac_menu`  (
  `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '父栏目ID',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标志',
  `menu_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目名',
  `controller` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法名',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 显示 1 不显示',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ac_menu
-- ----------------------------
INSERT INTO `ac_menu` VALUES (1, 0, '&#xe6ae;', '系统设置', 'set', 'index', 0);
INSERT INTO `ac_menu` VALUES (2, 1, '&#xe6ae;', '基本信息', 'set', 'base', 0);
INSERT INTO `ac_menu` VALUES (3, 1, '&#xe75e;', '轮播图设置', 'set', 'carousel', 0);
INSERT INTO `ac_menu` VALUES (4, 3, '', '轮播图添加', 'set', 'carousel_add', 1);
INSERT INTO `ac_menu` VALUES (5, 3, '', '轮播图修改', 'set', 'carousel_edit', 1);
INSERT INTO `ac_menu` VALUES (6, 3, '', '轮播图删除', 'set', 'carousel_delete', 1);
INSERT INTO `ac_menu` VALUES (7, 1, '&#xe811;', 'seo设置', 'set', 'seo', 0);
INSERT INTO `ac_menu` VALUES (8, 7, '', 'seo添加', 'set', 'seo_add', 1);
INSERT INTO `ac_menu` VALUES (9, 7, '', 'seo修改', 'set', 'seo_edit', 1);
INSERT INTO `ac_menu` VALUES (10, 7, '', 'seo删除', 'set', 'seo_delete', 1);
INSERT INTO `ac_menu` VALUES (11, 0, '&#xe726;', '管理员设置', 'manager', 'index', 0);
INSERT INTO `ac_menu` VALUES (12, 11, '&#xe732;', '管理员列表', 'manager', 'manager', 0);
INSERT INTO `ac_menu` VALUES (13, 12, '', '管理员添加', 'manager', 'manager_add', 1);
INSERT INTO `ac_menu` VALUES (14, 12, '', '管理员修改', 'manager', 'manager_edit', 1);
INSERT INTO `ac_menu` VALUES (15, 12, '', '管理员删除', 'manager', 'manager_delete', 1);
INSERT INTO `ac_menu` VALUES (16, 11, '&#xe6a9;', '管理组', 'manager', 'group', 0);
INSERT INTO `ac_menu` VALUES (17, 16, '', '管理组添加', 'manager', 'group_add', 1);
INSERT INTO `ac_menu` VALUES (18, 16, '', '管理组修改', 'manager', 'group_edit', 1);
INSERT INTO `ac_menu` VALUES (19, 16, '', '管理组删除', 'manager', 'group_delete', 1);
INSERT INTO `ac_menu` VALUES (20, 16, '', '管理组权限', 'manager', 'group_right', 1);

-- ----------------------------
-- Table structure for ac_seo
-- ----------------------------
DROP TABLE IF EXISTS `ac_seo`;
CREATE TABLE `ac_seo`  (
  `seo_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `seo_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'seo名',
  `controller` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'title',
  `keywords` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'keywords',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'desc',
  PRIMARY KEY (`seo_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ac_system
-- ----------------------------
DROP TABLE IF EXISTS `ac_system`;
CREATE TABLE `ac_system`  (
  `system_id` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站名',
  `keywords` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `instructions` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站介绍',
  `copyright` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版权',
  `domain` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '域名',
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `icp` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'icp备案',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网站地址',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `wechat` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信二维码',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系qq',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `about` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关于',
  PRIMARY KEY (`system_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ac_system
-- ----------------------------
INSERT INTO `ac_system` VALUES (1, '胡桃社', '胡桃社，月光社', 'sad发送到发送到发送到发送到发顺丰的', '撒打发斯蒂芬阿斯蒂芬阿斯蒂芬                          ', '2019', 'www.baidu.com', '阿斯蒂芬啊', '阿士大夫撒地方', '按时发达月光社月光社斯蒂芬', '15855685005', '/uploads/img/20190220/4cf6f48799a4954e2f3c786d42a41578.jpg', '1315381101', '1315381101@qq.com', 'sadfjklasdjflkasjdf     ');

SET FOREIGN_KEY_CHECKS = 1;
