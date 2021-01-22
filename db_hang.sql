/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : db_hang

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2015-08-06 20:55:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for t_hangban
-- ----------------------------
DROP TABLE IF EXISTS `t_hangban`;
CREATE TABLE `t_hangban` (
  `id` int(11) NOT NULL DEFAULT '0',
  `riqi` varchar(255) DEFAULT NULL,
  `bianhao` varchar(255) DEFAULT NULL,
  `shifadi` varchar(255) DEFAULT NULL,
  `daodadi` varchar(255) DEFAULT NULL,
  `qifeishi` varchar(255) DEFAULT NULL,
  `shengpiao` int(11) DEFAULT NULL,
  `chengrenpiaojia` int(11) DEFAULT NULL,
  `ertongpiaojia` int(11) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hangban
-- ----------------------------
INSERT INTO `t_hangban` VALUES ('2', '2016-02-20', 'H001', '北京', '青岛', '08:00:00', '190', '200', '150', 'no');
INSERT INTO `t_hangban` VALUES ('3', '2016-02-20', 'H002', '北京', '大连', '09:00:00', '198', '180', '120', 'no');
INSERT INTO `t_hangban` VALUES ('4', '2016-02-20', 'H003', '北京', '南京', '10:00:00', '198', '100', '50', 'no');
INSERT INTO `t_hangban` VALUES ('5', '2016-02-07', 'MU1818', '北京', '上海', '16:00:00', '197', '1590', '1288', 'no');
INSERT INTO `t_hangban` VALUES ('6', '2015-12-31', 'CA1110', '北京', '成都', '12:00:00', '200', '990', '698', 'no');

-- ----------------------------
-- Table structure for t_liuyan
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyan`;
CREATE TABLE `t_liuyan` (
  `id` int(11) NOT NULL,
  `neirong` varchar(4000) DEFAULT NULL,
  `liuyanshi` varchar(55) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `huifu` varchar(4000) DEFAULT NULL,
  `huifushi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liuyan
-- ----------------------------
INSERT INTO `t_liuyan` VALUES ('3', '测试留言板测试类测试留言板测试测试留言板测试', '2016-02-11 16:33', '1', 'wwwwwwwwwwwwwwwwwwwwwwwww', '2016-03-11 16:34');
INSERT INTO `t_liuyan` VALUES ('4', 'dddddddddddddddddddddddddddddddddddddddddd', '2016-2-11 16:33', '1', 'eeeeeeeeeeeeeeeeeeeeeeeee', '2016-03-11 16:34');
INSERT INTO `t_liuyan` VALUES ('5', '有没有特价机票啊？？？', '2015-08-06 20:51', '4', '没有啊。。', '2015-08-06 20:52');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `userId` int(11) DEFAULT NULL,
  `xiadanshi` varchar(255) DEFAULT NULL,
  `shouhourenming` varchar(255) DEFAULT NULL,
  `shouhourenhua` varchar(255) DEFAULT NULL,
  `shouhourenzhi` varchar(255) DEFAULT NULL,
  `zongjiage` int(11) DEFAULT NULL,
  `zhuangtai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1438864632302', '3', '2016-02-06 08:37:12', '刘亦菲', '13811122211', '北京市', '200', '未受理');
INSERT INTO `t_order` VALUES ('1438865013720', '3', '2015-08-06 08:43:33', '刘亦菲', '13913811111', '北京市海淀区', '1590', '未受理');
INSERT INTO `t_order` VALUES ('1438865495737', '4', '2015-08-06 08:51:35', '高圆圆', '13255555555', '中国北京市', '3180', '已受理');

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `orderId` varchar(255) DEFAULT NULL,
  `hangbanId` int(11) DEFAULT NULL,
  `piaoleixing` varchar(255) DEFAULT NULL,
  `danjia` int(11) DEFAULT NULL,
  `shuliang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1438864609088', '1438864632302', '4', '成人票', '100', '2');
INSERT INTO `t_orderitem` VALUES ('1438864971786', '1438865013720', '5', '成人票', '1590', '1');
INSERT INTO `t_orderitem` VALUES ('1438865448729', '1438865495737', '5', '成人票', '1590', '1');
INSERT INTO `t_orderitem` VALUES ('1438865472714', '1438865495737', '5', '成人票', '1590', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_realname` varchar(50) DEFAULT NULL,
  `user_sex` varchar(50) DEFAULT NULL,
  `user_age` int(50) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  `user_del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'liusan', '000000', '刘三', '男', '33', '北京路', '13222222222', 'no');
INSERT INTO `t_user` VALUES ('2', 'lisisi', '000000', '李斯', '男', '20', '上海路', '13444444444', 'no');
INSERT INTO `t_user` VALUES ('3', 'yifei', '000000', '刘菲', '女', '20', '南京路', '13555555555', 'no');
INSERT INTO `t_user` VALUES ('4', 'gaoyy', '123456', '123456', '男', '22', '北京', '88889999', 'no');
