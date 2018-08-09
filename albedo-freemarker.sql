/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : albedo-old

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 07/08/2018 10:17:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_scheme_t
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme_t`;
CREATE TABLE `gen_scheme_t`  (
  `id_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `view_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视图类型 0  普通表格 1  表格采用ajax刷新',
  `package_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成表编号',
  `status_` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态 -2 已删除 -1停用 0 正常',
  `version_` int(11) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生成方案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_scheme_t
-- ----------------------------
INSERT INTO `gen_scheme_t` VALUES ('05bc9bf019d8480a902cf8b714a493db', '文件管理', 'curd', '0', 'com.albedo.java.modules', 'sys', '', '文件管理', '文件', 'admin', '34c0ae8ae28b4c66a78b95ab977a4529', '0', 0, '', '1', '2018-08-06 17:11:27', '1', '2018-08-06 17:11:27');

-- ----------------------------
-- Table structure for gen_table_column_t
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column_t`;
CREATE TABLE `gen_table_column_t`  (
  `id_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `name_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键',
  `is_unique` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否唯一（1：是；0：否）',
  `is_null` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort_` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `status_` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态 -2 已删除 -1停用 0 正常',
  `version_` int(11) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `gen_table_column_table_id`(`gen_table_id`) USING BTREE,
  INDEX `gen_table_column_name`(`name_`) USING BTREE,
  INDEX `gen_table_column_sort`(`sort_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column_t
-- ----------------------------
INSERT INTO `gen_table_column_t` VALUES ('1435fa28801742c3af0f90a0865b7a4d', '34c0ae8ae28b4c66a78b95ab977a4529', 'status_', 'status_', '', 'int(11)', 'Long', 'status', '0', '0', '1', '1', '0', '0', '0', 'eq', 'radio', 'sys_status', NULL, 100, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('546e961b3a01439aa2c9240622575166', '34c0ae8ae28b4c66a78b95ab977a4529', 'created_date', 'created_date', '', 'timestamp', 'java.util.Date', 'createdDate', '0', '0', '0', '1', '0', '0', '0', 'eq', 'dateselect', '', NULL, 70, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('55b6c91da26a40b4b50e9216818c3fab', '34c0ae8ae28b4c66a78b95ab977a4529', 'description_', 'description_', '', 'varchar(255)', 'String', 'description', '0', '0', '1', '1', '1', '0', '0', 'eq', 'textarea', '', NULL, 110, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('6ad06ac67e904d3c91f2dc91274d4b74', '34c0ae8ae28b4c66a78b95ab977a4529', 'id_', 'id_', '', 'varchar(32)', 'String', 'id', '1', '0', '0', '1', '0', '0', '0', 'eq', 'input', '', NULL, 10, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('6d74a20ae02c4f659eeff1ddf9dbe4e2', '34c0ae8ae28b4c66a78b95ab977a4529', 'version_', 'version_', '', 'int(11)', 'Long', 'version', '0', '0', '1', '1', '0', '0', '0', 'eq', 'input', '', NULL, 120, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('9e80e88c26fd4bbdb5cad97784de837d', '34c0ae8ae28b4c66a78b95ab977a4529', 'size_', '大小', '', 'varchar(50)', 'String', 'size', '0', '0', '0', '1', '1', '1', '0', 'eq', 'input', '', NULL, 40, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('ae7f29b148914bafb4e59341a084dbc7', '34c0ae8ae28b4c66a78b95ab977a4529', 'created_by', 'created_by', '', 'varchar(50)', 'String', 'createdBy', '0', '0', '0', '1', '0', '0', '0', 'eq', 'input', '', NULL, 60, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('c312e30e955e42ad8a11098e3175f25f', '34c0ae8ae28b4c66a78b95ab977a4529', 'path_', '路径', '', 'varchar(255)', 'String', 'path', '0', '0', '1', '1', '1', '1', '0', 'eq', 'fileselect', '', NULL, 30, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('e5f691aee0df486289b2fb49a6fca78d', '34c0ae8ae28b4c66a78b95ab977a4529', 'name_', '名称', '', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('f58a58d289bd474188b2199650ed4a45', '34c0ae8ae28b4c66a78b95ab977a4529', 'last_modified_date', 'last_modified_date', '', 'timestamp', 'java.util.Date', 'lastModifiedDate', '0', '0', '1', '1', '0', '0', '0', 'eq', 'dateselect', '', NULL, 90, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('f63468296fe847a99e64269f0b332150', '34c0ae8ae28b4c66a78b95ab977a4529', 'type_', '类型', '', 'varchar(60)', 'String', 'type', '0', '0', '1', '1', '1', '1', '0', 'eq', 'input', '', NULL, 50, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');
INSERT INTO `gen_table_column_t` VALUES ('ff8adf12dc084689b43cc4d727eafe2a', '34c0ae8ae28b4c66a78b95ab977a4529', 'last_modified_by', 'last_modified_by', '', 'varchar(50)', 'String', 'lastModifiedBy', '0', '0', '1', '1', '0', '0', '0', 'eq', 'input', '', NULL, 80, '0', 0, NULL, '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');

-- ----------------------------
-- Table structure for gen_table_fk_t
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_fk_t`;
CREATE TABLE `gen_table_fk_t`  (
  `id_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `name_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键',
  `is_unique` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否唯一（1：是；0：否）',
  `is_null` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort_` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `status_` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态 -2 已删除 -1停用 0 正常',
  `version_` int(11) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `gen_table_column_table_id`(`gen_table_id`) USING BTREE,
  INDEX `gen_table_column_name`(`name_`) USING BTREE,
  INDEX `gen_table_column_sort`(`sort_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_t
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_t`;
CREATE TABLE `gen_table_t`  (
  `id_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表外键',
  `status_` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态 -2 已删除 -1停用 0 正常',
  `version_` int(11) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `gen_table_name`(`name_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_t
-- ----------------------------
INSERT INTO `gen_table_t` VALUES ('34c0ae8ae28b4c66a78b95ab977a4529', 'sys_file_data_t', '文件表', 'FileData', '', '', '0', 0, '', '1', '2018-08-06 17:10:57', '1', '2018-08-06 17:10:57');

-- ----------------------------
-- Table structure for gen_template_t
-- ----------------------------
DROP TABLE IF EXISTS `gen_template_t`;
CREATE TABLE `gen_template_t`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成文件名',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `status_` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态 -2 已删除 -1停用 0 正常',
  `version_` int(11) NULL DEFAULT 0 COMMENT '默认0，必填，离线乐观锁',
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jhi_authority
-- ----------------------------
DROP TABLE IF EXISTS `jhi_authority`;
CREATE TABLE `jhi_authority`  (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jhi_persistent_audit_event
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
CREATE TABLE `jhi_persistent_audit_event`  (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `event_date` timestamp(0) NULL DEFAULT NULL,
  `event_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `idx_persistent_audit_event`(`principal`, `event_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 590 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_persistent_audit_event
-- ----------------------------
INSERT INTO `jhi_persistent_audit_event` VALUES (263, 'admin', '2017-07-04 17:45:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (264, 'admin', '2017-07-05 11:00:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (265, 'admin', '2017-07-05 11:02:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (266, 'admin', '2017-07-05 11:05:14', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (267, 'admin', '2017-07-05 14:27:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (268, 'admin', '2017-07-05 15:01:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (269, 'admin', '2017-07-05 15:03:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (270, 'admin', '2017-07-05 15:17:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (271, 'admin', '2017-11-06 14:50:37', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (272, '', '2017-11-06 14:57:42', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (273, '', '2017-11-06 14:57:48', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (274, '', '2017-11-06 14:57:53', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (275, '', '2017-11-06 14:58:15', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (276, '', '2017-11-06 14:58:18', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (277, 'admin', '2017-11-06 15:01:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (278, 'admin', '2017-11-06 15:22:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (279, 'admin', '2017-11-06 15:33:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (280, 'admin', '2017-11-06 16:02:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (281, 'admin', '2017-11-06 16:08:34', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (282, 'admin', '2017-11-06 16:11:07', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (283, 'admin', '2017-11-06 16:18:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (284, 'admin', '2017-11-06 16:23:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (285, 'admin', '2017-11-06 16:44:55', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (286, 'admin', '2017-11-06 16:46:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (287, 'admin', '2017-11-06 16:47:50', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (288, 'admin', '2017-11-06 17:13:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (289, 'admin', '2017-11-06 17:17:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (290, 'admin', '2017-11-07 16:11:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (291, 'admin', '2017-11-07 16:16:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (292, 'admin', '2017-11-08 14:47:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (293, 'admin', '2017-11-08 15:30:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (294, 'admin', '2017-11-08 15:34:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (295, 'admin', '2017-11-08 15:41:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (296, 'user', '2017-11-08 15:48:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (297, 'admin', '2017-11-08 15:51:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (298, 'admin', '2017-11-08 15:56:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (299, 'admin', '2017-11-08 16:33:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (300, 'admin', '2017-11-08 16:37:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (301, 'admin', '2017-11-08 16:47:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (302, 'admin', '2017-11-08 16:55:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (303, 'admin', '2017-11-08 17:03:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (304, 'admin', '2017-11-08 17:06:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (305, 'admin', '2017-11-08 17:12:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (306, 'admin', '2017-11-08 17:16:40', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (307, 'admin', '2017-11-08 17:38:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (308, 'admin', '2017-11-08 17:54:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (309, 'admin', '2017-11-08 17:56:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (310, 'admin', '2017-11-08 18:12:14', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (311, 'admin', '2017-11-08 19:40:38', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (312, 'admin', '2017-11-09 09:48:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (313, 'admin', '2017-11-09 10:03:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (314, 'admin', '2017-11-09 11:15:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (315, 'admin', '2017-11-09 11:21:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (316, 'admin', '2017-11-09 12:16:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (317, 'admin', '2017-11-09 13:10:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (318, 'admin', '2017-11-09 13:12:37', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (319, 'admin', '2017-11-09 13:14:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (320, 'admin', '2017-11-09 13:17:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (321, 'admin', '2017-11-09 13:25:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (322, 'admin', '2017-11-09 13:28:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (323, 'admin', '2017-11-09 13:31:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (324, 'admin', '2017-11-09 13:32:37', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (325, 'admin', '2017-11-09 13:35:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (326, 'admin', '2017-11-09 13:51:34', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (327, 'admin', '2017-11-09 14:20:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (328, 'admin', '2017-11-09 14:24:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (329, 'admin', '2017-11-09 14:35:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (330, 'admin', '2017-11-09 15:03:30', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (331, 'admin', '2017-11-09 15:50:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (332, 'admin', '2017-11-09 15:54:37', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (333, 'admin', '2017-11-09 16:47:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (334, 'admin', '2017-11-09 17:01:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (335, 'admin', '2017-11-09 17:16:07', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (336, 'admin', '2017-11-09 17:24:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (337, 'admin', '2017-11-10 09:05:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (338, 'admin', '2017-11-10 09:22:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (339, 'admin', '2017-11-10 09:34:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (340, 'admin', '2017-11-10 10:57:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (341, 'admin', '2017-11-10 11:12:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (342, 'admin', '2017-11-10 11:32:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (343, 'admin', '2017-11-10 11:54:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (344, 'admin', '2017-11-10 11:57:21', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (345, 'admin', '2017-11-10 13:18:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (346, 'admin', '2017-11-10 13:29:40', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (347, 'admin', '2017-11-10 13:54:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (348, 'admin', '2017-11-10 14:22:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (349, 'admin', '2017-11-10 14:50:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (350, 'admin', '2017-11-10 14:55:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (351, 'admin', '2017-11-10 15:06:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (352, 'admin', '2017-11-10 15:10:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (353, 'admin', '2017-11-13 09:12:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (354, 'admin', '2017-11-13 10:32:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (355, '', '2017-11-13 10:38:03', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (356, 'admin', '2017-11-13 10:38:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (357, 'admin', '2017-11-13 10:41:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (358, 'admin', '2017-11-13 11:47:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (359, 'admin', '2017-11-14 11:07:55', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (360, 'admin', '2017-11-14 11:23:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (361, '', '2017-11-14 11:53:06', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (362, 'admin', '2017-11-14 11:53:07', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (363, '', '2017-11-14 11:59:31', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (364, 'admin', '2017-11-14 11:59:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (365, 'admin', '2017-11-14 13:34:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (366, 'admin', '2017-11-15 10:58:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (367, 'admin', '2017-11-15 16:42:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (368, 'admin', '2017-11-15 16:44:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (369, 'admin', '2017-11-15 16:47:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (370, 'admin', '2017-11-15 16:50:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (371, 'admin', '2017-11-15 16:51:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (372, 'admin', '2017-11-15 16:57:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (373, 'admin', '2017-11-15 17:00:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (374, 'admin', '2017-11-15 17:08:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (375, 'admin', '2017-11-15 17:47:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (376, 'admin', '2017-11-15 17:49:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (377, 'admin', '2017-11-16 09:10:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (378, 'admin', '2017-11-16 09:11:37', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (379, 'admin', '2017-11-16 10:34:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (380, 'admin', '2017-11-16 11:52:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (381, 'admin', '2017-11-16 13:22:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (382, 'admin', '2017-11-16 13:27:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (383, 'admin', '2017-11-16 13:42:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (384, 'admin', '2017-11-16 13:46:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (385, 'admin', '2017-11-17 09:27:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (386, 'admin', '2017-11-17 09:28:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (387, 'admin', '2017-11-17 09:28:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (388, 'admin', '2017-11-17 09:31:34', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (389, 'admin', '2017-11-17 09:31:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (390, 'admin', '2017-11-17 09:33:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (391, 'admin', '2017-11-17 09:46:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (392, 'admin', '2017-11-17 09:56:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (393, 'admin', '2017-11-17 10:24:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (394, 'admin', '2017-11-17 15:13:42', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (395, 'admin', '2017-11-17 15:20:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (412, 'wrong-user', '2017-11-20 14:45:15', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (413, 'user-jwt-controller-remember-me', '2017-11-20 14:45:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (414, 'user-jwt-controller', '2017-11-20 14:45:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (415, 'wrong-user', '2017-11-20 14:51:43', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (416, 'user-jwt-controller-remember-me', '2017-11-20 14:54:26', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (417, 'wrong-user', '2017-11-20 14:55:18', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (418, 'user-jwt-controller-remember-me', '2017-11-20 14:55:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (419, 'user-jwt-controller', '2017-11-20 14:55:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (420, 'user-jwt-controller', '2017-11-20 14:57:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (421, 'admin', '2017-11-20 15:14:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (426, 'wrong-user', '2017-11-20 17:55:58', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (427, 'user-jwt-controller-remember-me', '2017-11-20 17:56:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (428, 'user-jwt-controller', '2017-11-20 17:56:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (433, 'wrong-user', '2017-11-21 09:16:01', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (434, 'user-jwt-controller-remember-me', '2017-11-21 09:16:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (435, 'user-jwt-controller', '2017-11-21 09:16:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (440, 'wrong-user', '2017-11-21 10:01:08', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (441, 'user-jwt-controller-remember-me', '2017-11-21 10:01:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (442, 'user-jwt-controller', '2017-11-21 10:01:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (447, 'wrong-user', '2017-11-21 11:27:00', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (448, 'user-jwt-controller-remember-me', '2017-11-21 11:27:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (449, 'user-jwt-controller', '2017-11-21 11:27:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (454, 'wrong-user', '2017-11-21 11:37:37', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (455, 'user-jwt-controller-remember-me', '2017-11-21 11:37:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (456, 'user-jwt-controller', '2017-11-21 11:37:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (461, 'wrong-user', '2017-11-21 15:32:06', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (462, 'user-jwt-controller-remember-me', '2017-11-21 15:32:07', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (463, 'user-jwt-controller', '2017-11-21 15:32:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (464, 'wrong-user', '2017-11-21 15:34:48', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (465, 'user-jwt-controller-remember-me', '2017-11-21 15:34:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (466, 'user-jwt-controller', '2017-11-21 15:34:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (467, 'admin', '2017-11-22 11:15:16', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (468, 'wrong-user', '2017-11-22 11:20:15', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (469, 'user-jwt-controller-remember-me', '2017-11-22 11:20:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (470, 'user-jwt-controller', '2017-11-22 11:20:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (475, 'wrong-user', '2017-11-22 16:41:34', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (476, 'user-jwt-controller-remember-me', '2017-11-22 16:41:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (477, 'user-jwt-controller', '2017-11-22 16:41:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (482, 'wrong-user', '2017-11-22 17:06:11', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (483, 'user-jwt-controller-remember-me', '2017-11-22 17:06:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (484, 'user-jwt-controller', '2017-11-22 17:06:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (489, 'wrong-user', '2017-11-23 09:23:45', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (490, 'user-jwt-controller-remember-me', '2017-11-23 09:23:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (491, 'user-jwt-controller', '2017-11-23 09:23:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (492, 'admin', '2017-11-23 11:56:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (493, 'admin', '2017-11-23 12:00:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (494, 'admin', '2017-11-23 12:00:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (495, 'admin', '2017-11-23 13:28:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (496, 'admin', '2017-11-23 13:40:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (497, 'admin', '2017-11-23 13:40:21', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (498, 'admin', '2017-11-23 13:41:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (499, 'admin', '2017-11-23 13:41:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (500, 'admin', '2017-11-23 20:40:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (505, 'wrong-user', '2017-11-23 20:53:16', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (506, 'user-jwt-controller-remember-me', '2017-11-23 20:53:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (507, 'user-jwt-controller', '2017-11-23 20:53:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (508, 'admin', '2018-07-03 15:17:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (509, 'admin', '2018-07-04 09:15:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (510, 'admin', '2018-07-04 09:19:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (511, 'admin', '2018-07-04 09:59:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (512, 'admin', '2018-07-04 11:04:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (513, 'admin', '2018-07-04 12:45:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (514, 'admin', '2018-07-04 12:47:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (515, 'admin', '2018-07-04 14:07:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (520, 'admin', '2018-07-09 14:55:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (521, 'admin', '2018-07-09 16:11:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (522, 'admin', '2018-07-09 21:07:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (523, 'admin', '2018-07-10 09:17:30', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (524, 'admin', '2018-07-10 14:21:16', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (525, 'admin', '2018-07-10 14:21:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (526, 'admin', '2018-07-10 15:23:36', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (527, 'admin', '2018-07-10 15:23:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (528, 'admin', '2018-07-10 16:22:39', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (529, 'admin', '2018-07-10 16:22:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (530, 'admin', '2018-07-10 16:57:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (531, 'admin', '2018-07-10 17:12:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (532, 'admin', '2018-07-11 10:50:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (533, 'admin', '2018-07-11 11:19:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (534, 'admin3', '2018-07-11 11:20:09', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (535, 'admin', '2018-07-11 11:22:30', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (536, 'admin', '2018-07-11 11:41:42', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (537, 'admin', '2018-07-11 14:26:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (538, 'admin', '2018-07-11 15:01:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (539, 'admin', '2018-07-11 17:08:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (540, 'admin', '2018-07-11 17:20:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (541, 'admin', '2018-07-12 14:06:40', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (542, 'admin', '2018-07-12 16:00:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (543, 'admin', '2018-07-12 17:50:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (544, 'admin', '2018-07-16 09:19:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (545, 'admin', '2018-07-16 16:41:59', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (546, 'admin', '2018-07-16 16:43:01', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (547, 'admin', '2018-07-16 16:43:08', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (548, 'admin', '2018-07-16 16:43:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (549, 'admin', '2018-07-16 16:49:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (550, 'admin', '2018-07-16 21:00:41', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (551, 'admin', '2018-07-16 21:00:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (552, 'admin', '2018-07-16 21:25:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (553, 'admin', '2018-07-16 22:20:48', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (554, 'admin', '2018-07-16 22:20:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (555, 'admin', '2018-07-16 22:22:38', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (556, 'admin', '2018-07-16 22:22:54', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (557, 'admin', '2018-07-16 22:22:57', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (558, 'admin', '2018-07-16 22:22:58', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (559, 'admin', '2018-07-16 22:23:00', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (560, 'admin', '2018-07-16 22:23:06', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (561, 'admin', '2018-07-16 22:23:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (562, 'admin', '2018-07-16 22:23:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (563, 'admin', '2018-07-17 09:14:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (564, 'admin', '2018-07-17 10:29:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (565, 'admin', '2018-07-17 13:32:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (566, 'admin', '2018-07-17 13:39:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (567, 'admin', '2018-07-18 16:50:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (568, 'admin', '2018-07-19 16:56:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (569, 'admin', '2018-07-19 16:56:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (570, 'admin', '2018-07-19 16:57:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (571, 'admin', '2018-07-19 16:57:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (572, 'admin', '2018-07-19 16:58:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (573, 'admin', '2018-07-19 17:00:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (574, 'admin', '2018-07-19 17:00:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (575, 'admin', '2018-07-19 17:00:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (576, 'admin', '2018-07-19 17:13:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (577, 'user-jwt-controller-remember-me', '2018-07-24 09:56:50', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (578, 'user-jwt-controller', '2018-07-24 09:56:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (587, 'user-jwt-controller-remember-me', '2018-07-24 09:59:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (588, 'user-jwt-controller', '2018-07-24 09:59:14', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (589, 'admin', '2018-07-30 14:35:30', 'AUTHENTICATION_SUCCESS');

-- ----------------------------
-- Table structure for jhi_persistent_audit_evt_data
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
CREATE TABLE `jhi_persistent_audit_evt_data`  (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`, `name`) USING BTREE,
  INDEX `idx_persistent_audit_evt_data`(`event_id`) USING BTREE,
  CONSTRAINT `jhi_persistent_audit_evt_data_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_persistent_audit_evt_data
-- ----------------------------
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (263, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (263, 'sessionId', '0zrBAPPqGkbQQdESYqHTdrYfAAU43pjuM46Ry2_e');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (353, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (353, 'sessionId', 'j7f07P9P_2_GHLKLQhf1ejLPNezoWxPavZCY_Quz');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (354, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (354, 'sessionId', '5QE6ZqdHVucNJ4QeT_VwDz27_EjYE1euj9_zFOv9');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (355, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (355, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (355, 'sessionId', 'oq4lzod99v2DnCzcbI9LNh_p3rABAwU9DMWfYcg-');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (355, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (356, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (356, 'sessionId', 'oq4lzod99v2DnCzcbI9LNh_p3rABAwU9DMWfYcg-');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (357, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (357, 'sessionId', 'ufyKKWAjADjc0xEtwcWgiKgdVbW-fMTt_v8za6V9');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (358, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (358, 'sessionId', 'uJ17O71x63zQYW1N8YzgGmafLGw0cPUwm-xFfzpk');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (359, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (359, 'sessionId', '9ygjPrEguNsMv5GibktkLaSGFFQvRLtNAd60ahEe');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (360, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (360, 'sessionId', 'b2CT0p7JAYJ3E4Y9SDIXfgLvQ7yOatlm5cNkKezL');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (361, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (361, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (361, 'sessionId', '9dJQl3BdZdlRMt0CSECyEp6gJp-k77TBP6cJqe4s');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (361, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (362, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (362, 'sessionId', '9dJQl3BdZdlRMt0CSECyEp6gJp-k77TBP6cJqe4s');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (363, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (363, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (363, 'sessionId', 'KRYCjUY2Bl9h1gLkyyH7OgBIH0w6YWUjJtGM7I5u');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (363, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (364, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (364, 'sessionId', 'KRYCjUY2Bl9h1gLkyyH7OgBIH0w6YWUjJtGM7I5u');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (365, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (365, 'sessionId', 'rQ71f6JpzINkC71JwDliCEG3mVxeAKIQWPhwYUTt');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (366, 'remoteAddress', '0:0:0:0:0:0:0:1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (366, 'sessionId', 'g2wmixJHPZqmMl4ACLl9L6Edq9WUVwHTN8RP_YsY');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (412, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (412, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (415, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (415, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (417, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (417, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (426, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (426, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (433, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (433, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (440, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (440, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (447, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (447, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (454, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (454, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (461, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (461, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (464, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (464, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (468, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (468, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (475, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (475, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (482, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (482, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (489, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (489, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (505, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (505, 'type', 'org.springframework.security.authentication.BadCredentialsException');

-- ----------------------------
-- Table structure for jhi_persistent_token
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_token`;
CREATE TABLE `jhi_persistent_token`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series_` varchar(76) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `token_value` varchar(76) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token_date` date NULL DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `fk_user_persistent_token`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logging_event
-- ----------------------------
DROP TABLE IF EXISTS `logging_event`;
CREATE TABLE `logging_event`  (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestmp` bigint(20) NOT NULL COMMENT '创建时间',
  `formatted_message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `logger_name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `level_string` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '级别',
  `thread_name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线程',
  `reference_flag` smallint(6) NULL DEFAULT NULL COMMENT '引用标识',
  `arg0` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数0',
  `arg1` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数1',
  `arg2` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数2',
  `arg3` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数3',
  `caller_filename` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作文件',
  `caller_class` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类名',
  `caller_method` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作方法',
  `caller_line` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作行',
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logging_event_exception
-- ----------------------------
DROP TABLE IF EXISTS `logging_event_exception`;
CREATE TABLE `logging_event_exception`  (
  `event_id` bigint(20) NOT NULL,
  `i` smallint(6) NOT NULL,
  `trace_line` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`event_id`, `i`) USING BTREE,
  CONSTRAINT `logging_event_exception_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `logging_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logging_event_property
-- ----------------------------
DROP TABLE IF EXISTS `logging_event_property`;
CREATE TABLE `logging_event_property`  (
  `event_id` bigint(20) NOT NULL,
  `mapped_key` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mapped_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`event_id`, `mapped_key`) USING BTREE,
  CONSTRAINT `logging_event_property_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `logging_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_area_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_area_t`;
CREATE TABLE `sys_area_t`  (
  `id_` int(11) NOT NULL COMMENT '区域id',
  `parent_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级区域节点',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上级区域',
  `name_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `short_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域简称',
  `sort_` int(11) NOT NULL COMMENT '序号',
  `level_` int(11) NULL DEFAULT NULL COMMENT '区域等级(1省/2市/3区县)',
  `code_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  `is_leaf` bit(1) NULL DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modified_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `last_modified_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `description_` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态',
  `version_` int(11) NOT NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_area_t
-- ----------------------------
INSERT INTO `sys_area_t` VALUES (1, '', 0, '全国', NULL, 0, 0, NULL, b'0', NULL, NULL, NULL, NULL, NULL, '0', 0);
INSERT INTO `sys_area_t` VALUES (110000, '1,', 1, '北京市', NULL, 1, 1, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-06-30 15:01:29', NULL, '0', 4);
INSERT INTO `sys_area_t` VALUES (110100, '1,110000,', 110000, '市辖区', '', 0, 2, '', b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', '', '0', 9);
INSERT INTO `sys_area_t` VALUES (110101, '1,110000,110100,', 110100, '东城区', '', 0, 3, '', b'1', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', '', '0', 5);
INSERT INTO `sys_area_t` VALUES (110102, '1,110000,110100,', 110100, '西城区', NULL, 30, 3, NULL, b'1', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 6);
INSERT INTO `sys_area_t` VALUES (110103, '1,110000,110100,', 110100, '崇文区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110104, '1,110000,110100,', 110100, '宣武区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110105, '1,110000,110100,', 110100, '朝阳区', 'ddd', 120, 3, NULL, b'1', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', 'sss', '0', 10);
INSERT INTO `sys_area_t` VALUES (110106, '1,110000,110100,', 110100, '丰台区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110107, '1,110000,110100,', 110100, '石景山区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110108, '1,110000,110100,', 110100, '海淀区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110109, '1,110000,110100,', 110100, '门头沟区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110111, '1,110000,110100,', 110100, '房山区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110112, '1,110000,110100,', 110100, '通州区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110113, '1,110000,110100,', 110100, '顺义区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110114, '1,110000,110100,', 110100, '昌平区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110115, '1,110000,110100,', 110100, '大兴区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110116, '1,110000,110100,', 110100, '怀柔区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110117, '1,110000,110100,', 110100, '平谷区', NULL, 0, 3, NULL, b'0', NULL, '2017-06-30 15:01:29', '1', '2017-11-10 14:03:53', NULL, '0', 5);
INSERT INTO `sys_area_t` VALUES (110200, '1,110000,', 110000, '县', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:01:33', NULL, '0', 2);
INSERT INTO `sys_area_t` VALUES (110228, '1,110000,110200,', 110200, '密云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:01:33', NULL, '0', 2);
INSERT INTO `sys_area_t` VALUES (110229, '1,110000,110200,', 110200, '延庆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:01:33', NULL, '0', 2);
INSERT INTO `sys_area_t` VALUES (120000, '1,', 1, '天津市', NULL, 2, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 2);
INSERT INTO `sys_area_t` VALUES (120100, '1,120000,', 120000, '市辖区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120101, '1,120000,120100,', 120100, '和平区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120102, '1,120000,120100,', 120100, '河东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120103, '1,120000,120100,', 120100, '河西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120104, '1,120000,120100,', 120100, '南开区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120105, '1,120000,120100,', 120100, '河北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120106, '1,120000,120100,', 120100, '红桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120107, '1,120000,120100,', 120100, '塘沽区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120108, '1,120000,120100,', 120100, '汉沽区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120109, '1,120000,120100,', 120100, '大港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120110, '1,120000,120100,', 120100, '东丽区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120111, '1,120000,120100,', 120100, '西青区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120112, '1,120000,120100,', 120100, '津南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120113, '1,120000,120100,', 120100, '北辰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120114, '1,120000,120100,', 120100, '武清区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120115, '1,120000,120100,', 120100, '宝坻区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120200, '1,120000,', 120000, '县', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120221, '1,120000,120200,', 120200, '宁河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120223, '1,120000,120200,', 120200, '静海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (120225, '1,120000,120200,', 120200, '蓟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130000, '1,', 1, '河北省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130100, '1,130000,', 130000, '石家庄市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130101, '1,130000,130100,', 130100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130102, '1,130000,130100,', 130100, '长安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130103, '1,130000,130100,', 130100, '桥东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130104, '1,130000,130100,', 130100, '桥西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130105, '1,130000,130100,', 130100, '新华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130107, '1,130000,130100,', 130100, '井陉矿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130108, '1,130000,130100,', 130100, '裕华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130121, '1,130000,130100,', 130100, '井陉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130123, '1,130000,130100,', 130100, '正定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130124, '1,130000,130100,', 130100, '栾城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130125, '1,130000,130100,', 130100, '行唐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130126, '1,130000,130100,', 130100, '灵寿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130127, '1,130000,130100,', 130100, '高邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130128, '1,130000,130100,', 130100, '深泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130129, '1,130000,130100,', 130100, '赞皇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130130, '1,130000,130100,', 130100, '无极县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130131, '1,130000,130100,', 130100, '平山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130132, '1,130000,130100,', 130100, '元氏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130133, '1,130000,130100,', 130100, '赵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130181, '1,130000,130100,', 130100, '辛集市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130182, '1,130000,130100,', 130100, '藁城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130183, '1,130000,130100,', 130100, '晋州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130184, '1,130000,130100,', 130100, '新乐市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130185, '1,130000,130100,', 130100, '鹿泉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130200, '1,130000,', 130000, '唐山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130201, '1,130000,130200,', 130200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130202, '1,130000,130200,', 130200, '路南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130203, '1,130000,130200,', 130200, '路北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130204, '1,130000,130200,', 130200, '古冶区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130205, '1,130000,130200,', 130200, '开平区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130207, '1,130000,130200,', 130200, '丰南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130208, '1,130000,130200,', 130200, '丰润区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130223, '1,130000,130200,', 130200, '滦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130224, '1,130000,130200,', 130200, '滦南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130225, '1,130000,130200,', 130200, '乐亭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130227, '1,130000,130200,', 130200, '迁西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130229, '1,130000,130200,', 130200, '玉田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130230, '1,130000,130200,', 130200, '唐海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130281, '1,130000,130200,', 130200, '遵化市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130283, '1,130000,130200,', 130200, '迁安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130300, '1,130000,', 130000, '秦皇岛市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130301, '1,130000,130300,', 130300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130302, '1,130000,130300,', 130300, '海港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130303, '1,130000,130300,', 130300, '山海关区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130304, '1,130000,130300,', 130300, '北戴河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130321, '1,130000,130300,', 130300, '青龙满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130322, '1,130000,130300,', 130300, '昌黎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130323, '1,130000,130300,', 130300, '抚宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130324, '1,130000,130300,', 130300, '卢龙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130400, '1,130000,', 130000, '邯郸市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130401, '1,130000,130400,', 130400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130402, '1,130000,130400,', 130400, '邯山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130403, '1,130000,130400,', 130400, '丛台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130404, '1,130000,130400,', 130400, '复兴区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130406, '1,130000,130400,', 130400, '峰峰矿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130421, '1,130000,130400,', 130400, '邯郸县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130423, '1,130000,130400,', 130400, '临漳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130424, '1,130000,130400,', 130400, '成安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130425, '1,130000,130400,', 130400, '大名县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130426, '1,130000,130400,', 130400, '涉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130427, '1,130000,130400,', 130400, '磁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130428, '1,130000,130400,', 130400, '肥乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130429, '1,130000,130400,', 130400, '永年县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130430, '1,130000,130400,', 130400, '邱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130431, '1,130000,130400,', 130400, '鸡泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130432, '1,130000,130400,', 130400, '广平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130433, '1,130000,130400,', 130400, '馆陶县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130434, '1,130000,130400,', 130400, '魏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130435, '1,130000,130400,', 130400, '曲周县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130481, '1,130000,130400,', 130400, '武安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130500, '1,130000,', 130000, '邢台市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130501, '1,130000,130500,', 130500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130502, '1,130000,130500,', 130500, '桥东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130503, '1,130000,130500,', 130500, '桥西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130521, '1,130000,130500,', 130500, '邢台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130522, '1,130000,130500,', 130500, '临城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130523, '1,130000,130500,', 130500, '内丘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130524, '1,130000,130500,', 130500, '柏乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130525, '1,130000,130500,', 130500, '隆尧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130526, '1,130000,130500,', 130500, '任县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130527, '1,130000,130500,', 130500, '南和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130528, '1,130000,130500,', 130500, '宁晋县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130529, '1,130000,130500,', 130500, '巨鹿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130530, '1,130000,130500,', 130500, '新河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130531, '1,130000,130500,', 130500, '广宗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130532, '1,130000,130500,', 130500, '平乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130533, '1,130000,130500,', 130500, '威县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130534, '1,130000,130500,', 130500, '清河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130535, '1,130000,130500,', 130500, '临西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130581, '1,130000,130500,', 130500, '南宫市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130582, '1,130000,130500,', 130500, '沙河市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130600, '1,130000,', 130000, '保定市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130601, '1,130000,130600,', 130600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130602, '1,130000,130600,', 130600, '新市区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130603, '1,130000,130600,', 130600, '北市区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130604, '1,130000,130600,', 130600, '南市区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130621, '1,130000,130600,', 130600, '满城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130622, '1,130000,130600,', 130600, '清苑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130623, '1,130000,130600,', 130600, '涞水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130624, '1,130000,130600,', 130600, '阜平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130625, '1,130000,130600,', 130600, '徐水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130626, '1,130000,130600,', 130600, '定兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130627, '1,130000,130600,', 130600, '唐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130628, '1,130000,130600,', 130600, '高阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130629, '1,130000,130600,', 130600, '容城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130630, '1,130000,130600,', 130600, '涞源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130631, '1,130000,130600,', 130600, '望都县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130632, '1,130000,130600,', 130600, '安新县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130633, '1,130000,130600,', 130600, '易县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130634, '1,130000,130600,', 130600, '曲阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130635, '1,130000,130600,', 130600, '蠡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130636, '1,130000,130600,', 130600, '顺平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130637, '1,130000,130600,', 130600, '博野县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130638, '1,130000,130600,', 130600, '雄县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130681, '1,130000,130600,', 130600, '涿州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130682, '1,130000,130600,', 130600, '定州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130683, '1,130000,130600,', 130600, '安国市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130684, '1,130000,130600,', 130600, '高碑店市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130700, '1,130000,', 130000, '张家口市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130701, '1,130000,130700,', 130700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130702, '1,130000,130700,', 130700, '桥东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130703, '1,130000,130700,', 130700, '桥西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130705, '1,130000,130700,', 130700, '宣化区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130706, '1,130000,130700,', 130700, '下花园区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130721, '1,130000,130700,', 130700, '宣化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130722, '1,130000,130700,', 130700, '张北县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130723, '1,130000,130700,', 130700, '康保县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130724, '1,130000,130700,', 130700, '沽源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130725, '1,130000,130700,', 130700, '尚义县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130726, '1,130000,130700,', 130700, '蔚县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130727, '1,130000,130700,', 130700, '阳原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130728, '1,130000,130700,', 130700, '怀安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130729, '1,130000,130700,', 130700, '万全县', '', 0, 3, '', b'1', NULL, NULL, '1', '2016-12-28 16:37:55', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (130730, '1,130000,130700,', 130700, '怀来县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130731, '1,130000,130700,', 130700, '涿鹿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130732, '1,130000,130700,', 130700, '赤城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130733, '1,130000,130700,', 130700, '崇礼县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130800, '1,130000,', 130000, '承德市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130801, '1,130000,130800,', 130800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130802, '1,130000,130800,', 130800, '双桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130803, '1,130000,130800,', 130800, '双滦区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130804, '1,130000,130800,', 130800, '鹰手营子矿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130821, '1,130000,130800,', 130800, '承德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130822, '1,130000,130800,', 130800, '兴隆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130823, '1,130000,130800,', 130800, '平泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130824, '1,130000,130800,', 130800, '滦平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130825, '1,130000,130800,', 130800, '隆化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130826, '1,130000,130800,', 130800, '丰宁满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130827, '1,130000,130800,', 130800, '宽城满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130828, '1,130000,130800,', 130800, '围场满族蒙古族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130900, '1,130000,', 130000, '沧州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130901, '1,130000,130900,', 130900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130902, '1,130000,130900,', 130900, '新华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130903, '1,130000,130900,', 130900, '运河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130921, '1,130000,130900,', 130900, '沧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130922, '1,130000,130900,', 130900, '青县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130923, '1,130000,130900,', 130900, '东光县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130924, '1,130000,130900,', 130900, '海兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130925, '1,130000,130900,', 130900, '盐山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130926, '1,130000,130900,', 130900, '肃宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130927, '1,130000,130900,', 130900, '南皮县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130928, '1,130000,130900,', 130900, '吴桥县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130929, '1,130000,130900,', 130900, '献县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130930, '1,130000,130900,', 130900, '孟村回族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130981, '1,130000,130900,', 130900, '泊头市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130982, '1,130000,130900,', 130900, '任丘市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130983, '1,130000,130900,', 130900, '黄骅市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (130984, '1,130000,130900,', 130900, '河间市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131000, '1,130000,', 130000, '廊坊市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131001, '1,130000,131000,', 131000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131002, '1,130000,131000,', 131000, '安次区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131003, '1,130000,131000,', 131000, '广阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131022, '1,130000,131000,', 131000, '固安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131023, '1,130000,131000,', 131000, '永清县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131024, '1,130000,131000,', 131000, '香河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131025, '1,130000,131000,', 131000, '大城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131026, '1,130000,131000,', 131000, '文安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131028, '1,130000,131000,', 131000, '大厂回族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131081, '1,130000,131000,', 131000, '霸州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131082, '1,130000,131000,', 131000, '三河市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131100, '1,130000,', 130000, '衡水市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131101, '1,130000,131100,', 131100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131102, '1,130000,131100,', 131100, '桃城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131121, '1,130000,131100,', 131100, '枣强县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131122, '1,130000,131100,', 131100, '武邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131123, '1,130000,131100,', 131100, '武强县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131124, '1,130000,131100,', 131100, '饶阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131125, '1,130000,131100,', 131100, '安平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131126, '1,130000,131100,', 131100, '故城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131127, '1,130000,131100,', 131100, '景县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131128, '1,130000,131100,', 131100, '阜城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131181, '1,130000,131100,', 131100, '冀州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (131182, '1,130000,131100,', 131100, '深州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140000, '1,', 1, '山西省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140100, '1,140000,', 140000, '太原市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140101, '1,140000,140100,', 140100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140105, '1,140000,140100,', 140100, '小店区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140106, '1,140000,140100,', 140100, '迎泽区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140107, '1,140000,140100,', 140100, '杏花岭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140108, '1,140000,140100,', 140100, '尖草坪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140109, '1,140000,140100,', 140100, '万柏林区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140110, '1,140000,140100,', 140100, '晋源区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140121, '1,140000,140100,', 140100, '清徐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140122, '1,140000,140100,', 140100, '阳曲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140123, '1,140000,140100,', 140100, '娄烦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140181, '1,140000,140100,', 140100, '古交市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140200, '1,140000,', 140000, '大同市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140201, '1,140000,140200,', 140200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140202, '1,140000,140200,', 140200, '城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140203, '1,140000,140200,', 140200, '矿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140211, '1,140000,140200,', 140200, '南郊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140212, '1,140000,140200,', 140200, '新荣区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140221, '1,140000,140200,', 140200, '阳高县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140222, '1,140000,140200,', 140200, '天镇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140223, '1,140000,140200,', 140200, '广灵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140224, '1,140000,140200,', 140200, '灵丘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140225, '1,140000,140200,', 140200, '浑源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140226, '1,140000,140200,', 140200, '左云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140227, '1,140000,140200,', 140200, '大同县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140300, '1,140000,', 140000, '阳泉市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140301, '1,140000,140300,', 140300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140302, '1,140000,140300,', 140300, '城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140303, '1,140000,140300,', 140300, '矿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140311, '1,140000,140300,', 140300, '郊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140321, '1,140000,140300,', 140300, '平定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140322, '1,140000,140300,', 140300, '盂县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140400, '1,140000,', 140000, '长治市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140401, '1,140000,140400,', 140400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140402, '1,140000,140400,', 140400, '城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140411, '1,140000,140400,', 140400, '郊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140421, '1,140000,140400,', 140400, '长治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140423, '1,140000,140400,', 140400, '襄垣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140424, '1,140000,140400,', 140400, '屯留县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140425, '1,140000,140400,', 140400, '平顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140426, '1,140000,140400,', 140400, '黎城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140427, '1,140000,140400,', 140400, '壶关县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140428, '1,140000,140400,', 140400, '长子县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140429, '1,140000,140400,', 140400, '武乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140430, '1,140000,140400,', 140400, '沁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140431, '1,140000,140400,', 140400, '沁源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140481, '1,140000,140400,', 140400, '潞城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140500, '1,140000,', 140000, '晋城市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140501, '1,140000,140500,', 140500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140502, '1,140000,140500,', 140500, '城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140521, '1,140000,140500,', 140500, '沁水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140522, '1,140000,140500,', 140500, '阳城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140524, '1,140000,140500,', 140500, '陵川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140525, '1,140000,140500,', 140500, '泽州县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140581, '1,140000,140500,', 140500, '高平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140600, '1,140000,', 140000, '朔州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140601, '1,140000,140600,', 140600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140602, '1,140000,140600,', 140600, '朔城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140603, '1,140000,140600,', 140600, '平鲁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140621, '1,140000,140600,', 140600, '山阴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140622, '1,140000,140600,', 140600, '应县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140623, '1,140000,140600,', 140600, '右玉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140624, '1,140000,140600,', 140600, '怀仁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140700, '1,140000,', 140000, '晋中市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140701, '1,140000,140700,', 140700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140702, '1,140000,140700,', 140700, '榆次区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140721, '1,140000,140700,', 140700, '榆社县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140722, '1,140000,140700,', 140700, '左权县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140723, '1,140000,140700,', 140700, '和顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140724, '1,140000,140700,', 140700, '昔阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140725, '1,140000,140700,', 140700, '寿阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140726, '1,140000,140700,', 140700, '太谷县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140727, '1,140000,140700,', 140700, '祁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140728, '1,140000,140700,', 140700, '平遥县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140729, '1,140000,140700,', 140700, '灵石县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140781, '1,140000,140700,', 140700, '介休市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140800, '1,140000,', 140000, '运城市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140801, '1,140000,140800,', 140800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140802, '1,140000,140800,', 140800, '盐湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140821, '1,140000,140800,', 140800, '临猗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140822, '1,140000,140800,', 140800, '万荣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140823, '1,140000,140800,', 140800, '闻喜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140824, '1,140000,140800,', 140800, '稷山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140825, '1,140000,140800,', 140800, '新绛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140826, '1,140000,140800,', 140800, '绛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140827, '1,140000,140800,', 140800, '垣曲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140828, '1,140000,140800,', 140800, '夏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140829, '1,140000,140800,', 140800, '平陆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140830, '1,140000,140800,', 140800, '芮城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140881, '1,140000,140800,', 140800, '永济市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140882, '1,140000,140800,', 140800, '河津市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140900, '1,140000,', 140000, '忻州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140901, '1,140000,140900,', 140900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140902, '1,140000,140900,', 140900, '忻府区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140921, '1,140000,140900,', 140900, '定襄县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140922, '1,140000,140900,', 140900, '五台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140923, '1,140000,140900,', 140900, '代县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140924, '1,140000,140900,', 140900, '繁峙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140925, '1,140000,140900,', 140900, '宁武县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140926, '1,140000,140900,', 140900, '静乐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140927, '1,140000,140900,', 140900, '神池县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140928, '1,140000,140900,', 140900, '五寨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140929, '1,140000,140900,', 140900, '岢岚县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140930, '1,140000,140900,', 140900, '河曲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140931, '1,140000,140900,', 140900, '保德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140932, '1,140000,140900,', 140900, '偏关县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (140981, '1,140000,140900,', 140900, '原平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141000, '1,140000,', 140000, '临汾市', '', 0, 2, '', b'0', NULL, NULL, '1', '2016-12-28 17:02:00', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (141001, '1,140000,141000,', 141000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141002, '1,140000,141000,', 141000, '尧都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141021, '1,140000,141000,', 141000, '曲沃县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141022, '1,140000,141000,', 141000, '翼城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141023, '1,140000,141000,', 141000, '襄汾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141024, '1,140000,141000,', 141000, '洪洞县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141025, '1,140000,141000,', 141000, '古县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141026, '1,140000,141000,', 141000, '安泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141027, '1,140000,141000,', 141000, '浮山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141028, '1,140000,141000,', 141000, '吉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141029, '1,140000,141000,', 141000, '乡宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141030, '1,140000,141000,', 141000, '大宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141031, '1,140000,141000,', 141000, '隰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141032, '1,140000,141000,', 141000, '永和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141033, '1,140000,141000,', 141000, '蒲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141034, '1,140000,141000,', 141000, '汾西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141081, '1,140000,141000,', 141000, '侯马市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141082, '1,140000,141000,', 141000, '霍州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141100, '1,140000,', 140000, '吕梁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141101, '1,140000,141100,', 141100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141102, '1,140000,141100,', 141100, '离石区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141121, '1,140000,141100,', 141100, '文水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141122, '1,140000,141100,', 141100, '交城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141123, '1,140000,141100,', 141100, '兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141124, '1,140000,141100,', 141100, '临县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141125, '1,140000,141100,', 141100, '柳林县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141126, '1,140000,141100,', 141100, '石楼县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141127, '1,140000,141100,', 141100, '岚县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141128, '1,140000,141100,', 141100, '方山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141129, '1,140000,141100,', 141100, '中阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141130, '1,140000,141100,', 141100, '交口县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141181, '1,140000,141100,', 141100, '孝义市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (141182, '1,140000,141100,', 141100, '汾阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150000, '1,', 1, '内蒙古自治区', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150100, '1,150000,', 150000, '呼和浩特市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150101, '1,150000,150100,', 150100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150102, '1,150000,150100,', 150100, '新城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150103, '1,150000,150100,', 150100, '回民区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150104, '1,150000,150100,', 150100, '玉泉区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150105, '1,150000,150100,', 150100, '赛罕区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150121, '1,150000,150100,', 150100, '土默特左旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150122, '1,150000,150100,', 150100, '托克托县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150123, '1,150000,150100,', 150100, '和林格尔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150124, '1,150000,150100,', 150100, '清水河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150125, '1,150000,150100,', 150100, '武川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150200, '1,150000,', 150000, '包头市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150201, '1,150000,150200,', 150200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150202, '1,150000,150200,', 150200, '东河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150203, '1,150000,150200,', 150200, '昆都仑区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150204, '1,150000,150200,', 150200, '青山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150205, '1,150000,150200,', 150200, '石拐区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150206, '1,150000,150200,', 150200, '白云矿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150207, '1,150000,150200,', 150200, '九原区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150221, '1,150000,150200,', 150200, '土默特右旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150222, '1,150000,150200,', 150200, '固阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150223, '1,150000,150200,', 150200, '达尔罕茂明安联合旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150300, '1,150000,', 150000, '乌海市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150301, '1,150000,150300,', 150300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150302, '1,150000,150300,', 150300, '海勃湾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150303, '1,150000,150300,', 150300, '海南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150304, '1,150000,150300,', 150300, '乌达区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150400, '1,150000,', 150000, '赤峰市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150401, '1,150000,150400,', 150400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150402, '1,150000,150400,', 150400, '红山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150403, '1,150000,150400,', 150400, '元宝山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150404, '1,150000,150400,', 150400, '松山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150421, '1,150000,150400,', 150400, '阿鲁科尔沁旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150422, '1,150000,150400,', 150400, '巴林左旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150423, '1,150000,150400,', 150400, '巴林右旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150424, '1,150000,150400,', 150400, '林西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150425, '1,150000,150400,', 150400, '克什克腾旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150426, '1,150000,150400,', 150400, '翁牛特旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150428, '1,150000,150400,', 150400, '喀喇沁旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150429, '1,150000,150400,', 150400, '宁城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150430, '1,150000,150400,', 150400, '敖汉旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150500, '1,150000,', 150000, '通辽市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150501, '1,150000,150500,', 150500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150502, '1,150000,150500,', 150500, '科尔沁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150521, '1,150000,150500,', 150500, '科尔沁左翼中旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150522, '1,150000,150500,', 150500, '科尔沁左翼后旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150523, '1,150000,150500,', 150500, '开鲁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150524, '1,150000,150500,', 150500, '库伦旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150525, '1,150000,150500,', 150500, '奈曼旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150526, '1,150000,150500,', 150500, '扎鲁特旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150581, '1,150000,150500,', 150500, '霍林郭勒市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150600, '1,150000,', 150000, '鄂尔多斯市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150602, '1,150000,150600,', 150600, '东胜区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150621, '1,150000,150600,', 150600, '达拉特旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150622, '1,150000,150600,', 150600, '准格尔旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150623, '1,150000,150600,', 150600, '鄂托克前旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150624, '1,150000,150600,', 150600, '鄂托克旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150625, '1,150000,150600,', 150600, '杭锦旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150626, '1,150000,150600,', 150600, '乌审旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150627, '1,150000,150600,', 150600, '伊金霍洛旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150700, '1,150000,', 150000, '呼伦贝尔市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150701, '1,150000,150700,', 150700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150702, '1,150000,150700,', 150700, '海拉尔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150721, '1,150000,150700,', 150700, '阿荣旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150722, '1,150000,150700,', 150700, '莫力达瓦达斡尔族自治旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150723, '1,150000,150700,', 150700, '鄂伦春自治旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150724, '1,150000,150700,', 150700, '鄂温克族自治旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150725, '1,150000,150700,', 150700, '陈巴尔虎旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150726, '1,150000,150700,', 150700, '新巴尔虎左旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150727, '1,150000,150700,', 150700, '新巴尔虎右旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150781, '1,150000,150700,', 150700, '满洲里市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150782, '1,150000,150700,', 150700, '牙克石市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150783, '1,150000,150700,', 150700, '扎兰屯市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150784, '1,150000,150700,', 150700, '额尔古纳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150785, '1,150000,150700,', 150700, '根河市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150800, '1,150000,', 150000, '巴彦淖尔市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150801, '1,150000,150800,', 150800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150802, '1,150000,150800,', 150800, '临河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150821, '1,150000,150800,', 150800, '五原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150822, '1,150000,150800,', 150800, '磴口县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150823, '1,150000,150800,', 150800, '乌拉特前旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150824, '1,150000,150800,', 150800, '乌拉特中旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150825, '1,150000,150800,', 150800, '乌拉特后旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150826, '1,150000,150800,', 150800, '杭锦后旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150900, '1,150000,', 150000, '乌兰察布市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150901, '1,150000,150900,', 150900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150902, '1,150000,150900,', 150900, '集宁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150921, '1,150000,150900,', 150900, '卓资县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150922, '1,150000,150900,', 150900, '化德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150923, '1,150000,150900,', 150900, '商都县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150924, '1,150000,150900,', 150900, '兴和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150925, '1,150000,150900,', 150900, '凉城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150926, '1,150000,150900,', 150900, '察哈尔右翼前旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150927, '1,150000,150900,', 150900, '察哈尔右翼中旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150928, '1,150000,150900,', 150900, '察哈尔右翼后旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150929, '1,150000,150900,', 150900, '四子王旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (150981, '1,150000,150900,', 150900, '丰镇市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152200, '1,150000,', 150000, '兴安盟', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152201, '1,150000,152200,', 152200, '乌兰浩特市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152202, '1,150000,152200,', 152200, '阿尔山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152221, '1,150000,152200,', 152200, '科尔沁右翼前旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152222, '1,150000,152200,', 152200, '科尔沁右翼中旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152223, '1,150000,152200,', 152200, '扎赉特旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152224, '1,150000,152200,', 152200, '突泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152500, '1,150000,', 150000, '锡林郭勒盟', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152501, '1,150000,152500,', 152500, '二连浩特市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152502, '1,150000,152500,', 152500, '锡林浩特市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152522, '1,150000,152500,', 152500, '阿巴嘎旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152523, '1,150000,152500,', 152500, '苏尼特左旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152524, '1,150000,152500,', 152500, '苏尼特右旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152525, '1,150000,152500,', 152500, '东乌珠穆沁旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152526, '1,150000,152500,', 152500, '西乌珠穆沁旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152527, '1,150000,152500,', 152500, '太仆寺旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152528, '1,150000,152500,', 152500, '镶黄旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152529, '1,150000,152500,', 152500, '正镶白旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152530, '1,150000,152500,', 152500, '正蓝旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152531, '1,150000,152500,', 152500, '多伦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152900, '1,150000,', 150000, '阿拉善盟', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152921, '1,150000,152900,', 152900, '阿拉善左旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152922, '1,150000,152900,', 152900, '阿拉善右旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (152923, '1,150000,152900,', 152900, '额济纳旗', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210000, '1,', 1, '辽宁省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210100, '1,210000,', 210000, '沈阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210101, '1,210000,210100,', 210100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210102, '1,210000,210100,', 210100, '和平区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210103, '1,210000,210100,', 210100, '沈河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210104, '1,210000,210100,', 210100, '大东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210105, '1,210000,210100,', 210100, '皇姑区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210106, '1,210000,210100,', 210100, '铁西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210111, '1,210000,210100,', 210100, '苏家屯区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210112, '1,210000,210100,', 210100, '东陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210113, '1,210000,210100,', 210100, '沈北新区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210114, '1,210000,210100,', 210100, '于洪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210122, '1,210000,210100,', 210100, '辽中县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210123, '1,210000,210100,', 210100, '康平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210124, '1,210000,210100,', 210100, '法库县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210181, '1,210000,210100,', 210100, '新民市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210200, '1,210000,', 210000, '大连市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210201, '1,210000,210200,', 210200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210202, '1,210000,210200,', 210200, '中山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210203, '1,210000,210200,', 210200, '西岗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210204, '1,210000,210200,', 210200, '沙河口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210211, '1,210000,210200,', 210200, '甘井子区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210212, '1,210000,210200,', 210200, '旅顺口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210213, '1,210000,210200,', 210200, '金州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210224, '1,210000,210200,', 210200, '长海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210281, '1,210000,210200,', 210200, '瓦房店市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210282, '1,210000,210200,', 210200, '普兰店市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210283, '1,210000,210200,', 210200, '庄河市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210300, '1,210000,', 210000, '鞍山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210301, '1,210000,210300,', 210300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210302, '1,210000,210300,', 210300, '铁东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210303, '1,210000,210300,', 210300, '铁西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210304, '1,210000,210300,', 210300, '立山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210311, '1,210000,210300,', 210300, '千山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210321, '1,210000,210300,', 210300, '台安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210323, '1,210000,210300,', 210300, '岫岩满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210381, '1,210000,210300,', 210300, '海城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210400, '1,210000,', 210000, '抚顺市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210401, '1,210000,210400,', 210400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210402, '1,210000,210400,', 210400, '新抚区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210403, '1,210000,210400,', 210400, '东洲区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210404, '1,210000,210400,', 210400, '望花区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210411, '1,210000,210400,', 210400, '顺城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210421, '1,210000,210400,', 210400, '抚顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210422, '1,210000,210400,', 210400, '新宾满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210423, '1,210000,210400,', 210400, '清原满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210500, '1,210000,', 210000, '本溪市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210501, '1,210000,210500,', 210500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210502, '1,210000,210500,', 210500, '平山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210503, '1,210000,210500,', 210500, '溪湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210504, '1,210000,210500,', 210500, '明山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210505, '1,210000,210500,', 210500, '南芬区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210521, '1,210000,210500,', 210500, '本溪满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210522, '1,210000,210500,', 210500, '桓仁满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210600, '1,210000,', 210000, '丹东市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210601, '1,210000,210600,', 210600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210602, '1,210000,210600,', 210600, '元宝区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210603, '1,210000,210600,', 210600, '振兴区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210604, '1,210000,210600,', 210600, '振安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210624, '1,210000,210600,', 210600, '宽甸满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210681, '1,210000,210600,', 210600, '东港市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210682, '1,210000,210600,', 210600, '凤城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210700, '1,210000,', 210000, '锦州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210701, '1,210000,210700,', 210700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210702, '1,210000,210700,', 210700, '古塔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210703, '1,210000,210700,', 210700, '凌河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210711, '1,210000,210700,', 210700, '太和区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210726, '1,210000,210700,', 210700, '黑山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210727, '1,210000,210700,', 210700, '义县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210781, '1,210000,210700,', 210700, '凌海市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210782, '1,210000,210700,', 210700, '北镇市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210800, '1,210000,', 210000, '营口市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210801, '1,210000,210800,', 210800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210802, '1,210000,210800,', 210800, '站前区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210803, '1,210000,210800,', 210800, '西市区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210804, '1,210000,210800,', 210800, '鲅鱼圈区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210811, '1,210000,210800,', 210800, '老边区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210881, '1,210000,210800,', 210800, '盖州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210882, '1,210000,210800,', 210800, '大石桥市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210900, '1,210000,', 210000, '阜新市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210901, '1,210000,210900,', 210900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210902, '1,210000,210900,', 210900, '海州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210903, '1,210000,210900,', 210900, '新邱区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210904, '1,210000,210900,', 210900, '太平区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210905, '1,210000,210900,', 210900, '清河门区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210911, '1,210000,210900,', 210900, '细河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210921, '1,210000,210900,', 210900, '阜新蒙古族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (210922, '1,210000,210900,', 210900, '彰武县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211000, '1,210000,', 210000, '辽阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211001, '1,210000,211000,', 211000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211002, '1,210000,211000,', 211000, '白塔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211003, '1,210000,211000,', 211000, '文圣区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211004, '1,210000,211000,', 211000, '宏伟区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211005, '1,210000,211000,', 211000, '弓长岭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211011, '1,210000,211000,', 211000, '太子河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211021, '1,210000,211000,', 211000, '辽阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211081, '1,210000,211000,', 211000, '灯塔市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211100, '1,210000,', 210000, '盘锦市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211101, '1,210000,211100,', 211100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211102, '1,210000,211100,', 211100, '双台子区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211103, '1,210000,211100,', 211100, '兴隆台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211121, '1,210000,211100,', 211100, '大洼县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211122, '1,210000,211100,', 211100, '盘山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211200, '1,210000,', 210000, '铁岭市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211201, '1,210000,211200,', 211200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211202, '1,210000,211200,', 211200, '银州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211204, '1,210000,211200,', 211200, '清河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211221, '1,210000,211200,', 211200, '铁岭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211223, '1,210000,211200,', 211200, '西丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211224, '1,210000,211200,', 211200, '昌图县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211281, '1,210000,211200,', 211200, '调兵山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211282, '1,210000,211200,', 211200, '开原市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211300, '1,210000,', 210000, '朝阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211301, '1,210000,211300,', 211300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211302, '1,210000,211300,', 211300, '双塔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211303, '1,210000,211300,', 211300, '龙城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211321, '1,210000,211300,', 211300, '朝阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211322, '1,210000,211300,', 211300, '建平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211324, '1,210000,211300,', 211300, '喀喇沁左翼蒙古族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211381, '1,210000,211300,', 211300, '北票市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211382, '1,210000,211300,', 211300, '凌源市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211400, '1,210000,', 210000, '葫芦岛市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211401, '1,210000,211400,', 211400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211402, '1,210000,211400,', 211400, '连山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211403, '1,210000,211400,', 211400, '龙港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211404, '1,210000,211400,', 211400, '南票区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211421, '1,210000,211400,', 211400, '绥中县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211422, '1,210000,211400,', 211400, '建昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (211481, '1,210000,211400,', 211400, '兴城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (213342, '1,110000,', 110000, '11', NULL, 30, 1, NULL, b'0', '1', '2015-08-27 11:30:17', NULL, '2016-12-14 15:01:33', NULL, '-2', 2);
INSERT INTO `sys_area_t` VALUES (220000, '1,', 1, '吉林省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220100, '1,220000,', 220000, '长春市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220101, '1,220000,220100,', 220100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220102, '1,220000,220100,', 220100, '南关区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220103, '1,220000,220100,', 220100, '宽城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220104, '1,220000,220100,', 220100, '朝阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220105, '1,220000,220100,', 220100, '二道区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220106, '1,220000,220100,', 220100, '绿园区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220112, '1,220000,220100,', 220100, '双阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220122, '1,220000,220100,', 220100, '农安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220181, '1,220000,220100,', 220100, '九台市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220182, '1,220000,220100,', 220100, '榆树市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220183, '1,220000,220100,', 220100, '德惠市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220200, '1,220000,', 220000, '吉林市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220201, '1,220000,220200,', 220200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220202, '1,220000,220200,', 220200, '昌邑区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220203, '1,220000,220200,', 220200, '龙潭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220204, '1,220000,220200,', 220200, '船营区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220211, '1,220000,220200,', 220200, '丰满区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220221, '1,220000,220200,', 220200, '永吉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220281, '1,220000,220200,', 220200, '蛟河市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220282, '1,220000,220200,', 220200, '桦甸市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220283, '1,220000,220200,', 220200, '舒兰市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220284, '1,220000,220200,', 220200, '磐石市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220300, '1,220000,', 220000, '四平市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220301, '1,220000,220300,', 220300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220302, '1,220000,220300,', 220300, '铁西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220303, '1,220000,220300,', 220300, '铁东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220322, '1,220000,220300,', 220300, '梨树县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220323, '1,220000,220300,', 220300, '伊通满族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220381, '1,220000,220300,', 220300, '公主岭市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220382, '1,220000,220300,', 220300, '双辽市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220400, '1,220000,', 220000, '辽源市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220401, '1,220000,220400,', 220400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220402, '1,220000,220400,', 220400, '龙山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220403, '1,220000,220400,', 220400, '西安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220421, '1,220000,220400,', 220400, '东丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220422, '1,220000,220400,', 220400, '东辽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220500, '1,220000,', 220000, '通化市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220501, '1,220000,220500,', 220500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220502, '1,220000,220500,', 220500, '东昌区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220503, '1,220000,220500,', 220500, '二道江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220521, '1,220000,220500,', 220500, '通化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220523, '1,220000,220500,', 220500, '辉南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220524, '1,220000,220500,', 220500, '柳河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220581, '1,220000,220500,', 220500, '梅河口市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220582, '1,220000,220500,', 220500, '集安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220600, '1,220000,', 220000, '白山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220601, '1,220000,220600,', 220600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220602, '1,220000,220600,', 220600, '八道江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220604, '1,220000,220600,', 220600, '江源区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220621, '1,220000,220600,', 220600, '抚松县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220622, '1,220000,220600,', 220600, '靖宇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220623, '1,220000,220600,', 220600, '长白朝鲜族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220681, '1,220000,220600,', 220600, '临江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220700, '1,220000,', 220000, '松原市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220701, '1,220000,220700,', 220700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220702, '1,220000,220700,', 220700, '宁江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220721, '1,220000,220700,', 220700, '前郭尔罗斯蒙古族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220722, '1,220000,220700,', 220700, '长岭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220723, '1,220000,220700,', 220700, '乾安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220724, '1,220000,220700,', 220700, '扶余县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220800, '1,220000,', 220000, '白城市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220801, '1,220000,220800,', 220800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220802, '1,220000,220800,', 220800, '洮北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220821, '1,220000,220800,', 220800, '镇赉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220822, '1,220000,220800,', 220800, '通榆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220881, '1,220000,220800,', 220800, '洮南市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (220882, '1,220000,220800,', 220800, '大安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222400, '1,220000,', 220000, '延边朝鲜族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222401, '1,220000,222400,', 222400, '延吉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222402, '1,220000,222400,', 222400, '图们市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222403, '1,220000,222400,', 222400, '敦化市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222404, '1,220000,222400,', 222400, '珲春市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222405, '1,220000,222400,', 222400, '龙井市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222406, '1,220000,222400,', 222400, '和龙市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222424, '1,220000,222400,', 222400, '汪清县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (222426, '1,220000,222400,', 222400, '安图县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230000, '1,', 1, '黑龙江省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230100, '1,230000,', 230000, '哈尔滨市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230101, '1,230000,230100,', 230100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230102, '1,230000,230100,', 230100, '道里区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230103, '1,230000,230100,', 230100, '南岗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230104, '1,230000,230100,', 230100, '道外区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230108, '1,230000,230100,', 230100, '平房区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230109, '1,230000,230100,', 230100, '松北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230110, '1,230000,230100,', 230100, '香坊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230111, '1,230000,230100,', 230100, '呼兰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230112, '1,230000,230100,', 230100, '阿城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230123, '1,230000,230100,', 230100, '依兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230124, '1,230000,230100,', 230100, '方正县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230125, '1,230000,230100,', 230100, '宾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230126, '1,230000,230100,', 230100, '巴彦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230127, '1,230000,230100,', 230100, '木兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230128, '1,230000,230100,', 230100, '通河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230129, '1,230000,230100,', 230100, '延寿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230182, '1,230000,230100,', 230100, '双城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230183, '1,230000,230100,', 230100, '尚志市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230184, '1,230000,230100,', 230100, '五常市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230200, '1,230000,', 230000, '齐齐哈尔市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230201, '1,230000,230200,', 230200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230202, '1,230000,230200,', 230200, '龙沙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230203, '1,230000,230200,', 230200, '建华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230204, '1,230000,230200,', 230200, '铁锋区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230205, '1,230000,230200,', 230200, '昂昂溪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230206, '1,230000,230200,', 230200, '富拉尔基区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230207, '1,230000,230200,', 230200, '碾子山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230208, '1,230000,230200,', 230200, '梅里斯达斡尔族区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230221, '1,230000,230200,', 230200, '龙江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230223, '1,230000,230200,', 230200, '依安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230224, '1,230000,230200,', 230200, '泰来县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230225, '1,230000,230200,', 230200, '甘南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230227, '1,230000,230200,', 230200, '富裕县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230229, '1,230000,230200,', 230200, '克山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230230, '1,230000,230200,', 230200, '克东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230231, '1,230000,230200,', 230200, '拜泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230281, '1,230000,230200,', 230200, '讷河市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230300, '1,230000,', 230000, '鸡西市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230301, '1,230000,230300,', 230300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230302, '1,230000,230300,', 230300, '鸡冠区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230303, '1,230000,230300,', 230300, '恒山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230304, '1,230000,230300,', 230300, '滴道区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230305, '1,230000,230300,', 230300, '梨树区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230306, '1,230000,230300,', 230300, '城子河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230307, '1,230000,230300,', 230300, '麻山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230321, '1,230000,230300,', 230300, '鸡东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230381, '1,230000,230300,', 230300, '虎林市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230382, '1,230000,230300,', 230300, '密山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230400, '1,230000,', 230000, '鹤岗市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230401, '1,230000,230400,', 230400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230402, '1,230000,230400,', 230400, '向阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230403, '1,230000,230400,', 230400, '工农区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230404, '1,230000,230400,', 230400, '南山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230405, '1,230000,230400,', 230400, '兴安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230406, '1,230000,230400,', 230400, '东山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230407, '1,230000,230400,', 230400, '兴山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230421, '1,230000,230400,', 230400, '萝北县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230422, '1,230000,230400,', 230400, '绥滨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230500, '1,230000,', 230000, '双鸭山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230501, '1,230000,230500,', 230500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230502, '1,230000,230500,', 230500, '尖山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230503, '1,230000,230500,', 230500, '岭东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230505, '1,230000,230500,', 230500, '四方台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230506, '1,230000,230500,', 230500, '宝山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230521, '1,230000,230500,', 230500, '集贤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230522, '1,230000,230500,', 230500, '友谊县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230523, '1,230000,230500,', 230500, '宝清县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230524, '1,230000,230500,', 230500, '饶河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230600, '1,230000,', 230000, '大庆市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230601, '1,230000,230600,', 230600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230602, '1,230000,230600,', 230600, '萨尔图区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230603, '1,230000,230600,', 230600, '龙凤区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230604, '1,230000,230600,', 230600, '让胡路区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230605, '1,230000,230600,', 230600, '红岗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230606, '1,230000,230600,', 230600, '大同区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230621, '1,230000,230600,', 230600, '肇州县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230622, '1,230000,230600,', 230600, '肇源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230623, '1,230000,230600,', 230600, '林甸县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230624, '1,230000,230600,', 230600, '杜尔伯特蒙古族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230700, '1,230000,', 230000, '伊春市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230701, '1,230000,230700,', 230700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230702, '1,230000,230700,', 230700, '伊春区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230703, '1,230000,230700,', 230700, '南岔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230704, '1,230000,230700,', 230700, '友好区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230705, '1,230000,230700,', 230700, '西林区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230706, '1,230000,230700,', 230700, '翠峦区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230707, '1,230000,230700,', 230700, '新青区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230708, '1,230000,230700,', 230700, '美溪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230709, '1,230000,230700,', 230700, '金山屯区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230710, '1,230000,230700,', 230700, '五营区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230711, '1,230000,230700,', 230700, '乌马河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230712, '1,230000,230700,', 230700, '汤旺河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230713, '1,230000,230700,', 230700, '带岭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230714, '1,230000,230700,', 230700, '乌伊岭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230715, '1,230000,230700,', 230700, '红星区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230716, '1,230000,230700,', 230700, '上甘岭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230722, '1,230000,230700,', 230700, '嘉荫县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230781, '1,230000,230700,', 230700, '铁力市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230800, '1,230000,', 230000, '佳木斯市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230801, '1,230000,230800,', 230800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230803, '1,230000,230800,', 230800, '向阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230804, '1,230000,230800,', 230800, '前进区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230805, '1,230000,230800,', 230800, '东风区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230811, '1,230000,230800,', 230800, '郊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230822, '1,230000,230800,', 230800, '桦南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230826, '1,230000,230800,', 230800, '桦川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:58:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230828, '1,230000,230800,', 230800, '汤原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230833, '1,230000,230800,', 230800, '抚远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230881, '1,230000,230800,', 230800, '同江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230882, '1,230000,230800,', 230800, '富锦市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230900, '1,230000,', 230000, '七台河市', '', 30, 2, '', b'0', NULL, NULL, '1', '2016-12-28 17:24:52', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (230901, '1,230000,230900,', 230900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230902, '1,230000,230900,', 230900, '新兴区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230903, '1,230000,230900,', 230900, '桃山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230904, '1,230000,230900,', 230900, '茄子河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (230921, '1,230000,230900,', 230900, '勃利县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231000, '1,230000,', 230000, '牡丹江市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231001, '1,230000,231000,', 231000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231002, '1,230000,231000,', 231000, '东安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231003, '1,230000,231000,', 231000, '阳明区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231004, '1,230000,231000,', 231000, '爱民区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231005, '1,230000,231000,', 231000, '西安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231024, '1,230000,231000,', 231000, '东宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231025, '1,230000,231000,', 231000, '林口县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231081, '1,230000,231000,', 231000, '绥芬河市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231083, '1,230000,231000,', 231000, '海林市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231084, '1,230000,231000,', 231000, '宁安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231085, '1,230000,231000,', 231000, '穆棱市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231100, '1,230000,', 230000, '黑河市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231101, '1,230000,231100,', 231100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231102, '1,230000,231100,', 231100, '爱辉区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231121, '1,230000,231100,', 231100, '嫩江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231123, '1,230000,231100,', 231100, '逊克县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231124, '1,230000,231100,', 231100, '孙吴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231181, '1,230000,231100,', 231100, '北安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231182, '1,230000,231100,', 231100, '五大连池市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231200, '1,230000,', 230000, '绥化市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231201, '1,230000,231200,', 231200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231202, '1,230000,231200,', 231200, '北林区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231221, '1,230000,231200,', 231200, '望奎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231222, '1,230000,231200,', 231200, '兰西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231223, '1,230000,231200,', 231200, '青冈县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231224, '1,230000,231200,', 231200, '庆安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231225, '1,230000,231200,', 231200, '明水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231226, '1,230000,231200,', 231200, '绥棱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231281, '1,230000,231200,', 231200, '安达市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231282, '1,230000,231200,', 231200, '肇东市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (231283, '1,230000,231200,', 231200, '海伦市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232700, '1,230000,', 230000, '大兴安岭地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232701, '1,230000,232700,', 232700, '加格达奇区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232702, '1,230000,232700,', 232700, '松岭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232703, '1,230000,232700,', 232700, '新林区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232704, '1,230000,232700,', 232700, '呼中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232721, '1,230000,232700,', 232700, '呼玛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232722, '1,230000,232700,', 232700, '塔河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (232723, '1,230000,232700,', 232700, '漠河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310000, '1,', 1, '上海市', '', 0, 1, '', b'0', NULL, NULL, '1', '2016-12-28 15:20:49', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (310100, '1,310000,', 310000, '市辖区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310101, '1,310000,310100,', 310100, '黄浦区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310103, '1,310000,310100,', 310100, '卢湾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310104, '1,310000,310100,', 310100, '徐汇区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310105, '1,310000,310100,', 310100, '长宁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310106, '1,310000,310100,', 310100, '静安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310107, '1,310000,310100,', 310100, '普陀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310108, '1,310000,310100,', 310100, '闸北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310109, '1,310000,310100,', 310100, '虹口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310110, '1,310000,310100,', 310100, '杨浦区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310112, '1,310000,310100,', 310100, '闵行区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310113, '1,310000,310100,', 310100, '宝山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310114, '1,310000,310100,', 310100, '嘉定区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310115, '1,310000,310100,', 310100, '浦东新区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310116, '1,310000,310100,', 310100, '金山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310117, '1,310000,310100,', 310100, '松江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310118, '1,310000,310100,', 310100, '青浦区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310119, '1,310000,310100,', 310100, '南汇区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310120, '1,310000,310100,', 310100, '奉贤区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310200, '1,310000,', 310000, '县', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (310230, '1,310000,310200,', 310200, '崇明县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320000, '1,', 1, '江苏省', NULL, 0, 1, NULL, b'0', NULL, NULL, '1', '2016-12-28 12:30:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320100, '1,320000,', 320000, '南京市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320101, '1,320000,320100,', 320100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320102, '1,320000,320100,', 320100, '玄武区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320103, '1,320000,320100,', 320100, '白下区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320104, '1,320000,320100,', 320100, '秦淮区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320105, '1,320000,320100,', 320100, '建邺区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320106, '1,320000,320100,', 320100, '鼓楼区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320107, '1,320000,320100,', 320100, '下关区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320111, '1,320000,320100,', 320100, '浦口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320113, '1,320000,320100,', 320100, '栖霞区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320114, '1,320000,320100,', 320100, '雨花台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320115, '1,320000,320100,', 320100, '江宁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320116, '1,320000,320100,', 320100, '六合区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320124, '1,320000,320100,', 320100, '溧水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320125, '1,320000,320100,', 320100, '高淳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320200, '1,320000,', 320000, '无锡市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320201, '1,320000,320200,', 320200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320202, '1,320000,320200,', 320200, '崇安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320203, '1,320000,320200,', 320200, '南长区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320204, '1,320000,320200,', 320200, '北塘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320205, '1,320000,320200,', 320200, '锡山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320206, '1,320000,320200,', 320200, '惠山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320211, '1,320000,320200,', 320200, '滨湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320281, '1,320000,320200,', 320200, '江阴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320282, '1,320000,320200,', 320200, '宜兴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320300, '1,320000,', 320000, '徐州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320301, '1,320000,320300,', 320300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320302, '1,320000,320300,', 320300, '鼓楼区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320303, '1,320000,320300,', 320300, '云龙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320304, '1,320000,320300,', 320300, '九里区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320305, '1,320000,320300,', 320300, '贾汪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320311, '1,320000,320300,', 320300, '泉山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320321, '1,320000,320300,', 320300, '丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320322, '1,320000,320300,', 320300, '沛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320323, '1,320000,320300,', 320300, '铜山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320324, '1,320000,320300,', 320300, '睢宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320381, '1,320000,320300,', 320300, '新沂市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320382, '1,320000,320300,', 320300, '邳州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320400, '1,320000,', 320000, '常州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320401, '1,320000,320400,', 320400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320402, '1,320000,320400,', 320400, '天宁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320404, '1,320000,320400,', 320400, '钟楼区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320405, '1,320000,320400,', 320400, '戚墅堰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320411, '1,320000,320400,', 320400, '新北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320412, '1,320000,320400,', 320400, '武进区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320481, '1,320000,320400,', 320400, '溧阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320482, '1,320000,320400,', 320400, '金坛市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320500, '1,320000,', 320000, '苏州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320501, '1,320000,320500,', 320500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320502, '1,320000,320500,', 320500, '沧浪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320503, '1,320000,320500,', 320500, '平江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320504, '1,320000,320500,', 320500, '金阊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320505, '1,320000,320500,', 320500, '虎丘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320506, '1,320000,320500,', 320500, '吴中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320507, '1,320000,320500,', 320500, '相城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320581, '1,320000,320500,', 320500, '常熟市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320582, '1,320000,320500,', 320500, '张家港市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320583, '1,320000,320500,', 320500, '昆山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320584, '1,320000,320500,', 320500, '吴江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320585, '1,320000,320500,', 320500, '太仓市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320600, '1,320000,', 320000, '南通市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320601, '1,320000,320600,', 320600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320602, '1,320000,320600,', 320600, '崇川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320611, '1,320000,320600,', 320600, '港闸区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320621, '1,320000,320600,', 320600, '海安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320623, '1,320000,320600,', 320600, '如东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320681, '1,320000,320600,', 320600, '启东市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320682, '1,320000,320600,', 320600, '如皋市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320683, '1,320000,320600,', 320600, '通州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320684, '1,320000,320600,', 320600, '海门市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320700, '1,320000,', 320000, '连云港市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320701, '1,320000,320700,', 320700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320703, '1,320000,320700,', 320700, '连云区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320705, '1,320000,320700,', 320700, '新浦区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320706, '1,320000,320700,', 320700, '海州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320721, '1,320000,320700,', 320700, '赣榆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320722, '1,320000,320700,', 320700, '东海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320723, '1,320000,320700,', 320700, '灌云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320724, '1,320000,320700,', 320700, '灌南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320800, '1,320000,', 320000, '淮安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320801, '1,320000,320800,', 320800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320802, '1,320000,320800,', 320800, '清河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320803, '1,320000,320800,', 320800, '楚州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320804, '1,320000,320800,', 320800, '淮阴区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320811, '1,320000,320800,', 320800, '清浦区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320826, '1,320000,320800,', 320800, '涟水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320829, '1,320000,320800,', 320800, '洪泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320830, '1,320000,320800,', 320800, '盱眙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320831, '1,320000,320800,', 320800, '金湖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320900, '1,320000,', 320000, '盐城市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320901, '1,320000,320900,', 320900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320902, '1,320000,320900,', 320900, '亭湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320903, '1,320000,320900,', 320900, '盐都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320921, '1,320000,320900,', 320900, '响水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320922, '1,320000,320900,', 320900, '滨海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320923, '1,320000,320900,', 320900, '阜宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320924, '1,320000,320900,', 320900, '射阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320925, '1,320000,320900,', 320900, '建湖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320981, '1,320000,320900,', 320900, '东台市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (320982, '1,320000,320900,', 320900, '大丰市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321000, '1,320000,', 320000, '扬州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321001, '1,320000,321000,', 321000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321002, '1,320000,321000,', 321000, '广陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321003, '1,320000,321000,', 321000, '邗江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321011, '1,320000,321000,', 321000, '维扬区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321023, '1,320000,321000,', 321000, '宝应县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321081, '1,320000,321000,', 321000, '仪征市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321084, '1,320000,321000,', 321000, '高邮市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321088, '1,320000,321000,', 321000, '江都市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321100, '1,320000,', 320000, '镇江市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321101, '1,320000,321100,', 321100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321102, '1,320000,321100,', 321100, '京口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321111, '1,320000,321100,', 321100, '润州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321112, '1,320000,321100,', 321100, '丹徒区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321181, '1,320000,321100,', 321100, '丹阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321182, '1,320000,321100,', 321100, '扬中市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321183, '1,320000,321100,', 321100, '句容市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321200, '1,320000,', 320000, '泰州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321201, '1,320000,321200,', 321200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321202, '1,320000,321200,', 321200, '海陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321203, '1,320000,321200,', 321200, '高港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321281, '1,320000,321200,', 321200, '兴化市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321282, '1,320000,321200,', 321200, '靖江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321283, '1,320000,321200,', 321200, '泰兴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321284, '1,320000,321200,', 321200, '姜堰市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321300, '1,320000,', 320000, '宿迁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321301, '1,320000,321300,', 321300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321302, '1,320000,321300,', 321300, '宿城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321311, '1,320000,321300,', 321300, '宿豫区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321322, '1,320000,321300,', 321300, '沭阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321323, '1,320000,321300,', 321300, '泗阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (321324, '1,320000,321300,', 321300, '泗洪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330000, '1,', 1, '浙江省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330100, '1,330000,', 330000, '杭州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330101, '1,330000,330100,', 330100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330102, '1,330000,330100,', 330100, '上城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330103, '1,330000,330100,', 330100, '下城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330104, '1,330000,330100,', 330100, '江干区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330105, '1,330000,330100,', 330100, '拱墅区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330106, '1,330000,330100,', 330100, '西湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330108, '1,330000,330100,', 330100, '滨江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330109, '1,330000,330100,', 330100, '萧山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330110, '1,330000,330100,', 330100, '余杭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330122, '1,330000,330100,', 330100, '桐庐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330127, '1,330000,330100,', 330100, '淳安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330182, '1,330000,330100,', 330100, '建德市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330183, '1,330000,330100,', 330100, '富阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330185, '1,330000,330100,', 330100, '临安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330200, '1,330000,', 330000, '宁波市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330201, '1,330000,330200,', 330200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330203, '1,330000,330200,', 330200, '海曙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330204, '1,330000,330200,', 330200, '江东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330205, '1,330000,330200,', 330200, '江北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330206, '1,330000,330200,', 330200, '北仑区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330211, '1,330000,330200,', 330200, '镇海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330212, '1,330000,330200,', 330200, '鄞州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330225, '1,330000,330200,', 330200, '象山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330226, '1,330000,330200,', 330200, '宁海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330281, '1,330000,330200,', 330200, '余姚市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330282, '1,330000,330200,', 330200, '慈溪市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330283, '1,330000,330200,', 330200, '奉化市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330300, '1,330000,', 330000, '温州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330301, '1,330000,330300,', 330300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330302, '1,330000,330300,', 330300, '鹿城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330303, '1,330000,330300,', 330300, '龙湾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330304, '1,330000,330300,', 330300, '瓯海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330322, '1,330000,330300,', 330300, '洞头县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330324, '1,330000,330300,', 330300, '永嘉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330326, '1,330000,330300,', 330300, '平阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330327, '1,330000,330300,', 330300, '苍南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330328, '1,330000,330300,', 330300, '文成县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330329, '1,330000,330300,', 330300, '泰顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330381, '1,330000,330300,', 330300, '瑞安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330382, '1,330000,330300,', 330300, '乐清市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330400, '1,330000,', 330000, '嘉兴市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330401, '1,330000,330400,', 330400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330402, '1,330000,330400,', 330400, '秀城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330411, '1,330000,330400,', 330400, '秀洲区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330421, '1,330000,330400,', 330400, '嘉善县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330424, '1,330000,330400,', 330400, '海盐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330481, '1,330000,330400,', 330400, '海宁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330482, '1,330000,330400,', 330400, '平湖市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330483, '1,330000,330400,', 330400, '桐乡市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330500, '1,330000,', 330000, '湖州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330501, '1,330000,330500,', 330500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330502, '1,330000,330500,', 330500, '吴兴区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330503, '1,330000,330500,', 330500, '南浔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330521, '1,330000,330500,', 330500, '德清县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330522, '1,330000,330500,', 330500, '长兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330523, '1,330000,330500,', 330500, '安吉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330600, '1,330000,', 330000, '绍兴市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330601, '1,330000,330600,', 330600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330602, '1,330000,330600,', 330600, '越城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330621, '1,330000,330600,', 330600, '绍兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330624, '1,330000,330600,', 330600, '新昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330681, '1,330000,330600,', 330600, '诸暨市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330682, '1,330000,330600,', 330600, '上虞市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330683, '1,330000,330600,', 330600, '嵊州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330700, '1,330000,', 330000, '金华市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330701, '1,330000,330700,', 330700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330702, '1,330000,330700,', 330700, '婺城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330703, '1,330000,330700,', 330700, '金东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330723, '1,330000,330700,', 330700, '武义县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330726, '1,330000,330700,', 330700, '浦江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330727, '1,330000,330700,', 330700, '磐安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330781, '1,330000,330700,', 330700, '兰溪市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330782, '1,330000,330700,', 330700, '义乌市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330783, '1,330000,330700,', 330700, '东阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330784, '1,330000,330700,', 330700, '永康市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330800, '1,330000,', 330000, '衢州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330801, '1,330000,330800,', 330800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330802, '1,330000,330800,', 330800, '柯城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330803, '1,330000,330800,', 330800, '衢江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330822, '1,330000,330800,', 330800, '常山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330824, '1,330000,330800,', 330800, '开化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330825, '1,330000,330800,', 330800, '龙游县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330881, '1,330000,330800,', 330800, '江山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330900, '1,330000,', 330000, '舟山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330901, '1,330000,330900,', 330900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330902, '1,330000,330900,', 330900, '定海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330903, '1,330000,330900,', 330900, '普陀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330921, '1,330000,330900,', 330900, '岱山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (330922, '1,330000,330900,', 330900, '嵊泗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331000, '1,330000,', 330000, '台州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331001, '1,330000,331000,', 331000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331002, '1,330000,331000,', 331000, '椒江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331003, '1,330000,331000,', 331000, '黄岩区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331004, '1,330000,331000,', 331000, '路桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331021, '1,330000,331000,', 331000, '玉环县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331022, '1,330000,331000,', 331000, '三门县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331023, '1,330000,331000,', 331000, '天台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331024, '1,330000,331000,', 331000, '仙居县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331081, '1,330000,331000,', 331000, '温岭市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331082, '1,330000,331000,', 331000, '临海市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331100, '1,330000,', 330000, '丽水市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331101, '1,330000,331100,', 331100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331102, '1,330000,331100,', 331100, '莲都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331121, '1,330000,331100,', 331100, '青田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331122, '1,330000,331100,', 331100, '缙云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331123, '1,330000,331100,', 331100, '遂昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331124, '1,330000,331100,', 331100, '松阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331125, '1,330000,331100,', 331100, '云和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331126, '1,330000,331100,', 331100, '庆元县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331127, '1,330000,331100,', 331100, '景宁畲族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (331181, '1,330000,331100,', 331100, '龙泉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340000, '1,', 1, '安徽省', NULL, 0, 1, NULL, b'0', NULL, NULL, '1', '2016-12-28 12:24:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340100, '1,340000,', 340000, '合肥市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340101, '1,340000,340100,', 340100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340102, '1,340000,340100,', 340100, '瑶海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340103, '1,340000,340100,', 340100, '庐阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340104, '1,340000,340100,', 340100, '蜀山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340111, '1,340000,340100,', 340100, '包河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340121, '1,340000,340100,', 340100, '长丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340122, '1,340000,340100,', 340100, '肥东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340123, '1,340000,340100,', 340100, '肥西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340200, '1,340000,', 340000, '芜湖市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340201, '1,340000,340200,', 340200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340202, '1,340000,340200,', 340200, '镜湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340203, '1,340000,340200,', 340200, '弋江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340207, '1,340000,340200,', 340200, '鸠江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340208, '1,340000,340200,', 340200, '三山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340221, '1,340000,340200,', 340200, '芜湖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340222, '1,340000,340200,', 340200, '繁昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340223, '1,340000,340200,', 340200, '南陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340300, '1,340000,', 340000, '蚌埠市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340301, '1,340000,340300,', 340300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340302, '1,340000,340300,', 340300, '龙子湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340303, '1,340000,340300,', 340300, '蚌山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340304, '1,340000,340300,', 340300, '禹会区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340311, '1,340000,340300,', 340300, '淮上区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340321, '1,340000,340300,', 340300, '怀远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340322, '1,340000,340300,', 340300, '五河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340323, '1,340000,340300,', 340300, '固镇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340400, '1,340000,', 340000, '淮南市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340401, '1,340000,340400,', 340400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340402, '1,340000,340400,', 340400, '大通区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340403, '1,340000,340400,', 340400, '田家庵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340404, '1,340000,340400,', 340400, '谢家集区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340405, '1,340000,340400,', 340400, '八公山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340406, '1,340000,340400,', 340400, '潘集区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340421, '1,340000,340400,', 340400, '凤台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340500, '1,340000,', 340000, '马鞍山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340501, '1,340000,340500,', 340500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340502, '1,340000,340500,', 340500, '金家庄区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340503, '1,340000,340500,', 340500, '花山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340504, '1,340000,340500,', 340500, '雨山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340521, '1,340000,340500,', 340500, '当涂县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340600, '1,340000,', 340000, '淮北市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340601, '1,340000,340600,', 340600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340602, '1,340000,340600,', 340600, '杜集区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340603, '1,340000,340600,', 340600, '相山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340604, '1,340000,340600,', 340600, '烈山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340621, '1,340000,340600,', 340600, '濉溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340700, '1,340000,', 340000, '铜陵市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340701, '1,340000,340700,', 340700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340702, '1,340000,340700,', 340700, '铜官山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340703, '1,340000,340700,', 340700, '狮子山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340711, '1,340000,340700,', 340700, '郊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340721, '1,340000,340700,', 340700, '铜陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340800, '1,340000,', 340000, '安庆市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340801, '1,340000,340800,', 340800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340802, '1,340000,340800,', 340800, '迎江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340803, '1,340000,340800,', 340800, '大观区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340811, '1,340000,340800,', 340800, '宜秀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340822, '1,340000,340800,', 340800, '怀宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340823, '1,340000,340800,', 340800, '枞阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340824, '1,340000,340800,', 340800, '潜山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340825, '1,340000,340800,', 340800, '太湖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340826, '1,340000,340800,', 340800, '宿松县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340827, '1,340000,340800,', 340800, '望江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340828, '1,340000,340800,', 340800, '岳西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (340881, '1,340000,340800,', 340800, '桐城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341000, '1,340000,', 340000, '黄山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341001, '1,340000,341000,', 341000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341002, '1,340000,341000,', 341000, '屯溪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341003, '1,340000,341000,', 341000, '黄山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341004, '1,340000,341000,', 341000, '徽州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341021, '1,340000,341000,', 341000, '歙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341022, '1,340000,341000,', 341000, '休宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341023, '1,340000,341000,', 341000, '黟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341024, '1,340000,341000,', 341000, '祁门县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341100, '1,340000,', 340000, '滁州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341101, '1,340000,341100,', 341100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341102, '1,340000,341100,', 341100, '琅琊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341103, '1,340000,341100,', 341100, '南谯区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341122, '1,340000,341100,', 341100, '来安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341124, '1,340000,341100,', 341100, '全椒县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341125, '1,340000,341100,', 341100, '定远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341126, '1,340000,341100,', 341100, '凤阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341181, '1,340000,341100,', 341100, '天长市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341182, '1,340000,341100,', 341100, '明光市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341200, '1,340000,', 340000, '阜阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341201, '1,340000,341200,', 341200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341202, '1,340000,341200,', 341200, '颍州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341203, '1,340000,341200,', 341200, '颍东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341204, '1,340000,341200,', 341200, '颍泉区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341221, '1,340000,341200,', 341200, '临泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341222, '1,340000,341200,', 341200, '太和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341225, '1,340000,341200,', 341200, '阜南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341226, '1,340000,341200,', 341200, '颍上县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341282, '1,340000,341200,', 341200, '界首市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341300, '1,340000,', 340000, '宿州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341301, '1,340000,341300,', 341300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341302, '1,340000,341300,', 341300, '埇桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341321, '1,340000,341300,', 341300, '砀山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341322, '1,340000,341300,', 341300, '萧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341323, '1,340000,341300,', 341300, '灵璧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341324, '1,340000,341300,', 341300, '泗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341400, '1,340000,', 340000, '巢湖市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341401, '1,340000,341400,', 341400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341402, '1,340000,341400,', 341400, '居巢区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341421, '1,340000,341400,', 341400, '庐江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341422, '1,340000,341400,', 341400, '无为县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341423, '1,340000,341400,', 341400, '含山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341424, '1,340000,341400,', 341400, '和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341500, '1,340000,', 340000, '六安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341501, '1,340000,341500,', 341500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341502, '1,340000,341500,', 341500, '金安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341503, '1,340000,341500,', 341500, '裕安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341521, '1,340000,341500,', 341500, '寿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341522, '1,340000,341500,', 341500, '霍邱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341523, '1,340000,341500,', 341500, '舒城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341524, '1,340000,341500,', 341500, '金寨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341525, '1,340000,341500,', 341500, '霍山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341600, '1,340000,', 340000, '亳州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341601, '1,340000,341600,', 341600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341602, '1,340000,341600,', 341600, '谯城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341621, '1,340000,341600,', 341600, '涡阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341622, '1,340000,341600,', 341600, '蒙城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341623, '1,340000,341600,', 341600, '利辛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341700, '1,340000,', 340000, '池州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341701, '1,340000,341700,', 341700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341702, '1,340000,341700,', 341700, '贵池区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341721, '1,340000,341700,', 341700, '东至县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341722, '1,340000,341700,', 341700, '石台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341723, '1,340000,341700,', 341700, '青阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341800, '1,340000,', 340000, '宣城市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341801, '1,340000,341800,', 341800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341802, '1,340000,341800,', 341800, '宣州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341821, '1,340000,341800,', 341800, '郎溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341822, '1,340000,341800,', 341800, '广德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341823, '1,340000,341800,', 341800, '泾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341824, '1,340000,341800,', 341800, '绩溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341825, '1,340000,341800,', 341800, '旌德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (341881, '1,340000,341800,', 341800, '宁国市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350000, '1,', 1, '福建省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350100, '1,350000,', 350000, '福州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350101, '1,350000,350100,', 350100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350102, '1,350000,350100,', 350100, '鼓楼区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350103, '1,350000,350100,', 350100, '台江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350104, '1,350000,350100,', 350100, '仓山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350105, '1,350000,350100,', 350100, '马尾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350111, '1,350000,350100,', 350100, '晋安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350121, '1,350000,350100,', 350100, '闽侯县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350122, '1,350000,350100,', 350100, '连江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350123, '1,350000,350100,', 350100, '罗源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350124, '1,350000,350100,', 350100, '闽清县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350125, '1,350000,350100,', 350100, '永泰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350128, '1,350000,350100,', 350100, '平潭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350181, '1,350000,350100,', 350100, '福清市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350182, '1,350000,350100,', 350100, '长乐市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350200, '1,350000,', 350000, '厦门市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350201, '1,350000,350200,', 350200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350203, '1,350000,350200,', 350200, '思明区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350205, '1,350000,350200,', 350200, '海沧区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350206, '1,350000,350200,', 350200, '湖里区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350211, '1,350000,350200,', 350200, '集美区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350212, '1,350000,350200,', 350200, '同安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350213, '1,350000,350200,', 350200, '翔安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350300, '1,350000,', 350000, '莆田市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350301, '1,350000,350300,', 350300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350302, '1,350000,350300,', 350300, '城厢区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350303, '1,350000,350300,', 350300, '涵江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350304, '1,350000,350300,', 350300, '荔城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350305, '1,350000,350300,', 350300, '秀屿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350322, '1,350000,350300,', 350300, '仙游县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350400, '1,350000,', 350000, '三明市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350401, '1,350000,350400,', 350400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350402, '1,350000,350400,', 350400, '梅列区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350403, '1,350000,350400,', 350400, '三元区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350421, '1,350000,350400,', 350400, '明溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350423, '1,350000,350400,', 350400, '清流县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350424, '1,350000,350400,', 350400, '宁化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350425, '1,350000,350400,', 350400, '大田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350426, '1,350000,350400,', 350400, '尤溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350427, '1,350000,350400,', 350400, '沙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350428, '1,350000,350400,', 350400, '将乐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350429, '1,350000,350400,', 350400, '泰宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350430, '1,350000,350400,', 350400, '建宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350481, '1,350000,350400,', 350400, '永安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350500, '1,350000,', 350000, '泉州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350501, '1,350000,350500,', 350500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350502, '1,350000,350500,', 350500, '鲤城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350503, '1,350000,350500,', 350500, '丰泽区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350504, '1,350000,350500,', 350500, '洛江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350505, '1,350000,350500,', 350500, '泉港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350521, '1,350000,350500,', 350500, '惠安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350524, '1,350000,350500,', 350500, '安溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350525, '1,350000,350500,', 350500, '永春县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350526, '1,350000,350500,', 350500, '德化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350527, '1,350000,350500,', 350500, '金门县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350581, '1,350000,350500,', 350500, '石狮市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350582, '1,350000,350500,', 350500, '晋江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350583, '1,350000,350500,', 350500, '南安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350600, '1,350000,', 350000, '漳州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350601, '1,350000,350600,', 350600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350602, '1,350000,350600,', 350600, '芗城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350603, '1,350000,350600,', 350600, '龙文区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350622, '1,350000,350600,', 350600, '云霄县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350623, '1,350000,350600,', 350600, '漳浦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350624, '1,350000,350600,', 350600, '诏安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350625, '1,350000,350600,', 350600, '长泰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350626, '1,350000,350600,', 350600, '东山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350627, '1,350000,350600,', 350600, '南靖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350628, '1,350000,350600,', 350600, '平和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350629, '1,350000,350600,', 350600, '华安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350681, '1,350000,350600,', 350600, '龙海市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350700, '1,350000,', 350000, '南平市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350701, '1,350000,350700,', 350700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350702, '1,350000,350700,', 350700, '延平区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350721, '1,350000,350700,', 350700, '顺昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350722, '1,350000,350700,', 350700, '浦城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350723, '1,350000,350700,', 350700, '光泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350724, '1,350000,350700,', 350700, '松溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350725, '1,350000,350700,', 350700, '政和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350781, '1,350000,350700,', 350700, '邵武市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350782, '1,350000,350700,', 350700, '武夷山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350783, '1,350000,350700,', 350700, '建瓯市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350784, '1,350000,350700,', 350700, '建阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350800, '1,350000,', 350000, '龙岩市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350801, '1,350000,350800,', 350800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350802, '1,350000,350800,', 350800, '新罗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350821, '1,350000,350800,', 350800, '长汀县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350822, '1,350000,350800,', 350800, '永定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350823, '1,350000,350800,', 350800, '上杭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350824, '1,350000,350800,', 350800, '武平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350825, '1,350000,350800,', 350800, '连城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350881, '1,350000,350800,', 350800, '漳平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350900, '1,350000,', 350000, '宁德市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350901, '1,350000,350900,', 350900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350902, '1,350000,350900,', 350900, '蕉城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350921, '1,350000,350900,', 350900, '霞浦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350922, '1,350000,350900,', 350900, '古田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350923, '1,350000,350900,', 350900, '屏南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350924, '1,350000,350900,', 350900, '寿宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350925, '1,350000,350900,', 350900, '周宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350926, '1,350000,350900,', 350900, '柘荣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350981, '1,350000,350900,', 350900, '福安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (350982, '1,350000,350900,', 350900, '福鼎市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360000, '1,', 1, '江西省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360100, '1,360000,', 360000, '南昌市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360101, '1,360000,360100,', 360100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360102, '1,360000,360100,', 360100, '东湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360103, '1,360000,360100,', 360100, '西湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360104, '1,360000,360100,', 360100, '青云谱区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360105, '1,360000,360100,', 360100, '湾里区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360111, '1,360000,360100,', 360100, '青山湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360121, '1,360000,360100,', 360100, '南昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360122, '1,360000,360100,', 360100, '新建县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360123, '1,360000,360100,', 360100, '安义县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360124, '1,360000,360100,', 360100, '进贤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360200, '1,360000,', 360000, '景德镇市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360201, '1,360000,360200,', 360200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360202, '1,360000,360200,', 360200, '昌江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360203, '1,360000,360200,', 360200, '珠山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360222, '1,360000,360200,', 360200, '浮梁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360281, '1,360000,360200,', 360200, '乐平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360300, '1,360000,', 360000, '萍乡市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360301, '1,360000,360300,', 360300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360302, '1,360000,360300,', 360300, '安源区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360313, '1,360000,360300,', 360300, '湘东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:15', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360321, '1,360000,360300,', 360300, '莲花县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360322, '1,360000,360300,', 360300, '上栗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360323, '1,360000,360300,', 360300, '芦溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360400, '1,360000,', 360000, '九江市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360401, '1,360000,360400,', 360400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360402, '1,360000,360400,', 360400, '庐山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360403, '1,360000,360400,', 360400, '浔阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360421, '1,360000,360400,', 360400, '九江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360423, '1,360000,360400,', 360400, '武宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360424, '1,360000,360400,', 360400, '修水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360425, '1,360000,360400,', 360400, '永修县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360426, '1,360000,360400,', 360400, '德安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360427, '1,360000,360400,', 360400, '星子县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360428, '1,360000,360400,', 360400, '都昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360429, '1,360000,360400,', 360400, '湖口县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360430, '1,360000,360400,', 360400, '彭泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360481, '1,360000,360400,', 360400, '瑞昌市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360500, '1,360000,', 360000, '新余市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360501, '1,360000,360500,', 360500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360502, '1,360000,360500,', 360500, '渝水区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360521, '1,360000,360500,', 360500, '分宜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360600, '1,360000,', 360000, '鹰潭市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360601, '1,360000,360600,', 360600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360602, '1,360000,360600,', 360600, '月湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360622, '1,360000,360600,', 360600, '余江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360681, '1,360000,360600,', 360600, '贵溪市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360700, '1,360000,', 360000, '赣州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360701, '1,360000,360700,', 360700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360702, '1,360000,360700,', 360700, '章贡区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360721, '1,360000,360700,', 360700, '赣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360722, '1,360000,360700,', 360700, '信丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360723, '1,360000,360700,', 360700, '大余县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360724, '1,360000,360700,', 360700, '上犹县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360725, '1,360000,360700,', 360700, '崇义县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360726, '1,360000,360700,', 360700, '安远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360727, '1,360000,360700,', 360700, '龙南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:16', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360728, '1,360000,360700,', 360700, '定南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360729, '1,360000,360700,', 360700, '全南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360730, '1,360000,360700,', 360700, '宁都县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360731, '1,360000,360700,', 360700, '于都县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360732, '1,360000,360700,', 360700, '兴国县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360733, '1,360000,360700,', 360700, '会昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360734, '1,360000,360700,', 360700, '寻乌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360735, '1,360000,360700,', 360700, '石城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360781, '1,360000,360700,', 360700, '瑞金市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360782, '1,360000,360700,', 360700, '南康市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360800, '1,360000,', 360000, '吉安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360801, '1,360000,360800,', 360800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360802, '1,360000,360800,', 360800, '吉州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360803, '1,360000,360800,', 360800, '青原区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360821, '1,360000,360800,', 360800, '吉安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360822, '1,360000,360800,', 360800, '吉水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360823, '1,360000,360800,', 360800, '峡江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360824, '1,360000,360800,', 360800, '新干县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360825, '1,360000,360800,', 360800, '永丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360826, '1,360000,360800,', 360800, '泰和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360827, '1,360000,360800,', 360800, '遂川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360828, '1,360000,360800,', 360800, '万安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360829, '1,360000,360800,', 360800, '安福县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360830, '1,360000,360800,', 360800, '永新县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360881, '1,360000,360800,', 360800, '井冈山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360900, '1,360000,', 360000, '宜春市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360901, '1,360000,360900,', 360900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360902, '1,360000,360900,', 360900, '袁州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360921, '1,360000,360900,', 360900, '奉新县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360922, '1,360000,360900,', 360900, '万载县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360923, '1,360000,360900,', 360900, '上高县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360924, '1,360000,360900,', 360900, '宜丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360925, '1,360000,360900,', 360900, '靖安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360926, '1,360000,360900,', 360900, '铜鼓县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360981, '1,360000,360900,', 360900, '丰城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360982, '1,360000,360900,', 360900, '樟树市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (360983, '1,360000,360900,', 360900, '高安市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361000, '1,360000,', 360000, '抚州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361001, '1,360000,361000,', 361000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361002, '1,360000,361000,', 361000, '临川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:17', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361021, '1,360000,361000,', 361000, '南城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361022, '1,360000,361000,', 361000, '黎川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361023, '1,360000,361000,', 361000, '南丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361024, '1,360000,361000,', 361000, '崇仁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361025, '1,360000,361000,', 361000, '乐安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361026, '1,360000,361000,', 361000, '宜黄县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361027, '1,360000,361000,', 361000, '金溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361028, '1,360000,361000,', 361000, '资溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361029, '1,360000,361000,', 361000, '东乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361030, '1,360000,361000,', 361000, '广昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361100, '1,360000,', 360000, '上饶市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361101, '1,360000,361100,', 361100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361102, '1,360000,361100,', 361100, '信州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361121, '1,360000,361100,', 361100, '上饶县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361122, '1,360000,361100,', 361100, '广丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361123, '1,360000,361100,', 361100, '玉山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361124, '1,360000,361100,', 361100, '铅山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361125, '1,360000,361100,', 361100, '横峰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361126, '1,360000,361100,', 361100, '弋阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361127, '1,360000,361100,', 361100, '余干县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361128, '1,360000,361100,', 361100, '鄱阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361129, '1,360000,361100,', 361100, '万年县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361130, '1,360000,361100,', 361100, '婺源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (361181, '1,360000,361100,', 361100, '德兴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370000, '1,', 1, '山东省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370100, '1,370000,', 370000, '济南市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370101, '1,370000,370100,', 370100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370102, '1,370000,370100,', 370100, '历下区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370103, '1,370000,370100,', 370100, '市中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370104, '1,370000,370100,', 370100, '槐荫区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370105, '1,370000,370100,', 370100, '天桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370112, '1,370000,370100,', 370100, '历城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370113, '1,370000,370100,', 370100, '长清区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370124, '1,370000,370100,', 370100, '平阴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370125, '1,370000,370100,', 370100, '济阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370126, '1,370000,370100,', 370100, '商河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370181, '1,370000,370100,', 370100, '章丘市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370200, '1,370000,', 370000, '青岛市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370201, '1,370000,370200,', 370200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370202, '1,370000,370200,', 370200, '市南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:18', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370203, '1,370000,370200,', 370200, '市北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370205, '1,370000,370200,', 370200, '四方区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370211, '1,370000,370200,', 370200, '黄岛区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370212, '1,370000,370200,', 370200, '崂山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370213, '1,370000,370200,', 370200, '李沧区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370214, '1,370000,370200,', 370200, '城阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370281, '1,370000,370200,', 370200, '胶州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370282, '1,370000,370200,', 370200, '即墨市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370283, '1,370000,370200,', 370200, '平度市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370284, '1,370000,370200,', 370200, '胶南市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370285, '1,370000,370200,', 370200, '莱西市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370300, '1,370000,', 370000, '淄博市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370301, '1,370000,370300,', 370300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370302, '1,370000,370300,', 370300, '淄川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370303, '1,370000,370300,', 370300, '张店区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370304, '1,370000,370300,', 370300, '博山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370305, '1,370000,370300,', 370300, '临淄区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370306, '1,370000,370300,', 370300, '周村区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370321, '1,370000,370300,', 370300, '桓台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370322, '1,370000,370300,', 370300, '高青县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370323, '1,370000,370300,', 370300, '沂源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370400, '1,370000,', 370000, '枣庄市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370401, '1,370000,370400,', 370400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370402, '1,370000,370400,', 370400, '市中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370403, '1,370000,370400,', 370400, '薛城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370404, '1,370000,370400,', 370400, '峄城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370405, '1,370000,370400,', 370400, '台儿庄区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370406, '1,370000,370400,', 370400, '山亭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370481, '1,370000,370400,', 370400, '滕州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370500, '1,370000,', 370000, '东营市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:19', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370501, '1,370000,370500,', 370500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370502, '1,370000,370500,', 370500, '东营区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370503, '1,370000,370500,', 370500, '河口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370521, '1,370000,370500,', 370500, '垦利县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370522, '1,370000,370500,', 370500, '利津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370523, '1,370000,370500,', 370500, '广饶县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370600, '1,370000,', 370000, '烟台市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370601, '1,370000,370600,', 370600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370602, '1,370000,370600,', 370600, '芝罘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370611, '1,370000,370600,', 370600, '福山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370612, '1,370000,370600,', 370600, '牟平区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370613, '1,370000,370600,', 370600, '莱山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370634, '1,370000,370600,', 370600, '长岛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370681, '1,370000,370600,', 370600, '龙口市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370682, '1,370000,370600,', 370600, '莱阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370683, '1,370000,370600,', 370600, '莱州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370684, '1,370000,370600,', 370600, '蓬莱市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370685, '1,370000,370600,', 370600, '招远市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370686, '1,370000,370600,', 370600, '栖霞市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370687, '1,370000,370600,', 370600, '海阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370700, '1,370000,', 370000, '潍坊市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370701, '1,370000,370700,', 370700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370702, '1,370000,370700,', 370700, '潍城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370703, '1,370000,370700,', 370700, '寒亭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370704, '1,370000,370700,', 370700, '坊子区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370705, '1,370000,370700,', 370700, '奎文区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370724, '1,370000,370700,', 370700, '临朐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370725, '1,370000,370700,', 370700, '昌乐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370781, '1,370000,370700,', 370700, '青州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370782, '1,370000,370700,', 370700, '诸城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370783, '1,370000,370700,', 370700, '寿光市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370784, '1,370000,370700,', 370700, '安丘市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370785, '1,370000,370700,', 370700, '高密市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370786, '1,370000,370700,', 370700, '昌邑市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370800, '1,370000,', 370000, '济宁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370801, '1,370000,370800,', 370800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370802, '1,370000,370800,', 370800, '市中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370811, '1,370000,370800,', 370800, '任城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370826, '1,370000,370800,', 370800, '微山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370827, '1,370000,370800,', 370800, '鱼台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:20', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370828, '1,370000,370800,', 370800, '金乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370829, '1,370000,370800,', 370800, '嘉祥县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370830, '1,370000,370800,', 370800, '汶上县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370831, '1,370000,370800,', 370800, '泗水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370832, '1,370000,370800,', 370800, '梁山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370881, '1,370000,370800,', 370800, '曲阜市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370882, '1,370000,370800,', 370800, '兖州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370883, '1,370000,370800,', 370800, '邹城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370900, '1,370000,', 370000, '泰安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370901, '1,370000,370900,', 370900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370902, '1,370000,370900,', 370900, '泰山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370903, '1,370000,370900,', 370900, '岱岳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370921, '1,370000,370900,', 370900, '宁阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370923, '1,370000,370900,', 370900, '东平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370982, '1,370000,370900,', 370900, '新泰市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (370983, '1,370000,370900,', 370900, '肥城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371000, '1,370000,', 370000, '威海市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371001, '1,370000,371000,', 371000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371002, '1,370000,371000,', 371000, '环翠区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371081, '1,370000,371000,', 371000, '文登市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371082, '1,370000,371000,', 371000, '荣成市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371083, '1,370000,371000,', 371000, '乳山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371100, '1,370000,', 370000, '日照市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371101, '1,370000,371100,', 371100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371102, '1,370000,371100,', 371100, '东港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371103, '1,370000,371100,', 371100, '岚山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371121, '1,370000,371100,', 371100, '五莲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371122, '1,370000,371100,', 371100, '莒县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371200, '1,370000,', 370000, '莱芜市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371201, '1,370000,371200,', 371200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371202, '1,370000,371200,', 371200, '莱城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371203, '1,370000,371200,', 371200, '钢城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371300, '1,370000,', 370000, '临沂市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371301, '1,370000,371300,', 371300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371302, '1,370000,371300,', 371300, '兰山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371311, '1,370000,371300,', 371300, '罗庄区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371312, '1,370000,371300,', 371300, '河东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371321, '1,370000,371300,', 371300, '沂南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371322, '1,370000,371300,', 371300, '郯城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371323, '1,370000,371300,', 371300, '沂水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371324, '1,370000,371300,', 371300, '苍山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371325, '1,370000,371300,', 371300, '费县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:21', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371326, '1,370000,371300,', 371300, '平邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371327, '1,370000,371300,', 371300, '莒南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371328, '1,370000,371300,', 371300, '蒙阴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371329, '1,370000,371300,', 371300, '临沭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371400, '1,370000,', 370000, '德州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371401, '1,370000,371400,', 371400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371402, '1,370000,371400,', 371400, '德城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371421, '1,370000,371400,', 371400, '陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371422, '1,370000,371400,', 371400, '宁津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371423, '1,370000,371400,', 371400, '庆云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371424, '1,370000,371400,', 371400, '临邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371425, '1,370000,371400,', 371400, '齐河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371426, '1,370000,371400,', 371400, '平原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371427, '1,370000,371400,', 371400, '夏津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371428, '1,370000,371400,', 371400, '武城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371481, '1,370000,371400,', 371400, '乐陵市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371482, '1,370000,371400,', 371400, '禹城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371500, '1,370000,', 370000, '聊城市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371501, '1,370000,371500,', 371500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371502, '1,370000,371500,', 371500, '东昌府区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371521, '1,370000,371500,', 371500, '阳谷县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371522, '1,370000,371500,', 371500, '莘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371523, '1,370000,371500,', 371500, '茌平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371524, '1,370000,371500,', 371500, '东阿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371525, '1,370000,371500,', 371500, '冠县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371526, '1,370000,371500,', 371500, '高唐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371581, '1,370000,371500,', 371500, '临清市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371600, '1,370000,', 370000, '滨州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371601, '1,370000,371600,', 371600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371602, '1,370000,371600,', 371600, '滨城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371621, '1,370000,371600,', 371600, '惠民县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371622, '1,370000,371600,', 371600, '阳信县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371623, '1,370000,371600,', 371600, '无棣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371624, '1,370000,371600,', 371600, '沾化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371625, '1,370000,371600,', 371600, '博兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371626, '1,370000,371600,', 371600, '邹平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371700, '1,370000,', 370000, '菏泽市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:22', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371701, '1,370000,371700,', 371700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371702, '1,370000,371700,', 371700, '牡丹区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371721, '1,370000,371700,', 371700, '曹县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371722, '1,370000,371700,', 371700, '单县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371723, '1,370000,371700,', 371700, '成武县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371724, '1,370000,371700,', 371700, '巨野县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371725, '1,370000,371700,', 371700, '郓城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371726, '1,370000,371700,', 371700, '鄄城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371727, '1,370000,371700,', 371700, '定陶县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (371728, '1,370000,371700,', 371700, '东明县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410000, '1,', 1, '河南省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410100, '1,410000,', 410000, '郑州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410101, '1,410000,410100,', 410100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410102, '1,410000,410100,', 410100, '中原区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410103, '1,410000,410100,', 410100, '二七区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410104, '1,410000,410100,', 410100, '管城回族区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410105, '1,410000,410100,', 410100, '金水区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410106, '1,410000,410100,', 410100, '上街区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410108, '1,410000,410100,', 410100, '惠济区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410122, '1,410000,410100,', 410100, '中牟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410181, '1,410000,410100,', 410100, '巩义市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410182, '1,410000,410100,', 410100, '荥阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410183, '1,410000,410100,', 410100, '新密市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410184, '1,410000,410100,', 410100, '新郑市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410185, '1,410000,410100,', 410100, '登封市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410200, '1,410000,', 410000, '开封市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410201, '1,410000,410200,', 410200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410202, '1,410000,410200,', 410200, '龙亭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410203, '1,410000,410200,', 410200, '顺河回族区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410204, '1,410000,410200,', 410200, '鼓楼区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410205, '1,410000,410200,', 410200, '禹王台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410211, '1,410000,410200,', 410200, '金明区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410221, '1,410000,410200,', 410200, '杞县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410222, '1,410000,410200,', 410200, '通许县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410223, '1,410000,410200,', 410200, '尉氏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410224, '1,410000,410200,', 410200, '开封县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410225, '1,410000,410200,', 410200, '兰考县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410300, '1,410000,', 410000, '洛阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410301, '1,410000,410300,', 410300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:23', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410302, '1,410000,410300,', 410300, '老城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410303, '1,410000,410300,', 410300, '西工区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410304, '1,410000,410300,', 410300, '廛河回族区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410305, '1,410000,410300,', 410300, '涧西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410306, '1,410000,410300,', 410300, '吉利区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410307, '1,410000,410300,', 410300, '洛龙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410322, '1,410000,410300,', 410300, '孟津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410323, '1,410000,410300,', 410300, '新安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410324, '1,410000,410300,', 410300, '栾川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410325, '1,410000,410300,', 410300, '嵩县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410326, '1,410000,410300,', 410300, '汝阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410327, '1,410000,410300,', 410300, '宜阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410328, '1,410000,410300,', 410300, '洛宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410329, '1,410000,410300,', 410300, '伊川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410381, '1,410000,410300,', 410300, '偃师市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410400, '1,410000,', 410000, '平顶山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410401, '1,410000,410400,', 410400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410402, '1,410000,410400,', 410400, '新华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410403, '1,410000,410400,', 410400, '卫东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410404, '1,410000,410400,', 410400, '石龙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410411, '1,410000,410400,', 410400, '湛河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410421, '1,410000,410400,', 410400, '宝丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410422, '1,410000,410400,', 410400, '叶县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410423, '1,410000,410400,', 410400, '鲁山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410425, '1,410000,410400,', 410400, '郏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410481, '1,410000,410400,', 410400, '舞钢市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410482, '1,410000,410400,', 410400, '汝州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410500, '1,410000,', 410000, '安阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410501, '1,410000,410500,', 410500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410502, '1,410000,410500,', 410500, '文峰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410503, '1,410000,410500,', 410500, '北关区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410505, '1,410000,410500,', 410500, '殷都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410506, '1,410000,410500,', 410500, '龙安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410522, '1,410000,410500,', 410500, '安阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410523, '1,410000,410500,', 410500, '汤阴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410526, '1,410000,410500,', 410500, '滑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:24', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410527, '1,410000,410500,', 410500, '内黄县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410581, '1,410000,410500,', 410500, '林州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410600, '1,410000,', 410000, '鹤壁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410601, '1,410000,410600,', 410600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410602, '1,410000,410600,', 410600, '鹤山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410603, '1,410000,410600,', 410600, '山城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410611, '1,410000,410600,', 410600, '淇滨区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410621, '1,410000,410600,', 410600, '浚县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410622, '1,410000,410600,', 410600, '淇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410700, '1,410000,', 410000, '新乡市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410701, '1,410000,410700,', 410700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410702, '1,410000,410700,', 410700, '红旗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410703, '1,410000,410700,', 410700, '卫滨区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410704, '1,410000,410700,', 410700, '凤泉区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410711, '1,410000,410700,', 410700, '牧野区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410721, '1,410000,410700,', 410700, '新乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410724, '1,410000,410700,', 410700, '获嘉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410725, '1,410000,410700,', 410700, '原阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410726, '1,410000,410700,', 410700, '延津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410727, '1,410000,410700,', 410700, '封丘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410728, '1,410000,410700,', 410700, '长垣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410781, '1,410000,410700,', 410700, '卫辉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410782, '1,410000,410700,', 410700, '辉县市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410800, '1,410000,', 410000, '焦作市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410801, '1,410000,410800,', 410800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410802, '1,410000,410800,', 410800, '解放区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410803, '1,410000,410800,', 410800, '中站区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410804, '1,410000,410800,', 410800, '马村区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410811, '1,410000,410800,', 410800, '山阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410821, '1,410000,410800,', 410800, '修武县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410822, '1,410000,410800,', 410800, '博爱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410823, '1,410000,410800,', 410800, '武陟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:25', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410825, '1,410000,410800,', 410800, '温县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410881, '1,410000,410800,', 410800, '济源市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410882, '1,410000,410800,', 410800, '沁阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410883, '1,410000,410800,', 410800, '孟州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410900, '1,410000,', 410000, '濮阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410901, '1,410000,410900,', 410900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410902, '1,410000,410900,', 410900, '华龙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410922, '1,410000,410900,', 410900, '清丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410923, '1,410000,410900,', 410900, '南乐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410926, '1,410000,410900,', 410900, '范县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410927, '1,410000,410900,', 410900, '台前县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (410928, '1,410000,410900,', 410900, '濮阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411000, '1,410000,', 410000, '许昌市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411001, '1,410000,411000,', 411000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411002, '1,410000,411000,', 411000, '魏都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411023, '1,410000,411000,', 411000, '许昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411024, '1,410000,411000,', 411000, '鄢陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411025, '1,410000,411000,', 411000, '襄城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411081, '1,410000,411000,', 411000, '禹州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411082, '1,410000,411000,', 411000, '长葛市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411100, '1,410000,', 410000, '漯河市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411101, '1,410000,411100,', 411100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411102, '1,410000,411100,', 411100, '源汇区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411103, '1,410000,411100,', 411100, '郾城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411104, '1,410000,411100,', 411100, '召陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411121, '1,410000,411100,', 411100, '舞阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411122, '1,410000,411100,', 411100, '临颍县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411200, '1,410000,', 410000, '三门峡市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411201, '1,410000,411200,', 411200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411202, '1,410000,411200,', 411200, '湖滨区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411221, '1,410000,411200,', 411200, '渑池县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411222, '1,410000,411200,', 411200, '陕县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411224, '1,410000,411200,', 411200, '卢氏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411281, '1,410000,411200,', 411200, '义马市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411282, '1,410000,411200,', 411200, '灵宝市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411300, '1,410000,', 410000, '南阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411301, '1,410000,411300,', 411300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411302, '1,410000,411300,', 411300, '宛城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411303, '1,410000,411300,', 411300, '卧龙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411321, '1,410000,411300,', 411300, '南召县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:26', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411322, '1,410000,411300,', 411300, '方城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411323, '1,410000,411300,', 411300, '西峡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411324, '1,410000,411300,', 411300, '镇平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411325, '1,410000,411300,', 411300, '内乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411326, '1,410000,411300,', 411300, '淅川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411327, '1,410000,411300,', 411300, '社旗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411328, '1,410000,411300,', 411300, '唐河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411329, '1,410000,411300,', 411300, '新野县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411330, '1,410000,411300,', 411300, '桐柏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411381, '1,410000,411300,', 411300, '邓州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411400, '1,410000,', 410000, '商丘市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411401, '1,410000,411400,', 411400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411402, '1,410000,411400,', 411400, '梁园区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411403, '1,410000,411400,', 411400, '睢阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411421, '1,410000,411400,', 411400, '民权县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411422, '1,410000,411400,', 411400, '睢县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411423, '1,410000,411400,', 411400, '宁陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411424, '1,410000,411400,', 411400, '柘城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411425, '1,410000,411400,', 411400, '虞城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411426, '1,410000,411400,', 411400, '夏邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411481, '1,410000,411400,', 411400, '永城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411500, '1,410000,', 410000, '信阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411501, '1,410000,411500,', 411500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411502, '1,410000,411500,', 411500, '浉河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411503, '1,410000,411500,', 411500, '平桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411521, '1,410000,411500,', 411500, '罗山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411522, '1,410000,411500,', 411500, '光山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411523, '1,410000,411500,', 411500, '新县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411524, '1,410000,411500,', 411500, '商城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411525, '1,410000,411500,', 411500, '固始县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411526, '1,410000,411500,', 411500, '潢川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411527, '1,410000,411500,', 411500, '淮滨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411528, '1,410000,411500,', 411500, '息县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411600, '1,410000,', 410000, '周口市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411601, '1,410000,411600,', 411600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411602, '1,410000,411600,', 411600, '川汇区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411621, '1,410000,411600,', 411600, '扶沟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411622, '1,410000,411600,', 411600, '西华县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411623, '1,410000,411600,', 411600, '商水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411624, '1,410000,411600,', 411600, '沈丘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411625, '1,410000,411600,', 411600, '郸城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411626, '1,410000,411600,', 411600, '淮阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411627, '1,410000,411600,', 411600, '太康县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:27', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411628, '1,410000,411600,', 411600, '鹿邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411681, '1,410000,411600,', 411600, '项城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411700, '1,410000,', 410000, '驻马店市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411701, '1,410000,411700,', 411700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411702, '1,410000,411700,', 411700, '驿城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411721, '1,410000,411700,', 411700, '西平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411722, '1,410000,411700,', 411700, '上蔡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411723, '1,410000,411700,', 411700, '平舆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411724, '1,410000,411700,', 411700, '正阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411725, '1,410000,411700,', 411700, '确山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411726, '1,410000,411700,', 411700, '泌阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411727, '1,410000,411700,', 411700, '汝南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411728, '1,410000,411700,', 411700, '遂平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (411729, '1,410000,411700,', 411700, '新蔡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420000, '1,', 1, '湖北省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420100, '1,420000,', 420000, '武汉市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420101, '1,420000,420100,', 420100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420102, '1,420000,420100,', 420100, '江岸区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420103, '1,420000,420100,', 420100, '江汉区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420104, '1,420000,420100,', 420100, '硚口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420105, '1,420000,420100,', 420100, '汉阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420106, '1,420000,420100,', 420100, '武昌区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420107, '1,420000,420100,', 420100, '青山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420111, '1,420000,420100,', 420100, '洪山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420112, '1,420000,420100,', 420100, '东西湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420113, '1,420000,420100,', 420100, '汉南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420114, '1,420000,420100,', 420100, '蔡甸区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420115, '1,420000,420100,', 420100, '江夏区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420116, '1,420000,420100,', 420100, '黄陂区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420117, '1,420000,420100,', 420100, '新洲区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420200, '1,420000,', 420000, '黄石市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420201, '1,420000,420200,', 420200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420202, '1,420000,420200,', 420200, '黄石港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420203, '1,420000,420200,', 420200, '西塞山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420204, '1,420000,420200,', 420200, '下陆区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:28', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420205, '1,420000,420200,', 420200, '铁山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420222, '1,420000,420200,', 420200, '阳新县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420281, '1,420000,420200,', 420200, '大冶市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420300, '1,420000,', 420000, '十堰市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420301, '1,420000,420300,', 420300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420302, '1,420000,420300,', 420300, '茅箭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420303, '1,420000,420300,', 420300, '张湾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420321, '1,420000,420300,', 420300, '郧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420322, '1,420000,420300,', 420300, '郧西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420323, '1,420000,420300,', 420300, '竹山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420324, '1,420000,420300,', 420300, '竹溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420325, '1,420000,420300,', 420300, '房县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420381, '1,420000,420300,', 420300, '丹江口市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420500, '1,420000,', 420000, '宜昌市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420501, '1,420000,420500,', 420500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420502, '1,420000,420500,', 420500, '西陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420503, '1,420000,420500,', 420500, '伍家岗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420504, '1,420000,420500,', 420500, '点军区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420505, '1,420000,420500,', 420500, '猇亭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420506, '1,420000,420500,', 420500, '夷陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420525, '1,420000,420500,', 420500, '远安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420526, '1,420000,420500,', 420500, '兴山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420527, '1,420000,420500,', 420500, '秭归县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420528, '1,420000,420500,', 420500, '长阳土家族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420529, '1,420000,420500,', 420500, '五峰土家族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420581, '1,420000,420500,', 420500, '宜都市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420582, '1,420000,420500,', 420500, '当阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420583, '1,420000,420500,', 420500, '枝江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420600, '1,420000,', 420000, '襄樊市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420601, '1,420000,420600,', 420600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420602, '1,420000,420600,', 420600, '襄城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420606, '1,420000,420600,', 420600, '樊城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420607, '1,420000,420600,', 420600, '襄阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420624, '1,420000,420600,', 420600, '南漳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420625, '1,420000,420600,', 420600, '谷城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420626, '1,420000,420600,', 420600, '保康县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420682, '1,420000,420600,', 420600, '老河口市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420683, '1,420000,420600,', 420600, '枣阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420684, '1,420000,420600,', 420600, '宜城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420700, '1,420000,', 420000, '鄂州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:29', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420701, '1,420000,420700,', 420700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420702, '1,420000,420700,', 420700, '梁子湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420703, '1,420000,420700,', 420700, '华容区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420704, '1,420000,420700,', 420700, '鄂城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420800, '1,420000,', 420000, '荆门市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420801, '1,420000,420800,', 420800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420802, '1,420000,420800,', 420800, '东宝区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420804, '1,420000,420800,', 420800, '掇刀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420821, '1,420000,420800,', 420800, '京山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420822, '1,420000,420800,', 420800, '沙洋县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420881, '1,420000,420800,', 420800, '钟祥市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420900, '1,420000,', 420000, '孝感市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420901, '1,420000,420900,', 420900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420902, '1,420000,420900,', 420900, '孝南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420921, '1,420000,420900,', 420900, '孝昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420922, '1,420000,420900,', 420900, '大悟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420923, '1,420000,420900,', 420900, '云梦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420981, '1,420000,420900,', 420900, '应城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420982, '1,420000,420900,', 420900, '安陆市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (420984, '1,420000,420900,', 420900, '汉川市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421000, '1,420000,', 420000, '荆州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421001, '1,420000,421000,', 421000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421002, '1,420000,421000,', 421000, '沙市区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421003, '1,420000,421000,', 421000, '荆州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421022, '1,420000,421000,', 421000, '公安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421023, '1,420000,421000,', 421000, '监利县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421024, '1,420000,421000,', 421000, '江陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421081, '1,420000,421000,', 421000, '石首市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421083, '1,420000,421000,', 421000, '洪湖市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421087, '1,420000,421000,', 421000, '松滋市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421100, '1,420000,', 420000, '黄冈市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421101, '1,420000,421100,', 421100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421102, '1,420000,421100,', 421100, '黄州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421121, '1,420000,421100,', 421100, '团风县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421122, '1,420000,421100,', 421100, '红安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421123, '1,420000,421100,', 421100, '罗田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421124, '1,420000,421100,', 421100, '英山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421125, '1,420000,421100,', 421100, '浠水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:30', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421126, '1,420000,421100,', 421100, '蕲春县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421127, '1,420000,421100,', 421100, '黄梅县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421181, '1,420000,421100,', 421100, '麻城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421182, '1,420000,421100,', 421100, '武穴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421200, '1,420000,', 420000, '咸宁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421201, '1,420000,421200,', 421200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421202, '1,420000,421200,', 421200, '咸安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421221, '1,420000,421200,', 421200, '嘉鱼县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421222, '1,420000,421200,', 421200, '通城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421223, '1,420000,421200,', 421200, '崇阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421224, '1,420000,421200,', 421200, '通山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421281, '1,420000,421200,', 421200, '赤壁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421300, '1,420000,', 420000, '随州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421301, '1,420000,421300,', 421300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421302, '1,420000,421300,', 421300, '曾都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (421381, '1,420000,421300,', 421300, '广水市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422800, '1,420000,', 420000, '恩施土家族苗族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422801, '1,420000,422800,', 422800, '恩施市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422802, '1,420000,422800,', 422800, '利川市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422822, '1,420000,422800,', 422800, '建始县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422823, '1,420000,422800,', 422800, '巴东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422825, '1,420000,422800,', 422800, '宣恩县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422826, '1,420000,422800,', 422800, '咸丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422827, '1,420000,422800,', 422800, '来凤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (422828, '1,420000,422800,', 422800, '鹤峰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (429000, '1,420000,', 420000, '省直辖行政单位', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (429004, '1,420000,429000,', 429000, '仙桃市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (429005, '1,420000,429000,', 429000, '潜江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (429006, '1,420000,429000,', 429000, '天门市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (429021, '1,420000,429000,', 429000, '神农架林区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430000, '1,', 1, '湖南省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430100, '1,430000,', 430000, '长沙市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430101, '1,430000,430100,', 430100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430102, '1,430000,430100,', 430100, '芙蓉区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430103, '1,430000,430100,', 430100, '天心区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430104, '1,430000,430100,', 430100, '岳麓区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430105, '1,430000,430100,', 430100, '开福区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430111, '1,430000,430100,', 430100, '雨花区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430121, '1,430000,430100,', 430100, '长沙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430122, '1,430000,430100,', 430100, '望城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430124, '1,430000,430100,', 430100, '宁乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430181, '1,430000,430100,', 430100, '浏阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:31', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430200, '1,430000,', 430000, '株洲市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430201, '1,430000,430200,', 430200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430202, '1,430000,430200,', 430200, '荷塘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430203, '1,430000,430200,', 430200, '芦淞区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430204, '1,430000,430200,', 430200, '石峰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430211, '1,430000,430200,', 430200, '天元区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430221, '1,430000,430200,', 430200, '株洲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430223, '1,430000,430200,', 430200, '攸县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430224, '1,430000,430200,', 430200, '茶陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430225, '1,430000,430200,', 430200, '炎陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430281, '1,430000,430200,', 430200, '醴陵市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430300, '1,430000,', 430000, '湘潭市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430301, '1,430000,430300,', 430300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430302, '1,430000,430300,', 430300, '雨湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430304, '1,430000,430300,', 430300, '岳塘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430321, '1,430000,430300,', 430300, '湘潭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430381, '1,430000,430300,', 430300, '湘乡市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430382, '1,430000,430300,', 430300, '韶山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430400, '1,430000,', 430000, '衡阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430401, '1,430000,430400,', 430400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430405, '1,430000,430400,', 430400, '珠晖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430406, '1,430000,430400,', 430400, '雁峰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430407, '1,430000,430400,', 430400, '石鼓区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430408, '1,430000,430400,', 430400, '蒸湘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430412, '1,430000,430400,', 430400, '南岳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430421, '1,430000,430400,', 430400, '衡阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430422, '1,430000,430400,', 430400, '衡南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430423, '1,430000,430400,', 430400, '衡山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430424, '1,430000,430400,', 430400, '衡东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430426, '1,430000,430400,', 430400, '祁东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430481, '1,430000,430400,', 430400, '耒阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430482, '1,430000,430400,', 430400, '常宁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430500, '1,430000,', 430000, '邵阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430501, '1,430000,430500,', 430500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430502, '1,430000,430500,', 430500, '双清区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430503, '1,430000,430500,', 430500, '大祥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430511, '1,430000,430500,', 430500, '北塔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430521, '1,430000,430500,', 430500, '邵东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430522, '1,430000,430500,', 430500, '新邵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430523, '1,430000,430500,', 430500, '邵阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:32', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430524, '1,430000,430500,', 430500, '隆回县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430525, '1,430000,430500,', 430500, '洞口县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430527, '1,430000,430500,', 430500, '绥宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430528, '1,430000,430500,', 430500, '新宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430529, '1,430000,430500,', 430500, '城步苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430581, '1,430000,430500,', 430500, '武冈市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430600, '1,430000,', 430000, '岳阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430601, '1,430000,430600,', 430600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430602, '1,430000,430600,', 430600, '岳阳楼区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430603, '1,430000,430600,', 430600, '云溪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430611, '1,430000,430600,', 430600, '君山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430621, '1,430000,430600,', 430600, '岳阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430623, '1,430000,430600,', 430600, '华容县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430624, '1,430000,430600,', 430600, '湘阴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430626, '1,430000,430600,', 430600, '平江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430681, '1,430000,430600,', 430600, '汨罗市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430682, '1,430000,430600,', 430600, '临湘市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430700, '1,430000,', 430000, '常德市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430701, '1,430000,430700,', 430700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430702, '1,430000,430700,', 430700, '武陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430703, '1,430000,430700,', 430700, '鼎城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430721, '1,430000,430700,', 430700, '安乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430722, '1,430000,430700,', 430700, '汉寿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430723, '1,430000,430700,', 430700, '澧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430724, '1,430000,430700,', 430700, '临澧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430725, '1,430000,430700,', 430700, '桃源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430726, '1,430000,430700,', 430700, '石门县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430781, '1,430000,430700,', 430700, '津市市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430800, '1,430000,', 430000, '张家界市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430801, '1,430000,430800,', 430800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430802, '1,430000,430800,', 430800, '永定区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430811, '1,430000,430800,', 430800, '武陵源区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430821, '1,430000,430800,', 430800, '慈利县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430822, '1,430000,430800,', 430800, '桑植县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430900, '1,430000,', 430000, '益阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430901, '1,430000,430900,', 430900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430902, '1,430000,430900,', 430900, '资阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430903, '1,430000,430900,', 430900, '赫山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430921, '1,430000,430900,', 430900, '南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430922, '1,430000,430900,', 430900, '桃江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430923, '1,430000,430900,', 430900, '安化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:33', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (430981, '1,430000,430900,', 430900, '沅江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431000, '1,430000,', 430000, '郴州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431001, '1,430000,431000,', 431000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431002, '1,430000,431000,', 431000, '北湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431003, '1,430000,431000,', 431000, '苏仙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431021, '1,430000,431000,', 431000, '桂阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431022, '1,430000,431000,', 431000, '宜章县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431023, '1,430000,431000,', 431000, '永兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431024, '1,430000,431000,', 431000, '嘉禾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431025, '1,430000,431000,', 431000, '临武县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431026, '1,430000,431000,', 431000, '汝城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431027, '1,430000,431000,', 431000, '桂东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431028, '1,430000,431000,', 431000, '安仁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431081, '1,430000,431000,', 431000, '资兴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431100, '1,430000,', 430000, '永州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431101, '1,430000,431100,', 431100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431102, '1,430000,431100,', 431100, '零陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431103, '1,430000,431100,', 431100, '冷水滩区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431121, '1,430000,431100,', 431100, '祁阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431122, '1,430000,431100,', 431100, '东安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431123, '1,430000,431100,', 431100, '双牌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431124, '1,430000,431100,', 431100, '道县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431125, '1,430000,431100,', 431100, '江永县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431126, '1,430000,431100,', 431100, '宁远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431127, '1,430000,431100,', 431100, '蓝山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431128, '1,430000,431100,', 431100, '新田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431129, '1,430000,431100,', 431100, '江华瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431200, '1,430000,', 430000, '怀化市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431201, '1,430000,431200,', 431200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431202, '1,430000,431200,', 431200, '鹤城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431221, '1,430000,431200,', 431200, '中方县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431222, '1,430000,431200,', 431200, '沅陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431223, '1,430000,431200,', 431200, '辰溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431224, '1,430000,431200,', 431200, '溆浦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:34', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431225, '1,430000,431200,', 431200, '会同县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431226, '1,430000,431200,', 431200, '麻阳苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431227, '1,430000,431200,', 431200, '新晃侗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431228, '1,430000,431200,', 431200, '芷江侗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431229, '1,430000,431200,', 431200, '靖州苗族侗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431230, '1,430000,431200,', 431200, '通道侗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431281, '1,430000,431200,', 431200, '洪江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431300, '1,430000,', 430000, '娄底市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431301, '1,430000,431300,', 431300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431302, '1,430000,431300,', 431300, '娄星区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431321, '1,430000,431300,', 431300, '双峰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431322, '1,430000,431300,', 431300, '新化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431381, '1,430000,431300,', 431300, '冷水江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (431382, '1,430000,431300,', 431300, '涟源市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433100, '1,430000,', 430000, '湘西土家族苗族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433101, '1,430000,433100,', 433100, '吉首市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433122, '1,430000,433100,', 433100, '泸溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433123, '1,430000,433100,', 433100, '凤凰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433124, '1,430000,433100,', 433100, '花垣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433125, '1,430000,433100,', 433100, '保靖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433126, '1,430000,433100,', 433100, '古丈县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433127, '1,430000,433100,', 433100, '永顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (433130, '1,430000,433100,', 433100, '龙山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440000, '1,', 1, '广东省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440100, '1,440000,', 440000, '广州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440101, '1,440000,440100,', 440100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440103, '1,440000,440100,', 440100, '荔湾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440104, '1,440000,440100,', 440100, '越秀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440105, '1,440000,440100,', 440100, '海珠区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440106, '1,440000,440100,', 440100, '天河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440111, '1,440000,440100,', 440100, '白云区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440112, '1,440000,440100,', 440100, '黄埔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440113, '1,440000,440100,', 440100, '番禺区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440114, '1,440000,440100,', 440100, '花都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440115, '1,440000,440100,', 440100, '南沙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440116, '1,440000,440100,', 440100, '萝岗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440183, '1,440000,440100,', 440100, '增城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440184, '1,440000,440100,', 440100, '从化市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:35', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440200, '1,440000,', 440000, '韶关市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440201, '1,440000,440200,', 440200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440203, '1,440000,440200,', 440200, '武江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440204, '1,440000,440200,', 440200, '浈江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440205, '1,440000,440200,', 440200, '曲江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440222, '1,440000,440200,', 440200, '始兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440224, '1,440000,440200,', 440200, '仁化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440229, '1,440000,440200,', 440200, '翁源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440232, '1,440000,440200,', 440200, '乳源瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440233, '1,440000,440200,', 440200, '新丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440281, '1,440000,440200,', 440200, '乐昌市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440282, '1,440000,440200,', 440200, '南雄市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440300, '1,440000,', 440000, '深圳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440301, '1,440000,440300,', 440300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440303, '1,440000,440300,', 440300, '罗湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440304, '1,440000,440300,', 440300, '福田区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440305, '1,440000,440300,', 440300, '南山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440306, '1,440000,440300,', 440300, '宝安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440307, '1,440000,440300,', 440300, '龙岗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440308, '1,440000,440300,', 440300, '盐田区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440400, '1,440000,', 440000, '珠海市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440401, '1,440000,440400,', 440400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440402, '1,440000,440400,', 440400, '香洲区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440403, '1,440000,440400,', 440400, '斗门区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440404, '1,440000,440400,', 440400, '金湾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440500, '1,440000,', 440000, '汕头市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440501, '1,440000,440500,', 440500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440507, '1,440000,440500,', 440500, '龙湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440511, '1,440000,440500,', 440500, '金平区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440512, '1,440000,440500,', 440500, '濠江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440513, '1,440000,440500,', 440500, '潮阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440514, '1,440000,440500,', 440500, '潮南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440515, '1,440000,440500,', 440500, '澄海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440523, '1,440000,440500,', 440500, '南澳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440600, '1,440000,', 440000, '佛山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440601, '1,440000,440600,', 440600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440604, '1,440000,440600,', 440600, '禅城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:36', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440605, '1,440000,440600,', 440600, '南海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440606, '1,440000,440600,', 440600, '顺德区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440607, '1,440000,440600,', 440600, '三水区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440608, '1,440000,440600,', 440600, '高明区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440700, '1,440000,', 440000, '江门市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440701, '1,440000,440700,', 440700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440703, '1,440000,440700,', 440700, '蓬江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440704, '1,440000,440700,', 440700, '江海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440705, '1,440000,440700,', 440700, '新会区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440781, '1,440000,440700,', 440700, '台山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440783, '1,440000,440700,', 440700, '开平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440784, '1,440000,440700,', 440700, '鹤山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440785, '1,440000,440700,', 440700, '恩平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440800, '1,440000,', 440000, '湛江市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440801, '1,440000,440800,', 440800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440802, '1,440000,440800,', 440800, '赤坎区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440803, '1,440000,440800,', 440800, '霞山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440804, '1,440000,440800,', 440800, '坡头区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440811, '1,440000,440800,', 440800, '麻章区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440823, '1,440000,440800,', 440800, '遂溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440825, '1,440000,440800,', 440800, '徐闻县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440881, '1,440000,440800,', 440800, '廉江市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440882, '1,440000,440800,', 440800, '雷州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440883, '1,440000,440800,', 440800, '吴川市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440900, '1,440000,', 440000, '茂名市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440901, '1,440000,440900,', 440900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440902, '1,440000,440900,', 440900, '茂南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440903, '1,440000,440900,', 440900, '茂港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440923, '1,440000,440900,', 440900, '电白县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440981, '1,440000,440900,', 440900, '高州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440982, '1,440000,440900,', 440900, '化州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (440983, '1,440000,440900,', 440900, '信宜市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441200, '1,440000,', 440000, '肇庆市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441201, '1,440000,441200,', 441200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441202, '1,440000,441200,', 441200, '端州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441203, '1,440000,441200,', 441200, '鼎湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:37', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441223, '1,440000,441200,', 441200, '广宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441224, '1,440000,441200,', 441200, '怀集县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441225, '1,440000,441200,', 441200, '封开县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441226, '1,440000,441200,', 441200, '德庆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441283, '1,440000,441200,', 441200, '高要市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441284, '1,440000,441200,', 441200, '四会市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441300, '1,440000,', 440000, '惠州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441301, '1,440000,441300,', 441300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441302, '1,440000,441300,', 441300, '惠城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441303, '1,440000,441300,', 441300, '惠阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441322, '1,440000,441300,', 441300, '博罗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441323, '1,440000,441300,', 441300, '惠东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441324, '1,440000,441300,', 441300, '龙门县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441400, '1,440000,', 440000, '梅州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441401, '1,440000,441400,', 441400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441402, '1,440000,441400,', 441400, '梅江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441421, '1,440000,441400,', 441400, '梅县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441422, '1,440000,441400,', 441400, '大埔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441423, '1,440000,441400,', 441400, '丰顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441424, '1,440000,441400,', 441400, '五华县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441426, '1,440000,441400,', 441400, '平远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441427, '1,440000,441400,', 441400, '蕉岭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441481, '1,440000,441400,', 441400, '兴宁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441500, '1,440000,', 440000, '汕尾市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441501, '1,440000,441500,', 441500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441502, '1,440000,441500,', 441500, '城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441521, '1,440000,441500,', 441500, '海丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441523, '1,440000,441500,', 441500, '陆河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441581, '1,440000,441500,', 441500, '陆丰市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441600, '1,440000,', 440000, '河源市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441601, '1,440000,441600,', 441600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441602, '1,440000,441600,', 441600, '源城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441621, '1,440000,441600,', 441600, '紫金县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441622, '1,440000,441600,', 441600, '龙川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441623, '1,440000,441600,', 441600, '连平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:38', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441624, '1,440000,441600,', 441600, '和平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441625, '1,440000,441600,', 441600, '东源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441700, '1,440000,', 440000, '阳江市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441701, '1,440000,441700,', 441700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441702, '1,440000,441700,', 441700, '江城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441721, '1,440000,441700,', 441700, '阳西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441723, '1,440000,441700,', 441700, '阳东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441781, '1,440000,441700,', 441700, '阳春市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441800, '1,440000,', 440000, '清远市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441801, '1,440000,441800,', 441800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441802, '1,440000,441800,', 441800, '清城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441821, '1,440000,441800,', 441800, '佛冈县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441823, '1,440000,441800,', 441800, '阳山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441825, '1,440000,441800,', 441800, '连山壮族瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441826, '1,440000,441800,', 441800, '连南瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441827, '1,440000,441800,', 441800, '清新县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441881, '1,440000,441800,', 441800, '英德市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441882, '1,440000,441800,', 441800, '连州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441900, '1,440000,', 440000, '东莞市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (441901, '1,440000,441900,', 441900, '东莞市市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (442000, '1,440000,', 440000, '中山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (442001, '1,440000,442000,', 442000, '中山市市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445100, '1,440000,', 440000, '潮州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445101, '1,440000,445100,', 445100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445102, '1,440000,445100,', 445100, '湘桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445121, '1,440000,445100,', 445100, '潮安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445122, '1,440000,445100,', 445100, '饶平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445200, '1,440000,', 440000, '揭阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445201, '1,440000,445200,', 445200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445202, '1,440000,445200,', 445200, '榕城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445221, '1,440000,445200,', 445200, '揭东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445222, '1,440000,445200,', 445200, '揭西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445224, '1,440000,445200,', 445200, '惠来县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445281, '1,440000,445200,', 445200, '普宁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445300, '1,440000,', 440000, '云浮市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:39', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445301, '1,440000,445300,', 445300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445302, '1,440000,445300,', 445300, '云城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445321, '1,440000,445300,', 445300, '新兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445322, '1,440000,445300,', 445300, '郁南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445323, '1,440000,445300,', 445300, '云安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (445381, '1,440000,445300,', 445300, '罗定市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450000, '1,', 1, '广西壮族自治区', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450100, '1,450000,', 450000, '南宁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450101, '1,450000,450100,', 450100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450102, '1,450000,450100,', 450100, '兴宁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450103, '1,450000,450100,', 450100, '青秀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450105, '1,450000,450100,', 450100, '江南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450107, '1,450000,450100,', 450100, '西乡塘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450108, '1,450000,450100,', 450100, '良庆区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450109, '1,450000,450100,', 450100, '邕宁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450122, '1,450000,450100,', 450100, '武鸣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450123, '1,450000,450100,', 450100, '隆安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450124, '1,450000,450100,', 450100, '马山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450125, '1,450000,450100,', 450100, '上林县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450126, '1,450000,450100,', 450100, '宾阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450127, '1,450000,450100,', 450100, '横县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450200, '1,450000,', 450000, '柳州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450201, '1,450000,450200,', 450200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450202, '1,450000,450200,', 450200, '城中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450203, '1,450000,450200,', 450200, '鱼峰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450204, '1,450000,450200,', 450200, '柳南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450205, '1,450000,450200,', 450200, '柳北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450221, '1,450000,450200,', 450200, '柳江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450222, '1,450000,450200,', 450200, '柳城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450223, '1,450000,450200,', 450200, '鹿寨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450224, '1,450000,450200,', 450200, '融安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450225, '1,450000,450200,', 450200, '融水苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450226, '1,450000,450200,', 450200, '三江侗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450300, '1,450000,', 450000, '桂林市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450301, '1,450000,450300,', 450300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450302, '1,450000,450300,', 450300, '秀峰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450303, '1,450000,450300,', 450300, '叠彩区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450304, '1,450000,450300,', 450300, '象山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:40', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450305, '1,450000,450300,', 450300, '七星区', '', 0, 3, '', b'1', NULL, NULL, '1', '2016-12-28 16:37:58', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (450311, '1,450000,450300,', 450300, '雁山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450321, '1,450000,450300,', 450300, '阳朔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450322, '1,450000,450300,', 450300, '临桂县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450323, '1,450000,450300,', 450300, '灵川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450324, '1,450000,450300,', 450300, '全州县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450325, '1,450000,450300,', 450300, '兴安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450326, '1,450000,450300,', 450300, '永福县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450327, '1,450000,450300,', 450300, '灌阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450328, '1,450000,450300,', 450300, '龙胜各族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450329, '1,450000,450300,', 450300, '资源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450330, '1,450000,450300,', 450300, '平乐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450331, '1,450000,450300,', 450300, '荔蒲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450332, '1,450000,450300,', 450300, '恭城瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450400, '1,450000,', 450000, '梧州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450401, '1,450000,450400,', 450400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450403, '1,450000,450400,', 450400, '万秀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450404, '1,450000,450400,', 450400, '蝶山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450405, '1,450000,450400,', 450400, '长洲区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450421, '1,450000,450400,', 450400, '苍梧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450422, '1,450000,450400,', 450400, '藤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450423, '1,450000,450400,', 450400, '蒙山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450481, '1,450000,450400,', 450400, '岑溪市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450500, '1,450000,', 450000, '北海市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450501, '1,450000,450500,', 450500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450502, '1,450000,450500,', 450500, '海城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450503, '1,450000,450500,', 450500, '银海区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450512, '1,450000,450500,', 450500, '铁山港区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450521, '1,450000,450500,', 450500, '合浦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450600, '1,450000,', 450000, '防城港市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450601, '1,450000,450600,', 450600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450602, '1,450000,450600,', 450600, '港口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450603, '1,450000,450600,', 450600, '防城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450621, '1,450000,450600,', 450600, '上思县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450681, '1,450000,450600,', 450600, '东兴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450700, '1,450000,', 450000, '钦州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450701, '1,450000,450700,', 450700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:41', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450702, '1,450000,450700,', 450700, '钦南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450703, '1,450000,450700,', 450700, '钦北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450721, '1,450000,450700,', 450700, '灵山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450722, '1,450000,450700,', 450700, '浦北县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450800, '1,450000,', 450000, '贵港市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450801, '1,450000,450800,', 450800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450802, '1,450000,450800,', 450800, '港北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450803, '1,450000,450800,', 450800, '港南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450804, '1,450000,450800,', 450800, '覃塘区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450821, '1,450000,450800,', 450800, '平南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450881, '1,450000,450800,', 450800, '桂平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450900, '1,450000,', 450000, '玉林市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450901, '1,450000,450900,', 450900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450902, '1,450000,450900,', 450900, '玉州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450921, '1,450000,450900,', 450900, '容县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450922, '1,450000,450900,', 450900, '陆川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450923, '1,450000,450900,', 450900, '博白县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450924, '1,450000,450900,', 450900, '兴业县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (450981, '1,450000,450900,', 450900, '北流市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451000, '1,450000,', 450000, '百色市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451001, '1,450000,451000,', 451000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451002, '1,450000,451000,', 451000, '右江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451021, '1,450000,451000,', 451000, '田阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451022, '1,450000,451000,', 451000, '田东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451023, '1,450000,451000,', 451000, '平果县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451024, '1,450000,451000,', 451000, '德保县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451025, '1,450000,451000,', 451000, '靖西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451026, '1,450000,451000,', 451000, '那坡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451027, '1,450000,451000,', 451000, '凌云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451028, '1,450000,451000,', 451000, '乐业县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451029, '1,450000,451000,', 451000, '田林县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451030, '1,450000,451000,', 451000, '西林县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451031, '1,450000,451000,', 451000, '隆林各族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451100, '1,450000,', 450000, '贺州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451101, '1,450000,451100,', 451100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451102, '1,450000,451100,', 451100, '八步区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:42', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451121, '1,450000,451100,', 451100, '昭平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451122, '1,450000,451100,', 451100, '钟山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451123, '1,450000,451100,', 451100, '富川瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451200, '1,450000,', 450000, '河池市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451201, '1,450000,451200,', 451200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451202, '1,450000,451200,', 451200, '金城江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451221, '1,450000,451200,', 451200, '南丹县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451222, '1,450000,451200,', 451200, '天峨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451223, '1,450000,451200,', 451200, '凤山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451224, '1,450000,451200,', 451200, '东兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451225, '1,450000,451200,', 451200, '罗城仫佬族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451226, '1,450000,451200,', 451200, '环江毛南族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451227, '1,450000,451200,', 451200, '巴马瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451228, '1,450000,451200,', 451200, '都安瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451229, '1,450000,451200,', 451200, '大化瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451281, '1,450000,451200,', 451200, '宜州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451300, '1,450000,', 450000, '来宾市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451301, '1,450000,451300,', 451300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451302, '1,450000,451300,', 451300, '兴宾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451321, '1,450000,451300,', 451300, '忻城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451322, '1,450000,451300,', 451300, '象州县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451323, '1,450000,451300,', 451300, '武宣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451324, '1,450000,451300,', 451300, '金秀瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451381, '1,450000,451300,', 451300, '合山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451400, '1,450000,', 450000, '崇左市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451401, '1,450000,451400,', 451400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451402, '1,450000,451400,', 451400, '江洲区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451421, '1,450000,451400,', 451400, '扶绥县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451422, '1,450000,451400,', 451400, '宁明县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451423, '1,450000,451400,', 451400, '龙州县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451424, '1,450000,451400,', 451400, '大新县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451425, '1,450000,451400,', 451400, '天等县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (451481, '1,450000,451400,', 451400, '凭祥市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460000, '1,', 1, '海南省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460100, '1,460000,', 460000, '海口市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460101, '1,460000,460100,', 460100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460105, '1,460000,460100,', 460100, '秀英区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460106, '1,460000,460100,', 460100, '龙华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:43', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460107, '1,460000,460100,', 460100, '琼山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460108, '1,460000,460100,', 460100, '美兰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460200, '1,460000,', 460000, '三亚市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (460201, '1,460000,460200,', 460200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469000, '1,460000,', 460000, '省直辖县级行政单位', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469001, '1,460000,469000,', 469000, '五指山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469002, '1,460000,469000,', 469000, '琼海市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469003, '1,460000,469000,', 469000, '儋州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469005, '1,460000,469000,', 469000, '文昌市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469006, '1,460000,469000,', 469000, '万宁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469007, '1,460000,469000,', 469000, '东方市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469025, '1,460000,469000,', 469000, '定安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469026, '1,460000,469000,', 469000, '屯昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469027, '1,460000,469000,', 469000, '澄迈县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469028, '1,460000,469000,', 469000, '临高县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469030, '1,460000,469000,', 469000, '白沙黎族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469031, '1,460000,469000,', 469000, '昌江黎族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469033, '1,460000,469000,', 469000, '乐东黎族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469034, '1,460000,469000,', 469000, '陵水黎族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469035, '1,460000,469000,', 469000, '保亭黎族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469036, '1,460000,469000,', 469000, '琼中黎族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469037, '1,460000,469000,', 469000, '西沙群岛', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469038, '1,460000,469000,', 469000, '南沙群岛', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (469039, '1,460000,469000,', 469000, '中沙群岛的岛礁及其海域', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500000, '1,', 1, '重庆市', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500100, '1,500000,', 500000, '市辖区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500101, '1,500000,500100,', 500100, '万州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500102, '1,500000,500100,', 500100, '涪陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500103, '1,500000,500100,', 500100, '渝中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500104, '1,500000,500100,', 500100, '大渡口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500105, '1,500000,500100,', 500100, '江北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500106, '1,500000,500100,', 500100, '沙坪坝区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500107, '1,500000,500100,', 500100, '九龙坡区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500108, '1,500000,500100,', 500100, '南岸区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500109, '1,500000,500100,', 500100, '北碚区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500110, '1,500000,500100,', 500100, '万盛区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500111, '1,500000,500100,', 500100, '双桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500112, '1,500000,500100,', 500100, '渝北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500113, '1,500000,500100,', 500100, '巴南区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500114, '1,500000,500100,', 500100, '黔江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:44', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500115, '1,500000,500100,', 500100, '长寿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500116, '1,500000,500100,', 500100, '江津区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500117, '1,500000,500100,', 500100, '合川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500118, '1,500000,500100,', 500100, '永川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500119, '1,500000,500100,', 500100, '南川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500200, '1,500000,', 500000, '县', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500222, '1,500000,500200,', 500200, '綦江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500223, '1,500000,500200,', 500200, '潼南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500224, '1,500000,500200,', 500200, '铜梁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500225, '1,500000,500200,', 500200, '大足县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500226, '1,500000,500200,', 500200, '荣昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500227, '1,500000,500200,', 500200, '璧山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500228, '1,500000,500200,', 500200, '梁平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500229, '1,500000,500200,', 500200, '城口县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500230, '1,500000,500200,', 500200, '丰都县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500231, '1,500000,500200,', 500200, '垫江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500232, '1,500000,500200,', 500200, '武隆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500233, '1,500000,500200,', 500200, '忠县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500234, '1,500000,500200,', 500200, '开县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500235, '1,500000,500200,', 500200, '云阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500236, '1,500000,500200,', 500200, '奉节县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500237, '1,500000,500200,', 500200, '巫山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500238, '1,500000,500200,', 500200, '巫溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500240, '1,500000,500200,', 500200, '石柱土家族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500241, '1,500000,500200,', 500200, '秀山土家族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500242, '1,500000,500200,', 500200, '酉阳土家族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (500243, '1,500000,500200,', 500200, '彭水苗族土家族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510000, '1,', 1, '四川省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510100, '1,510000,', 510000, '成都市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:45', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510101, '1,510000,510100,', 510100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510104, '1,510000,510100,', 510100, '锦江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510105, '1,510000,510100,', 510100, '青羊区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510106, '1,510000,510100,', 510100, '金牛区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510107, '1,510000,510100,', 510100, '武侯区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510108, '1,510000,510100,', 510100, '成华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510112, '1,510000,510100,', 510100, '龙泉驿区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510113, '1,510000,510100,', 510100, '青白江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510114, '1,510000,510100,', 510100, '新都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510115, '1,510000,510100,', 510100, '温江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510121, '1,510000,510100,', 510100, '金堂县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510122, '1,510000,510100,', 510100, '双流县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510124, '1,510000,510100,', 510100, '郫县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510129, '1,510000,510100,', 510100, '大邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510131, '1,510000,510100,', 510100, '蒲江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510132, '1,510000,510100,', 510100, '新津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510181, '1,510000,510100,', 510100, '都江堰市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510182, '1,510000,510100,', 510100, '彭州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510183, '1,510000,510100,', 510100, '邛崃市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510184, '1,510000,510100,', 510100, '崇州市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510300, '1,510000,', 510000, '自贡市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510301, '1,510000,510300,', 510300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510302, '1,510000,510300,', 510300, '自流井区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510303, '1,510000,510300,', 510300, '贡井区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510304, '1,510000,510300,', 510300, '大安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510311, '1,510000,510300,', 510300, '沿滩区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510321, '1,510000,510300,', 510300, '荣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510322, '1,510000,510300,', 510300, '富顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510400, '1,510000,', 510000, '攀枝花市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510401, '1,510000,510400,', 510400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510402, '1,510000,510400,', 510400, '东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510403, '1,510000,510400,', 510400, '西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510411, '1,510000,510400,', 510400, '仁和区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510421, '1,510000,510400,', 510400, '米易县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510422, '1,510000,510400,', 510400, '盐边县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510500, '1,510000,', 510000, '泸州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510501, '1,510000,510500,', 510500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510502, '1,510000,510500,', 510500, '江阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510503, '1,510000,510500,', 510500, '纳溪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510504, '1,510000,510500,', 510500, '龙马潭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:46', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510521, '1,510000,510500,', 510500, '泸县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510522, '1,510000,510500,', 510500, '合江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510524, '1,510000,510500,', 510500, '叙永县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510525, '1,510000,510500,', 510500, '古蔺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510600, '1,510000,', 510000, '德阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510601, '1,510000,510600,', 510600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510603, '1,510000,510600,', 510600, '旌阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510623, '1,510000,510600,', 510600, '中江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510626, '1,510000,510600,', 510600, '罗江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510681, '1,510000,510600,', 510600, '广汉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510682, '1,510000,510600,', 510600, '什邡市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510683, '1,510000,510600,', 510600, '绵竹市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510700, '1,510000,', 510000, '绵阳市', '', 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 2);
INSERT INTO `sys_area_t` VALUES (510701, '1,510000,510700,', 510700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510703, '1,510000,510700,', 510700, '涪城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510704, '1,510000,510700,', 510700, '游仙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510722, '1,510000,510700,', 510700, '三台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510723, '1,510000,510700,', 510700, '盐亭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510724, '1,510000,510700,', 510700, '安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510725, '1,510000,510700,', 510700, '梓潼县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510726, '1,510000,510700,', 510700, '北川羌族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510727, '1,510000,510700,', 510700, '平武县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510781, '1,510000,510700,', 510700, '江油市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510800, '1,510000,', 510000, '广元市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510801, '1,510000,510800,', 510800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510802, '1,510000,510800,', 510800, '市中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510811, '1,510000,510800,', 510800, '元坝区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510812, '1,510000,510800,', 510800, '朝天区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510821, '1,510000,510800,', 510800, '旺苍县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510822, '1,510000,510800,', 510800, '青川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510823, '1,510000,510800,', 510800, '剑阁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510824, '1,510000,510800,', 510800, '苍溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510900, '1,510000,', 510000, '遂宁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510901, '1,510000,510900,', 510900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510903, '1,510000,510900,', 510900, '船山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510904, '1,510000,510900,', 510900, '安居区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:47', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510921, '1,510000,510900,', 510900, '蓬溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510922, '1,510000,510900,', 510900, '射洪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (510923, '1,510000,510900,', 510900, '大英县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511000, '1,510000,', 510000, '内江市', '', 0, 2, '', b'0', NULL, NULL, '1', '2017-03-02 23:21:42', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (511001, '1,510000,511000,', 511000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511002, '1,510000,511000,', 511000, '市中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511011, '1,510000,511000,', 511000, '东兴区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511024, '1,510000,511000,', 511000, '威远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511025, '1,510000,511000,', 511000, '资中县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511028, '1,510000,511000,', 511000, '隆昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511100, '1,510000,', 510000, '乐山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511101, '1,510000,511100,', 511100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511102, '1,510000,511100,', 511100, '市中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511111, '1,510000,511100,', 511100, '沙湾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511112, '1,510000,511100,', 511100, '五通桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511113, '1,510000,511100,', 511100, '金口河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511123, '1,510000,511100,', 511100, '犍为县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511124, '1,510000,511100,', 511100, '井研县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511126, '1,510000,511100,', 511100, '夹江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511129, '1,510000,511100,', 511100, '沐川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511132, '1,510000,511100,', 511100, '峨边彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511133, '1,510000,511100,', 511100, '马边彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511181, '1,510000,511100,', 511100, '峨眉山市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511300, '1,510000,', 510000, '南充市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511301, '1,510000,511300,', 511300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511302, '1,510000,511300,', 511300, '顺庆区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511303, '1,510000,511300,', 511300, '高坪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511304, '1,510000,511300,', 511300, '嘉陵区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511321, '1,510000,511300,', 511300, '南部县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511322, '1,510000,511300,', 511300, '营山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511323, '1,510000,511300,', 511300, '蓬安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511324, '1,510000,511300,', 511300, '仪陇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511325, '1,510000,511300,', 511300, '西充县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511381, '1,510000,511300,', 511300, '阆中市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511400, '1,510000,', 510000, '眉山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511401, '1,510000,511400,', 511400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511402, '1,510000,511400,', 511400, '东坡区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511421, '1,510000,511400,', 511400, '仁寿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511422, '1,510000,511400,', 511400, '彭山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511423, '1,510000,511400,', 511400, '洪雅县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511424, '1,510000,511400,', 511400, '丹棱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511425, '1,510000,511400,', 511400, '青神县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:48', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511500, '1,510000,', 510000, '宜宾市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511501, '1,510000,511500,', 511500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511502, '1,510000,511500,', 511500, '翠屏区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511521, '1,510000,511500,', 511500, '宜宾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511522, '1,510000,511500,', 511500, '南溪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511523, '1,510000,511500,', 511500, '江安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511524, '1,510000,511500,', 511500, '长宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511525, '1,510000,511500,', 511500, '高县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511526, '1,510000,511500,', 511500, '珙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511527, '1,510000,511500,', 511500, '筠连县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511528, '1,510000,511500,', 511500, '兴文县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511529, '1,510000,511500,', 511500, '屏山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511600, '1,510000,', 510000, '广安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511601, '1,510000,511600,', 511600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511602, '1,510000,511600,', 511600, '广安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511621, '1,510000,511600,', 511600, '岳池县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511622, '1,510000,511600,', 511600, '武胜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511623, '1,510000,511600,', 511600, '邻水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511681, '1,510000,511600,', 511600, '华蓥市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511700, '1,510000,', 510000, '达州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511701, '1,510000,511700,', 511700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511702, '1,510000,511700,', 511700, '通川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511721, '1,510000,511700,', 511700, '达县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511722, '1,510000,511700,', 511700, '宣汉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511723, '1,510000,511700,', 511700, '开江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511724, '1,510000,511700,', 511700, '大竹县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511725, '1,510000,511700,', 511700, '渠县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511781, '1,510000,511700,', 511700, '万源市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511800, '1,510000,', 510000, '雅安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511801, '1,510000,511800,', 511800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511802, '1,510000,511800,', 511800, '雨城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511821, '1,510000,511800,', 511800, '名山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511822, '1,510000,511800,', 511800, '荥经县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511823, '1,510000,511800,', 511800, '汉源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511824, '1,510000,511800,', 511800, '石棉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511825, '1,510000,511800,', 511800, '天全县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511826, '1,510000,511800,', 511800, '芦山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511827, '1,510000,511800,', 511800, '宝兴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511900, '1,510000,', 510000, '巴中市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:49', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511901, '1,510000,511900,', 511900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511902, '1,510000,511900,', 511900, '巴州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511921, '1,510000,511900,', 511900, '通江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511922, '1,510000,511900,', 511900, '南江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (511923, '1,510000,511900,', 511900, '平昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (512000, '1,510000,', 510000, '资阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (512001, '1,510000,512000,', 512000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (512002, '1,510000,512000,', 512000, '雁江区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (512021, '1,510000,512000,', 512000, '安岳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (512022, '1,510000,512000,', 512000, '乐至县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (512081, '1,510000,512000,', 512000, '简阳市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513200, '1,510000,', 510000, '阿坝藏族羌族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513221, '1,510000,513200,', 513200, '汶川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513222, '1,510000,513200,', 513200, '理县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513223, '1,510000,513200,', 513200, '茂县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513224, '1,510000,513200,', 513200, '松潘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513225, '1,510000,513200,', 513200, '九寨沟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513226, '1,510000,513200,', 513200, '金川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513227, '1,510000,513200,', 513200, '小金县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513228, '1,510000,513200,', 513200, '黑水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513229, '1,510000,513200,', 513200, '马尔康县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513230, '1,510000,513200,', 513200, '壤塘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513231, '1,510000,513200,', 513200, '阿坝县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513232, '1,510000,513200,', 513200, '若尔盖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513233, '1,510000,513200,', 513200, '红原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513300, '1,510000,', 510000, '甘孜藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513321, '1,510000,513300,', 513300, '康定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513322, '1,510000,513300,', 513300, '泸定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513323, '1,510000,513300,', 513300, '丹巴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513324, '1,510000,513300,', 513300, '九龙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513325, '1,510000,513300,', 513300, '雅江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513326, '1,510000,513300,', 513300, '道孚县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513327, '1,510000,513300,', 513300, '炉霍县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513328, '1,510000,513300,', 513300, '甘孜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513329, '1,510000,513300,', 513300, '新龙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513330, '1,510000,513300,', 513300, '德格县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513331, '1,510000,513300,', 513300, '白玉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513332, '1,510000,513300,', 513300, '石渠县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513333, '1,510000,513300,', 513300, '色达县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513334, '1,510000,513300,', 513300, '理塘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513335, '1,510000,513300,', 513300, '巴塘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:50', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513336, '1,510000,513300,', 513300, '乡城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513337, '1,510000,513300,', 513300, '稻城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513338, '1,510000,513300,', 513300, '得荣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513400, '1,510000,', 510000, '凉山彝族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513401, '1,510000,513400,', 513400, '西昌市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513422, '1,510000,513400,', 513400, '木里藏族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513423, '1,510000,513400,', 513400, '盐源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513424, '1,510000,513400,', 513400, '德昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513425, '1,510000,513400,', 513400, '会理县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513426, '1,510000,513400,', 513400, '会东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513427, '1,510000,513400,', 513400, '宁南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513428, '1,510000,513400,', 513400, '普格县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513429, '1,510000,513400,', 513400, '布拖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513430, '1,510000,513400,', 513400, '金阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513431, '1,510000,513400,', 513400, '昭觉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513432, '1,510000,513400,', 513400, '喜德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513433, '1,510000,513400,', 513400, '冕宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513434, '1,510000,513400,', 513400, '越西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513435, '1,510000,513400,', 513400, '甘洛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513436, '1,510000,513400,', 513400, '美姑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (513437, '1,510000,513400,', 513400, '雷波县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520000, '1,', 1, '贵州省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520100, '1,520000,', 520000, '贵阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520101, '1,520000,520100,', 520100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520102, '1,520000,520100,', 520100, '南明区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520103, '1,520000,520100,', 520100, '云岩区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520111, '1,520000,520100,', 520100, '花溪区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520112, '1,520000,520100,', 520100, '乌当区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520113, '1,520000,520100,', 520100, '白云区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520114, '1,520000,520100,', 520100, '小河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520121, '1,520000,520100,', 520100, '开阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520122, '1,520000,520100,', 520100, '息烽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520123, '1,520000,520100,', 520100, '修文县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520181, '1,520000,520100,', 520100, '清镇市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520200, '1,520000,', 520000, '六盘水市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520201, '1,520000,520200,', 520200, '钟山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520203, '1,520000,520200,', 520200, '六枝特区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520221, '1,520000,520200,', 520200, '水城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520222, '1,520000,520200,', 520200, '盘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520300, '1,520000,', 520000, '遵义市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:51', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520301, '1,520000,520300,', 520300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520302, '1,520000,520300,', 520300, '红花岗区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520303, '1,520000,520300,', 520300, '汇川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520321, '1,520000,520300,', 520300, '遵义县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520322, '1,520000,520300,', 520300, '桐梓县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520323, '1,520000,520300,', 520300, '绥阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520324, '1,520000,520300,', 520300, '正安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520325, '1,520000,520300,', 520300, '道真仡佬族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520326, '1,520000,520300,', 520300, '务川仡佬族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520327, '1,520000,520300,', 520300, '凤冈县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520328, '1,520000,520300,', 520300, '湄潭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520329, '1,520000,520300,', 520300, '余庆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520330, '1,520000,520300,', 520300, '习水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520381, '1,520000,520300,', 520300, '赤水市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520382, '1,520000,520300,', 520300, '仁怀市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520400, '1,520000,', 520000, '安顺市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520401, '1,520000,520400,', 520400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520402, '1,520000,520400,', 520400, '西秀区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520421, '1,520000,520400,', 520400, '平坝县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520422, '1,520000,520400,', 520400, '普定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520423, '1,520000,520400,', 520400, '镇宁布依族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520424, '1,520000,520400,', 520400, '关岭布依族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (520425, '1,520000,520400,', 520400, '紫云苗族布依族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522200, '1,520000,', 520000, '铜仁地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522201, '1,520000,522200,', 522200, '铜仁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522222, '1,520000,522200,', 522200, '江口县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522223, '1,520000,522200,', 522200, '玉屏侗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522224, '1,520000,522200,', 522200, '石阡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522225, '1,520000,522200,', 522200, '思南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522226, '1,520000,522200,', 522200, '印江土家族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522227, '1,520000,522200,', 522200, '德江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522228, '1,520000,522200,', 522200, '沿河土家族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522229, '1,520000,522200,', 522200, '松桃苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522230, '1,520000,522200,', 522200, '万山特区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522300, '1,520000,', 520000, '黔西南布依族苗族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522301, '1,520000,522300,', 522300, '兴义市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522322, '1,520000,522300,', 522300, '兴仁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522323, '1,520000,522300,', 522300, '普安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522324, '1,520000,522300,', 522300, '晴隆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522325, '1,520000,522300,', 522300, '贞丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:52', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522326, '1,520000,522300,', 522300, '望谟县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522327, '1,520000,522300,', 522300, '册亨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522328, '1,520000,522300,', 522300, '安龙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522400, '1,520000,', 520000, '毕节地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522401, '1,520000,522400,', 522400, '毕节市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522422, '1,520000,522400,', 522400, '大方县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522423, '1,520000,522400,', 522400, '黔西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522424, '1,520000,522400,', 522400, '金沙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522425, '1,520000,522400,', 522400, '织金县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522426, '1,520000,522400,', 522400, '纳雍县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522427, '1,520000,522400,', 522400, '威宁彝族回族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522428, '1,520000,522400,', 522400, '赫章县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522600, '1,520000,', 520000, '黔东南苗族侗族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522601, '1,520000,522600,', 522600, '凯里市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522622, '1,520000,522600,', 522600, '黄平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522623, '1,520000,522600,', 522600, '施秉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522624, '1,520000,522600,', 522600, '三穗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522625, '1,520000,522600,', 522600, '镇远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522626, '1,520000,522600,', 522600, '岑巩县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522627, '1,520000,522600,', 522600, '天柱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522628, '1,520000,522600,', 522600, '锦屏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522629, '1,520000,522600,', 522600, '剑河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522630, '1,520000,522600,', 522600, '台江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522631, '1,520000,522600,', 522600, '黎平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522632, '1,520000,522600,', 522600, '榕江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522633, '1,520000,522600,', 522600, '从江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522634, '1,520000,522600,', 522600, '雷山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522635, '1,520000,522600,', 522600, '麻江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522636, '1,520000,522600,', 522600, '丹寨县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522700, '1,520000,', 520000, '黔南布依族苗族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522701, '1,520000,522700,', 522700, '都匀市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522702, '1,520000,522700,', 522700, '福泉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522722, '1,520000,522700,', 522700, '荔波县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522723, '1,520000,522700,', 522700, '贵定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522725, '1,520000,522700,', 522700, '瓮安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522726, '1,520000,522700,', 522700, '独山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522727, '1,520000,522700,', 522700, '平塘县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522728, '1,520000,522700,', 522700, '罗甸县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522729, '1,520000,522700,', 522700, '长顺县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522730, '1,520000,522700,', 522700, '龙里县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522731, '1,520000,522700,', 522700, '惠水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (522732, '1,520000,522700,', 522700, '三都水族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530000, '1,', 1, '云南省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:53', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530100, '1,530000,', 530000, '昆明市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530101, '1,530000,530100,', 530100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530102, '1,530000,530100,', 530100, '五华区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530103, '1,530000,530100,', 530100, '盘龙区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530111, '1,530000,530100,', 530100, '官渡区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530112, '1,530000,530100,', 530100, '西山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530113, '1,530000,530100,', 530100, '东川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530121, '1,530000,530100,', 530100, '呈贡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530122, '1,530000,530100,', 530100, '晋宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530124, '1,530000,530100,', 530100, '富民县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530125, '1,530000,530100,', 530100, '宜良县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530126, '1,530000,530100,', 530100, '石林彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530127, '1,530000,530100,', 530100, '嵩明县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530128, '1,530000,530100,', 530100, '禄劝彝族苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530129, '1,530000,530100,', 530100, '寻甸回族彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530181, '1,530000,530100,', 530100, '安宁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530300, '1,530000,', 530000, '曲靖市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530301, '1,530000,530300,', 530300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530302, '1,530000,530300,', 530300, '麒麟区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530321, '1,530000,530300,', 530300, '马龙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530322, '1,530000,530300,', 530300, '陆良县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530323, '1,530000,530300,', 530300, '师宗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530324, '1,530000,530300,', 530300, '罗平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530325, '1,530000,530300,', 530300, '富源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530326, '1,530000,530300,', 530300, '会泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530328, '1,530000,530300,', 530300, '沾益县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530381, '1,530000,530300,', 530300, '宣威市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530400, '1,530000,', 530000, '玉溪市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530401, '1,530000,530400,', 530400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530402, '1,530000,530400,', 530400, '红塔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530421, '1,530000,530400,', 530400, '江川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530422, '1,530000,530400,', 530400, '澄江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530423, '1,530000,530400,', 530400, '通海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530424, '1,530000,530400,', 530400, '华宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530425, '1,530000,530400,', 530400, '易门县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530426, '1,530000,530400,', 530400, '峨山彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530427, '1,530000,530400,', 530400, '新平彝族傣族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530428, '1,530000,530400,', 530400, '元江哈尼族彝族傣族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530500, '1,530000,', 530000, '保山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530501, '1,530000,530500,', 530500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530502, '1,530000,530500,', 530500, '隆阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530521, '1,530000,530500,', 530500, '施甸县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:54', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530522, '1,530000,530500,', 530500, '腾冲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530523, '1,530000,530500,', 530500, '龙陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530524, '1,530000,530500,', 530500, '昌宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530600, '1,530000,', 530000, '昭通市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530601, '1,530000,530600,', 530600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530602, '1,530000,530600,', 530600, '昭阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530621, '1,530000,530600,', 530600, '鲁甸县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530622, '1,530000,530600,', 530600, '巧家县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530623, '1,530000,530600,', 530600, '盐津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530624, '1,530000,530600,', 530600, '大关县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530625, '1,530000,530600,', 530600, '永善县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530626, '1,530000,530600,', 530600, '绥江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530627, '1,530000,530600,', 530600, '镇雄县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530628, '1,530000,530600,', 530600, '彝良县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530629, '1,530000,530600,', 530600, '威信县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530630, '1,530000,530600,', 530600, '水富县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530700, '1,530000,', 530000, '丽江市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530701, '1,530000,530700,', 530700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530702, '1,530000,530700,', 530700, '古城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530721, '1,530000,530700,', 530700, '玉龙纳西族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530722, '1,530000,530700,', 530700, '永胜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530723, '1,530000,530700,', 530700, '华坪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530724, '1,530000,530700,', 530700, '宁蒗彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530800, '1,530000,', 530000, '思茅市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530801, '1,530000,530800,', 530800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530802, '1,530000,530800,', 530800, '翠云区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530821, '1,530000,530800,', 530800, '普洱哈尼族彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530822, '1,530000,530800,', 530800, '墨江哈尼族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530823, '1,530000,530800,', 530800, '景东彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530824, '1,530000,530800,', 530800, '景谷傣族彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530825, '1,530000,530800,', 530800, '镇沅彝族哈尼族拉祜族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530826, '1,530000,530800,', 530800, '江城哈尼族彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530827, '1,530000,530800,', 530800, '孟连傣族拉祜族佤族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530828, '1,530000,530800,', 530800, '澜沧拉祜族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530829, '1,530000,530800,', 530800, '西盟佤族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530900, '1,530000,', 530000, '临沧市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530901, '1,530000,530900,', 530900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530902, '1,530000,530900,', 530900, '临翔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530921, '1,530000,530900,', 530900, '凤庆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530922, '1,530000,530900,', 530900, '云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:55', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530923, '1,530000,530900,', 530900, '永德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530924, '1,530000,530900,', 530900, '镇康县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530925, '1,530000,530900,', 530900, '双江拉祜族佤族布朗族傣族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530926, '1,530000,530900,', 530900, '耿马傣族佤族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (530927, '1,530000,530900,', 530900, '沧源佤族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532300, '1,530000,', 530000, '楚雄彝族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532301, '1,530000,532300,', 532300, '楚雄市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532322, '1,530000,532300,', 532300, '双柏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532323, '1,530000,532300,', 532300, '牟定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532324, '1,530000,532300,', 532300, '南华县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532325, '1,530000,532300,', 532300, '姚安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532326, '1,530000,532300,', 532300, '大姚县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532327, '1,530000,532300,', 532300, '永仁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532328, '1,530000,532300,', 532300, '元谋县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532329, '1,530000,532300,', 532300, '武定县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532331, '1,530000,532300,', 532300, '禄丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532500, '1,530000,', 530000, '红河哈尼族彝族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532501, '1,530000,532500,', 532500, '个旧市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532502, '1,530000,532500,', 532500, '开远市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532522, '1,530000,532500,', 532500, '蒙自县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532523, '1,530000,532500,', 532500, '屏边苗族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532524, '1,530000,532500,', 532500, '建水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532525, '1,530000,532500,', 532500, '石屏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532526, '1,530000,532500,', 532500, '弥勒县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532527, '1,530000,532500,', 532500, '泸西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532528, '1,530000,532500,', 532500, '元阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532529, '1,530000,532500,', 532500, '红河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532530, '1,530000,532500,', 532500, '金平苗族瑶族傣族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532531, '1,530000,532500,', 532500, '绿春县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532532, '1,530000,532500,', 532500, '河口瑶族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532600, '1,530000,', 530000, '文山壮族苗族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532621, '1,530000,532600,', 532600, '文山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532622, '1,530000,532600,', 532600, '砚山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532623, '1,530000,532600,', 532600, '西畴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532624, '1,530000,532600,', 532600, '麻栗坡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532625, '1,530000,532600,', 532600, '马关县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532626, '1,530000,532600,', 532600, '丘北县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532627, '1,530000,532600,', 532600, '广南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532628, '1,530000,532600,', 532600, '富宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532800, '1,530000,', 530000, '西双版纳傣族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532801, '1,530000,532800,', 532800, '景洪市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532822, '1,530000,532800,', 532800, '勐海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:56', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532823, '1,530000,532800,', 532800, '勐腊县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532900, '1,530000,', 530000, '大理白族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532901, '1,530000,532900,', 532900, '大理市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532922, '1,530000,532900,', 532900, '漾濞彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532923, '1,530000,532900,', 532900, '祥云县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532924, '1,530000,532900,', 532900, '宾川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532925, '1,530000,532900,', 532900, '弥渡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532926, '1,530000,532900,', 532900, '南涧彝族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532927, '1,530000,532900,', 532900, '巍山彝族回族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532928, '1,530000,532900,', 532900, '永平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532929, '1,530000,532900,', 532900, '云龙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532930, '1,530000,532900,', 532900, '洱源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532931, '1,530000,532900,', 532900, '剑川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (532932, '1,530000,532900,', 532900, '鹤庆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533100, '1,530000,', 530000, '德宏傣族景颇族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533102, '1,530000,533100,', 533100, '瑞丽市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533103, '1,530000,533100,', 533100, '潞西市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533122, '1,530000,533100,', 533100, '梁河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533123, '1,530000,533100,', 533100, '盈江县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533124, '1,530000,533100,', 533100, '陇川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533300, '1,530000,', 530000, '怒江傈僳族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533321, '1,530000,533300,', 533300, '泸水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533323, '1,530000,533300,', 533300, '福贡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533324, '1,530000,533300,', 533300, '贡山独龙族怒族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533325, '1,530000,533300,', 533300, '兰坪白族普米族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533400, '1,530000,', 530000, '迪庆藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533421, '1,530000,533400,', 533400, '香格里拉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533422, '1,530000,533400,', 533400, '德钦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (533423, '1,530000,533400,', 533400, '维西傈僳族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540000, '1,', 1, '西藏自治区', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540100, '1,540000,', 540000, '拉萨市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540101, '1,540000,540100,', 540100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540102, '1,540000,540100,', 540100, '城关区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540121, '1,540000,540100,', 540100, '林周县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540122, '1,540000,540100,', 540100, '当雄县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540123, '1,540000,540100,', 540100, '尼木县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540124, '1,540000,540100,', 540100, '曲水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540125, '1,540000,540100,', 540100, '堆龙德庆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540126, '1,540000,540100,', 540100, '达孜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (540127, '1,540000,540100,', 540100, '墨竹工卡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542100, '1,540000,', 540000, '昌都地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542121, '1,540000,542100,', 542100, '昌都县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542122, '1,540000,542100,', 542100, '江达县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:57', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542123, '1,540000,542100,', 542100, '贡觉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542124, '1,540000,542100,', 542100, '类乌齐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542125, '1,540000,542100,', 542100, '丁青县', '', 0, 3, '', b'1', NULL, NULL, '1', '2016-12-29 13:33:18', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (542126, '1,540000,542100,', 542100, '察雅县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542127, '1,540000,542100,', 542100, '八宿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542128, '1,540000,542100,', 542100, '左贡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542129, '1,540000,542100,', 542100, '芒康县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542132, '1,540000,542100,', 542100, '洛隆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542133, '1,540000,542100,', 542100, '边坝县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542200, '1,540000,', 540000, '山南地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542221, '1,540000,542200,', 542200, '乃东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542222, '1,540000,542200,', 542200, '扎囊县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542223, '1,540000,542200,', 542200, '贡嘎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542224, '1,540000,542200,', 542200, '桑日县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542225, '1,540000,542200,', 542200, '琼结县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542226, '1,540000,542200,', 542200, '曲松县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542227, '1,540000,542200,', 542200, '措美县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542228, '1,540000,542200,', 542200, '洛扎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542229, '1,540000,542200,', 542200, '加查县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542231, '1,540000,542200,', 542200, '隆子县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542232, '1,540000,542200,', 542200, '错那县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542233, '1,540000,542200,', 542200, '浪卡子县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542300, '1,540000,', 540000, '日喀则地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542301, '1,540000,542300,', 542300, '日喀则市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542322, '1,540000,542300,', 542300, '南木林县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542323, '1,540000,542300,', 542300, '江孜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542324, '1,540000,542300,', 542300, '定日县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542325, '1,540000,542300,', 542300, '萨迦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542326, '1,540000,542300,', 542300, '拉孜县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542327, '1,540000,542300,', 542300, '昂仁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542328, '1,540000,542300,', 542300, '谢通门县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542329, '1,540000,542300,', 542300, '白朗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542330, '1,540000,542300,', 542300, '仁布县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542331, '1,540000,542300,', 542300, '康马县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542332, '1,540000,542300,', 542300, '定结县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542333, '1,540000,542300,', 542300, '仲巴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542334, '1,540000,542300,', 542300, '亚东县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542335, '1,540000,542300,', 542300, '吉隆县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542336, '1,540000,542300,', 542300, '聂拉木县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542337, '1,540000,542300,', 542300, '萨嘎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542338, '1,540000,542300,', 542300, '岗巴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542400, '1,540000,', 540000, '那曲地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542421, '1,540000,542400,', 542400, '那曲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:58', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542422, '1,540000,542400,', 542400, '嘉黎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542423, '1,540000,542400,', 542400, '比如县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542424, '1,540000,542400,', 542400, '聂荣县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542425, '1,540000,542400,', 542400, '安多县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542426, '1,540000,542400,', 542400, '申扎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542427, '1,540000,542400,', 542400, '索县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542428, '1,540000,542400,', 542400, '班戈县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542429, '1,540000,542400,', 542400, '巴青县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542430, '1,540000,542400,', 542400, '尼玛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542500, '1,540000,', 540000, '阿里地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542521, '1,540000,542500,', 542500, '普兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542522, '1,540000,542500,', 542500, '札达县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542523, '1,540000,542500,', 542500, '噶尔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542524, '1,540000,542500,', 542500, '日土县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542525, '1,540000,542500,', 542500, '革吉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542526, '1,540000,542500,', 542500, '改则县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542527, '1,540000,542500,', 542500, '措勤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542600, '1,540000,', 540000, '林芝地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542621, '1,540000,542600,', 542600, '林芝县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542622, '1,540000,542600,', 542600, '工布江达县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542623, '1,540000,542600,', 542600, '米林县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542624, '1,540000,542600,', 542600, '墨脱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542625, '1,540000,542600,', 542600, '波密县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542626, '1,540000,542600,', 542600, '察隅县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (542627, '1,540000,542600,', 542600, '朗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610000, '1,', 1, '陕西省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610100, '1,610000,', 610000, '西安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610101, '1,610000,610100,', 610100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610102, '1,610000,610100,', 610100, '新城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610103, '1,610000,610100,', 610100, '碑林区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610104, '1,610000,610100,', 610100, '莲湖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610111, '1,610000,610100,', 610100, '灞桥区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610112, '1,610000,610100,', 610100, '未央区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610113, '1,610000,610100,', 610100, '雁塔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610114, '1,610000,610100,', 610100, '阎良区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610115, '1,610000,610100,', 610100, '临潼区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610116, '1,610000,610100,', 610100, '长安区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610122, '1,610000,610100,', 610100, '蓝田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 14:59:59', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610124, '1,610000,610100,', 610100, '周至县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610125, '1,610000,610100,', 610100, '户县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610126, '1,610000,610100,', 610100, '高陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610200, '1,610000,', 610000, '铜川市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610201, '1,610000,610200,', 610200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610202, '1,610000,610200,', 610200, '王益区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610203, '1,610000,610200,', 610200, '印台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610204, '1,610000,610200,', 610200, '耀州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610222, '1,610000,610200,', 610200, '宜君县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610300, '1,610000,', 610000, '宝鸡市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610301, '1,610000,610300,', 610300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610302, '1,610000,610300,', 610300, '渭滨区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610303, '1,610000,610300,', 610300, '金台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610304, '1,610000,610300,', 610300, '陈仓区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610322, '1,610000,610300,', 610300, '凤翔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610323, '1,610000,610300,', 610300, '岐山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610324, '1,610000,610300,', 610300, '扶风县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610326, '1,610000,610300,', 610300, '眉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610327, '1,610000,610300,', 610300, '陇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610328, '1,610000,610300,', 610300, '千阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610329, '1,610000,610300,', 610300, '麟游县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610330, '1,610000,610300,', 610300, '凤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610331, '1,610000,610300,', 610300, '太白县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610400, '1,610000,', 610000, '咸阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610401, '1,610000,610400,', 610400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610402, '1,610000,610400,', 610400, '秦都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610403, '1,610000,610400,', 610400, '杨凌区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610404, '1,610000,610400,', 610400, '渭城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610422, '1,610000,610400,', 610400, '三原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610423, '1,610000,610400,', 610400, '泾阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610424, '1,610000,610400,', 610400, '乾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610425, '1,610000,610400,', 610400, '礼泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610426, '1,610000,610400,', 610400, '永寿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:00', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610427, '1,610000,610400,', 610400, '彬县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610428, '1,610000,610400,', 610400, '长武县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610429, '1,610000,610400,', 610400, '旬邑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610430, '1,610000,610400,', 610400, '淳化县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610431, '1,610000,610400,', 610400, '武功县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610481, '1,610000,610400,', 610400, '兴平市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610500, '1,610000,', 610000, '渭南市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610501, '1,610000,610500,', 610500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610502, '1,610000,610500,', 610500, '临渭区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610521, '1,610000,610500,', 610500, '华县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610522, '1,610000,610500,', 610500, '潼关县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610523, '1,610000,610500,', 610500, '大荔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610524, '1,610000,610500,', 610500, '合阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610525, '1,610000,610500,', 610500, '澄城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610526, '1,610000,610500,', 610500, '蒲城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610527, '1,610000,610500,', 610500, '白水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610528, '1,610000,610500,', 610500, '富平县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610581, '1,610000,610500,', 610500, '韩城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610582, '1,610000,610500,', 610500, '华阴市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610600, '1,610000,', 610000, '延安市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610601, '1,610000,610600,', 610600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610602, '1,610000,610600,', 610600, '宝塔区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610621, '1,610000,610600,', 610600, '延长县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610622, '1,610000,610600,', 610600, '延川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610623, '1,610000,610600,', 610600, '子长县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610624, '1,610000,610600,', 610600, '安塞县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610625, '1,610000,610600,', 610600, '志丹县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610626, '1,610000,610600,', 610600, '吴起县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610627, '1,610000,610600,', 610600, '甘泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610628, '1,610000,610600,', 610600, '富县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610629, '1,610000,610600,', 610600, '洛川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610630, '1,610000,610600,', 610600, '宜川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610631, '1,610000,610600,', 610600, '黄龙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610632, '1,610000,610600,', 610600, '黄陵县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610700, '1,610000,', 610000, '汉中市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610701, '1,610000,610700,', 610700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610702, '1,610000,610700,', 610700, '汉台区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610721, '1,610000,610700,', 610700, '南郑县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:01', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610722, '1,610000,610700,', 610700, '城固县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610723, '1,610000,610700,', 610700, '洋县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610724, '1,610000,610700,', 610700, '西乡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610725, '1,610000,610700,', 610700, '勉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610726, '1,610000,610700,', 610700, '宁强县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610727, '1,610000,610700,', 610700, '略阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610728, '1,610000,610700,', 610700, '镇巴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610729, '1,610000,610700,', 610700, '留坝县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610730, '1,610000,610700,', 610700, '佛坪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610800, '1,610000,', 610000, '榆林市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610801, '1,610000,610800,', 610800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610802, '1,610000,610800,', 610800, '榆阳区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610821, '1,610000,610800,', 610800, '神木县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610822, '1,610000,610800,', 610800, '府谷县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610823, '1,610000,610800,', 610800, '横山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610824, '1,610000,610800,', 610800, '靖边县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610825, '1,610000,610800,', 610800, '定边县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610826, '1,610000,610800,', 610800, '绥德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610827, '1,610000,610800,', 610800, '米脂县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610828, '1,610000,610800,', 610800, '佳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610829, '1,610000,610800,', 610800, '吴堡县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610830, '1,610000,610800,', 610800, '清涧县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610831, '1,610000,610800,', 610800, '子洲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610900, '1,610000,', 610000, '安康市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610901, '1,610000,610900,', 610900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610902, '1,610000,610900,', 610900, '汉滨区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610921, '1,610000,610900,', 610900, '汉阴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610922, '1,610000,610900,', 610900, '石泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610923, '1,610000,610900,', 610900, '宁陕县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610924, '1,610000,610900,', 610900, '紫阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610925, '1,610000,610900,', 610900, '岚皋县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610926, '1,610000,610900,', 610900, '平利县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610927, '1,610000,610900,', 610900, '镇坪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610928, '1,610000,610900,', 610900, '旬阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (610929, '1,610000,610900,', 610900, '白河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611000, '1,610000,', 610000, '商洛市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611001, '1,610000,611000,', 611000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611002, '1,610000,611000,', 611000, '商州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611021, '1,610000,611000,', 611000, '洛南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611022, '1,610000,611000,', 611000, '丹凤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611023, '1,610000,611000,', 611000, '商南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:02', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611024, '1,610000,611000,', 611000, '山阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611025, '1,610000,611000,', 611000, '镇安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (611026, '1,610000,611000,', 611000, '柞水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620000, '1,', 1, '甘肃省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620100, '1,620000,', 620000, '兰州市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620101, '1,620000,620100,', 620100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620102, '1,620000,620100,', 620100, '城关区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620103, '1,620000,620100,', 620100, '七里河区', '', 0, 3, '', b'1', NULL, NULL, '1', '2016-12-28 16:06:09', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (620104, '1,620000,620100,', 620100, '西固区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620105, '1,620000,620100,', 620100, '安宁区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620111, '1,620000,620100,', 620100, '红古区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620121, '1,620000,620100,', 620100, '永登县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620122, '1,620000,620100,', 620100, '皋兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620123, '1,620000,620100,', 620100, '榆中县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620200, '1,620000,', 620000, '嘉峪关市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620201, '1,620000,620200,', 620200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620300, '1,620000,', 620000, '金昌市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620301, '1,620000,620300,', 620300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620302, '1,620000,620300,', 620300, '金川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620321, '1,620000,620300,', 620300, '永昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620400, '1,620000,', 620000, '白银市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620401, '1,620000,620400,', 620400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620402, '1,620000,620400,', 620400, '白银区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620403, '1,620000,620400,', 620400, '平川区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620421, '1,620000,620400,', 620400, '靖远县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620422, '1,620000,620400,', 620400, '会宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620423, '1,620000,620400,', 620400, '景泰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620500, '1,620000,', 620000, '天水市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620501, '1,620000,620500,', 620500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620502, '1,620000,620500,', 620500, '秦城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620503, '1,620000,620500,', 620500, '北道区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620521, '1,620000,620500,', 620500, '清水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620522, '1,620000,620500,', 620500, '秦安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620523, '1,620000,620500,', 620500, '甘谷县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620524, '1,620000,620500,', 620500, '武山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620525, '1,620000,620500,', 620500, '张家川回族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620600, '1,620000,', 620000, '武威市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620601, '1,620000,620600,', 620600, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:03', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620602, '1,620000,620600,', 620600, '凉州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620621, '1,620000,620600,', 620600, '民勤县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620622, '1,620000,620600,', 620600, '古浪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620623, '1,620000,620600,', 620600, '天祝藏族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620700, '1,620000,', 620000, '张掖市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620701, '1,620000,620700,', 620700, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620702, '1,620000,620700,', 620700, '甘州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620721, '1,620000,620700,', 620700, '肃南裕固族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620722, '1,620000,620700,', 620700, '民乐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620723, '1,620000,620700,', 620700, '临泽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620724, '1,620000,620700,', 620700, '高台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620725, '1,620000,620700,', 620700, '山丹县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620800, '1,620000,', 620000, '平凉市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620801, '1,620000,620800,', 620800, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620802, '1,620000,620800,', 620800, '崆峒区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620821, '1,620000,620800,', 620800, '泾川县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620822, '1,620000,620800,', 620800, '灵台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620823, '1,620000,620800,', 620800, '崇信县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620824, '1,620000,620800,', 620800, '华亭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620825, '1,620000,620800,', 620800, '庄浪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620826, '1,620000,620800,', 620800, '静宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620900, '1,620000,', 620000, '酒泉市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620901, '1,620000,620900,', 620900, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620902, '1,620000,620900,', 620900, '肃州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620921, '1,620000,620900,', 620900, '金塔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620922, '1,620000,620900,', 620900, '瓜州县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620923, '1,620000,620900,', 620900, '肃北蒙古族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620924, '1,620000,620900,', 620900, '阿克塞哈萨克族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620981, '1,620000,620900,', 620900, '玉门市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (620982, '1,620000,620900,', 620900, '敦煌市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621000, '1,620000,', 620000, '庆阳市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621001, '1,620000,621000,', 621000, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621002, '1,620000,621000,', 621000, '西峰区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621021, '1,620000,621000,', 621000, '庆城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621022, '1,620000,621000,', 621000, '环县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621023, '1,620000,621000,', 621000, '华池县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621024, '1,620000,621000,', 621000, '合水县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621025, '1,620000,621000,', 621000, '正宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:04', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621026, '1,620000,621000,', 621000, '宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621027, '1,620000,621000,', 621000, '镇原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621100, '1,620000,', 620000, '定西市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621101, '1,620000,621100,', 621100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621102, '1,620000,621100,', 621100, '安定区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621121, '1,620000,621100,', 621100, '通渭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621122, '1,620000,621100,', 621100, '陇西县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621123, '1,620000,621100,', 621100, '渭源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621124, '1,620000,621100,', 621100, '临洮县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621125, '1,620000,621100,', 621100, '漳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621126, '1,620000,621100,', 621100, '岷县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621200, '1,620000,', 620000, '陇南市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621201, '1,620000,621200,', 621200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621202, '1,620000,621200,', 621200, '武都区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621221, '1,620000,621200,', 621200, '成县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621222, '1,620000,621200,', 621200, '文县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621223, '1,620000,621200,', 621200, '宕昌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621224, '1,620000,621200,', 621200, '康县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621225, '1,620000,621200,', 621200, '西和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621226, '1,620000,621200,', 621200, '礼县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621227, '1,620000,621200,', 621200, '徽县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (621228, '1,620000,621200,', 621200, '两当县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:05', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622900, '1,620000,', 620000, '临夏回族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622901, '1,620000,622900,', 622900, '临夏市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622921, '1,620000,622900,', 622900, '临夏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622922, '1,620000,622900,', 622900, '康乐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622923, '1,620000,622900,', 622900, '永靖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622924, '1,620000,622900,', 622900, '广河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622925, '1,620000,622900,', 622900, '和政县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622926, '1,620000,622900,', 622900, '东乡族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (622927, '1,620000,622900,', 622900, '积石山保安族东乡族撒拉族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623000, '1,620000,', 620000, '甘南藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623001, '1,620000,623000,', 623000, '合作市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623021, '1,620000,623000,', 623000, '临潭县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623022, '1,620000,623000,', 623000, '卓尼县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623023, '1,620000,623000,', 623000, '舟曲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623024, '1,620000,623000,', 623000, '迭部县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623025, '1,620000,623000,', 623000, '玛曲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623026, '1,620000,623000,', 623000, '碌曲县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (623027, '1,620000,623000,', 623000, '夏河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630000, '1,', 1, '青海省', NULL, 0, 1, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630100, '1,630000,', 630000, '西宁市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630101, '1,630000,630100,', 630100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630102, '1,630000,630100,', 630100, '城东区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630103, '1,630000,630100,', 630100, '城中区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630104, '1,630000,630100,', 630100, '城西区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:06', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630105, '1,630000,630100,', 630100, '城北区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630121, '1,630000,630100,', 630100, '大通回族土族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630122, '1,630000,630100,', 630100, '湟中县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (630123, '1,630000,630100,', 630100, '湟源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632100, '1,630000,', 630000, '海东地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632121, '1,630000,632100,', 632100, '平安县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632122, '1,630000,632100,', 632100, '民和回族土族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632123, '1,630000,632100,', 632100, '乐都县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632126, '1,630000,632100,', 632100, '互助土族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632127, '1,630000,632100,', 632100, '化隆回族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632128, '1,630000,632100,', 632100, '循化撒拉族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632200, '1,630000,', 630000, '海北藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632221, '1,630000,632200,', 632200, '门源回族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632222, '1,630000,632200,', 632200, '祁连县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632223, '1,630000,632200,', 632200, '海晏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632224, '1,630000,632200,', 632200, '刚察县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632300, '1,630000,', 630000, '黄南藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632321, '1,630000,632300,', 632300, '同仁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632322, '1,630000,632300,', 632300, '尖扎县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632323, '1,630000,632300,', 632300, '泽库县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632324, '1,630000,632300,', 632300, '河南蒙古族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632500, '1,630000,', 630000, '海南藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632521, '1,630000,632500,', 632500, '共和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632522, '1,630000,632500,', 632500, '同德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632523, '1,630000,632500,', 632500, '贵德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632524, '1,630000,632500,', 632500, '兴海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:07', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632525, '1,630000,632500,', 632500, '贵南县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632600, '1,630000,', 630000, '果洛藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632621, '1,630000,632600,', 632600, '玛沁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632622, '1,630000,632600,', 632600, '班玛县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632623, '1,630000,632600,', 632600, '甘德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632624, '1,630000,632600,', 632600, '达日县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632625, '1,630000,632600,', 632600, '久治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632626, '1,630000,632600,', 632600, '玛多县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632700, '1,630000,', 630000, '玉树藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632721, '1,630000,632700,', 632700, '玉树县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632722, '1,630000,632700,', 632700, '杂多县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632723, '1,630000,632700,', 632700, '称多县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632724, '1,630000,632700,', 632700, '治多县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632725, '1,630000,632700,', 632700, '囊谦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632726, '1,630000,632700,', 632700, '曲麻莱县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632800, '1,630000,', 630000, '海西蒙古族藏族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632801, '1,630000,632800,', 632800, '格尔木市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632802, '1,630000,632800,', 632800, '德令哈市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632821, '1,630000,632800,', 632800, '乌兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632822, '1,630000,632800,', 632800, '都兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632823, '1,630000,632800,', 632800, '天峻县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632824, '1,630000,632800,', 632800, '芒崖', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632825, '1,630000,632800,', 632800, '冷湖', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (632826, '1,630000,632800,', 632800, '大柴旦', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640000, '1,', 1, '宁夏回族自治区', '', 0, 1, '', b'0', NULL, NULL, '1', '2016-12-28 12:20:18', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (640100, '1,640000,', 640000, '银川市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640101, '1,640000,640100,', 640100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640104, '1,640000,640100,', 640100, '兴庆区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640105, '1,640000,640100,', 640100, '西夏区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640106, '1,640000,640100,', 640100, '金凤区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:08', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640121, '1,640000,640100,', 640100, '永宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640122, '1,640000,640100,', 640100, '贺兰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640181, '1,640000,640100,', 640100, '灵武市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640200, '1,640000,', 640000, '石嘴山市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640201, '1,640000,640200,', 640200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640202, '1,640000,640200,', 640200, '大武口区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640205, '1,640000,640200,', 640200, '惠农区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640221, '1,640000,640200,', 640200, '平罗县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640300, '1,640000,', 640000, '吴忠市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640301, '1,640000,640300,', 640300, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640302, '1,640000,640300,', 640300, '利通区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640323, '1,640000,640300,', 640300, '盐池县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640324, '1,640000,640300,', 640300, '同心县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640381, '1,640000,640300,', 640300, '青铜峡市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640400, '1,640000,', 640000, '固原市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640401, '1,640000,640400,', 640400, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640402, '1,640000,640400,', 640400, '原州区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640422, '1,640000,640400,', 640400, '西吉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640423, '1,640000,640400,', 640400, '隆德县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640424, '1,640000,640400,', 640400, '泾源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640425, '1,640000,640400,', 640400, '彭阳县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640500, '1,640000,', 640000, '中卫市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640501, '1,640000,640500,', 640500, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640502, '1,640000,640500,', 640500, '沙坡头区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640521, '1,640000,640500,', 640500, '中宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (640522, '1,640000,640500,', 640500, '海原县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:09', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650000, '1,', 1, '新疆维吾尔自治区', '', 0, 1, '', b'0', NULL, NULL, '1', '2016-12-28 14:11:40', '', '0', 1);
INSERT INTO `sys_area_t` VALUES (650100, '1,650000,', 650000, '乌鲁木齐市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650101, '1,650000,650100,', 650100, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650102, '1,650000,650100,', 650100, '天山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650103, '1,650000,650100,', 650100, '沙依巴克区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650104, '1,650000,650100,', 650100, '新市区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650105, '1,650000,650100,', 650100, '水磨沟区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650106, '1,650000,650100,', 650100, '头屯河区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650107, '1,650000,650100,', 650100, '达坂城区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650108, '1,650000,650100,', 650100, '东山区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650121, '1,650000,650100,', 650100, '乌鲁木齐县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650200, '1,650000,', 650000, '克拉玛依市', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650201, '1,650000,650200,', 650200, '市辖区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650202, '1,650000,650200,', 650200, '独山子区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650203, '1,650000,650200,', 650200, '克拉玛依区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650204, '1,650000,650200,', 650200, '白碱滩区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (650205, '1,650000,650200,', 650200, '乌尔禾区', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652100, '1,650000,', 650000, '吐鲁番地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652101, '1,650000,652100,', 652100, '吐鲁番市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652122, '1,650000,652100,', 652100, '鄯善县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:10', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652123, '1,650000,652100,', 652100, '托克逊县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652200, '1,650000,', 650000, '哈密地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652201, '1,650000,652200,', 652200, '哈密市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652222, '1,650000,652200,', 652200, '巴里坤哈萨克自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652223, '1,650000,652200,', 652200, '伊吾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652300, '1,650000,', 650000, '昌吉回族自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652301, '1,650000,652300,', 652300, '昌吉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652302, '1,650000,652300,', 652300, '阜康市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652303, '1,650000,652300,', 652300, '米泉市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652323, '1,650000,652300,', 652300, '呼图壁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652324, '1,650000,652300,', 652300, '玛纳斯县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652325, '1,650000,652300,', 652300, '奇台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652327, '1,650000,652300,', 652300, '吉木萨尔县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652328, '1,650000,652300,', 652300, '木垒哈萨克自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652700, '1,650000,', 650000, '博尔塔拉蒙古自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652701, '1,650000,652700,', 652700, '博乐市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652722, '1,650000,652700,', 652700, '精河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652723, '1,650000,652700,', 652700, '温泉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652800, '1,650000,', 650000, '巴音郭楞蒙古自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652801, '1,650000,652800,', 652800, '库尔勒市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652822, '1,650000,652800,', 652800, '轮台县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652823, '1,650000,652800,', 652800, '尉犁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652824, '1,650000,652800,', 652800, '若羌县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652825, '1,650000,652800,', 652800, '且末县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652826, '1,650000,652800,', 652800, '焉耆回族自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652827, '1,650000,652800,', 652800, '和静县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652828, '1,650000,652800,', 652800, '和硕县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652829, '1,650000,652800,', 652800, '博湖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652900, '1,650000,', 650000, '阿克苏地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:11', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652901, '1,650000,652900,', 652900, '阿克苏市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652922, '1,650000,652900,', 652900, '温宿县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652923, '1,650000,652900,', 652900, '库车县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652924, '1,650000,652900,', 652900, '沙雅县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652925, '1,650000,652900,', 652900, '新和县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652926, '1,650000,652900,', 652900, '拜城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652927, '1,650000,652900,', 652900, '乌什县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652928, '1,650000,652900,', 652900, '阿瓦提县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (652929, '1,650000,652900,', 652900, '柯坪县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653000, '1,650000,', 650000, '克孜勒苏柯尔克孜自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653001, '1,650000,653000,', 653000, '阿图什市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653022, '1,650000,653000,', 653000, '阿克陶县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653023, '1,650000,653000,', 653000, '阿合奇县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653024, '1,650000,653000,', 653000, '乌恰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653100, '1,650000,', 650000, '喀什地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653101, '1,650000,653100,', 653100, '喀什市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653121, '1,650000,653100,', 653100, '疏附县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653122, '1,650000,653100,', 653100, '疏勒县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653123, '1,650000,653100,', 653100, '英吉沙县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653124, '1,650000,653100,', 653100, '泽普县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653125, '1,650000,653100,', 653100, '莎车县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653126, '1,650000,653100,', 653100, '叶城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653127, '1,650000,653100,', 653100, '麦盖提县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653128, '1,650000,653100,', 653100, '岳普湖县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653129, '1,650000,653100,', 653100, '伽师县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653130, '1,650000,653100,', 653100, '巴楚县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653131, '1,650000,653100,', 653100, '塔什库尔干塔吉克自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653200, '1,650000,', 650000, '和田地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653201, '1,650000,653200,', 653200, '和田市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653221, '1,650000,653200,', 653200, '和田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653222, '1,650000,653200,', 653200, '墨玉县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653223, '1,650000,653200,', 653200, '皮山县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653224, '1,650000,653200,', 653200, '洛浦县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653225, '1,650000,653200,', 653200, '策勒县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653226, '1,650000,653200,', 653200, '于田县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (653227, '1,650000,653200,', 653200, '民丰县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654000, '1,650000,', 650000, '伊犁哈萨克自治州', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:12', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654002, '1,650000,654000,', 654000, '伊宁市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654003, '1,650000,654000,', 654000, '奎屯市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654021, '1,650000,654000,', 654000, '伊宁县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654022, '1,650000,654000,', 654000, '察布查尔锡伯自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654023, '1,650000,654000,', 654000, '霍城县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654024, '1,650000,654000,', 654000, '巩留县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654025, '1,650000,654000,', 654000, '新源县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654026, '1,650000,654000,', 654000, '昭苏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654027, '1,650000,654000,', 654000, '特克斯县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654028, '1,650000,654000,', 654000, '尼勒克县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654200, '1,650000,', 650000, '塔城地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654201, '1,650000,654200,', 654200, '塔城市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654202, '1,650000,654200,', 654200, '乌苏市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654221, '1,650000,654200,', 654200, '额敏县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654223, '1,650000,654200,', 654200, '沙湾县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654224, '1,650000,654200,', 654200, '托里县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654225, '1,650000,654200,', 654200, '裕民县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654226, '1,650000,654200,', 654200, '和布克赛尔蒙古自治县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654300, '1,650000,', 650000, '阿勒泰地区', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654301, '1,650000,654300,', 654300, '阿勒泰市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654321, '1,650000,654300,', 654300, '布尔津县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654322, '1,650000,654300,', 654300, '富蕴县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654323, '1,650000,654300,', 654300, '福海县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654324, '1,650000,654300,', 654300, '哈巴河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654325, '1,650000,654300,', 654300, '青河县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (654326, '1,650000,654300,', 654300, '吉木乃县', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (659000, '1,650000,', 650000, '省直辖行政单位', NULL, 0, 2, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (659001, '1,650000,659000,', 659000, '石河子市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (659002, '1,650000,659000,', 659000, '阿拉尔市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:13', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (659003, '1,650000,659000,', 659000, '图木舒克市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:14', NULL, '0', 1);
INSERT INTO `sys_area_t` VALUES (659004, '1,650000,659000,', 659000, '五家渠市', NULL, 0, 3, NULL, b'0', NULL, NULL, NULL, '2016-12-14 15:00:14', NULL, '0', 1);

-- ----------------------------
-- Table structure for sys_dict_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_t`;
CREATE TABLE `sys_dict_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `val_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `key_` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典唯一编码',
  `is_leaf` bit(1) NULL DEFAULT b'0' COMMENT '0 叶子节点 1 非叶子节点',
  `sort_` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status_` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `show_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源文件key',
  `is_show` bit(1) NULL DEFAULT b'1' COMMENT '0 叶子节点 1 非叶子节点',
  `version_` int(11) NULL DEFAULT 0,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `val_`(`val_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_t
-- ----------------------------
INSERT INTO `sys_dict_t` VALUES ('01738aa7fd884849b2631402b8159ebd', '业务消息', 'a73c99c35bd84d5baea21549c05e9493', '0,1,5ea249bb780348eb8ea6a0efade684a6,a73c99c35bd84d5baea21549c05e9493,', '1', NULL, 'sys_message_type_1', b'1', 0, '', '0', NULL, b'1', 3, '', '2016-12-05 11:31:22', '1', '2016-12-28 17:42:37');
INSERT INTO `sys_dict_t` VALUES ('04df64d859bc4073ac91a54d6b238501', '一级', '8040c72a95f541a49734bbe1c47547ca', '0,1,5ea249bb780348eb8ea6a0efade684a6,8040c72a95f541a49734bbe1c47547ca,', '1', NULL, 'sys_org_grade_1', b'0', 4, NULL, '0', NULL, b'1', 4, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('05655dc0210a4dc9840c3a22ab96cee3', '已删除', '36adfd803e3f4b48b6fa829c96b26959', '0,1,5ea249bb780348eb8ea6a0efade684a6,36adfd803e3f4b48b6fa829c96b26959,', '-2', NULL, 'sys_status_delete', b'1', 0, '', '0', NULL, b'0', 7, '', '2016-12-05 11:31:22', '1', '2016-12-29 13:15:08');
INSERT INTO `sys_dict_t` VALUES ('0857ed8ed2e44bac8434c524ab8f467a', '是', 'ed6bc6b03a2a4afbbdc9e35957aa0440', '0,1,5ea249bb780348eb8ea6a0efade684a6,ed6bc6b03a2a4afbbdc9e35957aa0440,', '1', NULL, 'sys_no', b'0', 0, '', '0', NULL, b'1', 10, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('0f77deaad18c48d4a1394093cd72f7f3', '请求方法类型', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '', NULL, 'sys_request_method', b'0', 30, '', '0', NULL, b'1', 0, '1', '2016-12-28 17:48:05', '1', '2016-12-28 17:48:58');
INSERT INTO `sys_dict_t` VALUES ('1', '数据字典', '0', '0,', NULL, NULL, 'base', b'0', 0, NULL, '0', NULL, b'1', 7, '', '2016-12-05 11:31:22', '1', '2017-11-08 18:13:00');
INSERT INTO `sys_dict_t` VALUES ('14c8d7b3fc56455db298a0cff97d0601', '系统管理', '1c7261a0576b4844be71a1a6f4238d49', '0,1,5ea249bb780348eb8ea6a0efade684a6,1c7261a0576b4844be71a1a6f4238d49,', 'system', '', 'sys_user_type_system', b'1', 10, '', '0', NULL, b'1', 6, '', '2016-12-05 11:31:22', '1', '2018-07-17 11:44:42');
INSERT INTO `sys_dict_t` VALUES ('1c7261a0576b4844be71a1a6f4238d49', '用户类型', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '1', '', 'sys_user_type', b'0', 10, '', '0', NULL, b'1', 11, '', '2016-12-05 11:31:22', '1', '2018-07-27 14:08:19');
INSERT INTO `sys_dict_t` VALUES ('1ef7c3f1ec58470f9187dc607f61399e', '省份、直辖市', '43c66dd855b84a4489e40a05141472db', '0,1,5ea249bb780348eb8ea6a0efade684a6,43c66dd855b84a4489e40a05141472db,', '1', NULL, 'sys_area_type_2', b'0', 20, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('24dc1071aefb47a1be1c0544062e99f9', '否', 'ed6bc6b03a2a4afbbdc9e35957aa0440', '0,1,5ea249bb780348eb8ea6a0efade684a6,ed6bc6b03a2a4afbbdc9e35957aa0440,', '0', NULL, 'sys_yes', b'0', 10, '', '0', NULL, b'1', 10, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('25958fb362674775b84050e8e2bbda56', '仅本人数据', 'aec4a6b7cfd6475ea0d97714c13003fe', '0,1,5ea249bb780348eb8ea6a0efade684a6,aec4a6b7cfd6475ea0d97714c13003fe,', '4', NULL, 'sys_role_scope_4', b'0', 10, '', '0', NULL, b'1', 6, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('2a325c1dcb95412faebd7118ed0e6110', 'WARN', 'cf92bd9bc2a64ac9a37776f3ec8cce24', '0,1,5ea249bb780348eb8ea6a0efade684a6,cf92bd9bc2a64ac9a37776f3ec8cce24,', 'WARN', NULL, 'sys_log_level_warn', b'1', 90, '', '0', NULL, b'1', 0, '1', '2017-01-03 15:04:12', '1', '2017-01-03 15:04:12');
INSERT INTO `sys_dict_t` VALUES ('2a41ef6aa47b40a5b15c899be205e0f1', '可见', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', 'show_hide', NULL, 'show_hide', b'0', 10, '', '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('2c6b8b7ba127449d8588ba2ea8d7c856', 'APP_IOS用户', '1c7261a0576b4844be71a1a6f4238d49', '0,1,5ea249bb780348eb8ea6a0efade684a6,1c7261a0576b4844be71a1a6f4238d49,', 'ios', '', 'sys_user_type_app_ios', b'1', 80, '', '0', NULL, b'1', 12, '', '2016-12-05 11:31:22', '1', '2018-07-27 14:08:19');
INSERT INTO `sys_dict_t` VALUES ('2d778a9832084c4ba246d1b042e9b4ea', '模块类型', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '', NULL, 'sys_module_type', b'0', 0, NULL, '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('36adfd803e3f4b48b6fa829c96b26959', '数据状态', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '', NULL, 'sys_status', b'0', 0, '', '0', NULL, b'1', 8, '', '2016-12-05 11:31:22', '1', '2016-12-29 13:15:08');
INSERT INTO `sys_dict_t` VALUES ('37d4968b75534f8abf7358fb9d21358b', '审核', '36adfd803e3f4b48b6fa829c96b26959', '0,1,5ea249bb780348eb8ea6a0efade684a6,36adfd803e3f4b48b6fa829c96b26959,', '1', NULL, 'sys_status_audit', b'0', 99, '', '0', NULL, b'1', 4, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('43c66dd855b84a4489e40a05141472db', '区域类型', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '', NULL, 'sys_area_type', b'0', 60, '', '0', NULL, b'1', 3, '', '2016-12-05 11:31:22', '1', '2018-07-04 11:13:03');
INSERT INTO `sys_dict_t` VALUES ('47ca009b782c4fffa467f1eeadf23906', '站内消息', 'a73c99c35bd84d5baea21549c05e9493', '0,1,5ea249bb780348eb8ea6a0efade684a6,a73c99c35bd84d5baea21549c05e9493,', '0', NULL, 'sys_message_type_0', b'0', 0, '', '0', NULL, b'1', 4, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('4b83e314763746b3857335ee9ec26836', '业务参数', '1', '0,1,', '', '', '', b'0', 98, '', '0', NULL, b'1', 7, '1', '2017-03-27 15:17:05', '1', '2018-07-17 11:00:24');
INSERT INTO `sys_dict_t` VALUES ('4c48895ca2754715ab127f387d556048', 'PUT', '0f77deaad18c48d4a1394093cd72f7f3', '0,1,5ea249bb780348eb8ea6a0efade684a6,0f77deaad18c48d4a1394093cd72f7f3,', 'PUT', '', 'sys_request_method_3', b'1', 90, '', '0', NULL, b'1', 0, '1', '2016-12-28 17:49:46', '1', '2018-07-09 16:13:48');
INSERT INTO `sys_dict_t` VALUES ('50664a812d6849d18ae438e884b3670d', '二级', '8040c72a95f541a49734bbe1c47547ca', '0,1,5ea249bb780348eb8ea6a0efade684a6,8040c72a95f541a49734bbe1c47547ca,', '2', NULL, 'sys_org_grade_2', b'0', 3, NULL, '0', NULL, b'1', 15, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('51594fc1aa1d4b14a8b00ad06e235f39', '失效', '36adfd803e3f4b48b6fa829c96b26959', '0,1,5ea249bb780348eb8ea6a0efade684a6,36adfd803e3f4b48b6fa829c96b26959,', '-1', NULL, 'sys_status_unable', b'0', -2, '', '0', NULL, b'1', 13, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('594e00eb4366445cb5c27a414ff28cba', '菜单模块', '2d778a9832084c4ba246d1b042e9b4ea', '0,1,5ea249bb780348eb8ea6a0efade684a6,2d778a9832084c4ba246d1b042e9b4ea,', '1', NULL, 'sys_module_type_1', b'1', 0, '', '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', '1', '2016-12-24 16:49:41');
INSERT INTO `sys_dict_t` VALUES ('5b9742fc0acd4a108b2ab661dc85269c', '所有数据', 'aec4a6b7cfd6475ea0d97714c13003fe', '0,1,5ea249bb780348eb8ea6a0efade684a6,aec4a6b7cfd6475ea0d97714c13003fe,', '1', NULL, 'sys_role_scope_1', b'0', 50, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('5ea249bb780348eb8ea6a0efade684a6', '系统参数', '1', '0,1,', '', NULL, 'sys', b'0', 8, '', '0', NULL, b'1', 14, '', '2016-12-05 11:31:22', '1', '2018-07-17 11:44:18');
INSERT INTO `sys_dict_t` VALUES ('62b6107b1ed34a18a437ea1b60bdc103', '代码生成ui路径', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '../../tunnel-ui/', NULL, 'sys_gen_code_ui_path', b'1', 120, '代码生成ui文件存放相对位置', '0', NULL, b'1', 0, '1', '2018-07-04 11:15:19', '1', '2018-07-04 12:47:58');
INSERT INTO `sys_dict_t` VALUES ('640537def76740f5872298c0e1935c70', 'DELETE', '0f77deaad18c48d4a1394093cd72f7f3', '0,1,5ea249bb780348eb8ea6a0efade684a6,0f77deaad18c48d4a1394093cd72f7f3,', 'DELETE', NULL, 'sys_request_method_4', b'1', 120, '', '0', NULL, b'1', 0, '1', '2016-12-29 09:39:55', '1', '2016-12-29 09:39:55');
INSERT INTO `sys_dict_t` VALUES ('662789515c2f4c3bac817622f1a7949f', '国家', '43c66dd855b84a4489e40a05141472db', '0,1,5ea249bb780348eb8ea6a0efade684a6,43c66dd855b84a4489e40a05141472db,', '0', NULL, 'sys_area_type_1', b'0', 1, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('74f6376829c54419b89ea3d37260f29e', '区县', '43c66dd855b84a4489e40a05141472db', '0,1,5ea249bb780348eb8ea6a0efade684a6,43c66dd855b84a4489e40a05141472db,', '3', NULL, 'sys_area_type_4', b'0', 40, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('7549dab0825844bc8fd1835b34cb4a77', 'APP_ANDRIOD用户', '1c7261a0576b4844be71a1a6f4238d49', '0,1,5ea249bb780348eb8ea6a0efade684a6,1c7261a0576b4844be71a1a6f4238d49,', 'andriod', '', 'sys_user_type_app_andriod', b'1', 50, '', '0', NULL, b'1', 0, '1', '2018-07-17 11:47:35', '1', '2018-07-17 11:47:35');
INSERT INTO `sys_dict_t` VALUES ('7a265834873548e797578f2f79bebe1d', '隐藏', '2a41ef6aa47b40a5b15c899be205e0f1', '0,1,5ea249bb780348eb8ea6a0efade684a6,2a41ef6aa47b40a5b15c899be205e0f1,', '1', NULL, 'show_hide_1', b'0', 20, '', '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('7a4c9a3ee0a74f0d932212defdd9b27d', '部门', '8725bc528472472cae9cd79d8a3526f7', '0,1,5ea249bb780348eb8ea6a0efade684a6,8725bc528472472cae9cd79d8a3526f7,', '2', '', 'sys_org_type_2', b'1', 20, '', '0', NULL, b'1', 4, '', '2016-12-05 11:31:22', '1', '2018-07-17 13:37:06');
INSERT INTO `sys_dict_t` VALUES ('7f51aaef298a4d24b4d3d993caa9a09f', 'ERROR', 'cf92bd9bc2a64ac9a37776f3ec8cce24', '0,1,5ea249bb780348eb8ea6a0efade684a6,cf92bd9bc2a64ac9a37776f3ec8cce24,', 'ERROR', NULL, 'sys_log_level_error', b'1', 150, '', '0', NULL, b'1', 0, '1', '2017-01-03 15:04:22', '1', '2017-01-03 15:04:22');
INSERT INTO `sys_dict_t` VALUES ('8040c72a95f541a49734bbe1c47547ca', '机构等级', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '', NULL, 'sys_org_grade', b'0', 10, NULL, '0', NULL, b'1', 13, '', '2016-12-05 11:31:22', '1', '2017-11-08 17:56:50');
INSERT INTO `sys_dict_t` VALUES ('80dcac9baced499580380a249e4c2e6c', 'POST', '0f77deaad18c48d4a1394093cd72f7f3', '0,1,5ea249bb780348eb8ea6a0efade684a6,0f77deaad18c48d4a1394093cd72f7f3,', 'POST', NULL, 'sys_request_method_2', b'1', 60, '', '0', NULL, b'1', 0, '1', '2016-12-28 17:49:25', '1', '2016-12-28 17:49:25');
INSERT INTO `sys_dict_t` VALUES ('8725bc528472472cae9cd79d8a3526f7', '机构类型', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '', NULL, 'sys_org_type', b'0', 0, NULL, '0', NULL, b'1', 11, '', '2016-12-05 11:31:22', '1', '2018-07-17 13:37:06');
INSERT INTO `sys_dict_t` VALUES ('943a3aa818614527a077f7f1fb53f8fd', '地市', '43c66dd855b84a4489e40a05141472db', '0,1,5ea249bb780348eb8ea6a0efade684a6,43c66dd855b84a4489e40a05141472db,', '2', NULL, 'sys_area_type_3', b'0', 30, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('97f1b5ad8a5a4d10a72693247c9187d9', '显示', '2a41ef6aa47b40a5b15c899be205e0f1', '0,1,5ea249bb780348eb8ea6a0efade684a6,2a41ef6aa47b40a5b15c899be205e0f1,', '0', NULL, 'show_hide_0', b'0', 10, '', '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('9a68b88d9d1542528761684536932fc8', '已处理', 'c2b4aadd1c184dcbbab22fa9785e09c2', '0,1,5ea249bb780348eb8ea6a0efade684a6,c2b4aadd1c184dcbbab22fa9785e09c2,', '1', NULL, 'sys_message_status_1', b'0', 0, '', '0', NULL, b'1', 4, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('a35b86dadd8744c4b8db1873725fe886', 'DEBUG', 'cf92bd9bc2a64ac9a37776f3ec8cce24', '0,1,5ea249bb780348eb8ea6a0efade684a6,cf92bd9bc2a64ac9a37776f3ec8cce24,', 'DEBUG', NULL, 'sys_log_level_debug', b'1', 0, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', '1', '2017-01-03 15:03:28');
INSERT INTO `sys_dict_t` VALUES ('a73c99c35bd84d5baea21549c05e9493', '消息类型', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '0', NULL, 'sys_message_type', b'0', 0, '', '0', NULL, b'1', 3, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('a83bbdd9168f4864a527dfe1fe95d1a3', '公司', '8725bc528472472cae9cd79d8a3526f7', '0,1,5ea249bb780348eb8ea6a0efade684a6,8725bc528472472cae9cd79d8a3526f7,', '1', '', 'sys_org_type_1', b'1', 0, '', '0', NULL, b'1', 6, '', '2016-12-05 11:31:22', '1', '2018-07-17 13:37:01');
INSERT INTO `sys_dict_t` VALUES ('aec4a6b7cfd6475ea0d97714c13003fe', '数据范围', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '0', NULL, 'sys_role_scope', b'0', 0, '', '0', NULL, b'1', 3, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('af4bd1c0c57e423c878711383b59eb04', '按明细设置', 'aec4a6b7cfd6475ea0d97714c13003fe', '0,1,5ea249bb780348eb8ea6a0efade684a6,aec4a6b7cfd6475ea0d97714c13003fe,', '5', NULL, 'sys_role_scope_5', b'0', 0, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('bca52f7429fb4814b144d96e1f4e79df', 'GET', '0f77deaad18c48d4a1394093cd72f7f3', '0,1,5ea249bb780348eb8ea6a0efade684a6,0f77deaad18c48d4a1394093cd72f7f3,', 'GET', NULL, 'sys_request_method_1', b'1', 30, '', '0', NULL, b'1', 0, '1', '2016-12-28 17:48:58', '1', '2016-12-28 17:48:58');
INSERT INTO `sys_dict_t` VALUES ('bde92fc6fdc44a2491658a9903634155', '权限模块', '2d778a9832084c4ba246d1b042e9b4ea', '0,1,5ea249bb780348eb8ea6a0efade684a6,2d778a9832084c4ba246d1b042e9b4ea,', '2', NULL, 'sys_module_type_2', b'1', 0, '', '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', '1', '2016-12-24 16:49:33');
INSERT INTO `sys_dict_t` VALUES ('c2b4aadd1c184dcbbab22fa9785e09c2', '消息状态', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '0', NULL, 'sys_message_status', b'0', 0, '', '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('cf92bd9bc2a64ac9a37776f3ec8cce24', '日志级别', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '', NULL, 'sys_log_level', b'0', 0, '', '0', NULL, b'1', 6, '', '2016-12-05 11:31:22', '1', '2017-01-03 15:02:38');
INSERT INTO `sys_dict_t` VALUES ('d5697906556a4ec8b4164534836a3d9a', 'INFO', 'cf92bd9bc2a64ac9a37776f3ec8cce24', '0,1,5ea249bb780348eb8ea6a0efade684a6,cf92bd9bc2a64ac9a37776f3ec8cce24,', 'INFO', NULL, 'sys_log_level_info', b'1', 30, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', '1', '2017-01-03 15:03:51');
INSERT INTO `sys_dict_t` VALUES ('d99f1efd57bc4a5bafbe3c5f79aee103', '四级', '8040c72a95f541a49734bbe1c47547ca', '0,1,5ea249bb780348eb8ea6a0efade684a6,8040c72a95f541a49734bbe1c47547ca,', '4', NULL, 'sys_org_grade_4', b'1', 10, '', '0', NULL, b'1', 4, '', '2016-12-05 11:31:22', '1', '2016-12-28 17:42:17');
INSERT INTO `sys_dict_t` VALUES ('da22436573c4424fbf13a1987faeb529', '三级', '8040c72a95f541a49734bbe1c47547ca', '0,1,5ea249bb780348eb8ea6a0efade684a6,8040c72a95f541a49734bbe1c47547ca,', '3', '', 'sys_org_grade_3', b'1', 40, '', '0', NULL, b'1', 7, '', '2016-12-05 11:31:22', '1', '2018-07-11 14:32:42');
INSERT INTO `sys_dict_t` VALUES ('e7f773681d574e7bb90c85386eaa489a', '未处理', 'c2b4aadd1c184dcbbab22fa9785e09c2', '0,1,5ea249bb780348eb8ea6a0efade684a6,c2b4aadd1c184dcbbab22fa9785e09c2,', '0', NULL, 'sys_message_status_0', b'0', 0, '', '0', NULL, b'1', 4, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('e81024b1d2a24442bbdc551d10250a0b', '正常', '36adfd803e3f4b48b6fa829c96b26959', '0,1,5ea249bb780348eb8ea6a0efade684a6,36adfd803e3f4b48b6fa829c96b26959,', '0', NULL, 'sys_status_normal', b'0', 10, '', '0', NULL, b'1', 13, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('ed6bc6b03a2a4afbbdc9e35957aa0440', '状态', '5ea249bb780348eb8ea6a0efade684a6', '0,1,5ea249bb780348eb8ea6a0efade684a6,', '0', NULL, 'sys_yes_no', b'0', 0, '', '0', NULL, b'1', 2, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('f64edd136e80465e8d78f66c008aaaf1', '所在机构及以下数据', 'aec4a6b7cfd6475ea0d97714c13003fe', '0,1,5ea249bb780348eb8ea6a0efade684a6,aec4a6b7cfd6475ea0d97714c13003fe,', '2', NULL, 'sys_role_scope_2', b'0', 30, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);
INSERT INTO `sys_dict_t` VALUES ('fcf6a12e6f0e4db98be49a1eefbd5a85', '所在机构数据', 'aec4a6b7cfd6475ea0d97714c13003fe', '0,1,5ea249bb780348eb8ea6a0efade684a6,aec4a6b7cfd6475ea0d97714c13003fe,', '3', NULL, 'sys_role_scope_3', b'0', 20, '', '0', NULL, b'1', 5, '', '2016-12-05 11:31:22', NULL, NULL);

-- ----------------------------
-- Table structure for sys_file_data_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_data_t`;
CREATE TABLE `sys_file_data_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `path_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `size_` int(11) NOT NULL COMMENT '大小',
  `type_` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `status_` int(11) NULL DEFAULT NULL,
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `login`(`size_`) USING BTREE,
  UNIQUE INDEX `idx_user_login`(`size_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件对象' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_login_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login_t`;
CREATE TABLE `sys_log_login_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `staff_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enter_time` datetime(0) NULL DEFAULT NULL,
  `leave_time` datetime(0) NULL DEFAULT NULL,
  `total_time` int(11) NULL DEFAULT NULL,
  `login_flag` int(11) NULL DEFAULT NULL,
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_operate_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operate_t`;
CREATE TABLE `sys_log_operate_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '日志类型 0：接入日志；1：错误日志',
  `staff_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception_` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `request_method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `access_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permissions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `time_consuming` int(11) NULL DEFAULT NULL,
  `request_uri` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '耗时(毫秒)',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `operate_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_operate_t
-- ----------------------------
INSERT INTO `sys_log_operate_t` VALUES ('0351bed41e0141488d63da97641403c0', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 910, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:23:35', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('07bcd6a77e6a47b2aeceab0c7403f685', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 24, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:19:53', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('0a3d075cf01e41b9834c3ad6137261f6', '数据模块-系统设置-系统管理-字典管理-查看字典', '0', '1', 'admin', '', 'GET', 'public void com.albedo.modules.sys.controller.DictController.findTreeData(java.lang.String,java.lang.String,javax.servlet.http.HttpServletResponse)', 'all=', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_dict_view])', 9, '/a/sys/dict/findTreeData', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:15', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('164adebacc8e483c9aa000f409cd39d0', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480757469012&pageNo=1&sortOrder=asc&pageSize=20&parentId=3566c3b5c4114f77a5434c175b9f64c5', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 22, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:31:09', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('18fa5ebb955d429fb5cea7f3b7fe7d44', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480757277139&pageNo=1&sortOrder=asc&pageSize=20&queryConditionJson=[]', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 69, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:27:57', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('1df83b5935c94cbabd17e8e6cc8181fd', '数据模块-系统设置-机构用户-机构管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.OrgController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_3', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_org_view])', 120, '/a/sys/org/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:29:21', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('20b4dbdbddbf4b0fb02915c2ee9051c1', '数据模块-系统设置-代码生成-生成方案配置', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.gen.controller.GenSchemeController.list(com.albedo.modules.gen.entity.GenScheme,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[gen_genScheme_view])', 14, '/a/gen/genScheme', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:33', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('2eb96d57df964083827b1b4360e47ca7', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 11, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:53', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('3304c32e90254fdb89ec8d0bc5a2299e', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480757458612&pageNo=1&sortOrder=asc&pageSize=20&parentId=1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 18, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:59', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('348c986f93564b6fabdfd61b4ffadf0b', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756374771&pageNo=1&sortOrder=asc&pageSize=20&queryConditionJson=[{\"fieldName\":\"orgId\",\"attrType\":\"String\",\"fieldNode\":\"\",\"operation\":\"=\",\"weight\":0,\"value\":\"1\"}]', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 40, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:55', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('3cc3c5bb125448d3b409bee6a5d18580', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756324062&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 589, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:05', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('3e3d568adb514011b043557629d7e7e8', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480757358393&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 23, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:29:18', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('3e4eecc1940a49b1909b55057c86b583', '数据模块-系统设置-系统管理-消息管理-查看消息列表', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.MessageController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Message)', 'sortName=&receiver=1&nd=1480756331894&pageNo=1&sortOrder=asc&pageSize=20&messageFlag=0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_message_view])', 76, '/a/sys/message/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:12', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('3e96cba292c44333a23640682730e951', '数据模块-系统设置-系统管理-字典管理-查看字典', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.DictController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Dict)', 'sortName=&nd=1480756334945&pageNo=1&sortOrder=asc&pageSize=20&parentId=1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_dict_view])', 33, '/a/sys/dict/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:15', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('3efee7b344c44c708214fee1d5745375', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480756330053&pageNo=1&sortOrder=asc&pageSize=20&parentId=1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 24, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:10', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('45ea612481f84489aea2dc05d5921c2e', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'GET', 'public java.util.List com.albedo.modules.sys.controller.ModuleController.findTreeData(java.lang.String,java.lang.String,javax.servlet.http.HttpServletResponse)', 'all=', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 5, '/a/sys/module/findTreeData', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:37', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('4773c36a2f3e4b6f9aef5a99bc024432', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 37, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:13:40', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('49f197ce20fb4cf4b9c29dba2e995615', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 33, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:24:43', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('4a26483b69704c5092cfbe51f3e0ded4', '数据模块-系统设置-机构用户-角色管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.RoleController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model,com.albedo.modules.sys.entity.Role)', 'tabPageId=jerichotabiframe_2', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_role_view])', 200, '/a/sys/role/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:29:20', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('4cd1f43fae78447488b28f847cec254b', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756421359&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 39, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:13:41', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('4dd70a88e49140ac9756965900ba9f1f', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 11, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:13:41', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('4e473711b63c4af0ac0f3d33333cc520', '数据模块-系统设置-机构用户-角色管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.RoleController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model,com.albedo.modules.sys.entity.Role)', 'tabPageId=jerichotabiframe_3', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_role_view])', 16, '/a/sys/role/', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:36', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('4e9011f54d7e45808704dfa44989cd46', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'GET', 'public void com.albedo.modules.sys.controller.ModuleController.findTreeData(java.lang.String,java.lang.String,javax.servlet.http.HttpServletResponse)', 'all=', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 14, '/a/sys/module/findTreeData', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:10', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('51c6dbf546574d0bbc7b0785c67a0163', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480757357091&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 24, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:29:17', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('53ad4b49892c4224bd3d0f8b45511472', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480757466884&pageNo=1&sortOrder=asc&pageSize=20&parentId=ee5224dc13404267acfb8fc443dee4c3', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 22, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:31:07', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('575b65090fc14a0fb3c79173f3ba362e', '数据模块-系统设置-机构用户-角色管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.RoleController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model,com.albedo.modules.sys.entity.Role)', 'tabPageId=jerichotabiframe_5', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_role_view])', 1944, '/a/sys/role/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:05', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('585b28b9cb784f7f887b6457ab706fa6', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&pageSize=20&nd=1480756444708&pageNo=1&sortOrder=asc&queryConditionJson=[{\"fieldName\":\"orgId\",\"attrType\":\"String\",\"fieldNode\":\"\",\"operation\":\"=\",\"weight\":0,\"value\":\"1\"}]', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 39, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:05', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('5c80b6e7ae4040eebbcbe3230022c74b', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 12, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:15:01', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('5dc0762505b3474dae68abce51933681', '数据模块-系统设置-系统管理-消息管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.MessageController.box(org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_8', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_message_view])', 605, '/a/sys/message/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:12', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('5dffb37b158a4fabb93e35099ca2167d', '数据模块-系统设置-系统管理-操作日志', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.LogOperateController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_logOperate_view])', 11, '/a/sys/logOperate/', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:27', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('663dd71633904d039e8ac01432973bab', '数据模块-系统设置-系统管理-操作日志', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.LogOperateController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_5', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_logOperate_view])', 11, '/a/sys/logOperate/', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:39', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('6a8808dba2e4425bb98cdbb89cb9dcd4', '数据模块-我的面板-个人信息-修改密码', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.modifyPwd(java.lang.String,java.lang.String,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_3', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 583, '/a/sys/staff/modifyPwd', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:00', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('6de0600a349f4124a66aaa5dca19000e', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480757462419&pageNo=1&sortOrder=asc&pageSize=20&parentId=fd8be39d8db44c60917633defe9996c0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 26, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:31:02', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('6e79cf85e2044c3cb255730868b02410', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 2582, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:11:53', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('6fd9dac77d674616b1c19f15c326a018', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 561, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:23:38', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('71b3fd4560ef453798127b59cbb7f7bd', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480757460144&pageNo=0&sortOrder=asc&pageSize=20&parentId=8bfcaa0836a145c3b9cd68c58e1f5aef', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 70, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:31:00', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('71c7d3555c724ec39339cceb99df0e3d', '数据模块-系统设置-机构用户-机构管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.OrgController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_3', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_org_view])', 11, '/a/sys/org/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:56', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('73528bed5b8f4a8a9a994a2c649bdbde', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 22, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:52', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('763dc27054084291945d83999d006650', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 62, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:31', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('8059ac3ee88c46dfb00e7de4d9a20704', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'parentId=1&nd=1450185157256&pageNo=1&sortOrder=asc&pageSize=20&sortName=', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 14, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:37', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('81e56430523f4c7dbd27bd35d5ef4e0c', '数据模块-系统设置-系统管理-字典管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.DictController.list()', 'tabPageId=jerichotabiframe_9', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_dict_view])', 442, '/a/sys/dict/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:15', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('83150f16a7484185bbaad534c7ec7b6e', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480757072573&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 55, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:24:33', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('854276bbdb86404e8b5808c7da3fffee', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756452494&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 36, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:13', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('880eda9751354104bce89672890f9a1e', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756667030&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 53, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:17:47', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('8ca3b2cfd9c54946ac55b9f5f1291ca7', '数据模块-系统设置-机构用户-机构管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.OrgController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_6', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_org_view])', 677, '/a/sys/org/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:07', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('8d71a3fd391048c389e3b680b06ced63', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480757453600&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 42, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:54', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('8f35d7e0d4254121bc1073d9273daa50', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480757266347&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 201, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:27:47', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('9122106641bb4626ba0073bd3d5cb01f', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756384902&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 25, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:13:05', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('92e5e61a02c642378e938f0b9299db8f', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 15, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:24:44', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('9308b10af8d54df5a0d0825476517ee4', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480757463499&pageNo=1&sortOrder=asc&pageSize=20&parentId=fd8be39d8db44c60917633defe9996c0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 25, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:31:04', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('933ae1f06a7e4b56a3be051ab9d6a112', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 18, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:37', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('963aa1e3cf1047bb8f7092d3d9813f9f', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_4', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 15, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:13:05', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('969ff06d8b20443584aeda6c175d569b', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.showSave(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model,org.springframework.web.servlet.mvc.support.RedirectAttributes)', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 416, '/a/sys/staff/showSave', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:13:43', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('9e4ffbcba7d44693bc9c4214006df4cf', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'nd=1450185154794&pageNo=1&sortOrder=asc&pageSize=20&sortName=', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 30, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:35', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('ac8b1c39761049fdaa844edd90fa5f3f', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.findList(com.albedo.common.domain.PageModel,com.albedo.modules.sys.entity.Module)', 'sortName=&nd=1480757468114&pageNo=1&sortOrder=asc&pageSize=20&parentId=4715e01a290c447eac93ee47db6b9c81', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 29, '/a/sys/module/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:31:08', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('ad8161add75547c3bbf3a78c91120e34', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_1', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 110, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:27:46', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('b15ed6e737d843be9c39a04e4cb62ccb', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'repage=', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 10, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:01', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('b4dfcca701a94aa086e6210984a39955', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756641354&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 1205, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:17:23', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('b5457f28fc694fb99adb5412c60638dd', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 747, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:17:03', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('b7e72c06ab8a4c24a02e7b85ac59cc00', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_4', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 1584, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:03', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('b969442f5ef44d759fe24590ccdb9ec0', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756445812&pageNo=1&sortOrder=asc&pageSize=20&queryConditionJson=[]', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 44, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:06', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('bae10b32c38f4d60a974bed4225381a8', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', 'tabPageId=jerichotabiframe_2', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 13, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:35', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('c3607ed0bb484bcf86e92f418d097524', '数据模块-系统设置-机构用户-区域管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.AreaController.list()', 'tabPageId=jerichotabiframe_10', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_area_view])', 531, '/a/sys/area/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:17', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('c37ba06f413441db8b5bee2657712930', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480757018570&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 42725, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:24:21', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('c6e36a2afcb34c91bdac3b7c803782f5', '数据模块-系统设置-系统管理-模块管理-查看列表模块', '0', '1', 'admin', '', 'GET', 'public void com.albedo.modules.sys.controller.ModuleController.findTreeData(java.lang.String,java.lang.String,javax.servlet.http.HttpServletResponse)', 'all=', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 9, '/a/sys/module/findTreeData', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:59', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('c7e432a6a96e4f0895efeaa1d675df26', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 19, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:24:32', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('c91b939daf7943a5b38ddcd2dc1bbeab', '数据模块-系统设置-代码生成-业务表配置', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.gen.controller.GenTableController.list(com.albedo.modules.gen.entity.GenTable,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_17', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[gen_genTable_view])', 691, '/a/gen/genTable', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:45', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('d23f2ccd9c1f4fc096390e59e08d56d3', '数据模块-系统设置-机构用户-用户管理-添加/修改用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.save(com.albedo.modules.sys.entity.Staff,java.lang.String,org.springframework.ui.Model,org.springframework.web.servlet.mvc.support.RedirectAttributes)', 'confirmNewPassword=&orgName=平台 &loginId=test&roleIdList=bf5eeff57a1e4b1fac97bb37b5b73da7&_roleIdList=on&mobile=&photo=&newPassword=&description=&telephone=&type=1&orgId=1&name=&id=&email=&status=0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_save])', 481, '/a/sys/staff/save', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:01', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('da107c368e1a48ed98293e80e10887d2', '数据模块-系统设置-系统管理-模块管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.list()', 'tabPageId=jerichotabiframe_4', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 130, '/a/sys/module/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:58', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('dbdd5eac2cda4b1f9cb676c045ab69a4', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 22, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:17:20', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('dcd6885a21ac4e22bff8bd146d299cdd', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 25, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:17:46', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('de6ea9b0db9444d388df1f47d0c9a0eb', '数据模块-系统设置-系统管理-模块管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.list()', 'tabPageId=jerichotabiframe_7', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 557, '/a/sys/module/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:10', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('e4ae343528984a13a2dffbf463baa8af', '数据模块-系统设置-机构用户-角色管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.RoleController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model,com.albedo.modules.sys.entity.Role)', 'tabPageId=jerichotabiframe_2', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_role_view])', 15, '/a/sys/role/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:30:55', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('e7d31e1942e14406a263495ff0dd55c4', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 15, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:12', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('eba9eb9b714140f4847b03c33680304e', '数据模块-系统设置-系统管理-模块管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.ModuleController.list()', 'tabPageId=jerichotabiframe_4', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_module_view])', 7, '/a/sys/module/', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', '2015-12-15 21:12:37', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('ec8f241fd2fe40f3a6f9199150336866', '数据模块-我的面板-个人信息-个人信息', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.info(com.albedo.modules.sys.entity.Staff,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_0', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[user])', 181, '/a/sys/staff/info', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:27:41', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('f45d2c95abe343d7aa8abde9c640bf68', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756441514&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 55, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:14:02', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('f817467450da4dd3bfc5d7268babf180', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 15, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:29:17', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('fa4fa191a7a243fd808ee1a0fc5631d0', '数据模块-系统设置-代码生成-生成方案配置', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.gen.controller.GenSchemeController.list(com.albedo.modules.gen.entity.GenScheme,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_16', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[gen_genScheme_view])', 555, '/a/gen/genScheme', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:42', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('fc1a5c2c34ab44d0a2adfb6e6faecaa6', '数据模块-系统设置-系统管理-操作日志', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.LogOperateController.list(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,org.springframework.ui.Model)', 'tabPageId=jerichotabiframe_14', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_logOperate_view])', 460, '/a/sys/logOperate/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:36', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('fd438e2d8a6e4514a2ce1375711f4720', '数据模块-系统设置-机构用户-用户管理-查看列表用户', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756501783&pageNo=1&sortOrder=asc&pageSize=20', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 66, '/a/sys/staff/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:15:02', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('fdbae5d81a744251a24bcdf27f1eaca8', '数据模块-系统设置-机构用户-用户管理', '0', '1', 'admin', '', 'GET', 'public java.lang.String com.albedo.modules.sys.controller.StaffController.list()', '', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_staff_view])', 9, '/a/sys/staff/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:29:18', NULL, '0');
INSERT INTO `sys_log_operate_t` VALUES ('ffa8b51b448a4a858f2cfcf46bf66075', '数据模块-系统设置-机构用户-区域管理-查看区域', '0', '1', 'admin', '', 'POST', 'public java.lang.String com.albedo.modules.sys.controller.AreaController.findList(com.albedo.common.domain.PageModel)', 'sortName=&nd=1480756336945&pageNo=1&sortOrder=asc&pageSize=100&queryConditionJson=[{\'fieldName\':\'parentId\',\'operation\':\'=\',\'value\':\'1\'}]', '0:0:0:0:0:0:0:1', '@org.apache.shiro.authz.annotation.RequiresPermissions(logical=AND, value=[sys_area_view])', 808, '/a/sys/area/findList', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '2016-12-03 17:12:18', NULL, '0');

-- ----------------------------
-- Table structure for sys_message_deal_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_deal_t`;
CREATE TABLE `sys_message_deal_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `staff_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deal_time` datetime(0) NULL DEFAULT NULL,
  `version_` int(11) NULL DEFAULT NULL,
  `status_` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_deal_t
-- ----------------------------
INSERT INTO `sys_message_deal_t` VALUES ('07d4ff2bf38444f1827b28ab3929c2f9', 'e7f47c0b61464282af7fd6dd51398130', '28ef444985d145879e89ee8a757c9dc8', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('08f100a0ce40443a8217e3f5ea306a71', 'e7f47c0b61464282af7fd6dd51398130', '26efce8f247e451b830322269bface41', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('0de1187ee2db4b2b8d24bcac577d141f', 'e7f47c0b61464282af7fd6dd51398130', '383d07235e3a4bcb9cf1eb0d15844d57', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('0e6bda00c98842f9a3d2036c6546d411', 'e7f47c0b61464282af7fd6dd51398130', '04f8a454bc0447e09791b5acf6466799', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('0f2e1302e43d41f9aa77c84e0a3931dc', 'e7f47c0b61464282af7fd6dd51398130', '2d1d5a605d364fccbd0f053416d8ba8e', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('327824ae247d41b99652a3032d5b18c2', 'e7f47c0b61464282af7fd6dd51398130', '216ecd201faa429ca8eed65b219a9463', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('4cb62813a06c406d8451b79271a08c1a', 'a6327bef6fd64b1087561a0d8d392c33', '0d7008a0bf1947dcaddde036d275ea34', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('71a2c9f54480404f8459a98e6de7c131', 'e7f47c0b61464282af7fd6dd51398130', '21dda8f61196466f8e6e03ef57518091', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('90c3456693894f73b63699b8d5c43649', 'e7f47c0b61464282af7fd6dd51398130', '2dfb5306b52b46af9544212364c27c13', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('949c6ca4e51d4ab6975235cc01fccedb', 'a6327bef6fd64b1087561a0d8d392c33', '04f8a454bc0447e09791b5acf6466799', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('bb7ba1926f7a4be9a397e4516f160865', 'a6327bef6fd64b1087561a0d8d392c33', '2d1d5a605d364fccbd0f053416d8ba8e', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('c5ca3a9b128a421e9a53cc943a62f284', 'a6327bef6fd64b1087561a0d8d392c33', '216ecd201faa429ca8eed65b219a9463', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('c83a2e0a381643ac99ec1529fbbc92a3', 'a6327bef6fd64b1087561a0d8d392c33', 'fe59fb534cb947fba464a55d53c2403e', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('e7d42e1236754a1eb4644c57947202b1', 'e7f47c0b61464282af7fd6dd51398130', '09471af5826b472790d440e04ab5df5d', NULL, NULL, '0');
INSERT INTO `sys_message_deal_t` VALUES ('ee09d960d333468bb2b1aef2bec0ca56', 'a6327bef6fd64b1087561a0d8d392c33', '26efce8f247e451b830322269bface41', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('ee6d04983642479ba369648841611844', 'a6327bef6fd64b1087561a0d8d392c33', '2dfb5306b52b46af9544212364c27c13', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('f4e241fc7bb14a82b5a62883224c6d9f', 'd56e63ac4b15463caa8d2f17eba25022', '216ecd201faa429ca8eed65b219a9463', NULL, NULL, '-2');
INSERT INTO `sys_message_deal_t` VALUES ('fa465da26da147bba4612e75a5e71636', 'a6327bef6fd64b1087561a0d8d392c33', '09471af5826b472790d440e04ab5df5d', NULL, NULL, '-2');

-- ----------------------------
-- Table structure for sys_message_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_t`;
CREATE TABLE `sys_message_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `type_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息主题',
  `content_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `message_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sender` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件端',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `reciver` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deal_time` datetime(0) NULL DEFAULT NULL,
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_` int(11) NULL DEFAULT NULL,
  `status_` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `FKFBFB834A7A37E1A2`(`sender`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_t
-- ----------------------------
INSERT INTO `sys_message_t` VALUES ('a6327bef6fd64b1087561a0d8d392c33', '0', 'test', '&lt;p&gt;\r\n	testsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsevvtestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsevvtestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsevvtestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsevvtestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsevvtestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsetestsevv&lt;/p&gt;', NULL, '', '0', '1', '2015-04-20 15:04:54', '2015-04-20 15:04:54', NULL, NULL, NULL, NULL, '-2');
INSERT INTO `sys_message_t` VALUES ('d56e63ac4b15463caa8d2f17eba25022', '0', '地对地导弹', '&lt;p&gt;\r\n	顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶v&lt;/p&gt;', NULL, '', '0', '1', '2015-04-20 15:04:11', '2015-04-20 15:04:11', NULL, NULL, NULL, NULL, '-2');
INSERT INTO `sys_message_t` VALUES ('e7f47c0b61464282af7fd6dd51398130', '0', 'testest', '&lt;p&gt;\r\n	&lt;span style=&quot;background-color:lime;&quot;&gt;tsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetsetse&lt;/span&gt;&lt;/p&gt;\r\n&lt;h1&gt;\r\n	&lt;span style=&quot;background-color:lime;&quot;&gt;dfsdfasdfsadfasdfasdf&lt;/span&gt;&lt;/h1&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;background-color:lime;&quot;&gt;dfasdfasdfasdfasd&lt;span style=&quot;background-color:yellow;&quot;&gt;&lt;span style=&quot;font-size:9px;&quot;&gt;sdfasdfasdfasdfsdfad&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:9px;&quot;&gt;sdfsadfsadfasdfsdfdfda&lt;/span&gt;&lt;/p&gt;', NULL, '', '0', '1', '2015-04-20 16:42:48', '2015-04-20 16:42:48', NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_module_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_module_t`;
CREATE TABLE `sys_module_t`  (
  `id_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块编码',
  `name_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '名称',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父module的id',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块类型  0 菜单模块 1权限模块',
  `microservice_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `component_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_` int(11) NULL DEFAULT 0 COMMENT '排序',
  `target_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_method` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `status_` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除  0正常 1不可用',
  `icon_cls` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '针对顶层菜单，0 普通展示下级菜单， 1已树形结构展示',
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version_` int(11) NOT NULL,
  `is_leaf` bit(1) NULL DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'module表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_module_t
-- ----------------------------
INSERT INTO `sys_module_t` VALUES ('024d876a23424ff397c224de2e2939a8', '生成方案配置', 'ee5224dc13404267acfb8fc443dee4c3', '4d32c49cc7f448dcbfb92ce9c4dde058,2d5f2af5e36349b5bb8dfbd5904900c8,ee5224dc13404267acfb8fc443dee4c3,', '1', 'albedobootcloudmicro/api', 'gen_genScheme', NULL, 10, '', '/gen/genScheme/', NULL, '0', 'fa-reddit-square', '0', '', 9, b'1', '', '2016-12-05 11:29:48', NULL, NULL);
INSERT INTO `sys_module_t` VALUES ('0771998f75b444f8b2ec0631c69c644f', '字典管理', '3566c3b5c4114f77a5434c175b9f64c5', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,', '1', 'albedobootcloudmicro/api', 'sys_dict', NULL, 30, '', '/sys/dict/', 'GET', '0', 'fa-navicon', '0', '', 0, b'0', '1', '2016-12-29 14:27:37', '1', '2016-12-29 14:50:38');
INSERT INTO `sys_module_t` VALUES ('08bb2278416a4aaa86a1db7898252791', '编辑', '0771998f75b444f8b2ec0631c69c644f', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,0771998f75b444f8b2ec0631c69c644f,', '2', NULL, 'sys_dict_edit', NULL, 40, NULL, '/sys/dict/edit', 'GET,POST', '0', 'fa-pencil', '0', NULL, 0, b'1', '1', '2016-12-29 14:27:37', '1', '2016-12-29 14:27:37');
INSERT INTO `sys_module_t` VALUES ('113d6198375f44b29bc5979c8a3b76d7', '删除', '7646a936058c4742992e30e261f1549c', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,7646a936058c4742992e30e261f1549c,', '2', NULL, 'sys_fileData_delete', NULL, 80, NULL, '/sys/fileData/delete', 'DELETE', '0', 'fa-trash-o', '0', NULL, 0, b'1', '1', '2018-08-06 17:11:27', '1', '2018-08-06 17:11:27');
INSERT INTO `sys_module_t` VALUES ('1d000d58d1e1482cb8245778f56a5ea0', '锁定', '7646a936058c4742992e30e261f1549c', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,7646a936058c4742992e30e261f1549c,', '2', NULL, 'sys_fileData_lock', NULL, 60, NULL, '/sys/fileData/lock', 'POST', '0', 'fa-lock', '0', NULL, 0, b'1', '1', '2018-08-06 17:11:27', '1', '2018-08-06 17:11:27');
INSERT INTO `sys_module_t` VALUES ('201305b309b0462ab8eb294ab1d42410', '用户管理', '714afd9e5d9f4c0697e502a43a4a2491', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,', '1', 'albedobootcloudmicro/api', 'sys_user', NULL, 30, '', '/sys/user/', 'GET', '0', 'fa-users', '0', '', 1, b'0', '1', '2016-12-29 14:54:14', '1', '2017-06-30 15:01:11');
INSERT INTO `sys_module_t` VALUES ('223b8f1345114589ae09681be4744bbc', '操作日志', '4715e01a290c447eac93ee47db6b9c81', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,', '1', NULL, 'sys_loggingEvent', NULL, 30, '', '/sys/loggingEvent/,/sys/loggingEvent/page', 'GET', '0', 'fa-list-ul', '0', '', 0, b'0', '1', '2017-01-03 14:57:47', '1', '2017-01-04 14:00:42');
INSERT INTO `sys_module_t` VALUES ('25a868347e8f4a6bb68b53925db95692', '编辑机构', 'ce4517a441dc4115a14921419b4d131a', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,ce4517a441dc4115a14921419b4d131a,', '2', NULL, 'sys_org_edit', NULL, 40, '', '/sys/org/edit', 'GET,POST', '0', '', '0', '', 21, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:11');
INSERT INTO `sys_module_t` VALUES ('2d5f2af5e36349b5bb8dfbd5904900c8', '代码生成', '4d32c49cc7f448dcbfb92ce9c4dde058', '4d32c49cc7f448dcbfb92ce9c4dde058,', '1', NULL, '', NULL, 60, '', '', NULL, '0', 'fa-sliders', '0', '', 6, b'0', '', '2016-12-05 11:29:48', '1', '2017-03-27 15:26:05');
INSERT INTO `sys_module_t` VALUES ('3566c3b5c4114f77a5434c175b9f64c5', '系统管理', 'fc987e00a31246aea6d2e2a6afe8db36', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,', '1', NULL, 'sys', NULL, 5, '', '', NULL, '0', 'fa-gear', '1', '_showTree', 24, b'0', '', '2016-12-05 11:29:48', NULL, NULL);
INSERT INTO `sys_module_t` VALUES ('37ceac18a00b4a7ea45c8681035fe402', '模块管理', '3566c3b5c4114f77a5434c175b9f64c5', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,', '1', 'albedobootcloudmicro/api', 'sys_module', NULL, 10, '', '/sys/module/', 'GET,POST,', '0', 'fa-sitemap', '0', '', 24, b'0', '', '2016-12-05 11:29:48', '1', '2016-12-29 15:15:58');
INSERT INTO `sys_module_t` VALUES ('3ce4aa89b1c5483dbc538d3f3ae0a63f', '删除机构', 'ce4517a441dc4115a14921419b4d131a', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,ce4517a441dc4115a14921419b4d131a,', '2', NULL, 'sys_org_delete', NULL, 80, '', '/sys/org/delete', 'DELETE', '0', '', '0', '', 18, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:11');
INSERT INTO `sys_module_t` VALUES ('3ce73e592a8f46d38618a996c29ef863', '编辑', 'e1f8b38201064edaaf72398851c752b7', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,e1f8b38201064edaaf72398851c752b7,', '2', NULL, 'sys_taskScheduleJob_edit', NULL, 40, NULL, '/sys/taskScheduleJob/edit', 'GET,POST', '0', 'fa-pencil', '0', NULL, 0, b'1', '1', '2017-01-23 09:55:09', '1', '2017-01-23 09:55:09');
INSERT INTO `sys_module_t` VALUES ('3dc743ff54734668b45a95dd02276de5', '锁定', '0771998f75b444f8b2ec0631c69c644f', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,0771998f75b444f8b2ec0631c69c644f,', '2', NULL, 'sys_dict_lock', NULL, 60, NULL, '/sys/dict/lock', 'POST', '0', 'fa-lock', '0', NULL, 0, b'1', '1', '2016-12-29 14:27:37', '1', '2016-12-29 14:27:37');
INSERT INTO `sys_module_t` VALUES ('42baef661e504fa998a35d27b0daa3c4', '账户预览', 'fd8be39d8db44c60917633defe9996c0', '4d32c49cc7f448dcbfb92ce9c4dde058,fd8be39d8db44c60917633defe9996c0,', '1', NULL, 'user', NULL, 30, '_top', '/index', 'GET', '0', 'fa-leaf', '0', '', 5, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:00:51');
INSERT INTO `sys_module_t` VALUES ('4715e01a290c447eac93ee47db6b9c81', '资源管理', 'fc987e00a31246aea6d2e2a6afe8db36', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,', '1', NULL, '', NULL, 30, '', '', NULL, '0', 'fa-book', '0', '', 19, b'0', '', '2016-12-05 11:29:48', '1', '2018-08-06 17:11:27');
INSERT INTO `sys_module_t` VALUES ('4d32c49cc7f448dcbfb92ce9c4dde058', '数据模块', '', '', '1', NULL, 'root', NULL, 30, NULL, NULL, NULL, '0', ' fa-reorder', '0', NULL, 10, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:00:51');
INSERT INTO `sys_module_t` VALUES ('5293bd1a28924276a236a4363af5dde8', '启用/停用机构', 'ce4517a441dc4115a14921419b4d131a', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,ce4517a441dc4115a14921419b4d131a,', '2', NULL, 'sys_org_lock', NULL, 60, '', '/sys/org/lock', 'POST', '0', '', '0', '', 19, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('590e0f70d9e9408499cbfed1c02cdd84', '锁定', 'e1f8b38201064edaaf72398851c752b7', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,e1f8b38201064edaaf72398851c752b7,', '2', NULL, 'sys_taskScheduleJob_lock', NULL, 60, NULL, '/sys/taskScheduleJob/lock', 'POST', '0', 'fa-lock', '0', NULL, 0, b'1', '1', '2017-01-23 09:55:09', '1', '2017-01-23 09:55:09');
INSERT INTO `sys_module_t` VALUES ('714afd9e5d9f4c0697e502a43a4a2491', '机构用户', 'fc987e00a31246aea6d2e2a6afe8db36', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,', '1', NULL, '', NULL, 0, '', '', NULL, '0', 'fa-dot-circle-o', '0', '', 11, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:11');
INSERT INTO `sys_module_t` VALUES ('749160f6086f475da6f350543994608e', '查看', 'fa1cf28bbd424fb0b900cf11f10b1817', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,fa1cf28bbd424fb0b900cf11f10b1817,', '2', NULL, 'sys_area_view', NULL, 20, NULL, '/sys/area/page', 'GET', '0', 'fa-info-circle', '0', NULL, 0, b'1', '1', '2016-12-29 14:31:16', '1', '2016-12-29 14:31:16');
INSERT INTO `sys_module_t` VALUES ('75f58401461c486b875f851e18a8ee9d', '锁定', '37ceac18a00b4a7ea45c8681035fe402', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,37ceac18a00b4a7ea45c8681035fe402,', '2', NULL, 'sys_module_lock', NULL, 60, '', '/sys/module/lock', 'POST', '0', '', NULL, '', 22, b'0', '', '2016-12-05 11:29:48', '1', '2017-01-04 11:37:58');
INSERT INTO `sys_module_t` VALUES ('7646a936058c4742992e30e261f1549c', '文件管理', '4715e01a290c447eac93ee47db6b9c81', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,', '1', NULL, 'sys_fileData', NULL, 30, NULL, '/sys/fileData/', 'GET', '0', 'fa-file', '0', NULL, 4, b'0', '1', '2018-08-06 17:11:27', '1', '2018-08-06 17:11:27');
INSERT INTO `sys_module_t` VALUES ('767ac3317dfb4566b92c1bf820f6402a', '删除', 'e1f8b38201064edaaf72398851c752b7', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,e1f8b38201064edaaf72398851c752b7,', '2', NULL, 'sys_taskScheduleJob_delete', NULL, 80, NULL, '/sys/taskScheduleJob/delete', 'DELETE', '0', 'fa-trash-o', '0', NULL, 0, b'1', '1', '2017-01-23 09:55:10', '1', '2017-01-23 09:55:10');
INSERT INTO `sys_module_t` VALUES ('7ff1ee3bd23845b8a1d7ef8df661bb0d', '编辑', '37ceac18a00b4a7ea45c8681035fe402', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,37ceac18a00b4a7ea45c8681035fe402,', '2', NULL, 'sys_module_edit', NULL, 40, '', '/sys/module/edit', 'GET,POST', '0', 'fa-pencil', '0', '', 27, b'0', '', '2016-12-05 11:29:48', '1', '2017-01-04 11:37:46');
INSERT INTO `sys_module_t` VALUES ('826137d6389f4730abb0422d7d252b32', '回话管理', '4715e01a290c447eac93ee47db6b9c81', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,', '1', NULL, 'sys_persistentToken_view', NULL, 30, '', '/sys/persistentToken/,/sys/persistentToken/page', 'GET', '0', 'fa-stack-exchange', '0', '', 0, b'1', '1', '2017-01-04 14:05:52', '1', '2017-01-04 14:05:52');
INSERT INTO `sys_module_t` VALUES ('87825137dec44ea5b04b9e43df1a1d5e', '修改密码', 'fd8be39d8db44c60917633defe9996c0', '4d32c49cc7f448dcbfb92ce9c4dde058,fd8be39d8db44c60917633defe9996c0,', '1', '', '', NULL, 90, '', '/account/changePassword', 'GET,', '0', 'fa-lock', '0', '', 20, b'1', '', '2016-12-05 11:29:48', '1', '2018-07-09 16:12:27');
INSERT INTO `sys_module_t` VALUES ('8d607e3d86ad436b89e3067323021168', '系统监控', '4715e01a290c447eac93ee47db6b9c81', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,', '1', NULL, 'sys_metrics', NULL, 0, '', '/sys/metrics,/management/metrics/', 'GET', '0', 'fa-drupal', NULL, '', 1, b'1', '', '2017-03-02 23:03:19', '1', '2017-06-30 14:46:48');
INSERT INTO `sys_module_t` VALUES ('8e21d10003694354822fe0ad44106ce0', '业务表配置', 'ee5224dc13404267acfb8fc443dee4c3', '4d32c49cc7f448dcbfb92ce9c4dde058,2d5f2af5e36349b5bb8dfbd5904900c8,ee5224dc13404267acfb8fc443dee4c3,', '1', 'albedobootcloudmicro/api', 'gen_genTable', NULL, 100, '', '/gen/genTable/', NULL, '0', 'fa-delicious', '0', '', 10, b'1', '', '2016-12-05 11:29:48', '1', '2016-12-25 17:13:13');
INSERT INTO `sys_module_t` VALUES ('8eae4c0c642a43eba9de678d36ca9186', '删除', '201305b309b0462ab8eb294ab1d42410', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,201305b309b0462ab8eb294ab1d42410,', '2', NULL, 'sys_user_delete', NULL, 80, NULL, '/sys/user/delete', 'DELETE', '0', 'fa-trash-o', '0', NULL, 1, b'1', '1', '2016-12-29 14:54:15', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('93eb238f76874dc78fcf10afb067e9d2', '查看', 'e1f8b38201064edaaf72398851c752b7', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,e1f8b38201064edaaf72398851c752b7,', '2', NULL, 'sys_taskScheduleJob_view', NULL, 20, NULL, '/sys/taskScheduleJob/page', 'GET', '0', 'fa-info-circle', '0', NULL, 0, b'1', '1', '2017-01-23 09:55:09', '1', '2017-01-23 09:55:09');
INSERT INTO `sys_module_t` VALUES ('95a093b48f1947818d50fe09eab72753', '编辑', 'bd7872df2fe748fb97bb1dcc629cdecb', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,bd7872df2fe748fb97bb1dcc629cdecb,', '2', NULL, 'sys_role_edit', NULL, 20, '', '/sys/role/edit', 'GET,POST', '0', '', '0', '', 29, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('9fec2607b166460cb99d9ed2436be506', '接口管理', '4715e01a290c447eac93ee47db6b9c81', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,', '1', NULL, '', NULL, 120, '_blank', '/../swagger-ui/index.html', 'GET', '0', 'fa-hand-pointer-o', '0', '', 5, b'1', '1', '2017-01-05 17:48:44', '1', '2017-11-08 18:16:49');
INSERT INTO `sys_module_t` VALUES ('abd42541d2614a7d9f117ce857645382', '删除', '37ceac18a00b4a7ea45c8681035fe402', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,37ceac18a00b4a7ea45c8681035fe402,', '2', NULL, 'sys_module_delete', NULL, 80, '', '/sys/module/delete', 'DELETE', '0', '', NULL, '', 20, b'0', '', '2016-12-05 11:29:48', '1', '2017-01-04 11:38:04');
INSERT INTO `sys_module_t` VALUES ('af6294af4db4487c930125b40212f6ac', '查看', '37ceac18a00b4a7ea45c8681035fe402', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,37ceac18a00b4a7ea45c8681035fe402,', '2', NULL, 'sys_module_view', NULL, 20, '', '/sys/module/page', 'GET', '0', 'fa-info-circle', '0', '', 29, b'0', '', '2016-12-05 11:29:48', '1', '2017-01-04 11:37:32');
INSERT INTO `sys_module_t` VALUES ('b4dc5bb4a11149d78c765dbef12e13c7', '删除', 'fa1cf28bbd424fb0b900cf11f10b1817', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,fa1cf28bbd424fb0b900cf11f10b1817,', '2', NULL, 'sys_area_delete', NULL, 80, NULL, '/sys/area/delete', 'DELETE', '0', 'fa-trash-o', '0', NULL, 0, b'1', '1', '2016-12-29 14:31:16', '1', '2016-12-29 14:31:16');
INSERT INTO `sys_module_t` VALUES ('b57911172bf74bceae6e22e706d83fb8', '锁定', '201305b309b0462ab8eb294ab1d42410', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,201305b309b0462ab8eb294ab1d42410,', '2', NULL, 'sys_user_lock', NULL, 60, '', '/sys/user/lock', 'POST', '0', 'fa-lock', NULL, '', 1, b'0', '1', '2017-03-02 22:25:04', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('badfe0b992fd4f79b1dfcc2494a47e76', '删除', 'bd7872df2fe748fb97bb1dcc629cdecb', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,bd7872df2fe748fb97bb1dcc629cdecb,', '2', NULL, 'sys_role_delete', NULL, 40, '', '/sys/role/delete', 'DELETE', '0', '', '0', '', 26, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('bc779f2d65da44ad8397a8ff5976ac65', '查看', 'bd7872df2fe748fb97bb1dcc629cdecb', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,bd7872df2fe748fb97bb1dcc629cdecb,', '2', NULL, 'sys_role_view', NULL, 10, '', '/sys/role/page', 'GET', '0', '', '0', '', 28, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('bd7872df2fe748fb97bb1dcc629cdecb', '角色管理', '714afd9e5d9f4c0697e502a43a4a2491', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,', '1', 'albedobootcloudmicro/api', 'sys_role', NULL, 90, '', '/sys/role/', 'GET', '0', 'fa-reorder', '0', '', 26, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('c80dc30eca8d4648a95af074a2dc11e4', '编辑', '7646a936058c4742992e30e261f1549c', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,7646a936058c4742992e30e261f1549c,', '2', NULL, 'sys_fileData_edit', NULL, 40, NULL, '/sys/fileData/edit', 'GET,POST', '0', 'fa-pencil', '0', NULL, 0, b'1', '1', '2018-08-06 17:11:27', '1', '2018-08-06 17:11:27');
INSERT INTO `sys_module_t` VALUES ('ccab7469d8df473c8ff769437f6bd393', '锁定', 'bd7872df2fe748fb97bb1dcc629cdecb', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,bd7872df2fe748fb97bb1dcc629cdecb,', '2', NULL, 'sys_role_lock', NULL, 30, '', '/sys/role/lock', 'POST', '0', '', '0', '', 1, b'0', '1', '2016-12-28 16:53:19', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('ce4517a441dc4115a14921419b4d131a', '机构管理', '714afd9e5d9f4c0697e502a43a4a2491', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,', '1', 'albedobootcloudmicro/api', 'sys_org', NULL, 60, '', '/sys/org/', 'GET', '0', 'fa-th-large', '0', '', 24, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('d40fcdec366f4038971f3d9bb68451eb', '编辑', 'fa1cf28bbd424fb0b900cf11f10b1817', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,fa1cf28bbd424fb0b900cf11f10b1817,', '2', NULL, 'sys_area_edit', NULL, 40, NULL, '/sys/area/edit', 'GET,POST', '0', 'fa-pencil', '0', NULL, 0, b'1', '1', '2016-12-29 14:31:16', '1', '2016-12-29 14:31:16');
INSERT INTO `sys_module_t` VALUES ('d6814dcbdb624077afeb95d856ad76d0', '删除', '0771998f75b444f8b2ec0631c69c644f', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,0771998f75b444f8b2ec0631c69c644f,', '2', NULL, 'sys_dict_delete', NULL, 80, NULL, '/sys/dict/delete', 'DELETE', '0', 'fa-trash-o', '0', NULL, 0, b'1', '1', '2016-12-29 14:27:37', '1', '2016-12-29 14:27:37');
INSERT INTO `sys_module_t` VALUES ('d7069653320643e89b3c93dcdfa5b2c6', '编辑', '201305b309b0462ab8eb294ab1d42410', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,201305b309b0462ab8eb294ab1d42410,', '2', NULL, 'sys_user_edit', NULL, 40, NULL, '/sys/user/edit', 'GET,POST', '0', 'fa-pencil', '0', NULL, 1, b'1', '1', '2016-12-29 14:54:15', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('e1f8b38201064edaaf72398851c752b7', '任务调度管理', '3566c3b5c4114f77a5434c175b9f64c5', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,', '1', 'albedobootcloudmicro/api', 'sys_taskScheduleJob', NULL, 30, NULL, '/sys/taskScheduleJob/', 'GET', '0', 'fa-file', '0', NULL, 0, b'0', '1', '2017-01-23 09:55:08', '1', '2017-01-23 09:55:09');
INSERT INTO `sys_module_t` VALUES ('e5223c949502447fa1a1f2b579203608', '锁定', 'fa1cf28bbd424fb0b900cf11f10b1817', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,fa1cf28bbd424fb0b900cf11f10b1817,', '2', NULL, 'sys_area_lock', NULL, 60, NULL, '/sys/area/lock', 'POST', '0', 'fa-lock', '0', NULL, 0, b'1', '1', '2016-12-29 14:31:16', '1', '2016-12-29 14:31:16');
INSERT INTO `sys_module_t` VALUES ('eaaff69aa81d448eb465d729bdad0508', '查看列表机构', 'ce4517a441dc4115a14921419b4d131a', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,ce4517a441dc4115a14921419b4d131a,', '2', NULL, 'sys_org_view', NULL, 20, '', '/sys/org/page', 'GET', '0', 'frame/images/icons/32X32/consulting.gif', '0', '', 21, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('ee5224dc13404267acfb8fc443dee4c3', '代码生成', '2d5f2af5e36349b5bb8dfbd5904900c8', '4d32c49cc7f448dcbfb92ce9c4dde058,2d5f2af5e36349b5bb8dfbd5904900c8,', '1', NULL, '', NULL, 0, '', '', NULL, '0', 'fa-ils', '0', '', 10, b'0', '', '2016-12-05 11:29:48', NULL, NULL);
INSERT INTO `sys_module_t` VALUES ('f5dc958155df4deaba4947bd9989202d', '查看', '0771998f75b444f8b2ec0631c69c644f', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,0771998f75b444f8b2ec0631c69c644f,', '2', NULL, 'sys_dict_view', NULL, 20, '', '/sys/dict/page', 'GET', '0', 'fa-info-circle', '0', '', 0, b'0', '1', '2016-12-29 14:27:37', '1', '2016-12-29 16:48:30');
INSERT INTO `sys_module_t` VALUES ('fa1cf28bbd424fb0b900cf11f10b1817', '区域管理', '3566c3b5c4114f77a5434c175b9f64c5', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,3566c3b5c4114f77a5434c175b9f64c5,', '1', 'albedobootcloudmicro/api', 'sys_area', NULL, 60, '', '/sys/area/', 'GET', '0', 'fa-map', '0', '', 0, b'0', '1', '2016-12-29 14:31:16', '1', '2016-12-29 14:49:29');
INSERT INTO `sys_module_t` VALUES ('fc987e00a31246aea6d2e2a6afe8db36', '系统设置', '4d32c49cc7f448dcbfb92ce9c4dde058', '4d32c49cc7f448dcbfb92ce9c4dde058,', '1', NULL, 'sm', NULL, 30, '', '', NULL, '0', 'fa-asterisk', '1', '', 28, b'0', '', '2016-12-05 11:29:48', '1', '2018-07-10 17:09:45');
INSERT INTO `sys_module_t` VALUES ('fcf49184c1854cc8958e4bb6de7b15b5', '业务中心', '4d32c49cc7f448dcbfb92ce9c4dde058', '4d32c49cc7f448dcbfb92ce9c4dde058,', '1', NULL, '', NULL, 20, '', '', NULL, '0', 'fa-lemon-o', '0', '', 36, b'0', '1', '2017-03-27 15:26:46', '1', '2018-07-11 10:58:45');
INSERT INTO `sys_module_t` VALUES ('fd8be39d8db44c60917633defe9996c0', '账户中心', '4d32c49cc7f448dcbfb92ce9c4dde058', '4d32c49cc7f448dcbfb92ce9c4dde058,', '1', NULL, '', NULL, 10, '', '', NULL, '0', 'fa-gear', '0', '', 15, b'0', '', '2016-12-05 11:29:48', '1', '2017-06-30 15:00:51');
INSERT INTO `sys_module_t` VALUES ('fe5dcdbcc132480da84701173a3fb5f2', '查看', '201305b309b0462ab8eb294ab1d42410', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,714afd9e5d9f4c0697e502a43a4a2491,201305b309b0462ab8eb294ab1d42410,', '2', NULL, 'sys_user_view', NULL, 20, NULL, '/sys/user/page', 'GET', '0', 'fa-info-circle', '0', NULL, 1, b'1', '1', '2016-12-29 14:54:14', '1', '2017-06-30 15:01:12');
INSERT INTO `sys_module_t` VALUES ('fefd0f584dba4a68975712194c366492', '查看', '7646a936058c4742992e30e261f1549c', '4d32c49cc7f448dcbfb92ce9c4dde058,fc987e00a31246aea6d2e2a6afe8db36,4715e01a290c447eac93ee47db6b9c81,7646a936058c4742992e30e261f1549c,', '2', NULL, 'sys_fileData_view', NULL, 20, NULL, '/sys/fileData/page', 'GET', '0', 'fa-info-circle', '0', NULL, 0, b'1', '1', '2018-08-06 17:11:27', '1', '2018-08-06 17:11:27');

-- ----------------------------
-- Table structure for sys_org_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_t`;
CREATE TABLE `sys_org_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `name_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `grade_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `is_leaf` bit(1) NULL DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `en_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_` int(11) NULL DEFAULT 0 COMMENT '序号',
  `type_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织类型',
  `status_` int(11) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` datetime(0) NULL DEFAULT NULL,
  `version_` int(11) NULL DEFAULT NULL,
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `FK2006A5E73CA88251`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_org_t
-- ----------------------------
INSERT INTO `sys_org_t` VALUES ('1', '平台', '0', '0,', '100000', '1', b'0', 'root', 30, '1', 0, '', '2016-12-12 16:32:48', '1', '2018-07-11 14:31:01', 9, NULL);
INSERT INTO `sys_org_t` VALUES ('14e596870e0f4ab59d64e1d5e1a4a403', '立架班组（上导）', '186eaa340c934cb49434765f807fdeff', '0,1,186eaa340c934cb49434765f807fdeff,', '', '2', b'1', NULL, 60, '2', -2, '1', '2018-07-11 15:34:40', '1', '2018-07-17 13:34:02', 2, '');
INSERT INTO `sys_org_t` VALUES ('186eaa340c934cb49434765f807fdeff', '两当隧道左线', '1', '0,1,', '100000', '1', b'0', NULL, 10, '1', -2, '', '2016-12-12 16:32:48', '1', '2018-07-17 13:34:02', 9, '');
INSERT INTO `sys_org_t` VALUES ('27db8e3b19364a279b1e9721b5a784c7', '人事部', '38c65b8630ff473aa9f618906401efa0', '0,1,38c65b8630ff473aa9f618906401efa0,', '100005', '1', b'1', NULL, 20, '1', -2, '', '2016-12-12 16:32:48', '1', '2018-07-11 14:26:37', 1, '');
INSERT INTO `sys_org_t` VALUES ('38c65b8630ff473aa9f618906401efa0', '综合部', '1', '0,1,', '100004', '1', b'0', NULL, 0, '1', -2, '', '2016-12-12 16:32:48', '1', '2018-07-11 14:26:37', 3, '');
INSERT INTO `sys_org_t` VALUES ('40cd4e7d47114a2a89ee6c3bc02e374d', '对对对', '38c65b8630ff473aa9f618906401efa0', '0,1,38c65b8630ff473aa9f618906401efa0,', '方法', '2', b'1', NULL, 80, '1', -2, '1', '2017-11-08 17:13:18', '1', '2017-11-08 17:17:03', 3, '');
INSERT INTO `sys_org_t` VALUES ('4e75509816c94e5f80237bb7f15132c1', '开挖班组（上导）', '186eaa340c934cb49434765f807fdeff', '0,1,186eaa340c934cb49434765f807fdeff,', '', '2', b'1', NULL, 30, '2', -2, '1', '2018-07-11 14:32:27', '1', '2018-07-17 13:34:02', 1, '');
INSERT INTO `sys_org_t` VALUES ('588e010702d343fe9082416102e49def', 'fdsa', 'c5fe48b99ad24e83a2271405a43fb8b7', '0,1,c5fe48b99ad24e83a2271405a43fb8b7,', 'dsfas', '1', b'1', NULL, 0, '1', -2, '', '2016-12-12 16:32:48', '1', '2017-06-30 16:40:02', 1, '');
INSERT INTO `sys_org_t` VALUES ('5a9a987f7e4a4f9ca58c63645e5b6aab', '陕口隧道进口左线', '1', '0,1,', '100003', '1', b'1', NULL, 40, '1', -2, '1', '2018-07-11 14:30:09', '1', '2018-07-17 13:34:09', 3, '');
INSERT INTO `sys_org_t` VALUES ('c4f84e7695d94b469d93405fb73060d0', 'dd', '38c65b8630ff473aa9f618906401efa0', '0,1,38c65b8630ff473aa9f618906401efa0,', '', '1', b'1', NULL, 30, '1', -2, '', '2017-03-02 22:23:11', '1', '2017-06-30 16:39:57', 1, '');
INSERT INTO `sys_org_t` VALUES ('c5fe48b99ad24e83a2271405a43fb8b7', '陕口隧道进口右线', '1', '0,1,', '100004', '1', b'1', NULL, 60, '1', -2, '', '2016-12-12 16:32:48', '1', '2018-07-17 13:34:07', 4, '');
INSERT INTO `sys_org_t` VALUES ('f2b3397b79684d69b10a090b4f415844', '出渣班组', '186eaa340c934cb49434765f807fdeff', '0,1,186eaa340c934cb49434765f807fdeff,', '', '2', b'1', NULL, 60, '2', -2, '1', '2018-07-11 15:30:58', '1', '2018-07-17 13:34:02', 3, '');
INSERT INTO `sys_org_t` VALUES ('f93883513a034577a166b424beb93794', '两当隧道右线', '1', '0,1,', '100001', '1', b'1', NULL, 30, '1', -2, '', '2016-12-12 16:32:48', '1', '2018-07-17 13:34:00', 3, '');

-- ----------------------------
-- Table structure for sys_role_module_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_module_t`;
CREATE TABLE `sys_role_module_t`  (
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `module_id`) USING BTREE,
  INDEX `FK_6eloh5l1ylo4pteqj5n1viu3c`(`module_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_module_t
-- ----------------------------
INSERT INTO `sys_role_module_t` VALUES ('43186a6c08d247c098ea357e28cc75f4', '4d32c49cc7f448dcbfb92ce9c4dde058');

-- ----------------------------
-- Table structure for sys_role_org_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_org_t`;
CREATE TABLE `sys_role_org_t`  (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`, `org_id`) USING BTREE,
  INDEX `FK4C18BAB12A44C67D`(`org_id`) USING BTREE,
  INDEX `FK4C18BAB1B90B46FD`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_t`;
CREATE TABLE `sys_role_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `name_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sys_data` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否系统数据',
  `data_scope` int(11) NULL DEFAULT NULL COMMENT '数据范围',
  `status_` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除  0正常 1不可用',
  `sort_` int(11) NULL DEFAULT 0 COMMENT '序号',
  `type_` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应activiti中的group表',
  `en_` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_` int(11) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `FKE5C4B49D852279D7`(`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_t
-- ----------------------------
INSERT INTO `sys_role_t` VALUES ('43186a6c08d247c098ea357e28cc75f4', '管理员', '1', '1', 1, '0', 0, NULL, NULL, '', 6, '', '2017-11-23 21:25:41', '1', '2017-11-23 21:25:42');

-- ----------------------------
-- Table structure for sys_task_schedule_job_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_schedule_job_t`;
CREATE TABLE `sys_task_schedule_job_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `group_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `spring_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean',
  `source_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务调用的方法名',
  `method_params` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `status_` int(11) NULL DEFAULT NULL,
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `name_group`(`name_`, `group_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task_schedule_job_t
-- ----------------------------
INSERT INTO `sys_task_schedule_job_t` VALUES ('e864d607c3374f059903eb037c46c49c', 'sample', 'test', '0', '*/5 * * * * ?', '', '1', 'sampleService', '', 'hello', '', '1', '2017-02-15 14:30:11', '1', '2017-06-30 15:01:25', 0, '', 1);

-- ----------------------------
-- Table structure for sys_user_role_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_t`;
CREATE TABLE `sys_user_role_t`  (
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_k7q8xbl92flmkhwupf64o6ii5`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role_t
-- ----------------------------
INSERT INTO `sys_user_role_t` VALUES ('2', '43186a6c08d247c098ea357e28cc75f4');
INSERT INTO `sys_user_role_t` VALUES ('5', '43186a6c08d247c098ea357e28cc75f4');
INSERT INTO `sys_user_role_t` VALUES ('fff43e1b172544e890a86f7b38fe6138', '43186a6c08d247c098ea357e28cc75f4');

-- ----------------------------
-- Table structure for sys_user_t
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_t`;
CREATE TABLE `sys_user_t`  (
  `id_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '类型',
  `key_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lang_key` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `property_` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reset_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reset_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `status_` int(11) NULL DEFAULT NULL,
  `description_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `login`(`login_id`) USING BTREE,
  UNIQUE INDEX `idx_user_login`(`login_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_t
-- ----------------------------
INSERT INTO `sys_user_t` VALUES ('1', NULL, NULL, 'admin', '$2a$10$LqPGl3Eg4y8Y18cg8ZmBZ.neox2ldzwYOUl7kpGhhL0F8Q80gev5W', 'Administrator', 'admin@localhost', NULL, 'system', NULL, 'zh-cn', NULL, NULL, NULL, 'system', '2018-07-17 13:14:36', 'system', NULL, 0, NULL, 0);
INSERT INTO `sys_user_t` VALUES ('2', '1', '/2018/7/18/848cd05dcb714d96b262b97fd54e2ddb.jpg', 'mange', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', '李武', 'anonymous@localhost1', '', 'system', '', 'zh-cn', NULL, '07101724038444399296', '2018-07-18 17:00:54', 'system', '2018-07-17 13:14:38', '1', '2018-07-18 17:00:54', 0, '<p>fdsfg</p>', 17);

SET FOREIGN_KEY_CHECKS = 1;
