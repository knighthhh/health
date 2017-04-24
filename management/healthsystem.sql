/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : healthsystem

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-04-20 12:14:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `about`
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `about_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `about_img` varchar(32) DEFAULT NULL COMMENT '图片',
  `about_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `about_info` varchar(255) DEFAULT NULL COMMENT '介绍',
  `about_copy` varchar(128) DEFAULT NULL COMMENT '版权',
  `about_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`about_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关于APP';

-- ----------------------------
-- Records of about
-- ----------------------------

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `top_up` mediumint(8) DEFAULT NULL COMMENT '充值金钱',
  `consume` mediumint(8) DEFAULT NULL COMMENT '消费金钱',
  `pay_remain` mediumint(8) DEFAULT NULL COMMENT '余额',
  `swift_number` varchar(128) DEFAULT NULL COMMENT '流水号',
  `pay_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的账户详情';

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `analyze`
-- ----------------------------
DROP TABLE IF EXISTS `analyze`;
CREATE TABLE `analyze` (
  `analyze_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `analyze_down` varchar(16) DEFAULT NULL COMMENT '下载量',
  `doc_reg` varchar(16) DEFAULT NULL COMMENT '医生注册数',
  `user_reg` varchar(16) DEFAULT NULL COMMENT '用户注册数',
  `online_doc` varchar(16) DEFAULT NULL COMMENT '在线医生人数',
  `online_user` varchar(16) DEFAULT NULL COMMENT '在线用户人数',
  `count_rece` varchar(16) DEFAULT NULL COMMENT '累计就诊人数',
  `analyze_time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`analyze_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计分析表';

-- ----------------------------
-- Records of analyze
-- ----------------------------

-- ----------------------------
-- Table structure for `attention`
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `atten_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `hos_id` mediumint(8) NOT NULL COMMENT '医院ID',
  `doc_id` mediumint(8) NOT NULL COMMENT '医生ID',
  `atten_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`atten_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of attention
-- ----------------------------

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `auth_name` varchar(32) NOT NULL COMMENT '权限名称',
  `auth_pid` varchar(32) NOT NULL COMMENT '父ID',
  `auth_c` varchar(64) NOT NULL COMMENT '模块',
  `auth_a` varchar(64) NOT NULL COMMENT '操作方法',
  `auth_path` varchar(128) NOT NULL COMMENT '全路径',
  `auth_level` varchar(8) NOT NULL COMMENT '级别',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员权限表';

-- ----------------------------
-- Records of auth
-- ----------------------------

-- ----------------------------
-- Table structure for `check_img`
-- ----------------------------
DROP TABLE IF EXISTS `check_img`;
CREATE TABLE `check_img` (
  `check_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `check_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `check_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`check_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查图片表';

-- ----------------------------
-- Records of check_img
-- ----------------------------

-- ----------------------------
-- Table structure for `department_info`
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `dep_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dep_name` varchar(30) NOT NULL COMMENT '科室名称',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='科室信息';

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', '外科', '0');
INSERT INTO `department_info` VALUES ('2', '内科', '0');
INSERT INTO `department_info` VALUES ('3', '骨外科', '0');
INSERT INTO `department_info` VALUES ('4', '儿科学', '0');
INSERT INTO `department_info` VALUES ('5', '妇产科学', '0');
INSERT INTO `department_info` VALUES ('6', '神经外科', '1');
INSERT INTO `department_info` VALUES ('7', '心血管外科', '1');
INSERT INTO `department_info` VALUES ('8', '心血管内科', '2');
INSERT INTO `department_info` VALUES ('9', '神经内科', '2');
INSERT INTO `department_info` VALUES ('10', '妇科', '5');
INSERT INTO `department_info` VALUES ('11', '骨科', '3');
INSERT INTO `department_info` VALUES ('12', '儿科', '4');
INSERT INTO `department_info` VALUES ('13', '脊柱外科', '3');
INSERT INTO `department_info` VALUES ('14', '新生儿科', '4');
INSERT INTO `department_info` VALUES ('15', '产科', '5');

-- ----------------------------
-- Table structure for `depa_illness`
-- ----------------------------
DROP TABLE IF EXISTS `depa_illness`;
CREATE TABLE `depa_illness` (
  `depa_illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_id` mediumint(8) NOT NULL COMMENT '疾病ID',
  PRIMARY KEY (`depa_illness_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室疾病关联表';

-- ----------------------------
-- Records of depa_illness
-- ----------------------------

-- ----------------------------
-- Table structure for `diet`
-- ----------------------------
DROP TABLE IF EXISTS `diet`;
CREATE TABLE `diet` (
  `diet_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usediet_id` int(16) NOT NULL COMMENT '记录人ID',
  `type_diet` varchar(8) DEFAULT NULL COMMENT '餐型',
  `food` varchar(255) DEFAULT NULL COMMENT '食物',
  `diet_time` varchar(16) DEFAULT NULL COMMENT '用餐时间',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`diet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='饮食记录表';

-- ----------------------------
-- Records of diet
-- ----------------------------

-- ----------------------------
-- Table structure for `doctor_info`
-- ----------------------------
DROP TABLE IF EXISTS `doctor_info`;
CREATE TABLE `doctor_info` (
  `doc_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `hos_id` mediumint(8) NOT NULL COMMENT '所属医院ID',
  `depa_id` mediumint(8) NOT NULL COMMENT '所属科室ID',
  `doc_name` varchar(32) NOT NULL COMMENT '医生姓名',
  `doc_sex` enum('女','男') NOT NULL DEFAULT '男' COMMENT '医生性别',
  `doc_img` varchar(128) NOT NULL COMMENT '医生头像',
  `doc_phone` varchar(32) NOT NULL COMMENT '医生电话',
  `doc_password` varchar(128) NOT NULL DEFAULT '123456' COMMENT '医生密码',
  `doc_especial` varchar(255) NOT NULL COMMENT '医生擅长',
  `doc_introduce` longtext COMMENT '医生介绍',
  `doc_address` varchar(128) NOT NULL COMMENT '所属地址',
  `doc_alipay` varchar(32) DEFAULT NULL COMMENT '支付宝账号',
  `doc_rece` varchar(8) NOT NULL COMMENT '线上累计接诊',
  `doc_hot` varchar(255) NOT NULL DEFAULT '0' COMMENT '热门程度',
  `doc_attention` varchar(8) DEFAULT NULL COMMENT '被关注量',
  `doc_fee` varchar(8) DEFAULT NULL COMMENT '费用',
  `doc_time` varchar(16) NOT NULL COMMENT '创建时间',
  `im_token` varchar(255) DEFAULT NULL COMMENT '医生聊天token',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='医生信息表';

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
INSERT INTO `doctor_info` VALUES ('1', '55', '2', '王哲', '男', 'doctor/2017-03-22/58d2546b514d2.jpg', '15768651579', 'e10adc3949ba59abbe56e057f20f883e', '心血管内科', '&lt;p&gt;哈哈啊哈哈哈的境况涉及到卡时间段库拉索建档立卡涉及到拉时间段雷克萨&amp;nbsp;&lt;/p&gt;', '北京 东城区 ', '15768650568', '213123', '5.0', '123', '999', '2017-03-29 19:17', '\"BoCPE524JFpgTHvaDjrJygw5f5aZvT5xw3JgzbRIqa+L76gWTUero45PGYcKDB1irmWzKc2/cx0kuqWCW/novrcSCIKmu0mR');
INSERT INTO `doctor_info` VALUES ('10', '55', '6', '姚桂泰', '男', 'doctor/2017-03-22/58d227278e625.jpg', '15768651578', 'e10adc3949ba59abbe56e057f20f883e', '鼻炎、皮肤病', '&lt;p&gt;1111&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '', '111', null, '-100', '2017-03-22 15:26', 'SkozrTqAAIy2qtxx9ytySgw5f5aZvT5xw3JgzbRIqa+L76gWTUero8r0cW89G7NPdirRB9E4cqQkuqWCW/novjsYXSKuZTiL');
INSERT INTO `doctor_info` VALUES ('20', '55', '6', '黄辉煌', '男', 'doctor/headimg/58f6ceba1417d.png', '15768651577', 'e10adc3949ba59abbe56e057f20f883e', '时间段开始', '&lt;p&gt;啊实打实大所大所&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '', '23', null, '200', '2017-03-22 17:55', 'XTH/LUg+fdRNd+FsYbZVmkeCMLfsJdG7DU8H1ybxjweIGYfROLLh8qJfejH4wBAwLHxltiuM54vwl/x9sbLqlwjA/rMMOzfD');
INSERT INTO `doctor_info` VALUES ('31', '55', '6', '张洋豪', '男', 'doctor/2017-03-22/58d255fe4298d.jpg', '15768651576', 'e10adc3949ba59abbe56e057f20f883e', 'eq', '', '广东 惠州 惠城区', 'qwe', '', '', null, '', '2017-03-23 18:30', 'yRmO7s3SpJjvQQog+vW9yVJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODtgefftkGqNP0ZV3W9VG58ywKNt4LG5AuMunCSODhfA6');
INSERT INTO `doctor_info` VALUES ('32', '54', '10', '叶莉', '女', 'doctor/2017-03-30/58dd11e4b5ae7.jpg', '15768651575', 'e10adc3949ba59abbe56e057f20f883e', '鼻炎、皮肤病', '&lt;p&gt;叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉&lt;/p&gt;', '广东 惠州 惠城区', '111', '', '1111', null, '200', '2017-03-30 22:10', 'w9EwB8vJX+uIC+KHL23cyQw5f5aZvT5xw3JgzbRIqa+L76gWTUerozYwdxP5IpJHt4L0u6EuZe4kuqWCW/novlSJEqWPmIq6');
INSERT INTO `doctor_info` VALUES ('33', '57', '9', '叶伟发', '男', 'doctor/2017-04-07/58e79d2f23359.jpg', '15768651574', 'e10adc3949ba59abbe56e057f20f883e', '骨科', '', '广东 惠州 惠城区', '123', '', '111', null, '123', '2017-04-07 22:11', 'Qm+2/pqDe8mby3220ZRWLVJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODnfveaVuATsx0ZV3W9VG58ywKNt4LG5AuA5mWHB9U8Fa');
INSERT INTO `doctor_info` VALUES ('34', '57', '8', '林庆涛', '男', 'doctor/2017-04-07/58e79df1b0a3f.jpg', '15768651573', 'e10adc3949ba59abbe56e057f20f883e', '心肌梗塞', '', '广东 惠州 惠城区', '123', '', '213', null, '123', '2017-04-07 22:10', 'fMahdrUUeR5ZD5oMAvGKWFJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODogo9ne6SiG/0ZV3W9VG58ywKNt4LG5AuNspSqNkvDRR');
INSERT INTO `doctor_info` VALUES ('35', '56', '6', '郑文志', '男', 'doctor/2017-04-07/58e7a12fd0ae3.jpg', '15768651572', 'e10adc3949ba59abbe56e057f20f883e', '脑外伤、脑出血', '', '广东 惠州 惠城区', '123', '', '113', null, '123', '2017-04-07 22:24', '9nbBNhjga4so5e1TJPYJdgw5f5aZvT5xw3JgzbRIqa+L76gWTUero4PT7zX69krW4G7SMrhpDZckuqWCW/novrSxEPLO8fVv');
INSERT INTO `doctor_info` VALUES ('36', '56', '13', '李随生', '男', 'doctor/2017-04-07/58e7a1472b042.jpg', '15768651570', 'e10adc3949ba59abbe56e057f20f883e', '骨伤', '', '广东 惠州 惠城区', '123', '', '12', null, '123', '2017-04-07 22:25', 'CqiZ8og8J9UIuyYYsbyghlJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODvg4ktKesOVY0ZV3W9VG58ywKNt4LG5AuNtNRziuCRfQ');
INSERT INTO `doctor_info` VALUES ('37', '54', '10', '李佳迪', '男', 'doctor/2017-04-07/58e7a17910ba8.jpg', '15768651569', 'e10adc3949ba59abbe56e057f20f883e', '子宫肌瘤', '', '广东 惠州 惠城区', '213', '', '11', null, '23', '2017-04-07 22:26', 'j8n4viitOTI0H52aYx3GMAw5f5aZvT5xw3JgzbRIqa+L76gWTUero1nfcaXrLbWIt4L0u6EuZe4kuqWCW/novi+23qTO+oMo');
INSERT INTO `doctor_info` VALUES ('38', '53', '9', '蔡刘聪', '男', 'doctor/2017-04-07/58e7a1c387f7e.jpg', '15768651568', 'e10adc3949ba59abbe56e057f20f883e', '神经病', '', '福建 福州 鼓楼区', '123', '', '11', null, '123', '2017-04-07 22:27', 'ib7bzm1NBzasbBC7K5FXhEeCMLfsJdG7DU8H1ybxjweIGYfROLLh8jM0ZSaTlbGfqVHaLUWvgLXwl/x9sbLqlx2zFMb8lkCS');
INSERT INTO `doctor_info` VALUES ('39', '53', '8', '黄宇红', '男', 'doctor/2017-04-07/58e7a1e532d9e.jpg', '15768651567', 'e10adc3949ba59abbe56e057f20f883e', '冠心病', '', '广东 惠州 惠城区', '213', '', '123', null, '23', '2017-04-07 22:27', 'rvdK9ab+bYpZD5oMAvGKWFJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODlzweSSHeIit0ZV3W9VG58ywKNt4LG5AuBOIjSDL3en0');
INSERT INTO `doctor_info` VALUES ('40', '57', '6', 'aa', '女', 'doctor/2017-04-10/58eb3840e43f9.png', '15768651566', 'e10adc3949ba59abbe56e057f20f883e', 'aa', '', '广东 惠州 惠城区', '', '', '', null, '', '2017-04-10 15:46', 'SGYx2dobcNCVG6OnD5ysClJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODjOewIBTTyq70ZV3W9VG58ywKNt4LG5AuFS2mx7UqP4q');
INSERT INTO `doctor_info` VALUES ('41', '57', '6', 'bb', '女', 'doctor/2017-04-10/58eb3b33d26dd.jpeg', '15768651565', 'e10adc3949ba59abbe56e057f20f883e', 'bb', '', '广东 惠州 惠城区', '', '', '', null, '', '2017-04-10 15:58', 'Rl8dtuB91vnIuBRd95kWnQw5f5aZvT5xw3JgzbRIqa+L76gWTUeroxHqJorUte0ac/qIn63+5QQkuqWCW/novs9EiKoNBb1p');
INSERT INTO `doctor_info` VALUES ('42', '58', '7', '王人民', '男', 'doctor/2017-04-10/58eb3b33d26dd.jpeg', '15768651560', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', null, '', '0', null, null, '', null);

-- ----------------------------
-- Table structure for `drug`
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `drug_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usedrug_id` int(16) NOT NULL COMMENT '用药人ID',
  `drug_info_id` int(16) NOT NULL COMMENT '药品详情ID',
  `ailmentv` varchar(32) DEFAULT NULL COMMENT '治疗疾病',
  `drug_hos` varchar(32) DEFAULT NULL COMMENT '开药医院',
  `drug_doc` varchar(16) DEFAULT NULL COMMENT '开药医生',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的用药信息';

-- ----------------------------
-- Records of drug
-- ----------------------------

-- ----------------------------
-- Table structure for `drug_img`
-- ----------------------------
DROP TABLE IF EXISTS `drug_img`;
CREATE TABLE `drug_img` (
  `drug_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `drug_img_name` varchar(16) DEFAULT NULL COMMENT '图片名称',
  `drug_img_path` varchar(16) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品图片表';

-- ----------------------------
-- Records of drug_img
-- ----------------------------

-- ----------------------------
-- Table structure for `drug_info`
-- ----------------------------
DROP TABLE IF EXISTS `drug_info`;
CREATE TABLE `drug_info` (
  `drug_info_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID',
  `drug_name` varchar(16) DEFAULT NULL COMMENT '药品名称',
  `drug_howuse` longtext COMMENT '使用方法',
  `drug_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `usedrug_time` varchar(32) DEFAULT NULL COMMENT '用药时间',
  `drug_remind` varchar(8) DEFAULT NULL COMMENT '是否提醒',
  PRIMARY KEY (`drug_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品信息表';

-- ----------------------------
-- Records of drug_info
-- ----------------------------

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedb_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `con_phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `feedb_content` longtext COMMENT '反馈内容',
  `feedb_img` varchar(32) DEFAULT NULL COMMENT '反馈图片',
  `feedb_time` varchar(16) DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`feedb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `form`
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `form_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `doc_name` varchar(16) DEFAULT NULL COMMENT '医生姓名',
  `depa_name` varchar(32) DEFAULT NULL COMMENT '科室名字',
  `illness_name` varchar(32) DEFAULT NULL COMMENT '疾病名称',
  `price` varchar(16) DEFAULT NULL COMMENT '价钱',
  `time` varchar(16) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的就诊订单';

-- ----------------------------
-- Records of form
-- ----------------------------

-- ----------------------------
-- Table structure for `friend_file`
-- ----------------------------
DROP TABLE IF EXISTS `friend_file`;
CREATE TABLE `friend_file` (
  `file_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `friend_id` int(16) NOT NULL COMMENT '关联的好友ID',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联的亲友档案';

-- ----------------------------
-- Records of friend_file
-- ----------------------------

-- ----------------------------
-- Table structure for `habit`
-- ----------------------------
DROP TABLE IF EXISTS `habit`;
CREATE TABLE `habit` (
  `habit_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usehab_id` int(16) NOT NULL COMMENT '记录人ID',
  `getup_time` varchar(16) DEFAULT NULL COMMENT '起床时间',
  `sleep_time` varchar(16) DEFAULT NULL COMMENT '睡觉时间',
  `other` varchar(255) DEFAULT NULL COMMENT '其他',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人习惯表';

-- ----------------------------
-- Records of habit
-- ----------------------------

-- ----------------------------
-- Table structure for `health_know`
-- ----------------------------
DROP TABLE IF EXISTS `health_know`;
CREATE TABLE `health_know` (
  `know_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '知识ID',
  `know_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `know_see` varchar(32) DEFAULT '0' COMMENT '浏览量',
  `know_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`know_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='健康知识表';

-- ----------------------------
-- Records of health_know
-- ----------------------------
INSERT INTO `health_know` VALUES ('2', '阿斯达所多', null, '&lt;p&gt;萨达萨达所大所&lt;/p&gt;', '2017-03-29 20:37');
INSERT INTO `health_know` VALUES ('5', '撒打算', '0', '&lt;p&gt;啊实打实大所&lt;/p&gt;', '2017-03-29 21:25');

-- ----------------------------
-- Table structure for `health_know_img`
-- ----------------------------
DROP TABLE IF EXISTS `health_know_img`;
CREATE TABLE `health_know_img` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `health_know_img` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `know_id` mediumint(9) NOT NULL COMMENT '所属知识ID',
  PRIMARY KEY (`id`),
  KEY `know_id` (`know_id`),
  CONSTRAINT `health_know_img_ibfk_1` FOREIGN KEY (`know_id`) REFERENCES `health_know` (`know_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康知识内容图片表';

-- ----------------------------
-- Records of health_know_img
-- ----------------------------

-- ----------------------------
-- Table structure for `history_search`
-- ----------------------------
DROP TABLE IF EXISTS `history_search`;
CREATE TABLE `history_search` (
  `history_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '搜索ID',
  `user_phone` varchar(16) NOT NULL COMMENT '用户手机号码',
  `search_content` longtext COMMENT '搜索内容',
  `search_time` varchar(16) DEFAULT NULL COMMENT '搜索时间',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_search
-- ----------------------------
INSERT INTO `history_search` VALUES ('3', '15768653333', '糖尿病', '2017-04-13 17:20');
INSERT INTO `history_search` VALUES ('4', '15768653949', 'aa', null);

-- ----------------------------
-- Table structure for `hospital_info`
-- ----------------------------
DROP TABLE IF EXISTS `hospital_info`;
CREATE TABLE `hospital_info` (
  `hos_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '医院ID',
  `hos_name` varchar(150) NOT NULL COMMENT '医院名称',
  `hos_level` varchar(30) NOT NULL DEFAULT '' COMMENT '医院等级',
  `hos_address` varchar(30) NOT NULL DEFAULT '' COMMENT '医院所属地址',
  `hos_address_detail` varchar(150) NOT NULL DEFAULT '' COMMENT '医院详细地址',
  `hos_longitude` varchar(30) NOT NULL DEFAULT '' COMMENT '医院经度',
  `hos_latitude` varchar(30) NOT NULL DEFAULT '' COMMENT '医院维度',
  `hos_introduce` longtext COMMENT '医院介绍',
  `hos_navigate_img` varchar(150) DEFAULT '' COMMENT '院内导航图片',
  `hos_hot` varchar(30) NOT NULL DEFAULT '' COMMENT '医院热门程度',
  `hos_time` varchar(30) NOT NULL DEFAULT '' COMMENT '创建时间',
  `hos_link` varchar(255) NOT NULL COMMENT '官网',
  `hos_attention` varchar(32) NOT NULL COMMENT '被关注量',
  PRIMARY KEY (`hos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='医院信息';

-- ----------------------------
-- Records of hospital_info
-- ----------------------------
INSERT INTO `hospital_info` VALUES ('53', '惠州市华康骨科医院', '二甲', '广东 广州 荔湾区', '广东省惠州市惠城区演达大道46号惠州学院对面', '114.429203', '23.045426', '&lt;p&gt;广东省惠州市惠城区演达大道46号惠州学院对面&lt;/p&gt;', 'Hospital/2017-04-12/58ee11715d13f.jpg', '324', '2017-03-11 16:23:06', '', '');
INSERT INTO `hospital_info` VALUES ('54', '惠州市中心人民医院', '三甲', '北京 西城区 ', '广东省惠州市惠城区鹅岭北路', '114.405428', '23.088142', '&lt;p&gt;惠州市中心人民医院坐落于惠民之州——惠州，面积两百余亩，是惠州最大的医院。&lt;/p&gt;', 'Hospital/2017-04-12/58ee112bd4e64.jpg', '5.0', '2017-03-16 17:50:21', '', '');
INSERT INTO `hospital_info` VALUES ('55', '东华医院', '二乙', '广东 惠州 惠城区', '河南岸南岸路143号', '114.429104', '23.066893', '&lt;p&gt;惠州东华医院位于惠城区河南岸南岸路143号，是一所综合性医院。医院经营面积6000平方米，医院核定床位230张（暂定），全院职工预计215人。&lt;/p&gt;', 'Hospital/2017-04-12/58ee11037d622.jpg', '4.2', '2017-03-22 12:43:25', '', '');
INSERT INTO `hospital_info` VALUES ('56', '博爱医院', '三甲', '广东 惠州 惠城区', '河南岸演达大道46号', '114.42628', '23.07249', '&lt;p&gt;段开始到静安寺肯德基爱神的箭卡死了&lt;/p&gt;', 'Hospital/2017-04-12/58ee10c5d9edb.jpg', '123', '2017-03-24 19:31:29', '', '');
INSERT INTO `hospital_info` VALUES ('57', '惠州市第三人民医院', '二甲', '广东 惠州 惠城区', '东平公园', '114.430077', '23.095056', '&lt;p&gt;惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院&lt;/p&gt;', 'Hospital/2017-04-06/58e6132a76fff.jpg', '5.0', '2017-04-06 18:06:34', '', '');

-- ----------------------------
-- Table structure for `hos_dep`
-- ----------------------------
DROP TABLE IF EXISTS `hos_dep`;
CREATE TABLE `hos_dep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_id` mediumint(9) NOT NULL COMMENT '科室ID',
  `hos_id` mediumint(9) NOT NULL COMMENT '所属医院',
  `dep_introduce` longtext NOT NULL COMMENT '科室介绍',
  `dep_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `hot` varchar(8) DEFAULT NULL COMMENT '是否热门',
  PRIMARY KEY (`id`),
  KEY `hos_id` (`hos_id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `hos_dep_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hos_dep_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `department_info` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='医院-科室关联表';

-- ----------------------------
-- Records of hos_dep
-- ----------------------------
INSERT INTO `hos_dep` VALUES ('1', '1', '54', 'sadasd', '12323', '1');
INSERT INTO `hos_dep` VALUES ('2', '1', '53', '213', '213', null);
INSERT INTO `hos_dep` VALUES ('4', '6', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:46', null);
INSERT INTO `hos_dep` VALUES ('5', '7', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:55', null);
INSERT INTO `hos_dep` VALUES ('7', '2', '54', '', '2017-03-17 19:26:22', '1');
INSERT INTO `hos_dep` VALUES ('8', '5', '54', '&lt;p&gt;哦哦哦&lt;/p&gt;', '2017-03-21 10:05:32', null);
INSERT INTO `hos_dep` VALUES ('9', '7', '54', '&lt;p&gt;阿萨德&lt;/p&gt;', '2017-03-21 12:03:58', null);
INSERT INTO `hos_dep` VALUES ('14', '10', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:32:41', null);
INSERT INTO `hos_dep` VALUES ('15', '4', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:35:42', null);
INSERT INTO `hos_dep` VALUES ('18', '8', '54', '', '2017-03-21 12:58:19', null);
INSERT INTO `hos_dep` VALUES ('20', '6', '54', '', '2017-03-21 13:00:04', null);
INSERT INTO `hos_dep` VALUES ('21', '9', '54', '', '2017-03-21 13:00:36', null);
INSERT INTO `hos_dep` VALUES ('23', '2', '53', '', '2017-03-21 13:31:49', null);
INSERT INTO `hos_dep` VALUES ('24', '8', '53', '', '2017-03-21 13:31:54', '1');
INSERT INTO `hos_dep` VALUES ('25', '9', '53', '', '2017-03-21 13:31:59', null);
INSERT INTO `hos_dep` VALUES ('26', '4', '53', '', '2017-03-21 13:32:17', null);
INSERT INTO `hos_dep` VALUES ('27', '3', '54', '&lt;p&gt;撒打算&lt;/p&gt;', '2017-03-22 11:26:48', null);
INSERT INTO `hos_dep` VALUES ('28', '1', '55', '', '2017-03-22 12:44:32', '1');
INSERT INTO `hos_dep` VALUES ('29', '2', '55', '', '2017-03-22 12:44:37', null);
INSERT INTO `hos_dep` VALUES ('30', '3', '55', '', '2017-03-22 12:44:41', null);
INSERT INTO `hos_dep` VALUES ('31', '4', '55', '', '2017-03-22 12:44:46', null);
INSERT INTO `hos_dep` VALUES ('32', '5', '55', '', '2017-03-22 12:44:51', null);
INSERT INTO `hos_dep` VALUES ('33', '6', '55', '', '2017-03-22 14:34:35', null);
INSERT INTO `hos_dep` VALUES ('34', '7', '57', '', '2017-04-07 22:09:52', '');
INSERT INTO `hos_dep` VALUES ('35', '6', '57', '&lt;p&gt;萨达&lt;br/&gt;&lt;/p&gt;', '2017-04-07 22:09:41', '');
INSERT INTO `hos_dep` VALUES ('36', '1', '57', '', '2017-04-07 22:09:46', '1');
INSERT INTO `hos_dep` VALUES ('37', '2', '57', '', '2017-04-07 22:10:01', null);
INSERT INTO `hos_dep` VALUES ('38', '8', '57', '', '2017-04-07 22:10:07', null);
INSERT INTO `hos_dep` VALUES ('39', '9', '57', '', '2017-04-07 22:10:12', null);
INSERT INTO `hos_dep` VALUES ('40', '1', '56', '', '2017-04-07 22:22:56', null);
INSERT INTO `hos_dep` VALUES ('41', '2', '56', '', '2017-04-07 22:23:04', null);
INSERT INTO `hos_dep` VALUES ('42', '3', '56', '', '2017-04-07 22:23:11', null);
INSERT INTO `hos_dep` VALUES ('43', '4', '56', '', '2017-04-07 22:23:15', null);
INSERT INTO `hos_dep` VALUES ('44', '5', '56', '', '2017-04-07 22:23:21', null);
INSERT INTO `hos_dep` VALUES ('45', '6', '56', '', '2017-04-07 22:23:26', null);
INSERT INTO `hos_dep` VALUES ('46', '7', '56', '', '2017-04-07 22:23:30', null);
INSERT INTO `hos_dep` VALUES ('47', '8', '56', '', '2017-04-07 22:23:35', null);
INSERT INTO `hos_dep` VALUES ('48', '13', '56', '', '2017-04-07 22:23:40', null);
INSERT INTO `hos_dep` VALUES ('49', '12', '56', '', '2017-04-07 22:23:45', null);
INSERT INTO `hos_dep` VALUES ('50', '14', '56', '', '2017-04-07 22:23:49', null);
INSERT INTO `hos_dep` VALUES ('51', '10', '56', '', '2017-04-07 22:23:53', null);
INSERT INTO `hos_dep` VALUES ('52', '15', '56', '', '2017-04-07 22:23:58', null);
INSERT INTO `hos_dep` VALUES ('53', '12', '53', '', '2017-04-07 22:26:19', null);

-- ----------------------------
-- Table structure for `hos_img`
-- ----------------------------
DROP TABLE IF EXISTS `hos_img`;
CREATE TABLE `hos_img` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hos_img` varchar(150) DEFAULT NULL COMMENT '医院图片',
  `hos_mid_img` varchar(150) DEFAULT NULL COMMENT '中图',
  `hos_sm_img` varchar(150) DEFAULT NULL COMMENT '小图',
  `hos_id` mediumint(9) NOT NULL COMMENT '医院ID',
  PRIMARY KEY (`id`),
  KEY `hos_id` (`hos_id`),
  CONSTRAINT `hos_img_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='医院图片';

-- ----------------------------
-- Records of hos_img
-- ----------------------------
INSERT INTO `hos_img` VALUES ('27', 'Hospital/2017-03-11/58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_0_58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_1_58c3b3ea8381b.jpg', '53');
INSERT INTO `hos_img` VALUES ('28', 'Hospital/2017-03-16/58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_0_58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_1_58ca5fdd343c8.jpg', '54');
INSERT INTO `hos_img` VALUES ('31', 'Hospital/2017-03-22/58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_0_58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_1_58d200ee440f8.jpg', '55');
INSERT INTO `hos_img` VALUES ('33', 'Hospital/2017-04-06/58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bac41b.jpg', '57');
INSERT INTO `hos_img` VALUES ('34', 'Hospital/2017-04-06/58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bccd94.jpg', '57');
INSERT INTO `hos_img` VALUES ('35', 'Hospital/2017-04-06/58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_0_58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_1_58e61f437aefd.jpg', '57');
INSERT INTO `hos_img` VALUES ('37', 'Hospital/2017-04-06/58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_0_58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_1_58e62991f115e.jpg', '57');
INSERT INTO `hos_img` VALUES ('38', 'Hospital/2017-04-06/58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_0_58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_1_58e62b18350bd.jpg', '55');
INSERT INTO `hos_img` VALUES ('39', 'Hospital/2017-04-12/58ee10a4cf1df.jpg', 'Hospital/2017-04-12/thumb_0_58ee10a4cf1df.jpg', 'Hospital/2017-04-12/thumb_1_58ee10a4cf1df.jpg', '56');
INSERT INTO `hos_img` VALUES ('40', 'Hospital/2017-04-12/58ee10b4ce491.jpg', 'Hospital/2017-04-12/thumb_0_58ee10b4ce491.jpg', 'Hospital/2017-04-12/thumb_1_58ee10b4ce491.jpg', '56');
INSERT INTO `hos_img` VALUES ('41', 'Hospital/2017-04-12/58ee111b5eb21.jpg', 'Hospital/2017-04-12/thumb_0_58ee111b5eb21.jpg', 'Hospital/2017-04-12/thumb_1_58ee111b5eb21.jpg', '55');
INSERT INTO `hos_img` VALUES ('42', 'Hospital/2017-04-12/58ee113ecfb15.jpg', 'Hospital/2017-04-12/thumb_0_58ee113ecfb15.jpg', 'Hospital/2017-04-12/thumb_1_58ee113ecfb15.jpg', '54');
INSERT INTO `hos_img` VALUES ('43', 'Hospital/2017-04-12/58ee11922e2e4.jpg', 'Hospital/2017-04-12/thumb_0_58ee11922e2e4.jpg', 'Hospital/2017-04-12/thumb_1_58ee11922e2e4.jpg', '53');

-- ----------------------------
-- Table structure for `illness`
-- ----------------------------
DROP TABLE IF EXISTS `illness`;
CREATE TABLE `illness` (
  `illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_name` varchar(32) NOT NULL COMMENT '疾病名称',
  `illness_introduce` longtext COMMENT '疾病介绍',
  PRIMARY KEY (`illness_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='疾病表';

-- ----------------------------
-- Records of illness
-- ----------------------------
INSERT INTO `illness` VALUES ('1', '1', '6', '脑外伤', '&lt;p&gt;脑外伤脑外伤脑外伤&lt;/p&gt;');
INSERT INTO `illness` VALUES ('2', '1', '11', '骨折', '&lt;p&gt;骨折骨折&lt;/p&gt;');
INSERT INTO `illness` VALUES ('4', '0', '8', '冠心病', '&lt;p&gt;冠心病冠心病冠心病冠心病&lt;/p&gt;');
INSERT INTO `illness` VALUES ('5', '0', '9', '脑梗塞', '&lt;p&gt;脑梗塞脑梗塞脑梗塞&lt;/p&gt;');
INSERT INTO `illness` VALUES ('6', '0', '12', '小儿感冒', '&lt;p&gt;小儿感冒小儿感冒小儿感冒&lt;/p&gt;');
INSERT INTO `illness` VALUES ('7', '0', '10', '月经失调', '&lt;p&gt;月经失调月经失调月经失调月经失调&lt;/p&gt;');
INSERT INTO `illness` VALUES ('8', '0', '7', '风湿性心脏病', '&lt;p&gt;风湿性心脏病风湿性心脏病风湿性心脏病&lt;/p&gt;');
INSERT INTO `illness` VALUES ('9', '0', '6', '脑出血', '&lt;p&gt;脑出血脑出血脑出血&lt;/p&gt;');
INSERT INTO `illness` VALUES ('10', '0', '13', '腰椎间盘突出', '&lt;p&gt;腰椎间盘突出腰椎间盘突出&lt;/p&gt;');
INSERT INTO `illness` VALUES ('11', '0', '14', '新生儿黄疸', '&lt;p&gt;新生儿黄疸新生儿黄疸新生儿黄疸&lt;/p&gt;');
INSERT INTO `illness` VALUES ('12', '0', '15', '妊娠合并症', '&lt;p&gt;妊娠合并症妊娠合并症&lt;/p&gt;');

-- ----------------------------
-- Table structure for `inquiry`
-- ----------------------------
DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry` (
  `inqu_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `inqu_peo_id` int(16) NOT NULL COMMENT '问诊人ID',
  `inqu_info` longtext COMMENT '问诊信息',
  `inqu_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `inqu_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`inqu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊信息表';

-- ----------------------------
-- Records of inquiry
-- ----------------------------

-- ----------------------------
-- Table structure for `inqu_img`
-- ----------------------------
DROP TABLE IF EXISTS `inqu_img`;
CREATE TABLE `inqu_img` (
  `inqu_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `inqu_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `inqu_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `inqu_img_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`inqu_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊图片';

-- ----------------------------
-- Records of inqu_img
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mg_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `mg_admin` varchar(16) NOT NULL COMMENT '管理员账号',
  `mg_password` varchar(128) NOT NULL COMMENT '管理员密码',
  `mg_name` varchar(32) NOT NULL COMMENT '管理员姓名',
  `mg_role_id` mediumint(8) NOT NULL COMMENT '角色ID',
  `mg_time` varchar(16) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员信息表';

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for `message_push`
-- ----------------------------
DROP TABLE IF EXISTS `message_push`;
CREATE TABLE `message_push` (
  `push_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '推送ID',
  `push_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `push_img` varchar(64) DEFAULT NULL COMMENT '图片',
  `push_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `push_content` longtext COMMENT '内容',
  `create_time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`push_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送';

-- ----------------------------
-- Records of message_push
-- ----------------------------

-- ----------------------------
-- Table structure for `my_doc`
-- ----------------------------
DROP TABLE IF EXISTS `my_doc`;
CREATE TABLE `my_doc` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `doc_ids` int(16) DEFAULT NULL COMMENT '关注的医生ID',
  `my_doc_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的医生';

-- ----------------------------
-- Records of my_doc
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `news_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `news_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `news_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_img`
-- ----------------------------
DROP TABLE IF EXISTS `news_img`;
CREATE TABLE `news_img` (
  `news_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `news_img_name` varchar(32) DEFAULT NULL COMMENT '图片名称',
  `news_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  `news_id` mediumint(8) NOT NULL COMMENT '新闻ID',
  PRIMARY KEY (`news_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻图片表';

-- ----------------------------
-- Records of news_img
-- ----------------------------

-- ----------------------------
-- Table structure for `page_img`
-- ----------------------------
DROP TABLE IF EXISTS `page_img`;
CREATE TABLE `page_img` (
  `page_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `page_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `page_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`page_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处方图片表';

-- ----------------------------
-- Records of page_img
-- ----------------------------

-- ----------------------------
-- Table structure for `push_img`
-- ----------------------------
DROP TABLE IF EXISTS `push_img`;
CREATE TABLE `push_img` (
  `push_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `push_img_path` varchar(64) DEFAULT NULL COMMENT '图片路径',
  `push_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`push_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送图片表';

-- ----------------------------
-- Records of push_img
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_auth_ac` varchar(255) NOT NULL COMMENT '模块操作',
  `role_auth_ids` varchar(255) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员角色表';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `see_doc_case`
-- ----------------------------
DROP TABLE IF EXISTS `see_doc_case`;
CREATE TABLE `see_doc_case` (
  `seecase_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户人ID',
  `useseedoc_id` int(16) NOT NULL COMMENT '记录人ID',
  `seecase_hos` varchar(32) DEFAULT NULL COMMENT '就诊医院',
  `seecase_depa` varchar(32) DEFAULT NULL COMMENT '就诊科室',
  `seecase_doc` varchar(32) DEFAULT NULL COMMENT '就诊医生',
  `seecase_info` longtext COMMENT '诊断',
  `seecase_sgs` longtext COMMENT '医生建议',
  `page_info` longtext COMMENT '处方信息',
  `page_img_id` varchar(16) DEFAULT NULL COMMENT '处方图片ID',
  `check_info` longtext COMMENT '检查信息',
  `check_img_id` varchar(16) DEFAULT NULL COMMENT '检查图片ID',
  `seecase_time` varchar(16) DEFAULT NULL COMMENT '就诊时间',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`seecase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院就诊记录';

-- ----------------------------
-- Records of see_doc_case
-- ----------------------------

-- ----------------------------
-- Table structure for `slider`
-- ----------------------------
DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider` (
  `slider_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `slider_path` varchar(128) DEFAULT NULL COMMENT '图片路径',
  `slider_name` varchar(64) DEFAULT NULL COMMENT '图片名字',
  `slider_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of slider
-- ----------------------------

-- ----------------------------
-- Table structure for `standard`
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `stan_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usestan_id` int(16) NOT NULL COMMENT '记录人ID',
  `blopre` varchar(8) DEFAULT NULL COMMENT '血压',
  `bloglu` varchar(8) DEFAULT NULL COMMENT '血糖',
  `heart` varchar(8) DEFAULT NULL COMMENT '心率',
  `pulse` varchar(8) DEFAULT NULL COMMENT '脉搏',
  `heat` varchar(8) DEFAULT NULL COMMENT '体温',
  `breathe` varchar(8) DEFAULT NULL COMMENT '呼吸频率',
  `capacity` varchar(8) DEFAULT NULL COMMENT '肺活量',
  `weight` varchar(8) DEFAULT NULL COMMENT '体重',
  `height` varchar(8) DEFAULT NULL COMMENT '身高',
  `vision` varchar(8) DEFAULT NULL COMMENT '视力',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`stan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康指标表';

-- ----------------------------
-- Records of standard
-- ----------------------------

-- ----------------------------
-- Table structure for `talk`
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `talk_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sender_id` int(16) NOT NULL COMMENT '发送者ID',
  `receiver_id` int(16) NOT NULL COMMENT '接收者ID',
  `content` longtext COMMENT '内容',
  `talk_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `talk_pic` varchar(32) DEFAULT NULL COMMENT '表情',
  `read` varchar(16) DEFAULT NULL COMMENT '是否已读',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录表';

-- ----------------------------
-- Records of talk
-- ----------------------------

-- ----------------------------
-- Table structure for `talk_img`
-- ----------------------------
DROP TABLE IF EXISTS `talk_img`;
CREATE TABLE `talk_img` (
  `talk_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `talk_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`talk_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天图片表';

-- ----------------------------
-- Records of talk_img
-- ----------------------------

-- ----------------------------
-- Table structure for `user_add`
-- ----------------------------
DROP TABLE IF EXISTS `user_add`;
CREATE TABLE `user_add` (
  `user_add_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '被添加者ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `uadd_name` varchar(16) NOT NULL COMMENT '姓名',
  `uadd_sex` enum('女','男') DEFAULT '男' COMMENT '性别',
  `uadd_age` mediumint(8) DEFAULT NULL COMMENT '年龄',
  `uadd_city` varchar(32) DEFAULT NULL COMMENT '居住地',
  `uadd_phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `uadd_rela` varchar(16) DEFAULT NULL COMMENT '与用户的关系',
  `inqu_id` int(16) DEFAULT NULL COMMENT '我的问诊',
  `drug_id` int(16) DEFAULT NULL COMMENT '我的用药',
  `stan_id` int(16) DEFAULT NULL COMMENT '我的健康指标',
  `diet_id` int(16) DEFAULT NULL COMMENT '我的饮食',
  `habit_id` int(16) DEFAULT NULL COMMENT '我的习惯',
  `seecase_id` int(16) DEFAULT NULL COMMENT '就诊记录',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户所有者添加的患者';

-- ----------------------------
-- Records of user_add
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` mediumint(16) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(16) NOT NULL COMMENT '用户姓名',
  `user_nickname` varchar(16) NOT NULL COMMENT '用户昵称',
  `user_age` mediumint(8) NOT NULL COMMENT '年龄',
  `user_phone` varchar(16) NOT NULL COMMENT '用户电话',
  `user_password` varchar(128) NOT NULL COMMENT '用户密码',
  `user_img` varchar(64) NOT NULL COMMENT '用户头像',
  `user_sex` enum('女','男') NOT NULL DEFAULT '男' COMMENT '用户性别',
  `user_city` varchar(128) NOT NULL COMMENT '所在城市',
  `user_date` varchar(16) NOT NULL COMMENT '出生日期',
  `papers_type` varchar(16) DEFAULT NULL COMMENT '证件类型',
  `papers_num` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `nation` varchar(16) DEFAULT '汉' COMMENT '民族',
  `profession` varchar(16) DEFAULT NULL COMMENT '职业',
  `education` varchar(16) DEFAULT NULL COMMENT '文化程度',
  `marriage` varchar(8) NOT NULL COMMENT '婚姻状况',
  `user_qq` varchar(16) DEFAULT NULL COMMENT 'QQ',
  `user_weixin` varchar(16) DEFAULT NULL COMMENT '微信',
  `user_time` varchar(16) NOT NULL COMMENT '创建时间',
  `user_token` varchar(256) DEFAULT NULL,
  `token_time` varchar(16) DEFAULT NULL COMMENT 'token生成时间',
  `login_time` varchar(16) DEFAULT NULL COMMENT '最后一次登录时间',
  `im_token` varchar(255) DEFAULT NULL COMMENT '融云token',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '张洋豪', '张洋豪', '22', '15768650568', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ec271fc8c.jpg', '男', '黑龙江 鸡西 鸡冠区', '07/13/1995', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15768650568', '2017-03-25 12:41', null, null, null, 'H1u+oxNOWZMkxm9oF1gIQAw5f5aZvT5xw3JgzbRIqa+L76gWTUero/s+ToM7UkrE4G7SMrhpDZdnXNe4pSrk/Nt6VddU0wGc');
INSERT INTO `user_info` VALUES ('2', '王哲', '王哲', '12', '15768650567', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ec6a6c634.jpg', '男', '天津 和平区 ', '11/09/1994', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15768650568', '2017-03-25 12:47', 'f836d948e94501df968cf0299bf3202b', '2017-04-18 07:43', '2017-04-18 07:43', 'rlCA52B5S12by3220ZRWLVJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODiR80ia6WDxB0ZV3W9VG58xQ7O4TGeFyDROIjSDL3en0');
INSERT INTO `user_info` VALUES ('3', '黄辉煌', '黄辉煌', '22', '15768650566', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ebe31bf28.jpg', '男', '广东 惠州 惠城区', '123', '学生证', '123', '123', '学生仔', '本科', '未婚', '123', '213', '2017-04-10 12:57', '54b0ade9851210e1196108a708f8da7f', '2017-04-18 08:37', '2017-04-18 08:37', 'T/Wcpzqz0+DiOq6p80aX8Aw5f5aZvT5xw3JgzbRIqa+L76gWTUero6ZNEA1f++vGMLGFONZxDV5nXNe4pSrk/DOrvNPO9obM');
INSERT INTO `user_info` VALUES ('4', '姚桂泰', '姚桂泰', '28', '15768650565', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-04-12/58ee11c7f147b.jpg', '男', '广东 惠州 惠城区', '1996-11-05', '身份证', '45456', '汉族', '学生', '本科', '未婚', '562356610', '562356610', '2017-04-12 19:38', null, null, null, 'KVcQpcvs/NXe/1wVZJNKkUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8gdMlYAX7ke64cjtZBihQDIxIOavrjCWGI1TaqhoBcD8');
INSERT INTO `user_info` VALUES ('5', '何家朗', '肥仔哥哥', '22', '15768652840', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-29/58db96bbf04bf.jpg', '男', '广东 广州 增城市', '06/06/1995', '身份证', '44162215564798888', '回族', '营养师', '本科', '未婚', '123456', '12346', '2017-03-29 19:13', '8f30ea9aa89e71ed34108e773fb1fa78', '2017-04-15 16:32', '2017-04-15 16:32', 'Em3Lsdwt+rOH2Q6sGpFgNww5f5aZvT5xw3JgzbRIqa+L76gWTUero6USCYyoi8vErmWzKc2/cx1Ig1GGHHi9MghZUialeCfr');
INSERT INTO `user_info` VALUES ('6', 'XHZWjN', '', '0', '15768653949', 'e10adc3949ba59abbe56e057f20f883e', 'User/headimg/58f81274d81f5.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-10 13:39', '4ee2a4d2494eee5fcc6694bf5006af96', '2017-04-20 09:52', '2017-04-20 09:52', 'JZB5VWqGThlUc4XIsC+JlQw5f5aZvT5xw3JgzbRIqa+L76gWTUero8SHSdhoK7HwJiSuox2fkbFheLBgh/qFnirMlwiWMyPM');
INSERT INTO `user_info` VALUES ('7', 'ExZmYH', '张三', '0', '15768653948', 'e10adc3949ba59abbe56e057f20f883e', 'User/headimg/58f703062dcb5.png', '男', '  ', '', '身份证', '', '汉', '', '本科', '未婚', '', '', '2017-04-12 19:39', '1ff824f9ee4e1b406f216e44fdb825bf', '2017-04-20 09:51', '2017-04-20 09:51', 'JQN+aIMJ4bBsZI39GOaA3ww5f5aZvT5xw3JgzbRIqa+L76gWTUeroxeAX4e6xFfdy+ZkLl6MfuhheLBgh/qFnplmpHm5SmN8');
INSERT INTO `user_info` VALUES ('8', 'hkK4B2', '李四', '0', '15768653333', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-04-12/58ee122610e95.jpg', '男', '  ', '', '身份证', '', '汉', '', '本科', '未婚', '', '', '2017-04-12 19:40', '94aa5f2cb9924f7fe031c4a0bcb5811d', '2017-04-20 11:59', '2017-04-20 11:59', 'PC8EIeoCDosHeNgWH+CEgQw5f5aZvT5xw3JgzbRIqa+L76gWTUero8K6f7PbQrg/y+ZkLl6MfuitzfSm0+F/Q5SFlE1cL6H4');
INSERT INTO `user_info` VALUES ('9', 'MK75EC', '', '0', '15768653334', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-12 18:21', 'd41661bd042bed4a597df4dda58e65cc', '2017-04-12 18:21', '2017-04-12 18:21', 'H7vrnfoHtFVcSS8ChYMcMUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8hnIzKAYQhgZy6IOuQR8kJ5f2m3mYT4DE3mObAGH+Zny');
INSERT INTO `user_info` VALUES ('10', 'y5qdXk', '', '0', '15768653666', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:05', null, null, null, 'DIy4DnOKqV9QPGfG1b2IWUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8jiZvSKQBubnHupunclA8hZf2m3mYT4DExE37CZH9Jpv');
INSERT INTO `user_info` VALUES ('11', 'psBeVQ', '', '0', '15768653665', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:07', null, null, null, '1oVvMZvW/TwoKmVewgCoogw5f5aZvT5xw3JgzbRIqa+L76gWTUerox7CDK4pA3NMR07B+R0eHGZ/kW09WWDh+89EiKoNBb1p');
INSERT INTO `user_info` VALUES ('12', 'PEfZ6c', '', '0', '15768653335', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:51', null, null, null, 'w+tE73NNgT725yZ9666rN0eCMLfsJdG7DU8H1ybxjweIGYfROLLh8kiX/d9sk1+V4xE74X5RiYxf2m3mYT4DE4r1421EXpfH');

-- ----------------------------
-- Table structure for `user_login`
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `user_phone` varchar(16) NOT NULL COMMENT '用户手机',
  `user_password` varchar(128) NOT NULL COMMENT '用户密码',
  `login_time` varchar(16) NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录验证表';

-- ----------------------------
-- Records of user_login
-- ----------------------------

-- ----------------------------
-- Table structure for `user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `user_add_id` int(16) DEFAULT NULL COMMENT '添加的患者',
  `account_id` int(16) DEFAULT NULL COMMENT '我的账户明细',
  `atten_id` int(16) DEFAULT NULL COMMENT '我的关注',
  `inqu_id` int(16) DEFAULT NULL COMMENT ' 我的问诊',
  `my_doc_id` int(16) DEFAULT NULL COMMENT '我的医生',
  `drug_id` int(16) DEFAULT NULL COMMENT '我的用药',
  `stan_id` int(16) DEFAULT NULL COMMENT '我的健康指标',
  `diet_id` int(16) DEFAULT NULL COMMENT '我的饮食',
  `habit_id` int(16) DEFAULT NULL COMMENT '我的习惯',
  `seecase_id` int(16) DEFAULT NULL COMMENT '历史就诊',
  `form_id` int(16) DEFAULT NULL COMMENT '我的订单',
  `feedb_id` int(16) DEFAULT NULL COMMENT '意见反馈',
  `file_id` int(16) DEFAULT NULL COMMENT '亲友档案',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关联表';

-- ----------------------------
-- Records of user_relation
-- ----------------------------
