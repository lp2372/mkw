/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : mxwonline

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 02/11/2018 17:22:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (9, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (10, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (11, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (24, 'Can add 邮箱验证', 7, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (25, 'Can change 邮箱验证', 7, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (26, 'Can delete 邮箱验证', 7, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (27, 'Can add 轮播图', 8, 'add_banner');
INSERT INTO `auth_permission` VALUES (28, 'Can change 轮播图', 8, 'change_banner');
INSERT INTO `auth_permission` VALUES (29, 'Can delete 轮播图', 8, 'delete_banner');
INSERT INTO `auth_permission` VALUES (30, 'Can view 轮播图', 8, 'view_banner');
INSERT INTO `auth_permission` VALUES (31, 'Can view 邮箱验证', 7, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (32, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (33, 'Can add 课程', 9, 'add_course');
INSERT INTO `auth_permission` VALUES (34, 'Can change 课程', 9, 'change_course');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 课程', 9, 'delete_course');
INSERT INTO `auth_permission` VALUES (36, 'Can add 章节', 10, 'add_lesson');
INSERT INTO `auth_permission` VALUES (37, 'Can change 章节', 10, 'change_lesson');
INSERT INTO `auth_permission` VALUES (38, 'Can delete 章节', 10, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (39, 'Can add 视频', 11, 'add_viedo');
INSERT INTO `auth_permission` VALUES (40, 'Can change 视频', 11, 'change_viedo');
INSERT INTO `auth_permission` VALUES (41, 'Can delete 视频', 11, 'delete_viedo');
INSERT INTO `auth_permission` VALUES (42, 'Can add 课程资源', 12, 'add_courseresource');
INSERT INTO `auth_permission` VALUES (43, 'Can change 课程资源', 12, 'change_courseresource');
INSERT INTO `auth_permission` VALUES (44, 'Can delete 课程资源', 12, 'delete_courseresource');
INSERT INTO `auth_permission` VALUES (45, 'Can view 课程', 9, 'view_course');
INSERT INTO `auth_permission` VALUES (46, 'Can view 课程资源', 12, 'view_courseresource');
INSERT INTO `auth_permission` VALUES (47, 'Can view 章节', 10, 'view_lesson');
INSERT INTO `auth_permission` VALUES (48, 'Can view 视频', 11, 'view_viedo');
INSERT INTO `auth_permission` VALUES (49, 'Can add 城市', 13, 'add_citydict');
INSERT INTO `auth_permission` VALUES (50, 'Can change 城市', 13, 'change_citydict');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 城市', 13, 'delete_citydict');
INSERT INTO `auth_permission` VALUES (52, 'Can add 机构', 14, 'add_courseorg');
INSERT INTO `auth_permission` VALUES (53, 'Can change 机构', 14, 'change_courseorg');
INSERT INTO `auth_permission` VALUES (54, 'Can delete 机构', 14, 'delete_courseorg');
INSERT INTO `auth_permission` VALUES (55, 'Can add 教师', 15, 'add_teacher');
INSERT INTO `auth_permission` VALUES (56, 'Can change 教师', 15, 'change_teacher');
INSERT INTO `auth_permission` VALUES (57, 'Can delete 教师', 15, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (58, 'Can view 城市', 13, 'view_citydict');
INSERT INTO `auth_permission` VALUES (59, 'Can view 机构', 14, 'view_courseorg');
INSERT INTO `auth_permission` VALUES (60, 'Can view 教师', 15, 'view_teacher');
INSERT INTO `auth_permission` VALUES (61, 'Can add 用户咨询', 16, 'add_userask');
INSERT INTO `auth_permission` VALUES (62, 'Can change 用户咨询', 16, 'change_userask');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 用户咨询', 16, 'delete_userask');
INSERT INTO `auth_permission` VALUES (64, 'Can add 课程评论', 17, 'add_coursecomment');
INSERT INTO `auth_permission` VALUES (65, 'Can change 课程评论', 17, 'change_coursecomment');
INSERT INTO `auth_permission` VALUES (66, 'Can delete 课程评论', 17, 'delete_coursecomment');
INSERT INTO `auth_permission` VALUES (67, 'Can add 用户收藏', 18, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (68, 'Can change 用户收藏', 18, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (69, 'Can delete 用户收藏', 18, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (70, 'Can add 用户信息', 19, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (71, 'Can change 用户信息', 19, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (72, 'Can delete 用户信息', 19, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (73, 'Can add 用户课程', 20, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (74, 'Can change 用户课程', 20, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 用户课程', 20, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (76, 'Can view 课程评论', 17, 'view_coursecomment');
INSERT INTO `auth_permission` VALUES (77, 'Can view 用户咨询', 16, 'view_userask');
INSERT INTO `auth_permission` VALUES (78, 'Can view 用户课程', 20, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (79, 'Can view 用户收藏', 18, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (80, 'Can view 用户信息', 19, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (81, 'Can add Bookmark', 21, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can change Bookmark', 21, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (83, 'Can delete Bookmark', 21, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (84, 'Can add User Setting', 22, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (85, 'Can change User Setting', 22, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (86, 'Can delete User Setting', 22, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (87, 'Can add User Widget', 23, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (88, 'Can change User Widget', 23, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (89, 'Can delete User Widget', 23, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (90, 'Can add log entry', 24, 'add_log');
INSERT INTO `auth_permission` VALUES (91, 'Can change log entry', 24, 'change_log');
INSERT INTO `auth_permission` VALUES (92, 'Can delete log entry', 24, 'delete_log');
INSERT INTO `auth_permission` VALUES (93, 'Can view Bookmark', 21, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (94, 'Can view log entry', 24, 'view_log');
INSERT INTO `auth_permission` VALUES (95, 'Can view User Setting', 22, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (96, 'Can view User Widget', 23, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (97, 'Can add revision', 25, 'add_revision');
INSERT INTO `auth_permission` VALUES (98, 'Can change revision', 25, 'change_revision');
INSERT INTO `auth_permission` VALUES (99, 'Can delete revision', 25, 'delete_revision');
INSERT INTO `auth_permission` VALUES (100, 'Can add version', 26, 'add_version');
INSERT INTO `auth_permission` VALUES (101, 'Can change version', 26, 'change_version');
INSERT INTO `auth_permission` VALUES (102, 'Can delete version', 26, 'delete_version');
INSERT INTO `auth_permission` VALUES (103, 'Can view revision', 25, 'view_revision');
INSERT INTO `auth_permission` VALUES (104, 'Can view version', 26, 'view_version');
INSERT INTO `auth_permission` VALUES (105, 'Can add captcha store', 27, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (106, 'Can change captcha store', 27, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (107, 'Can delete captcha store', 27, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (108, 'Can view captcha store', 27, 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (148, 'RRJA', 'rrja', 'd4938a887248a3d4fcb6fcf4f6daf32dc3195b5c', '2018-10-24 11:29:14.401119');
INSERT INTO `captcha_captchastore` VALUES (149, 'FPVJ', 'fpvj', '762185a3e670246e312af39cce03191582458a1a', '2018-10-24 11:29:14.399010');
INSERT INTO `captcha_captchastore` VALUES (151, 'TFLV', 'tflv', '8b01fbb0ad9fecfb6c1bfd707d28c9fa0b3de22a', '2018-10-24 11:29:25.389424');
INSERT INTO `captcha_captchastore` VALUES (152, 'RDLR', 'rdlr', '164616120f00b68a8b9aa05e88b1058ade41462a', '2018-10-24 11:29:25.390805');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degree` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_time` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) NULL DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `teacher_tell` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `youneed` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_course_11456c5a`(`course_org_id`) USING BTREE,
  INDEX `courses_course_d9614d40`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES (1, 'django与vue', '基础入门', '简单入门知识', 'cj', 30, 11, 7, 'courses/2018/10/540e57300001d6d906000338-240-135.jpg', 15, '2018-10-18 09:25:00.000000', 2, '后端开发', 'java', 1, '你能学会django的基本使用', '你至少需要python基础');
INSERT INTO `courses_course` VALUES (2, 'java入门', '基础java', 'java', 'zj', 12, 2, 8, 'courses/2018/10/57035ff200014b8a06000338-240-135_0nFiBSI.jpg', 0, '2018-10-29 16:24:00.000000', 2, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (3, 'mysql 数据库', 'mysql 数据库', 'mysql 数据库mysql 数据库mysql 数据库mysql 数据库mysql 数据库', 'cj', 12, 5, 7, 'courses/2018/10/mysql.jpg', 44, '2018-10-30 10:33:00.000000', 5, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (4, 'python 文件处理', 'python 文件处理', 'python 文件处理python 文件处理python 文件处理python 文件处理python 文件处理python 文件处理python 文件处理python 文件处理python 文件处理python 文件处理', 'zj', 34, 12, 23, 'courses/2018/10/python3.jpg', 23, '2018-10-30 10:35:00.000000', 5, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (5, 'python 错误异常', '搜索', 'python 错误异常python 错误异常python 错误异常', 'zj', 56, 12, 12, 'courses/2018/10/python.jpg', 12, '2018-10-30 10:42:00.000000', 4, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (6, '面向对象', '类与对象', '面向对象面向对象面向对象面向对象面向对象面向对象面向对象面向对象', 'gj', 45, 12, 45, 'courses/2018/10/python1.jpg', 35, '2018-10-30 10:43:00.000000', 3, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (7, 'python入门１', 'python入门１', 'python入门１python入门１python入门１python入门１python入门１python入门１python入门１', 'cj', 23, 12, 23, 'courses/2018/10/540e57300001d6d906000338-240-135_mvvGYHL.jpg', 13, '2018-10-30 10:44:00.000000', 6, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (8, 'python入门2', 'python入门2', 'python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2python入门2', 'gj', 45, 11, 23, 'courses/2018/10/540e57300001d6d906000338-240-135_mvvGYHL_mk3CdvS.jpg', 23, '2018-10-30 10:45:00.000000', 10, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (9, 'dajngo', 'dajngo', 'dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo dajngo', 'gj', 67, 123, 234, 'courses/2018/10/540e57300001d6d906000338-240-135_Z3HIQ2t.jpg', 23, '2018-10-30 10:46:00.000000', 11, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (10, 'Flask', 'Flask', 'FlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlaskFlask', 'gj', 56, 78, 234, 'courses/2018/10/540e57300001d6d906000338-240-135_wH52IED.jpg', 12, '2018-10-30 10:47:00.000000', 8, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (11, 'scrapy', 'scrapy', 'scrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapyscrapy', 'gj', 66, 123, 34, 'courses/2018/10/540e57300001d6d906000338-240-135_MSIqfvw.jpg', 12, '2018-10-30 10:47:00.000000', 3, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (12, 'numpy', 'numpy', 'numpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpynumpy', 'gj', 90, 123, 234, 'courses/2018/10/python1_CoieddA.jpg', 1234, '2018-10-30 10:49:00.000000', 2, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (13, 'java入门1', 'java入门1', 'java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1java入门1', 'zj', 56, 2, 13, 'courses/2018/10/57035ff200014b8a06000338-240-135_dHfj8Nq.jpg', 166, '2018-10-30 10:55:00.000000', 2, '后端开发', 'java', NULL, '', '');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresource_course_id_5eba1332_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES (1, '前段资源', 'course/resource/2018/10/media.zip', '2018-10-30 20:29:00.000000', 1);
INSERT INTO `courses_courseresource` VALUES (2, 'html文件', 'course/resource/2018/10/usercenter-fav-teacher.html', '2018-10-30 20:31:00.000000', 1);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (2, '第一章：进阶开发', '2018-10-18 09:39:00.000000', 1);
INSERT INTO `courses_lesson` VALUES (3, '第二章：基础知识', '2018-10-30 19:35:00.000000', 1);
INSERT INTO `courses_lesson` VALUES (4, '第三章：需求分析以及数据库设计', '2018-10-30 19:37:00.000000', 1);
INSERT INTO `courses_lesson` VALUES (5, '第四章　xadmin搭建后台', '2018-10-30 19:38:00.000000', 1);

-- ----------------------------
-- Table structure for courses_viedo
-- ----------------------------
DROP TABLE IF EXISTS `courses_viedo`;
CREATE TABLE `courses_viedo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_viedo_lesson_id_43979d5a_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_viedo_lesson_id_43979d5a_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_viedo
-- ----------------------------
INSERT INTO `courses_viedo` VALUES (1, '1.1 hello word', '2018-10-30 19:41:00.000000', 3, 'http://www.imooc.com/viedo/1430', 0);
INSERT INTO `courses_viedo` VALUES (2, '1.2基本概念', '2018-10-30 19:44:00.000000', 3, 'http://www.imooc.com/viedo/1430', 0);
INSERT INTO `courses_viedo` VALUES (3, '2.1 test1', '2018-10-30 19:45:00.000000', 2, 'http://www.imooc.com/viedo/1430', 0);
INSERT INTO `courses_viedo` VALUES (4, '2.2 test2', '2018-10-30 19:45:00.000000', 2, 'http://www.imooc.com/viedo/1430', 0);
INSERT INTO `courses_viedo` VALUES (5, '3.1 django app设计', '2018-10-30 19:45:00.000000', 4, 'http://www.imooc.com/viedo/1430', 2);
INSERT INTO `courses_viedo` VALUES (6, '3.2 django model设计', '2018-10-30 19:46:00.000000', 4, 'http://www.imooc.com/viedo/1430', 0);
INSERT INTO `courses_viedo` VALUES (7, '3.3 django user设计', '2018-10-30 19:46:00.000000', 4, 'http://www.imooc.com/viedo/1430', 1);
INSERT INTO `courses_viedo` VALUES (8, '3.4 django course设计', '2018-10-30 19:46:00.000000', 4, 'http://www.imooc.com/viedo/1430', 3);
INSERT INTO `courses_viedo` VALUES (9, '4.1 django xadmin 讲解', '2018-10-30 19:47:00.000000', 5, 'http://www.imooc.com/viedo/1430', 23);
INSERT INTO `courses_viedo` VALUES (10, '4.2 xadmin安装与注册', '2018-10-30 19:47:00.000000', 5, 'http://www.imooc.com/viedo/1430', 12);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (27, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'courses', 'course');
INSERT INTO `django_content_type` VALUES (12, 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES (10, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (11, 'courses', 'viedo');
INSERT INTO `django_content_type` VALUES (17, 'operation', 'coursecomment');
INSERT INTO `django_content_type` VALUES (16, 'operation', 'userask');
INSERT INTO `django_content_type` VALUES (20, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (18, 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES (19, 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES (13, 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES (14, 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES (15, 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES (25, 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES (26, 'reversion', 'version');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (7, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-10-18 09:14:51.848298');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-10-18 09:14:52.155338');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-10-18 09:14:52.728771');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-10-18 09:14:52.804761');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-10-18 09:14:52.816684');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-10-18 09:14:52.844288');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-10-18 09:14:52.875080');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-10-18 09:14:53.067681');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-10-18 09:14:53.094001');
INSERT INTO `django_migrations` VALUES (10, 'users', '0001_initial', '2018-10-18 09:14:53.621207');
INSERT INTO `django_migrations` VALUES (11, 'admin', '0001_initial', '2018-10-18 09:14:53.901981');
INSERT INTO `django_migrations` VALUES (12, 'admin', '0002_logentry_remove_auto_add', '2018-10-18 09:14:53.933463');
INSERT INTO `django_migrations` VALUES (13, 'courses', '0001_initial', '2018-10-18 09:14:54.199346');
INSERT INTO `django_migrations` VALUES (14, 'courses', '0002_auto_20181018_0914', '2018-10-18 09:14:54.261530');
INSERT INTO `django_migrations` VALUES (15, 'operation', '0001_initial', '2018-10-18 09:14:55.026185');
INSERT INTO `django_migrations` VALUES (16, 'organization', '0001_initial', '2018-10-18 09:14:55.161106');
INSERT INTO `django_migrations` VALUES (17, 'reversion', '0001_squashed_0004_auto_20160611_1202', '2018-10-18 09:14:55.429033');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2018-10-18 09:14:55.532105');
INSERT INTO `django_migrations` VALUES (19, 'users', '0002_banner_emailverifyrecord', '2018-10-18 09:14:55.580395');
INSERT INTO `django_migrations` VALUES (20, 'users', '0003_auto_20181017_1551', '2018-10-18 09:14:55.650294');
INSERT INTO `django_migrations` VALUES (21, 'xadmin', '0001_initial', '2018-10-18 09:14:55.949388');
INSERT INTO `django_migrations` VALUES (22, 'xadmin', '0002_log', '2018-10-18 09:14:56.178241');
INSERT INTO `django_migrations` VALUES (23, 'xadmin', '0003_auto_20160715_0100', '2018-10-18 09:14:56.324254');
INSERT INTO `django_migrations` VALUES (24, 'organization', '0002_auto_20181018_0956', '2018-10-18 09:56:09.128772');
INSERT INTO `django_migrations` VALUES (25, 'captcha', '0001_initial', '2018-10-18 20:47:51.065325');
INSERT INTO `django_migrations` VALUES (26, 'organization', '0003_courseorg_category', '2018-10-26 10:59:24.972643');
INSERT INTO `django_migrations` VALUES (27, 'organization', '0004_auto_20181029_1130', '2018-10-29 11:30:40.712460');
INSERT INTO `django_migrations` VALUES (28, 'courses', '0003_course_course_org', '2018-10-29 16:23:36.173430');
INSERT INTO `django_migrations` VALUES (29, 'organization', '0005_teacher_image', '2018-10-29 17:11:48.776773');
INSERT INTO `django_migrations` VALUES (30, 'courses', '0004_course_category', '2018-10-30 14:55:15.649215');
INSERT INTO `django_migrations` VALUES (31, 'courses', '0005_course_tag', '2018-10-30 15:50:02.556903');
INSERT INTO `django_migrations` VALUES (32, 'courses', '0006_viedo_url', '2018-10-30 19:41:12.116907');
INSERT INTO `django_migrations` VALUES (33, 'courses', '0007_viedo_learn_time', '2018-10-30 20:17:16.642259');
INSERT INTO `django_migrations` VALUES (35, 'courses', '0002_course_abc', '2018-10-30 21:05:19.658821');
INSERT INTO `django_migrations` VALUES (36, 'courses', '0003_auto_20181030_2107', '2018-10-30 21:07:09.949196');
INSERT INTO `django_migrations` VALUES (37, 'courses', '0004_auto_20181030_2113', '2018-10-30 21:13:19.872536');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_de54fa62`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('30440hvy0lkpi7xa8tp7lcxf7g14hotw', 'ZDk4MWQxYTA1ZjAzYWYwNTNiZWQwYjdjYmE5ZjM0ODA4OTA5ZTBlOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjZjM4OTY1Mjc4ZWVhODA0MzFhMTZjZjJlZmQzNWVmNTQwNmVmYzYiLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:27:14.533268');
INSERT INTO `django_session` VALUES ('3hj5ef7o6gtvfxgjhovpwn8zlv30kz9c', 'YWY1YzUyZDM3MmZlMzViZGQzM2JkYzU5NTBlMmE5MTNmNWZiNmU5Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6ImY0NWRlOTYwYzI3MmUyOWYxMTIwMTlmMGY4ZGE2YWE3MGIyZDdhOGUiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-01 17:15:56.844942');
INSERT INTO `django_session` VALUES ('6bf7vcvnj951jkrma9q9kwqk3g7b1fpi', 'YjllZTQ5Nzc4OTNmY2IwZDg2ZmI2NjM5ZDQyZTgyNDVhYTU4N2I5ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1ZGU5NjBjMjcyZTI5ZjExMjAxOWYwZjhkYTZhYTcwYjJkN2E4ZSJ9', '2018-11-02 17:17:44.646829');
INSERT INTO `django_session` VALUES ('74wsxanh13c5irvvq7h2mq75tsz40o6l', 'Nzk3NzRmOWQ2ZWE2Y2IwYTEzMTc2OWRhY2E3MWMyZDk1Yjg1MTg2Zjp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwNzdlOWFkYmMxMmNhZDUyNGMyZThkODkxYTU5YzdhMGYxM2JhZTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW4ifQ==', '2018-11-07 14:46:30.523437');
INSERT INTO `django_session` VALUES ('7w0x6jepvymsx7iwp3bmkn5tdcm8x02a', 'NmYwNjU3M2Q0NGQxNDA4NGU1ZjAwMzRjYjE5M2ExYjRhOGViOTcwZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhjZjM4OTY1Mjc4ZWVhODA0MzFhMTZjZjJlZmQzNWVmNTQwNmVmYzYiLCJfYXV0aF91c2VyX2lkIjoiMTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW4ifQ==', '2018-11-07 11:27:29.675767');
INSERT INTO `django_session` VALUES ('97o548fgf8tg9e1lqkpd902q6hhoog8x', 'OTAwNzJkZjViZTRhY2VlMTYwNWExNGFmOTM5Nzc3Y2M0MzAzOGRlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1ZGU5NjBjMjcyZTI5ZjExMjAxOWYwZjhkYTZhYTcwYjJkN2E4ZSJ9', '2018-11-01 17:03:04.042055');
INSERT INTO `django_session` VALUES ('a85v15wknwjpk5emovxtsn77rsm0vqyq', 'YWY1YzUyZDM3MmZlMzViZGQzM2JkYzU5NTBlMmE5MTNmNWZiNmU5Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6ImY0NWRlOTYwYzI3MmUyOWYxMTIwMTlmMGY4ZGE2YWE3MGIyZDdhOGUiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-01 16:45:58.182934');
INSERT INTO `django_session` VALUES ('bbp5uk7j7zflj3bvnb9xvmqc5y4iz635', 'NDlhNmY2MTlmMzI0NzQ3MGVjZjc4Y2Y5NTkxMDU1ODE4ZmZlZjMzNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNDVkZTk2MGMyNzJlMjlmMTEyMDE5ZjBmOGRhNmFhNzBiMmQ3YThlIn0=', '2018-11-01 16:09:05.387661');
INSERT INTO `django_session` VALUES ('ddh0bp6v6758tbo7kd4z953ve11cr0v9', 'OTAwNzJkZjViZTRhY2VlMTYwNWExNGFmOTM5Nzc3Y2M0MzAzOGRlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1ZGU5NjBjMjcyZTI5ZjExMjAxOWYwZjhkYTZhYTcwYjJkN2E4ZSJ9', '2018-11-01 17:05:09.446227');
INSERT INTO `django_session` VALUES ('evnzpx87wq8fgavfjdwp7vajveqagvd7', 'MDQwNDFkZWZmN2M3OTlkZTlmZmM0YTFjYzQxNWVmOWNlMzJlMGJjMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0NWRlOTYwYzI3MmUyOWYxMTIwMTlmMGY4ZGE2YWE3MGIyZDdhOGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW4iLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-01 19:55:41.974255');
INSERT INTO `django_session` VALUES ('fy7n9rw2umd1f9rro1h8f1o0e26jfjqj', 'OGMxYzM3OWY1ZTNiYzMzNGUxYjA2NzJkZDcwNzc0OTExNmRmZmMxNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0NWRlOTYwYzI3MmUyOWYxMTIwMTlmMGY4ZGE2YWE3MGIyZDdhOGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW4iLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-13 21:08:01.622910');
INSERT INTO `django_session` VALUES ('jzpnew5d764emlfc8597rahy8gjuo6jk', 'ZDk4MWQxYTA1ZjAzYWYwNTNiZWQwYjdjYmE5ZjM0ODA4OTA5ZTBlOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjZjM4OTY1Mjc4ZWVhODA0MzFhMTZjZjJlZmQzNWVmNTQwNmVmYzYiLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:26:26.009084');
INSERT INTO `django_session` VALUES ('kn1vtp54olxl6qhvcdanjvvfmmy79p96', 'YWY1YzUyZDM3MmZlMzViZGQzM2JkYzU5NTBlMmE5MTNmNWZiNmU5Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6ImY0NWRlOTYwYzI3MmUyOWYxMTIwMTlmMGY4ZGE2YWE3MGIyZDdhOGUiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-11-01 16:45:30.890863');
INSERT INTO `django_session` VALUES ('mm7juqgiaucmuayyd0q1coutlwanbxms', 'ZDk4MWQxYTA1ZjAzYWYwNTNiZWQwYjdjYmE5ZjM0ODA4OTA5ZTBlOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjZjM4OTY1Mjc4ZWVhODA0MzFhMTZjZjJlZmQzNWVmNTQwNmVmYzYiLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:27:39.327389');
INSERT INTO `django_session` VALUES ('mzmhlwsl5u728080zv77xsr8mhegmgf2', 'ZDk4MWQxYTA1ZjAzYWYwNTNiZWQwYjdjYmE5ZjM0ODA4OTA5ZTBlOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjZjM4OTY1Mjc4ZWVhODA0MzFhMTZjZjJlZmQzNWVmNTQwNmVmYzYiLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:27:02.241011');
INSERT INTO `django_session` VALUES ('o8wjm74bcv886jtwnsz7407s9xjpfe8v', 'OWRlM2I0YzI2NGQ0NDc4YjQwM2MxMmRjOGRkYTZkODhkMDcxNjFmODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwNzdlOWFkYmMxMmNhZDUyNGMyZThkODkxYTU5YzdhMGYxM2JhZTciLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:29:43.855917');
INSERT INTO `django_session` VALUES ('ps8ultaqn1ma23bshdpy9wol8av8871h', 'OTAwNzJkZjViZTRhY2VlMTYwNWExNGFmOTM5Nzc3Y2M0MzAzOGRlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1ZGU5NjBjMjcyZTI5ZjExMjAxOWYwZjhkYTZhYTcwYjJkN2E4ZSJ9', '2018-11-01 16:57:31.803368');
INSERT INTO `django_session` VALUES ('srse25t9x0wj9m7i86f4sowcwpun966s', 'OWRlM2I0YzI2NGQ0NDc4YjQwM2MxMmRjOGRkYTZkODhkMDcxNjFmODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwNzdlOWFkYmMxMmNhZDUyNGMyZThkODkxYTU5YzdhMGYxM2JhZTciLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:29:22.106408');
INSERT INTO `django_session` VALUES ('sys9p1j61bfhjbnec3rd9qwl2m1xssba', 'N2RiODM1ODA0MmFhNjdkZmVmYjQ1YzZkNzZjMDcyN2FmNDc4NzQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0NWRlOTYwYzI3MmUyOWYxMTIwMTlmMGY4ZGE2YWE3MGIyZDdhOGUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiJ9', '2018-11-01 16:50:41.647315');
INSERT INTO `django_session` VALUES ('t4yi6hid7kwhog2q1e2vvrca612indgo', 'OWRlM2I0YzI2NGQ0NDc4YjQwM2MxMmRjOGRkYTZkODhkMDcxNjFmODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwNzdlOWFkYmMxMmNhZDUyNGMyZThkODkxYTU5YzdhMGYxM2JhZTciLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:29:49.055900');
INSERT INTO `django_session` VALUES ('ugcv3lqhs0mlv9l7lna7yc8ymu43tcvq', 'OWRlM2I0YzI2NGQ0NDc4YjQwM2MxMmRjOGRkYTZkODhkMDcxNjFmODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwNzdlOWFkYmMxMmNhZDUyNGMyZThkODkxYTU5YzdhMGYxM2JhZTciLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:30:06.507503');
INSERT INTO `django_session` VALUES ('ul84h16dkw59wacxlo07xkkjhj9heu80', 'N2RiODM1ODA0MmFhNjdkZmVmYjQ1YzZkNzZjMDcyN2FmNDc4NzQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0NWRlOTYwYzI3MmUyOWYxMTIwMTlmMGY4ZGE2YWE3MGIyZDdhOGUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiJ9', '2018-11-01 16:52:06.798620');
INSERT INTO `django_session` VALUES ('zc1nz61wpba96pcj32jcrtzqqw69gbpb', 'N2Q4YTVhYzE3ZmJhYzA0YzMzNjFlMmFlYjhmMzE0ODEzNjA5YWVjYjp7IkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl0sIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQ1ZGU5NjBjMjcyZTI5ZjExMjAxOWYwZjhkYTZhYTcwYjJkN2E4ZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-11-01 16:09:41.982746');
INSERT INTO `django_session` VALUES ('zcifmczjscv7kn5qgojwc7vlci9zjg6f', 'OWRlM2I0YzI2NGQ0NDc4YjQwM2MxMmRjOGRkYTZkODhkMDcxNjFmODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwNzdlOWFkYmMxMmNhZDUyNGMyZThkODkxYTU5YzdhMGYxM2JhZTciLCJfYXV0aF91c2VyX2lkIjoiMTAifQ==', '2018-11-07 11:29:34.172652');

-- ----------------------------
-- Table structure for operation_coursecomment
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomment`;
CREATE TABLE `operation_coursecomment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_coursecomment_course_id_ae7551b0_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_coursecomment_user_id_8f3ff0f8_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_coursecomment_course_id_ae7551b0_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomment_user_id_8f3ff0f8_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_coursecomment
-- ----------------------------
INSERT INTO `operation_coursecomment` VALUES (1, '讲的太好了', '2018-11-01 11:44:24.311648', 1, 1);
INSERT INTO `operation_coursecomment` VALUES (2, '你好啊', '2018-11-01 11:48:27.057164', 1, 1);

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES (1, 'lp', '122332', 'flask', '2018-10-29 15:20:50.296621');
INSERT INTO `operation_userask` VALUES (2, 'lp', '122332', 'flask', '2018-10-29 15:21:17.903042');
INSERT INTO `operation_userask` VALUES (3, 'lp', '122332', 'flask', '2018-10-29 15:22:00.982228');
INSERT INTO `operation_userask` VALUES (4, 'boby', '456', 'php', '2018-10-29 15:27:36.923452');
INSERT INTO `operation_userask` VALUES (5, 'hl', '1213', 'html', '2018-10-29 15:28:58.907498');
INSERT INTO `operation_userask` VALUES (6, 'laippeng', '18702529877', 'go', '2018-10-29 15:43:03.276116');
INSERT INTO `operation_userask` VALUES (7, '33434', '18702529877', 'weqa', '2018-10-29 15:45:15.121809');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES (1, '2018-10-30 15:08:49.000000', 13, 1);
INSERT INTO `operation_usercourse` VALUES (2, '2018-10-30 15:09:07.000000', 13, 6);

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES (10, 3, 3, '2018-10-30 16:11:56.643032', 1);
INSERT INTO `operation_userfavorite` VALUES (18, 2, 2, '2018-10-30 17:31:18.595768', 1);
INSERT INTO `operation_userfavorite` VALUES (19, 13, 1, '2018-10-30 17:31:26.224972', 1);

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES (1, '北京市', '北京市', '2018-10-26 10:36:00.000000');
INSERT INTO `organization_citydict` VALUES (2, '上海市', '上海市', '2018-10-26 10:36:00.000000');
INSERT INTO `organization_citydict` VALUES (3, '深圳市', '深圳市', '2018-10-26 10:36:00.000000');
INSERT INTO `organization_citydict` VALUES (4, '广州市', '广州市', '2018-10-26 10:36:00.000000');
INSERT INTO `organization_citydict` VALUES (5, '南昌市', '南昌市', '2018-10-26 10:37:00.000000');
INSERT INTO `organization_citydict` VALUES (6, '南京市', '南京', '2018-10-26 11:28:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_course_city_id_4a842f85_fk_organization_citydict_id`(`city_id`) USING BTREE,
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES (2, '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n　　慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] \r\n　　月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 2, 'org/2018/10/imooc_OphEf2V.png', '地址', '2018-10-26 11:03:00.000000', 3, 'pxjg', 0, 333);
INSERT INTO `organization_courseorg` VALUES (3, '北京大学', '北京大学（Peking University）简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是最早以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。北大是中国近代以来唯一以国家最高学府身份创立的学校，最初也是国家最高教育行政机关，行使教育部职能，统管全国教育。北大催生了中国最早的现代学制，开创了中国最早的文科、理科、社科、农科、医科等大学学科，是近代以来中国高等教育的奠基者 [1-3]  。\r\n　　1912年5月3日，京师大学堂改称北京大学校，严复为首任校长 [4]  。1917年，蔡元培出任校长，“循思想自由原则、取兼容并包之义”，把北大办成全国学术和思想中心，使北大成为新文化运动中心、五四运动策源地。1937年抗日战争爆发，北大与清华大学、南开大学南迁长沙，组成国立长沙临时大学。不久迁往昆明，改称国立西南联合大学。1946年10月在北平复学 [5]  。\r\n北大由教育部直属，中央直管副部级建制，是国家双一流 [6]  、211工程、985工程 [5]  、2011计划重点建设的全国重点大学，九校联盟 [7]  、中国大学校长联谊会、京港大学联盟 [8]  、亚洲大学联盟 [9]  、东亚研究型大学协会、国际研究型大学联盟、环太平洋大学联盟、东亚四大学论坛、国际公立大学论坛、中俄综合性大学联盟重要成员。 [10-13] \r\n　　北大始终与国家民族的命运紧密相连，聚集了许多学者专家，培养了众多优秀人才，创造了大批重大科学成果，影响和推动了中国近现代思想理论、科学技术、文化教育和社会发展的进程', 22, 1, 'org/2018/10/bjdx.jpg', '北京', '2018-10-26 11:21:00.000000', 1, 'gx', 23424, 0);
INSERT INTO `organization_courseorg` VALUES (4, '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、东亚研究型大学协会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉为“红色工程师的摇篮”。\r\n　　清华大学的前身清华学堂始建于1911年，因水木清华而得名，是清政府设立的留美预备学校，其建校的资金源于1908年美国退还的部分庚子赔款。1912年更名为清华学校。1928年更名为国立清华大学。1937年抗日战争全面爆发后南迁长沙，与北京大学、南开大学组建国立长沙临时大学，1938年迁至昆明改名为国立西南联合大学。1946年迁回清华园。1949年中华人民共和国成立，清华大学进入了新的发展阶段。　\r\n　　1952年全国高等学校院系调整后成为多科性工业大学。1978年以来逐步恢复和发展为综合性的研究型大学。\r\n水木清华，钟灵毓秀，清华大学秉持“自强不息、厚德载物”的校训和“行胜于言”的校风，坚持“中西融汇、古今贯通、文理渗透”的办学风格和“又红又专、全面发展”的培养特色，弘扬“爱国奉献、追求卓越”传统和“人文日新”精神。恰如清华园工字厅内对联所书——“槛外山光，历春夏秋冬、万千变幻，都非凡境；窗中云影，任东西南北、去来澹荡，洵是仙居”', 74, 0, 'org/2018/10/qhdx-logo.png', '清华', '2018-10-26 11:25:00.000000', 1, 'gx', 22, 9);
INSERT INTO `organization_courseorg` VALUES (5, '南京大学', '南京大学（Nanjing University），简称“南大”，是中华人民共和国教育部直属、中央直管副部级建制的综合性全国重点大学，是历史悠久、声誉卓著的百年名校。位列首批国家“双一流“世界一流大学A类建设高校、”211工程“、”985工程”，入选“珠峰计划”、“111计划”、“2011计划”、“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“卓越法律人才教育培养计划”，是九校联盟、中国大学校长联谊会、环太平洋大学联盟、21世纪学术联盟和东亚研究型大学协会成员。 [1] \r\n　　南京大学其学脉可追溯自孙吴永安元年（258年）的南京太学，近代校史肇始于1902年创建的三江师范学堂，此后历经两江师范学堂、南京高等师范学校、国立东南大学等历史时期，1949年由民国时期中国最高学府“国立中央大学”易名“国立南京大学”，1950年径称“南京大学”并沿用至今。1920年在中国国立高等学府中首开“女禁”，引领男女同校之风。最早在中国开展现代学术研究，建立中国最早的现代科学研究实验室，成为中国第一所以大学自治、学术自由、文理为基本兼有农工商等专门应用科、集教学和研究于一体的现代大学，被国际上誉为“东方教育的中心”。 [1] \r\n　　南京大学是中国现代科学的发祥地之一，是哈佛大学白碧德主义影响下的中国“学衡派”的雅集地，被誉为“中国科学社的大本营和科学发展的主要基地”，是“985工程”首批九所高水平大学中唯一未合并其他院校的高校，坚持“内涵发展”，赢得社会“中国最温和的大学”之美誉。', 23, 0, 'org/2018/10/njdx_cVYO8d1.jpg', '南京', '2018-10-26 11:27:00.000000', 6, 'gx', 23, 0);
INSERT INTO `organization_courseorg` VALUES (6, '慕课网３', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n　　慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] \r\n　　4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2018/10/imooc_Gn1sRjp.png', '深圳', '2018-10-26 14:23:00.000000', 3, 'pxjg', 0, 7);
INSERT INTO `organization_courseorg` VALUES (7, '慕课网２', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n　　慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] \r\n　　4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2018/10/imooc_Y2Tonsq.png', '南昌', '2018-10-26 14:26:00.000000', 5, 'pxjg', 0, 8);
INSERT INTO `organization_courseorg` VALUES (8, '慕课网４', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n　　慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] \r\n　　4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2018/10/imooc_V0TJOyb.png', '广州', '2018-10-26 14:26:00.000000', 4, 'pxjg', 0, 0);
INSERT INTO `organization_courseorg` VALUES (9, '赖鹏', '个人机构', 12, 0, 'org/2018/10/njdx_5mqeUvv.jpg', '上海', '2018-10-26 14:29:00.000000', 2, 'gr', 0, 88);
INSERT INTO `organization_courseorg` VALUES (10, '廖雪峰', 'python', 0, 0, 'org/2018/10/bjdx_cCpdUw8.jpg', '上海', '2018-10-26 14:30:00.000000', 2, 'gr', 77, 123);
INSERT INTO `organization_courseorg` VALUES (11, 'boby', 'django web', 0, 0, 'org/2018/10/imooc_Gn1sRjp_UPSE69R.png', '上海', '2018-10-26 14:31:00.000000', 2, 'gr', 0, 0);

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_commpany` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id`(`org_id`) USING BTREE,
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES (1, 'boby', 4, 'xxxx', 'xxxx', 'xxx', 0, 0, '2018-10-29 16:06:00.000000', 2, 'teacher/2018/10/aobama_CXWwMef.png');
INSERT INTO `organization_teacher` VALUES (2, 'lp', 6, 'xxxx', 'xxxx', 'xxxx', 0, 0, '2018-10-29 16:06:00.000000', 2, 'teacher/2018/10/aobama.png');

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reversion_revision_user_id_17095f45_fk_users_userprofile_id`(`user_id`) USING BTREE,
  INDEX `reversion_revision_c69e55a4`(`date_created`) USING BTREE,
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serialized_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `object_repr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `reversion_version_db_b2c54f65_uniq`(`db`, `content_type_id`, `object_id`, `revision_id`) USING BTREE,
  INDEX `reversion_ver_content_type_id_7d0ff25c_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id`(`revision_id`) USING BTREE,
  CONSTRAINT `reversion_ver_content_type_id_7d0ff25c_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES (4, 'LDh4U5F0', '2@2.com', 'register', '2018-10-23 18:37:25.696107');
INSERT INTO `users_emailverifyrecord` VALUES (12, 'QYUOKrOk', '237290082@qq.com', 'forget', '2018-10-24 11:28:38.239473');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birday` date NULL DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$24000$qcqhYOwQdxlm$obsiZYz8gSRjzKmL8qfmPZt/y81u56Q4Ipghfe2T8t8=', '2018-10-26 10:35:56.321042', 1, 'python', '', '', '1@1.com', 1, 1, '2018-10-18 09:16:48.530690', '', NULL, 'female', '', NULL, 'image/default.png');
INSERT INTO `users_userprofile` VALUES (6, 'pbkdf2_sha256$24000$IoDNwuHHiulo$hPcKevQKv9ET+U1bC0E0r13g5+BNBGjSQs33jNS37zk=', NULL, 0, '2@2.com', '', '', '2@2.com', 0, 0, '2018-10-23 18:37:25.611365', '', NULL, 'female', '', NULL, 'image/default.png');
INSERT INTO `users_userprofile` VALUES (10, 'pbkdf2_sha256$24000$wum6m4U2Z3Pw$nRTZ9jMj4y3qlbSojeIqdlpJ/bO3B0w7I3mCkXPzgoM=', '2018-10-24 14:46:30.403007', 0, '237290082@qq.com', '', '', '237290082@qq.com', 0, 1, '2018-10-24 11:24:55.958233', '', NULL, 'female', '', NULL, 'image/default.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_permissions_userprofile_id_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-10-18 09:26:03.548381', '127.0.0.1', '1', 'Course object', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-10-18 09:27:08.453602', '127.0.0.1', '1', 'Lesson object', 'create', '已添加', 10, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-10-18 09:39:34.036612', '127.0.0.1', '2', 'Lesson object', 'create', '已添加', 10, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-10-18 09:43:20.785204', '127.0.0.1', '1', '第一章：入门', 'change', '已修改 name 。', 10, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-10-19 17:17:44.415334', '127.0.0.1', '3', '627514802@qq.com', 'delete', '', 6, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-10-26 10:36:27.545182', '127.0.0.1', '1', '北京市', 'create', '已添加', 13, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-10-26 10:36:40.643734', '127.0.0.1', '2', '上海市', 'create', '已添加', 13, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-10-26 10:36:54.310793', '127.0.0.1', '3', '深圳市', 'create', '已添加', 13, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-10-26 10:37:12.085651', '127.0.0.1', '4', '广州市', 'create', '已添加', 13, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-10-26 10:37:49.702611', '127.0.0.1', '5', '南昌市', 'create', '已添加', 13, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-10-26 11:01:38.811935', '127.0.0.1', '1', '慕课网', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-10-26 11:03:13.640680', '127.0.0.1', '2', '慕课网', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-10-26 11:25:07.273381', '127.0.0.1', '3', '北京大学', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-10-26 11:26:27.510863', '127.0.0.1', '4', '清华大学', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-10-26 11:27:18.120688', '127.0.0.1', '3', '北京大学', 'change', '已修改 desc 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-10-26 11:28:41.726437', '127.0.0.1', '5', '南京大学', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-10-26 11:29:03.022134', '127.0.0.1', '6', '南京市', 'create', '已添加', 13, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-10-26 11:29:26.801848', '127.0.0.1', '5', '南京大学', 'change', '已修改 image 和 city 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-10-26 14:26:29.602187', '127.0.0.1', '6', '慕课网３', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-10-26 14:26:55.474069', '127.0.0.1', '7', '慕课网２', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-10-26 14:29:16.380020', '127.0.0.1', '8', '慕课网４', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-10-26 14:30:11.907583', '127.0.0.1', '9', '赖鹏', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-10-26 14:31:02.030683', '127.0.0.1', '10', '廖雪峰', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-10-26 14:32:02.686757', '127.0.0.1', '11', 'boby', 'create', '已添加', 14, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-10-29 16:06:18.827256', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 机构', NULL, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-10-29 16:06:46.944097', '127.0.0.1', '1', 'boby', 'create', '已添加', 15, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-10-29 16:07:06.496868', '127.0.0.1', '2', 'lp', 'create', '已添加', 15, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-10-29 16:24:33.466253', '127.0.0.1', '1', 'python入门', 'change', '已修改 course_org 和 image 。', 9, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-10-29 16:25:23.641117', '127.0.0.1', '2', 'java入门', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-10-29 17:14:43.905908', '127.0.0.1', '2', 'lp', 'change', '已修改 image 。', 15, 1);
INSERT INTO `xadmin_log` VALUES (32, '2018-10-29 17:14:57.929903', '127.0.0.1', '1', 'boby', 'change', '已修改 image 。', 15, 1);
INSERT INTO `xadmin_log` VALUES (33, '2018-10-30 10:35:34.516143', '127.0.0.1', '3', 'mysql 数据库', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (34, '2018-10-30 10:42:22.550409', '127.0.0.1', '4', 'python 文件处理', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (35, '2018-10-30 10:43:19.794421', '127.0.0.1', '5', 'python 错误异常', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (36, '2018-10-30 10:44:33.728076', '127.0.0.1', '6', '面向对象', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (37, '2018-10-30 10:45:34.956319', '127.0.0.1', '7', 'python入门１', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (38, '2018-10-30 10:46:17.951576', '127.0.0.1', '8', 'python入门2', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (39, '2018-10-30 10:47:08.091354', '127.0.0.1', '9', 'dajngo', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (40, '2018-10-30 10:47:47.923536', '127.0.0.1', '10', 'Flask', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (41, '2018-10-30 10:48:27.754898', '127.0.0.1', '11', 'scrapy', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (42, '2018-10-30 10:55:13.997865', '127.0.0.1', '12', 'numpy', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (43, '2018-10-30 10:56:27.753255', '127.0.0.1', '13', 'java入门1', 'create', '已添加', 9, 1);
INSERT INTO `xadmin_log` VALUES (44, '2018-10-30 19:36:44.505313', '127.0.0.1', '3', '第一章：基础知识', 'create', '已添加', 10, 1);
INSERT INTO `xadmin_log` VALUES (45, '2018-10-30 19:37:32.725067', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 章节', NULL, 1);
INSERT INTO `xadmin_log` VALUES (46, '2018-10-30 19:37:50.636340', '127.0.0.1', '2', '第二章：进阶开发', 'change', '已修改 name 。', 10, 1);
INSERT INTO `xadmin_log` VALUES (47, '2018-10-30 19:38:17.854666', '127.0.0.1', '4', '第三章：需求分析以及数据库设计', 'create', '已添加', 10, 1);
INSERT INTO `xadmin_log` VALUES (48, '2018-10-30 19:38:47.926792', '127.0.0.1', '5', '第四章　xadmin搭建后台', 'create', '已添加', 10, 1);
INSERT INTO `xadmin_log` VALUES (49, '2018-10-30 19:43:48.705671', '127.0.0.1', '1', '1.1 hello word', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (50, '2018-10-30 19:44:42.789473', '127.0.0.1', '2', '1.2基本概念', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (51, '2018-10-30 19:45:15.633148', '127.0.0.1', '3', '2.1 test1', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (52, '2018-10-30 19:45:32.748205', '127.0.0.1', '4', '2.2 test2', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (53, '2018-10-30 19:46:00.344870', '127.0.0.1', '5', '3.1 django app设计', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (54, '2018-10-30 19:46:31.493043', '127.0.0.1', '6', '3.2 django model设计', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (55, '2018-10-30 19:46:49.907549', '127.0.0.1', '7', '3.3 django user设计', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (56, '2018-10-30 19:47:09.222643', '127.0.0.1', '8', '3.4 django course设计', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (57, '2018-10-30 19:47:40.107127', '127.0.0.1', '9', '4.1 django xadmin 讲解', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (58, '2018-10-30 19:48:06.703268', '127.0.0.1', '10', '4.2 xadmin安装与注册', 'create', '已添加', 11, 1);
INSERT INTO `xadmin_log` VALUES (59, '2018-10-30 19:49:04.955005', '127.0.0.1', '2', '第一章：进阶开发', 'change', '已修改 name 。', 10, 1);
INSERT INTO `xadmin_log` VALUES (60, '2018-10-30 19:49:13.415324', '127.0.0.1', '3', '第二章：基础知识', 'change', '已修改 name 。', 10, 1);
INSERT INTO `xadmin_log` VALUES (61, '2018-10-30 20:17:48.388319', '127.0.0.1', '10', '4.2 xadmin安装与注册', 'change', '已修改 learn_time 。', 11, 1);
INSERT INTO `xadmin_log` VALUES (62, '2018-10-30 20:17:54.885980', '127.0.0.1', '9', '4.1 django xadmin 讲解', 'change', '已修改 learn_time 。', 11, 1);
INSERT INTO `xadmin_log` VALUES (63, '2018-10-30 20:18:00.593091', '127.0.0.1', '8', '3.4 django course设计', 'change', '已修改 learn_time 。', 11, 1);
INSERT INTO `xadmin_log` VALUES (64, '2018-10-30 20:18:06.611173', '127.0.0.1', '7', '3.3 django user设计', 'change', '已修改 learn_time 。', 11, 1);
INSERT INTO `xadmin_log` VALUES (65, '2018-10-30 20:18:12.740367', '127.0.0.1', '5', '3.1 django app设计', 'change', '已修改 learn_time 。', 11, 1);
INSERT INTO `xadmin_log` VALUES (66, '2018-10-30 20:30:21.137225', '127.0.0.1', '1', '前段资源', 'create', '已添加', 12, 1);
INSERT INTO `xadmin_log` VALUES (67, '2018-10-30 20:31:51.471078', '127.0.0.1', '2', 'html文件', 'create', '已添加', 12, 1);
INSERT INTO `xadmin_log` VALUES (68, '2018-10-30 21:08:00.466568', '127.0.0.1', '1', 'django与vue', 'change', '已修改 teacher 。', 9, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
INSERT INTO `xadmin_usersettings` VALUES (2, 'site-theme', 'https://bootswatch.com/3/spacelab/bootstrap.min.css', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
