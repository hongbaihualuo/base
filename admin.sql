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

 Date: 25/02/2019 18:27:19
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_carousel
-- ----------------------------
INSERT INTO `ac_carousel` VALUES (10, '首页', '首页', '/uploads/img/20190222/e2203e355c7dd6234040ea8418f41a57.jpg', '', 1, 1, 2, '2019-02-22 18:32:50');
INSERT INTO `ac_carousel` VALUES (11, '首页1', '', '/uploads/img/20190225/5a185bf0fbbfe6da6012253265841d97.jpg', '', 0, 0, 3, '2019-02-25 16:39:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_manage
-- ----------------------------
INSERT INTO `ac_manage` VALUES (1, 'admin', '$2y$10$yq70Bqv5DELrtLpg9M.3MOH2HmU4i122tsA1MXkz7Jp.r/FKBlz3u', 1, '珀翡', '2019-02-22 16:09:54', 0);
INSERT INTO `ac_manage` VALUES (2, 'taotao', '$2y$10$l6Yjg8G/TfIx6Xw78kc3qOZyoY3VA0MmGqh0z6anibPOXj1Cwe7AS', 4, '陶一鸣', '2019-02-23 10:49:48', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_manage_group
-- ----------------------------
INSERT INTO `ac_manage_group` VALUES (1, '超级管理员', '超级管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30', 0);
INSERT INTO `ac_manage_group` VALUES (3, '测试', '测试专员', '1,2,3,11,12,16,21', 0);
INSERT INTO `ac_manage_group` VALUES (4, '测试2', '', '1,2,3,6,7,11,12,16,21,22,23,27', 0);

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
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型 0 登录 1 添加 2 修改 3 删除 4 其他',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`manage_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_manage_log
-- ----------------------------
INSERT INTO `ac_manage_log` VALUES (1, '删除管理员', '删除了管理员taotao', 1, '127.0.0.1', 3, '2019-02-23 13:48:44');
INSERT INTO `ac_manage_log` VALUES (2, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-23 14:07:20');
INSERT INTO `ac_manage_log` VALUES (3, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-23 14:36:05');
INSERT INTO `ac_manage_log` VALUES (4, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-23 14:40:46');
INSERT INTO `ac_manage_log` VALUES (5, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-23 14:49:23');
INSERT INTO `ac_manage_log` VALUES (6, '添加管理组', '添加的管理组为：测试2', 1, '127.0.0.1', 1, '2019-02-23 14:58:02');
INSERT INTO `ac_manage_log` VALUES (7, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-23 15:29:16');
INSERT INTO `ac_manage_log` VALUES (8, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 08:34:56');
INSERT INTO `ac_manage_log` VALUES (9, '登录', '登录', 2, '127.0.0.1', 0, '2019-02-25 08:46:22');
INSERT INTO `ac_manage_log` VALUES (10, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 09:19:27');
INSERT INTO `ac_manage_log` VALUES (11, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 09:33:56');
INSERT INTO `ac_manage_log` VALUES (12, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 11:27:43');
INSERT INTO `ac_manage_log` VALUES (13, '添加用户类型', '添加的用户类型为：普通用户', 1, '127.0.0.1', 1, '2019-02-25 11:39:35');
INSERT INTO `ac_manage_log` VALUES (14, '添加用户', '添加了xlolic管理员', 1, '127.0.0.1', 1, '2019-02-25 13:26:34');
INSERT INTO `ac_manage_log` VALUES (15, '添加用户', '添加了lolicc用户', 1, '127.0.0.1', 1, '2019-02-25 14:44:33');
INSERT INTO `ac_manage_log` VALUES (16, '添加用户', '添加了taotao用户', 1, '127.0.0.1', 1, '2019-02-25 14:58:37');
INSERT INTO `ac_manage_log` VALUES (17, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 15:28:38');
INSERT INTO `ac_manage_log` VALUES (18, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 15:30:08');
INSERT INTO `ac_manage_log` VALUES (19, '删除用户', '删除用户', 1, '127.0.0.1', 3, '2019-02-25 15:37:45');
INSERT INTO `ac_manage_log` VALUES (20, '删除用户', '删除用户', 1, '127.0.0.1', 3, '2019-02-25 15:38:22');
INSERT INTO `ac_manage_log` VALUES (21, '添加用户', '添加了lolicc用户', 1, '127.0.0.1', 1, '2019-02-25 15:39:22');
INSERT INTO `ac_manage_log` VALUES (22, '管理员信息修改', '修改了lolicc的信息', 1, '127.0.0.1', 2, '2019-02-25 15:40:05');
INSERT INTO `ac_manage_log` VALUES (23, '上传文件', '文件路径:/uploads/img/20190225/5a185bf0fbbfe6da6012253265841d97.jpg', 1, '127.0.0.1', 1, '2019-02-25 16:39:01');
INSERT INTO `ac_manage_log` VALUES (24, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 16:44:47');
INSERT INTO `ac_manage_log` VALUES (25, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 16:44:56');
INSERT INTO `ac_manage_log` VALUES (26, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 16:45:06');
INSERT INTO `ac_manage_log` VALUES (27, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 16:45:11');
INSERT INTO `ac_manage_log` VALUES (28, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 16:46:22');
INSERT INTO `ac_manage_log` VALUES (29, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 16:54:57');
INSERT INTO `ac_manage_log` VALUES (30, '登录', '登录', 2, '127.0.0.1', 0, '2019-02-25 16:58:20');
INSERT INTO `ac_manage_log` VALUES (31, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 17:04:16');
INSERT INTO `ac_manage_log` VALUES (32, '管理员信息修改', '修改了taotao的信息', 1, '127.0.0.1', 2, '2019-02-25 17:04:22');
INSERT INTO `ac_manage_log` VALUES (33, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 17:43:28');
INSERT INTO `ac_manage_log` VALUES (34, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 17:45:20');
INSERT INTO `ac_manage_log` VALUES (35, '登录', '登录', 2, '127.0.0.1', 0, '2019-02-25 17:48:02');
INSERT INTO `ac_manage_log` VALUES (36, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 17:50:42');
INSERT INTO `ac_manage_log` VALUES (37, '登录', '登录', 2, '127.0.0.1', 0, '2019-02-25 17:52:14');
INSERT INTO `ac_manage_log` VALUES (38, '登录', '登录', 1, '127.0.0.1', 0, '2019-02-25 17:52:59');
INSERT INTO `ac_manage_log` VALUES (39, '修改用户类型', '修改的用户类型为：普通用户', 1, '127.0.0.1', 2, '2019-02-25 17:54:11');
INSERT INTO `ac_manage_log` VALUES (40, '修改管理组', '修改的管理组为：测试2', 1, '127.0.0.1', 2, '2019-02-25 18:04:06');
INSERT INTO `ac_manage_log` VALUES (41, '修改用户类型', '修改的用户类型为：普通用户', 1, '127.0.0.1', 2, '2019-02-25 18:16:09');
INSERT INTO `ac_manage_log` VALUES (42, '修改管理组', '修改的管理组为：测试2', 1, '127.0.0.1', 2, '2019-02-25 18:22:33');

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
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `ac_menu` VALUES (11, 0, '&#xe726;', '管理员', 'manager', 'index', 0);
INSERT INTO `ac_menu` VALUES (12, 11, '&#xe6fa;', '管理员列表', 'manager', 'manager', 0);
INSERT INTO `ac_menu` VALUES (13, 12, '', '管理员添加', 'manager', 'manager_add', 1);
INSERT INTO `ac_menu` VALUES (14, 12, '', '管理员修改', 'manager', 'manager_edit', 1);
INSERT INTO `ac_menu` VALUES (15, 12, '', '管理员删除', 'manager', 'manager_delete', 1);
INSERT INTO `ac_menu` VALUES (16, 11, '&#xe6a9;', '管理组', 'manager', 'group', 0);
INSERT INTO `ac_menu` VALUES (17, 16, '', '管理组添加', 'manager', 'group_add', 1);
INSERT INTO `ac_menu` VALUES (18, 16, '', '管理组修改', 'manager', 'group_edit', 1);
INSERT INTO `ac_menu` VALUES (19, 16, '', '管理组删除', 'manager', 'group_delete', 1);
INSERT INTO `ac_menu` VALUES (20, 16, '', '管理组权限', 'manager', 'group_right_change', 1);
INSERT INTO `ac_menu` VALUES (21, 11, '&#xe6a2;', '管理员日志', 'manager', 'log', 0);
INSERT INTO `ac_menu` VALUES (22, 0, '&#xe6b8;', '用户管理', 'member', 'index', 0);
INSERT INTO `ac_menu` VALUES (23, 22, '&#xe6fa;', '用户列表', 'member', 'member', 0);
INSERT INTO `ac_menu` VALUES (24, 23, '', '用户添加', 'member', 'member_add', 1);
INSERT INTO `ac_menu` VALUES (25, 23, '', '用户修改', 'member', 'member_edit', 1);
INSERT INTO `ac_menu` VALUES (26, 23, '', '用户删除', 'member', 'member_delete', 1);
INSERT INTO `ac_menu` VALUES (27, 22, '&#xe6a9;', '用户类型', 'member', 'type', 0);
INSERT INTO `ac_menu` VALUES (28, 27, '', '用户类型添加', 'member', 'type_add', 1);
INSERT INTO `ac_menu` VALUES (29, 27, '', '用户类型修改', 'member', 'type_edit', 1);
INSERT INTO `ac_menu` VALUES (30, 27, '', '用户类型删除', 'member', 'type_delete', 1);

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
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ac_seo
-- ----------------------------
INSERT INTO `ac_seo` VALUES (4, '帮助中心', 'index', 'help', '【帮助中心】- 胡桃社', '胡桃社，帮助', '');

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

-- ----------------------------
-- Table structure for ac_user
-- ----------------------------
DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user`  (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户类型',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户状态0 启用 1停用',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '用户金额',
  `score` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '用户积分',
  `add_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `add_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加ip',
  `last_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `user_type`(`user_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_user
-- ----------------------------
INSERT INTO `ac_user` VALUES (1, 1, 'xlolic', '$2y$10$ZHfAGra1zY4sB3zjmGI9PeudjfA.msbLZmWQdFvfb0BrwKd82wDZW', '', 0, 0.00, 0.00, '2019-02-25 13:26:34', '127.0.0.1', '2019-02-25 13:26:34', '127.0.0.1');
INSERT INTO `ac_user` VALUES (15, 1, 'lolicc', '$2y$10$8.xrai6xDPpz8ZbwZvPwCeVrxz0OGo1KHWPif/Wss196V5PxSvDL6', '15255562449', 0, 0.00, 0.00, '2019-02-25 15:39:22', '127.0.0.1', '2019-02-25 15:39:22', '127.0.0.1');

-- ----------------------------
-- Table structure for ac_user_info
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_info`;
CREATE TABLE `ac_user_info`  (
  `user_info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `idcard` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `qq_openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ登录接入码',
  `wx_openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信登录接入码',
  `recom_code` smallint(5) NOT NULL DEFAULT 0 COMMENT '邀请码',
  `phone_sign` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机标识码',
  `reg_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '注册类型 0web 1wap 2安卓 3IOS',
  `source` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '来源',
  PRIMARY KEY (`user_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_user_info
-- ----------------------------
INSERT INTO `ac_user_info` VALUES (1, 1, '', '', '', '', 0, '', 0, '0');
INSERT INTO `ac_user_info` VALUES (4, 15, '陶陶', '', '', '', 2121, '', 0, '后台添加');

-- ----------------------------
-- Table structure for ac_user_type
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_type`;
CREATE TABLE `ac_user_type`  (
  `user_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型名',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型描述',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 启用 1 停用',
  PRIMARY KEY (`user_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ac_user_type
-- ----------------------------
INSERT INTO `ac_user_type` VALUES (1, '普通用户', '普通用户', 0);

SET FOREIGN_KEY_CHECKS = 1;
