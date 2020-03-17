/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : ssm_student

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-06-04 17:35:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminlogin
-- ----------------------------
DROP TABLE IF EXISTS `adminlogin`;
CREATE TABLE `adminlogin` (
  `loginid` int(11) NOT NULL,
  `loginpassword` varchar(255) NOT NULL DEFAULT '123456',
  PRIMARY KEY (`loginid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlogin
-- ----------------------------
INSERT INTO `adminlogin` VALUES ('123456', '123456');

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `classid` int(11) NOT NULL,
  `classname` varchar(255) NOT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('1', '计算1班');
INSERT INTO `classroom` VALUES ('2', '计算2班');
INSERT INTO `classroom` VALUES ('3', '软件1班');
INSERT INTO `classroom` VALUES ('4', '软件2班');
INSERT INTO `classroom` VALUES ('5', '电气1班');
INSERT INTO `classroom` VALUES ('6', '电气2班');
INSERT INTO `classroom` VALUES ('7', '电气3班');
INSERT INTO `classroom` VALUES ('8', '电气4班');
INSERT INTO `classroom` VALUES ('9', '电力1班');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseid` int(11) NOT NULL,
  `coursename` varchar(255) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `coursetime` varchar(255) DEFAULT 'null',
  `courseroom` varchar(255) DEFAULT 'null',
  `courseweek` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`courseid`),
  KEY `fk_course_teacher` (`teacherid`),
  CONSTRAINT `fk_course_teacher` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C语言', '1007', '8:20-9:55', '工2——105', '1-10周', '3');
INSERT INTO `course` VALUES ('2', 'Java', '1005', '10:15-11:50', '工1——106', '1-12周', '3');
INSERT INTO `course` VALUES ('3', '操作系统', '1002', '14:00-15:35', '工1——208', '5-14周', '2');
INSERT INTO `course` VALUES ('4', '数据库', '1003', '15:55-17:30', '工2——309', '4-14周', '3');
INSERT INTO `course` VALUES ('5', '计算机网络', '1002', '14:00-15:35', '工2——202', '3-8周', '2');
INSERT INTO `course` VALUES ('6', 'C++', '1007', '8:20-9:55', '工2——105', '1-9周', '3');
INSERT INTO `course` VALUES ('7', '计算机导论', '1002', '14:00-15:35', '工1——209', '1-9周', '1');
INSERT INTO `course` VALUES ('8', 'C#', '1003', '14:00-15:35', '工1——207', '5-15周', '2');
INSERT INTO `course` VALUES ('9', 'JavaWeb', '1001', '14:00-15:35', '工1——208', '1-14周', '3');
INSERT INTO `course` VALUES ('10', 'Linux', '1008', '8:20-9:55', '工2——216', '3-11周', '2');
INSERT INTO `course` VALUES ('11', '大学物理', '1006', '15:55-17:30', '工1——108', '3-10周', '2');
INSERT INTO `course` VALUES ('12', '毛概', '1009', '15:55-17:30', '工2——107', '2-9周', '2');
INSERT INTO `course` VALUES ('13', '中国近代史', '1007', '8:20-9:55', '工1——303', '3-8周', '1');
INSERT INTO `course` VALUES ('14', '职业沟通', '1007', '10:15-11:50', '工2——401', '4-7周', '1');
INSERT INTO `course` VALUES ('15', '计算机导论', '1006', '14:00-15:35', '工1——405', '3-11周', '1');
INSERT INTO `course` VALUES ('16', '高等数学', '1004', '8:20-9:55', '工2——416', '1-12周', '3');
INSERT INTO `course` VALUES ('17', '汇编原理', '1004', '10:15-11:50', '工2——416', '4—12周', '2');
INSERT INTO `course` VALUES ('18', '多媒体技术技术与应用', '1005', '11:15-11:50', '工2——316', '6-8周', '1');

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse` (
  `courseid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL,
  KEY `fk_selectedcourse_course` (`courseid`),
  KEY `fk_selectedcourse_student` (`studentid`),
  CONSTRAINT `fk_selectedcourse_course` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_selectedcourse_student` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO `selectedcourse` VALUES ('3', '10006', '89');
INSERT INTO `selectedcourse` VALUES ('2', '10007', '99');
INSERT INTO `selectedcourse` VALUES ('3', '10007', '100');
INSERT INTO `selectedcourse` VALUES ('4', '10002', '88');
INSERT INTO `selectedcourse` VALUES ('1', '10003', '76');
INSERT INTO `selectedcourse` VALUES ('4', '10003', '66');
INSERT INTO `selectedcourse` VALUES ('3', '10001', '90');
INSERT INTO `selectedcourse` VALUES ('3', '10002', '100');
INSERT INTO `selectedcourse` VALUES ('5', '10001', '99');
INSERT INTO `selectedcourse` VALUES ('5', '10002', '22');
INSERT INTO `selectedcourse` VALUES ('5', '10003', '99');
INSERT INTO `selectedcourse` VALUES ('1', '10002', '88');
INSERT INTO `selectedcourse` VALUES ('6', '10002', '77');
INSERT INTO `selectedcourse` VALUES ('2', '10002', '62');
INSERT INTO `selectedcourse` VALUES ('9', '10001', '88');
INSERT INTO `selectedcourse` VALUES ('9', '10003', '99');
INSERT INTO `selectedcourse` VALUES ('9', '10004', '92');
INSERT INTO `selectedcourse` VALUES ('9', '10006', '90');
INSERT INTO `selectedcourse` VALUES ('9', '10007', '91');
INSERT INTO `selectedcourse` VALUES ('9', '10009', '93');
INSERT INTO `selectedcourse` VALUES ('9', '10013', '89');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `studentname` varchar(255) NOT NULL,
  `studentsex` varchar(255) DEFAULT 'null',
  `studentbirth` varchar(255) DEFAULT 'null',
  `classid` int(11) NOT NULL,
  PRIMARY KEY (`studentid`),
  KEY `fk_student_classroom` (`classid`),
  CONSTRAINT `fk_student_classroom` FOREIGN KEY (`classid`) REFERENCES `classroom` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('10001', '张三', '男', '1996-07-29', '1');
INSERT INTO `student` VALUES ('10002', '李四', '男', '1999-11-11', '2');
INSERT INTO `student` VALUES ('10003', '小花', '女', '1999-01-01', '4');
INSERT INTO `student` VALUES ('10004', '小华', '女', '1999-01-03', '8');
INSERT INTO `student` VALUES ('10005', '小张', '男', '1998-12-12', '6');
INSERT INTO `student` VALUES ('10006', '孙悟空', '男', '1997-02-02', '3');
INSERT INTO `student` VALUES ('10007', '铁扇', '女', '1995-03-03', '7');
INSERT INTO `student` VALUES ('10008', '牛魔王', '男', '1996-07-07', '8');
INSERT INTO `student` VALUES ('10009', '老王', '男', '1996-07-12', '2');
INSERT INTO `student` VALUES ('10010', '小郭', '女', '1997-06-06', '3');
INSERT INTO `student` VALUES ('10011', '小贾', '女', '1998-06-07', '4');
INSERT INTO `student` VALUES ('10012', '罗贝', '女', '1996-08-08', '6');
INSERT INTO `student` VALUES ('10013', '张大强', '男', '1997-12-12', '9');

-- ----------------------------
-- Table structure for studentlogin
-- ----------------------------
DROP TABLE IF EXISTS `studentlogin`;
CREATE TABLE `studentlogin` (
  `loginid` int(11) NOT NULL,
  `loginpassword` varchar(255) DEFAULT '123456',
  KEY `fk_studentlogin_student` (`loginid`),
  CONSTRAINT `fk_studentlogin_student` FOREIGN KEY (`loginid`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentlogin
-- ----------------------------
INSERT INTO `studentlogin` VALUES ('10001', '123456');
INSERT INTO `studentlogin` VALUES ('10002', '123456');
INSERT INTO `studentlogin` VALUES ('10003', '123456');
INSERT INTO `studentlogin` VALUES ('10004', '123456');
INSERT INTO `studentlogin` VALUES ('10005', '123456');
INSERT INTO `studentlogin` VALUES ('10006', '123456');
INSERT INTO `studentlogin` VALUES ('10007', '123456');
INSERT INTO `studentlogin` VALUES ('10008', '123456');
INSERT INTO `studentlogin` VALUES ('10009', '123456');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherid` int(11) NOT NULL AUTO_INCREMENT,
  `teachername` varchar(255) NOT NULL,
  `teachersex` varchar(255) DEFAULT 'null',
  `title` varchar(255) DEFAULT 'null',
  `classid` int(11) NOT NULL,
  PRIMARY KEY (`teacherid`),
  KEY `fk_teacher_classroom` (`classid`),
  CONSTRAINT `fk_teacher_classroom` FOREIGN KEY (`classid`) REFERENCES `classroom` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1001', '刘老师', '女', '教授', '2');
INSERT INTO `teacher` VALUES ('1002', '张老师', '男', '副教授', '9');
INSERT INTO `teacher` VALUES ('1003', '李老师', '男', '助教', '4');
INSERT INTO `teacher` VALUES ('1004', '陈老师', '女', '讲师', '1');
INSERT INTO `teacher` VALUES ('1005', '罗老师', '男', '副教授', '3');
INSERT INTO `teacher` VALUES ('1006', '孙老师', '男', '教授', '7');
INSERT INTO `teacher` VALUES ('1007', '易老师', '女', '助教', '8');
INSERT INTO `teacher` VALUES ('1008', '龙老师', '男', '讲师', '5');
INSERT INTO `teacher` VALUES ('1009', '付老师', '女', '教授', '6');
INSERT INTO `teacher` VALUES ('1010', '肖老师', '男', '副教授', '5');
INSERT INTO `teacher` VALUES ('1011', '汪老师', '女', '助教', '3');

-- ----------------------------
-- Table structure for teacherlogin
-- ----------------------------
DROP TABLE IF EXISTS `teacherlogin`;
CREATE TABLE `teacherlogin` (
  `loginid` int(11) NOT NULL,
  `loginpassword` varchar(255) DEFAULT '123456',
  KEY `fk_teacherlogin_teacher` (`loginid`),
  CONSTRAINT `fk_teacherlogin_teacher` FOREIGN KEY (`loginid`) REFERENCES `teacher` (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacherlogin
-- ----------------------------
INSERT INTO `teacherlogin` VALUES ('1001', '123456');
INSERT INTO `teacherlogin` VALUES ('1002', '123456');
INSERT INTO `teacherlogin` VALUES ('1003', '123456');
INSERT INTO `teacherlogin` VALUES ('1004', '123456');
INSERT INTO `teacherlogin` VALUES ('1005', '123456');
INSERT INTO `teacherlogin` VALUES ('1006', '123456');
INSERT INTO `teacherlogin` VALUES ('1007', '123456');
INSERT INTO `teacherlogin` VALUES ('1008', '123456');
INSERT INTO `teacherlogin` VALUES ('1009', '123456');
