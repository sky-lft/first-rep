/*
Navicat MySQL Data Transfer

Source Server         : 517198361.
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : hr

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2016-07-05 00:14:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `change`
-- ----------------------------
DROP TABLE IF EXISTS `change`;
CREATE TABLE `change` (
  `id` int(5) NOT NULL,
  `oldId` int(5) NOT NULL COMMENT '原来部门id',
  `newId` int(5) NOT NULL COMMENT '现在部门id',
  `staffId` int(10) NOT NULL,
  `changeTime` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oldId` (`oldId`),
  KEY `newId` (`newId`),
  KEY `staffId` (`staffId`),
  CONSTRAINT `change_ibfk_1` FOREIGN KEY (`oldId`) REFERENCES `department` (`id`),
  CONSTRAINT `change_ibfk_2` FOREIGN KEY (`newId`) REFERENCES `department` (`id`),
  CONSTRAINT `change_ibfk_3` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of change
-- ----------------------------

-- ----------------------------
-- Table structure for `degree`
-- ----------------------------
DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `degree` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of degree
-- ----------------------------
INSERT INTO `degree` VALUES ('1', '小学');
INSERT INTO `degree` VALUES ('2', '初中');
INSERT INTO `degree` VALUES ('3', '高中');
INSERT INTO `degree` VALUES ('4', '本科');
INSERT INTO `degree` VALUES ('5', '专科');
INSERT INTO `degree` VALUES ('6', '硕士');
INSERT INTO `degree` VALUES ('7', '教授');
INSERT INTO `degree` VALUES ('8', '博士');
INSERT INTO `degree` VALUES ('9', '博士后');
INSERT INTO `degree` VALUES ('10', '专家');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `parentId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '行政部', null);
INSERT INTO `department` VALUES ('2', '技术部', null);
INSERT INTO `department` VALUES ('3', '销售部', null);
INSERT INTO `department` VALUES ('4', '后勤部', '1');
INSERT INTO `department` VALUES ('5', '市场部', null);
INSERT INTO `department` VALUES ('6', '财务部', null);
INSERT INTO `department` VALUES ('7', '人力资源部', '1');
INSERT INTO `department` VALUES ('8', '研发部', null);

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'sky', '123456');
INSERT INTO `login` VALUES ('2', 'admin', '123456');

-- ----------------------------
-- Table structure for `rewardpenalties`
-- ----------------------------
DROP TABLE IF EXISTS `rewardpenalties`;
CREATE TABLE `rewardpenalties` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '奖惩类型\r\n1：奖励\r\n2: 惩罚',
  `time` date NOT NULL,
  `reason` varchar(100) NOT NULL COMMENT '原因',
  `result` varchar(30) NOT NULL COMMENT '结果',
  `staffId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffId` (`staffId`),
  CONSTRAINT `rewardpenalties_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rewardpenalties
-- ----------------------------
INSERT INTO `rewardpenalties` VALUES ('1', '1', '2016-03-11', '拾金不昧', '奖励100元', '13108101');
INSERT INTO `rewardpenalties` VALUES ('2', '2', '2016-05-21', '损坏公司物品', '惩罚300元', '13108103');
INSERT INTO `rewardpenalties` VALUES ('3', '1', '2016-06-01', '接待客户', '奖励1030元', '13108104');
INSERT INTO `rewardpenalties` VALUES ('4', '1', '2015-04-13', '准备大型会议', '奖励10元', '13108101');
INSERT INTO `rewardpenalties` VALUES ('5', '1', '2015-04-13', '准备大型会议', '奖励10元', '13108102');
INSERT INTO `rewardpenalties` VALUES ('6', '1', '2015-04-13', '准备大型会议', '奖励10元', '13108103');
INSERT INTO `rewardpenalties` VALUES ('7', '1', '2015-04-13', '准备大型会议', '奖励10元', '13108104');
INSERT INTO `rewardpenalties` VALUES ('8', '1', '2015-04-13', '准备大型会议', '奖励10元', '13108105');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) DEFAULT NULL,
  `resedentId` varchar(18) DEFAULT NULL,
  `resedentType` int(1) DEFAULT NULL,
  `degreeId` int(10) DEFAULT NULL COMMENT '学历',
  `sex` int(1) DEFAULT '1' COMMENT '1:男 0:女',
  `phone` varchar(11) DEFAULT NULL,
  `mail` varchar(20) DEFAULT NULL,
  `marital` int(1) DEFAULT '1' COMMENT '婚姻状况 1:已婚 0：未婚',
  `titleId` int(5) DEFAULT NULL COMMENT '职称',
  `staffType` int(5) DEFAULT NULL COMMENT '合同类型',
  `birth` date DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `startTime` date DEFAULT NULL COMMENT '入职时间',
  `workAge` int(3) DEFAULT NULL COMMENT '合同到期时间\r\n',
  `endTime` date DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degreeId` (`degreeId`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`degreeId`) REFERENCES `degree` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13108316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('13108301', '张三', '123456789012345678', '1', '3', '1', '12345678901', '1@163.com', '1', '1', '1', '1980-04-11', '36', '2014-09-01', '2', '2017-08-31', null);
INSERT INTO `staff` VALUES ('13108302', '李四', '123426789012345678', '0', '4', '1', '12345678902', '2@163.com', '1', '3', '1', '1985-02-16', '31', '2014-09-01', '2', '2017-08-31', null);
INSERT INTO `staff` VALUES ('13108303', '赵六', '123426789012445678', '0', '2', '0', '12345678904', '4@163.com', '1', '1', '1', '1975-07-11', '41', '2013-05-13', '3', '2018-05-12', null);
INSERT INTO `staff` VALUES ('13108304', '周七', '123426789012445671', '1', '3', '1', '12345678905', '5@163.com', '1', '2', '1', '1984-08-23', '41', '2014-01-13', '2', '2018-01-12', null);
INSERT INTO `staff` VALUES ('13108305', '王五', '123426789012345678', '0', '6', '0', '12345678903', '3@163.com', '0', '3', '1', '1995-06-26', '21', '2016-07-13', '0', '2019-07-12', null);
INSERT INTO `staff` VALUES ('13108306', '吴春万', '620421199709123421', '1', '7', '1', '13519875678', null, '0', '2', '1', '1993-07-07', '24', '2016-07-04', '12', '2020-08-04', null);
INSERT INTO `staff` VALUES ('13108307', '余海林', '620421199709121111', '1', '6', '1', '13519832356', null, '1', '3', '1', '2011-07-04', '5', '2016-07-04', '5', '2019-07-04', null);
INSERT INTO `staff` VALUES ('13108308', '余海', '620421199709121111', '1', '6', '1', '13519832356', null, '1', '3', '1', '2011-07-04', '5', '2016-07-04', '5', '2019-07-04', null);
INSERT INTO `staff` VALUES ('13108309', '黄虎', '620421199709121111', '1', '6', '1', '13519832356', null, '1', '3', '1', '2010-07-04', '6', '2016-07-04', '5', '2019-07-04', null);
INSERT INTO `staff` VALUES ('13108310', '黄虎画', '620421199709121111', '1', '6', '1', '13519832356', null, '1', '3', '1', '2009-07-04', '7', '2016-07-04', '5', '2019-07-04', null);
INSERT INTO `staff` VALUES ('13108311', '黄虎才', '620421199709121111', '0', '3', '1', '13519832222', null, '0', '3', '1', '2007-07-04', '9', '2016-07-04', '13', '2019-07-04', null);
INSERT INTO `staff` VALUES ('13108312', '黄虎才', '620421199709121111', '0', '3', '1', '13519832222', null, '0', '3', '1', '2007-07-04', '9', '2016-07-04', '13', '2019-07-04', null);
INSERT INTO `staff` VALUES ('13108313', '黄虎才', '620421199709121111', '0', '3', '1', '13519832222', null, '0', '3', '1', '2010-07-04', '6', '2016-07-04', '13', '2019-07-04', null);
INSERT INTO `staff` VALUES ('13108314', '黄虎成', '620421199709121198', '1', '7', '1', '13519832200', null, '0', '5', '1', '1983-07-04', '33', '2016-07-04', '15', '2039-07-04', null);
INSERT INTO `staff` VALUES ('13108315', '余夸', '620421199102123421', '0', '5', '1', '13519831231', null, '0', '4', '2', '1993-07-07', '23', '2016-07-04', '10', '2020-07-04', null);

-- ----------------------------
-- Table structure for `title`
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `content` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('1', '程序员');
INSERT INTO `title` VALUES ('2', '助理工程师');
INSERT INTO `title` VALUES ('3', '工程师');
INSERT INTO `title` VALUES ('4', '高级工程师');
INSERT INTO `title` VALUES ('5', '研究级高级工程师');

-- ----------------------------
-- Table structure for `titlejudge`
-- ----------------------------
DROP TABLE IF EXISTS `titlejudge`;
CREATE TABLE `titlejudge` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `oldTitle` int(5) NOT NULL,
  `newTitle` int(5) NOT NULL,
  `titleTime` date NOT NULL,
  `staffId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oldTitle` (`oldTitle`),
  KEY `newTitle` (`newTitle`),
  KEY `staffId` (`staffId`),
  CONSTRAINT `titlejudge_ibfk_1` FOREIGN KEY (`oldTitle`) REFERENCES `title` (`id`),
  CONSTRAINT `titlejudge_ibfk_2` FOREIGN KEY (`newTitle`) REFERENCES `title` (`id`),
  CONSTRAINT `titlejudge_ibfk_3` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of titlejudge
-- ----------------------------
INSERT INTO `titlejudge` VALUES ('1', '1', '2', '2016-01-30', '13108101');
INSERT INTO `titlejudge` VALUES ('2', '3', '4', '2016-03-13', '13108105');
INSERT INTO `titlejudge` VALUES ('3', '2', '3', '2016-01-11', '13108102');
INSERT INTO `titlejudge` VALUES ('4', '4', '5', '2016-04-16', '13108104');
INSERT INTO `titlejudge` VALUES ('5', '1', '2', '2016-01-30', '13108103');

-- ----------------------------
-- Table structure for `train`
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `content` varchar(100) DEFAULT NULL COMMENT '内容',
  `host` varchar(10) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `title` varchar(30) NOT NULL COMMENT '主题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('1', '2016-06-30', '2016-07-01', 'saaaaaaaa', '企业', '西湖', 'aaaa');
INSERT INTO `train` VALUES ('2', '2016-05-12', '2016-06-01', 'wefevgreggrg', '企业', '下沙', 'bbg');
INSERT INTO `train` VALUES ('3', '2016-02-11', '2016-08-05', 'sadadadff', '企业', '滨江', 'qeqeq');
INSERT INTO `train` VALUES ('4', '2016-03-24', '2016-05-14', 'sweerwg', '企业', '杭电', 'fefwfwe');
INSERT INTO `train` VALUES ('5', '2016-01-15', '2016-04-30', 'sqeqeqeqeqea', '企业', '北京国家会展中心', 'dwqeqe');

-- ----------------------------
-- Table structure for `trainstaff`
-- ----------------------------
DROP TABLE IF EXISTS `trainstaff`;
CREATE TABLE `trainstaff` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `trainId` int(5) NOT NULL,
  `staffId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainId` (`trainId`),
  KEY `staffId` (`staffId`),
  CONSTRAINT `trainstaff_ibfk_1` FOREIGN KEY (`trainId`) REFERENCES `train` (`id`),
  CONSTRAINT `trainstaff_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trainstaff
-- ----------------------------
INSERT INTO `trainstaff` VALUES ('1', '1', '13108101');
INSERT INTO `trainstaff` VALUES ('2', '3', '13108104');
INSERT INTO `trainstaff` VALUES ('3', '2', '13108102');
INSERT INTO `trainstaff` VALUES ('4', '3', '13108104');
INSERT INTO `trainstaff` VALUES ('5', '4', '13108102');
INSERT INTO `trainstaff` VALUES ('6', '2', '13108105');
INSERT INTO `trainstaff` VALUES ('9', '1', '13108101');
INSERT INTO `trainstaff` VALUES ('10', '3', '13108104');
INSERT INTO `trainstaff` VALUES ('13', '2', '13108102');
INSERT INTO `trainstaff` VALUES ('14', '3', '13108104');
INSERT INTO `trainstaff` VALUES ('15', '4', '13108102');
INSERT INTO `trainstaff` VALUES ('16', '2', '13108105');
