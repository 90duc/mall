/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-08-28 11:26:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(255) NOT NULL AUTO_INCREMENT COMMENT '管理员标识id',
  `aname` varchar(255) DEFAULT NULL COMMENT '管理员名字',
  `apassword` varchar(255) DEFAULT NULL COMMENT '密码',
  `atype` varchar(255) DEFAULT NULL COMMENT '管理员类型等级',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aname` (`aname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '潘小华', '201430340118', '超级管理员');
INSERT INTO `admin` VALUES ('2', '黄佳鑫', '201430340107', '普通管理员');
INSERT INTO `admin` VALUES ('3', '贺世宇', '201430340104', '普通管理员');

-- ----------------------------
-- Table structure for btype
-- ----------------------------
DROP TABLE IF EXISTS `btype`;
CREATE TABLE `btype` (
  `btid` int(255) NOT NULL AUTO_INCREMENT COMMENT '大分类标识id',
  `btname` varchar(255) DEFAULT NULL COMMENT '大分类名称',
  PRIMARY KEY (`btid`),
  UNIQUE KEY `btname` (`btname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of btype
-- ----------------------------
INSERT INTO `btype` VALUES ('4', '家用电器');
INSERT INTO `btype` VALUES ('3', '手机数码');
INSERT INTO `btype` VALUES ('8', '服饰');
INSERT INTO `btype` VALUES ('1', '进口商品');
INSERT INTO `btype` VALUES ('2', '食品饮料');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `cid` int(255) NOT NULL AUTO_INCREMENT COMMENT '商品标识id',
  `cname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `btid` int(11) DEFAULT NULL COMMENT '大分类',
  `stid` int(11) DEFAULT NULL COMMENT '小分类',
  `cprice` double(10,2) DEFAULT NULL COMMENT '商品单价',
  `cremain` int(255) NOT NULL COMMENT '剩余数量',
  PRIMARY KEY (`cid`),
  KEY `btid` (`btid`),
  KEY `stid` (`stid`),
  CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`btid`) REFERENCES `btype` (`btid`) ON DELETE SET NULL,
  CONSTRAINT `commodity_ibfk_2` FOREIGN KEY (`stid`) REFERENCES `stype` (`stid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '伊利牛奶', '1', '1', '100.00', '9884');
INSERT INTO `commodity` VALUES ('2', '蒙牛牛奶', '1', '1', '50.00', '87902');
INSERT INTO `commodity` VALUES ('3', 'xo', '2', '3', '500.00', '49985');
INSERT INTO `commodity` VALUES ('4', '人头马', '2', '3', '399.00', '20000');
INSERT INTO `commodity` VALUES ('5', '维他奶', '1', '2', '3.00', '9089');
INSERT INTO `commodity` VALUES ('6', 'iPhone', '3', '5', '5999.00', '193');
INSERT INTO `commodity` VALUES ('7', '华为P10', '3', '5', '4999.00', '299');
INSERT INTO `commodity` VALUES ('8', '魅族', '3', '5', '2499.00', '200');
INSERT INTO `commodity` VALUES ('9', '索尼耳机', '3', '6', '1299.00', '97');
INSERT INTO `commodity` VALUES ('10', 'beats', '3', '6', '699.00', '238');
INSERT INTO `commodity` VALUES ('11', 'TCL', '4', '7', '7499.00', '50');
INSERT INTO `commodity` VALUES ('12', '格力', '4', '8', '4899.00', '67');
INSERT INTO `commodity` VALUES ('13', '小天鹅', '4', '8', '1888.00', '10');
INSERT INTO `commodity` VALUES ('14', '小米9', '3', '5', '3999.00', '20');
INSERT INTO `commodity` VALUES ('15', '美的', '4', '8', '2999.00', '150');

-- ----------------------------
-- Table structure for goods_hobby
-- ----------------------------
DROP TABLE IF EXISTS `goods_hobby`;
CREATE TABLE `goods_hobby` (
  `cur_cid` int(255) DEFAULT NULL COMMENT '用户id',
  `intro_cid` int(255) DEFAULT NULL COMMENT '商品id',
  `rank` decimal(10,2) DEFAULT NULL COMMENT '推荐等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_hobby
-- ----------------------------
INSERT INTO `goods_hobby` VALUES ('1', '10', '4.00');
INSERT INTO `goods_hobby` VALUES ('2', '11', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '11', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('1', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('1', '14', '1.00');
INSERT INTO `goods_hobby` VALUES ('1', '15', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '3', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('1', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '6', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '7', '3.00');
INSERT INTO `goods_hobby` VALUES ('1', '8', '2.00');
INSERT INTO `goods_hobby` VALUES ('1', '9', '4.00');
INSERT INTO `goods_hobby` VALUES ('10', '1', '4.00');
INSERT INTO `goods_hobby` VALUES ('10', '11', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('10', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('12', '5', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '10', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '14', '1.00');
INSERT INTO `goods_hobby` VALUES ('10', '15', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '3', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('10', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '6', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '7', '3.00');
INSERT INTO `goods_hobby` VALUES ('10', '8', '2.00');
INSERT INTO `goods_hobby` VALUES ('10', '9', '4.00');
INSERT INTO `goods_hobby` VALUES ('11', '1', '3.00');
INSERT INTO `goods_hobby` VALUES ('11', '10', '3.00');
INSERT INTO `goods_hobby` VALUES ('11', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('11', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('11', '14', '2.00');
INSERT INTO `goods_hobby` VALUES ('11', '15', '2.00');
INSERT INTO `goods_hobby` VALUES ('11', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('11', '3', '4.00');
INSERT INTO `goods_hobby` VALUES ('11', '4', '3.00');
INSERT INTO `goods_hobby` VALUES ('11', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('11', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('11', '7', '4.00');
INSERT INTO `goods_hobby` VALUES ('11', '8', '3.00');
INSERT INTO `goods_hobby` VALUES ('11', '9', '3.00');
INSERT INTO `goods_hobby` VALUES ('12', '1', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '10', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '11', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '13', '3.00');
INSERT INTO `goods_hobby` VALUES ('12', '14', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '15', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('12', '3', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('2', '12', '3.00');
INSERT INTO `goods_hobby` VALUES ('2', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('2', '14', '2.00');
INSERT INTO `goods_hobby` VALUES ('2', '15', '3.00');
INSERT INTO `goods_hobby` VALUES ('2', '3', '3.00');
INSERT INTO `goods_hobby` VALUES ('2', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('2', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('2', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('2', '7', '3.00');
INSERT INTO `goods_hobby` VALUES ('2', '8', '2.00');
INSERT INTO `goods_hobby` VALUES ('2', '9', '3.00');
INSERT INTO `goods_hobby` VALUES ('3', '1', '3.00');
INSERT INTO `goods_hobby` VALUES ('3', '10', '3.00');
INSERT INTO `goods_hobby` VALUES ('3', '11', '4.00');
INSERT INTO `goods_hobby` VALUES ('3', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('3', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('3', '14', '2.00');
INSERT INTO `goods_hobby` VALUES ('3', '15', '2.00');
INSERT INTO `goods_hobby` VALUES ('3', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('3', '4', '3.00');
INSERT INTO `goods_hobby` VALUES ('3', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('3', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('3', '7', '4.00');
INSERT INTO `goods_hobby` VALUES ('3', '8', '3.00');
INSERT INTO `goods_hobby` VALUES ('3', '9', '3.00');
INSERT INTO `goods_hobby` VALUES ('4', '1', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '10', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '11', '3.00');
INSERT INTO `goods_hobby` VALUES ('4', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '13', '3.00');
INSERT INTO `goods_hobby` VALUES ('4', '14', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '15', '1.00');
INSERT INTO `goods_hobby` VALUES ('4', '2', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '3', '3.00');
INSERT INTO `goods_hobby` VALUES ('4', '5', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '7', '3.00');
INSERT INTO `goods_hobby` VALUES ('4', '8', '2.00');
INSERT INTO `goods_hobby` VALUES ('4', '9', '2.00');
INSERT INTO `goods_hobby` VALUES ('5', '1', '3.00');
INSERT INTO `goods_hobby` VALUES ('5', '10', '3.00');
INSERT INTO `goods_hobby` VALUES ('5', '11', '3.00');
INSERT INTO `goods_hobby` VALUES ('5', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('5', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('5', '14', '1.00');
INSERT INTO `goods_hobby` VALUES ('5', '15', '2.00');
INSERT INTO `goods_hobby` VALUES ('5', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('5', '3', '3.00');
INSERT INTO `goods_hobby` VALUES ('5', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('5', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('5', '7', '3.00');
INSERT INTO `goods_hobby` VALUES ('5', '8', '3.00');
INSERT INTO `goods_hobby` VALUES ('5', '9', '3.00');
INSERT INTO `goods_hobby` VALUES ('6', '1', '3.00');
INSERT INTO `goods_hobby` VALUES ('12', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '7', '2.00');
INSERT INTO `goods_hobby` VALUES ('12', '8', '1.00');
INSERT INTO `goods_hobby` VALUES ('12', '9', '2.00');
INSERT INTO `goods_hobby` VALUES ('13', '1', '4.00');
INSERT INTO `goods_hobby` VALUES ('13', '10', '4.00');
INSERT INTO `goods_hobby` VALUES ('13', '11', '4.00');
INSERT INTO `goods_hobby` VALUES ('13', '12', '3.00');
INSERT INTO `goods_hobby` VALUES ('13', '14', '2.00');
INSERT INTO `goods_hobby` VALUES ('13', '15', '3.00');
INSERT INTO `goods_hobby` VALUES ('13', '2', '4.00');
INSERT INTO `goods_hobby` VALUES ('13', '3', '4.00');
INSERT INTO `goods_hobby` VALUES ('13', '4', '3.00');
INSERT INTO `goods_hobby` VALUES ('13', '5', '4.00');
INSERT INTO `goods_hobby` VALUES ('13', '6', '3.00');
INSERT INTO `goods_hobby` VALUES ('13', '7', '4.00');
INSERT INTO `goods_hobby` VALUES ('13', '8', '3.00');
INSERT INTO `goods_hobby` VALUES ('13', '9', '4.00');
INSERT INTO `goods_hobby` VALUES ('14', '1', '1.00');
INSERT INTO `goods_hobby` VALUES ('14', '10', '1.00');
INSERT INTO `goods_hobby` VALUES ('14', '11', '2.00');
INSERT INTO `goods_hobby` VALUES ('14', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('14', '13', '2.00');
INSERT INTO `goods_hobby` VALUES ('14', '15', '1.00');
INSERT INTO `goods_hobby` VALUES ('14', '2', '2.00');
INSERT INTO `goods_hobby` VALUES ('14', '3', '2.00');
INSERT INTO `goods_hobby` VALUES ('14', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('14', '5', '1.00');
INSERT INTO `goods_hobby` VALUES ('14', '6', '1.00');
INSERT INTO `goods_hobby` VALUES ('14', '7', '2.00');
INSERT INTO `goods_hobby` VALUES ('14', '8', '1.00');
INSERT INTO `goods_hobby` VALUES ('14', '9', '1.00');
INSERT INTO `goods_hobby` VALUES ('15', '1', '3.00');
INSERT INTO `goods_hobby` VALUES ('15', '10', '3.00');
INSERT INTO `goods_hobby` VALUES ('15', '11', '2.00');
INSERT INTO `goods_hobby` VALUES ('15', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('15', '13', '3.00');
INSERT INTO `goods_hobby` VALUES ('15', '14', '1.00');
INSERT INTO `goods_hobby` VALUES ('15', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('15', '3', '2.00');
INSERT INTO `goods_hobby` VALUES ('15', '4', '1.00');
INSERT INTO `goods_hobby` VALUES ('15', '5', '2.00');
INSERT INTO `goods_hobby` VALUES ('15', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('15', '7', '2.00');
INSERT INTO `goods_hobby` VALUES ('15', '8', '1.00');
INSERT INTO `goods_hobby` VALUES ('15', '9', '3.00');
INSERT INTO `goods_hobby` VALUES ('2', '1', '3.00');
INSERT INTO `goods_hobby` VALUES ('2', '10', '3.00');
INSERT INTO `goods_hobby` VALUES ('6', '11', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '13', '3.00');
INSERT INTO `goods_hobby` VALUES ('6', '14', '1.00');
INSERT INTO `goods_hobby` VALUES ('6', '15', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '2', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '3', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '5', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '7', '2.00');
INSERT INTO `goods_hobby` VALUES ('6', '8', '1.00');
INSERT INTO `goods_hobby` VALUES ('6', '9', '3.00');
INSERT INTO `goods_hobby` VALUES ('7', '1', '3.00');
INSERT INTO `goods_hobby` VALUES ('7', '10', '3.00');
INSERT INTO `goods_hobby` VALUES ('7', '11', '4.00');
INSERT INTO `goods_hobby` VALUES ('7', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('7', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('7', '14', '2.00');
INSERT INTO `goods_hobby` VALUES ('7', '15', '2.00');
INSERT INTO `goods_hobby` VALUES ('7', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('7', '3', '4.00');
INSERT INTO `goods_hobby` VALUES ('7', '4', '3.00');
INSERT INTO `goods_hobby` VALUES ('7', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('7', '6', '2.00');
INSERT INTO `goods_hobby` VALUES ('7', '8', '3.00');
INSERT INTO `goods_hobby` VALUES ('7', '9', '3.00');
INSERT INTO `goods_hobby` VALUES ('8', '1', '2.00');
INSERT INTO `goods_hobby` VALUES ('8', '10', '2.00');
INSERT INTO `goods_hobby` VALUES ('8', '11', '3.00');
INSERT INTO `goods_hobby` VALUES ('8', '12', '1.00');
INSERT INTO `goods_hobby` VALUES ('8', '13', '3.00');
INSERT INTO `goods_hobby` VALUES ('8', '14', '1.00');
INSERT INTO `goods_hobby` VALUES ('8', '15', '1.00');
INSERT INTO `goods_hobby` VALUES ('8', '2', '2.00');
INSERT INTO `goods_hobby` VALUES ('8', '3', '3.00');
INSERT INTO `goods_hobby` VALUES ('8', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('8', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('8', '6', '1.00');
INSERT INTO `goods_hobby` VALUES ('8', '7', '3.00');
INSERT INTO `goods_hobby` VALUES ('8', '9', '2.00');
INSERT INTO `goods_hobby` VALUES ('9', '1', '4.00');
INSERT INTO `goods_hobby` VALUES ('9', '10', '4.00');
INSERT INTO `goods_hobby` VALUES ('9', '11', '3.00');
INSERT INTO `goods_hobby` VALUES ('9', '12', '2.00');
INSERT INTO `goods_hobby` VALUES ('9', '13', '4.00');
INSERT INTO `goods_hobby` VALUES ('9', '14', '1.00');
INSERT INTO `goods_hobby` VALUES ('9', '15', '3.00');
INSERT INTO `goods_hobby` VALUES ('9', '2', '3.00');
INSERT INTO `goods_hobby` VALUES ('9', '3', '3.00');
INSERT INTO `goods_hobby` VALUES ('9', '4', '2.00');
INSERT INTO `goods_hobby` VALUES ('9', '5', '3.00');
INSERT INTO `goods_hobby` VALUES ('9', '6', '3.00');
INSERT INTO `goods_hobby` VALUES ('9', '7', '3.00');
INSERT INTO `goods_hobby` VALUES ('9', '8', '2.00');

-- ----------------------------
-- Table structure for goods_pics
-- ----------------------------
DROP TABLE IF EXISTS `goods_pics`;
CREATE TABLE `goods_pics` (
  `cid` int(255) DEFAULT NULL,
  `pic1` varchar(255) DEFAULT NULL,
  `pic2` varchar(255) DEFAULT NULL,
  `pic3` varchar(255) DEFAULT NULL,
  `minipic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_pics
-- ----------------------------
INSERT INTO `goods_pics` VALUES ('1', 'goodsPic/0001_1.jpg', 'goodsPic/0001_2.jpg', 'goodsPic/0001_3.jpg', 'goodsPic/0001_0.jpg');
INSERT INTO `goods_pics` VALUES ('2', 'goodsPic/0002_1.jpg', 'goodsPic/0002_2.jpg', 'goodsPic/0002_3.jpg', 'goodsPic/0002_0.jpg');
INSERT INTO `goods_pics` VALUES ('3', 'goodsPic/0003_1.jpg', 'goodsPic/0003_2.jpg', 'goodsPic/0003_3.jpg', 'goodsPic/0003_0.jpg');
INSERT INTO `goods_pics` VALUES ('4', 'goodsPic/0004_1.jpg', 'goodsPic/0004_2.jpg', 'goodsPic/0004_3.jpg', 'goodsPic/0004_0.jpg');
INSERT INTO `goods_pics` VALUES ('5', 'goodsPic/0005_1.jpg', 'goodsPic/0005_2.jpg', 'goodsPic/0005_3.jpg', 'goodsPic/0005_0.jpg');
INSERT INTO `goods_pics` VALUES ('6', 'goodsPic/0006_1.jpg', 'goodsPic/0006_2.jpg', 'goodsPic/0006_3.jpg', 'goodsPic/0006_0.jpg');
INSERT INTO `goods_pics` VALUES ('7', 'goodsPic/0007_1.jpg', 'goodsPic/0007_2.jpg', 'goodsPic/0007_3.jpg', 'goodsPic/0007_0.jpg');
INSERT INTO `goods_pics` VALUES ('8', 'goodsPic/0008_1.jpg', 'goodsPic/0008_2.jpg', 'goodsPic/0008_3.jpg', 'goodsPic/0008_0.jpg');
INSERT INTO `goods_pics` VALUES ('9', 'goodsPic/0009_1.jpg', 'goodsPic/0009_2.jpg', 'goodsPic/0009_3.jpg', 'goodsPic/0009_0.jpg');
INSERT INTO `goods_pics` VALUES ('10', 'goodsPic/0010_1.jpg', 'goodsPic/0010_2.jpg', 'goodsPic/0010_3.jpg', 'goodsPic/0010_0.jpg');
INSERT INTO `goods_pics` VALUES ('11', 'goodsPic/0011_1.jpg', 'goodsPic/0011_2.jpg', 'goodsPic/0011_3.jpg', 'goodsPic/0011_0.jpg');
INSERT INTO `goods_pics` VALUES ('12', 'goodsPic/0012_1.jpg', 'goodsPic/0012_2.jpg', 'goodsPic/0012_3.jpg', 'goodsPic/0012_0.jpg');
INSERT INTO `goods_pics` VALUES ('13', 'goodsPic/0013_1.jpg', 'goodsPic/0013_2.jpg', 'goodsPic/0013_3.jpg', 'goodsPic/0013_0.jpg');
INSERT INTO `goods_pics` VALUES ('14', 'goodsPic/0014_1.jpg', 'goodsPic/0014_2.jpg', 'goodsPic/0014_3.jpg', 'goodsPic/0014_0.jpg');
INSERT INTO `goods_pics` VALUES ('15', 'goodsPic/0015_1.jpg', 'goodsPic/0015_2.jpg', 'goodsPic/0015_3.jpg', 'goodsPic/0015_0.jpg');

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `iid` int(255) NOT NULL AUTO_INCREMENT COMMENT '订单详情标识id',
  `oid` int(255) DEFAULT NULL COMMENT '订单id',
  `cid` int(255) DEFAULT NULL COMMENT '商品id',
  `csize` int(255) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`iid`),
  KEY `oid` (`oid`),
  KEY `cid` (`cid`),
  CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE,
  CONSTRAINT `orderinfo_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `commodity` (`cid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('10', '8', '5', '100');
INSERT INTO `orderinfo` VALUES ('14', '10', '3', '42');
INSERT INTO `orderinfo` VALUES ('15', '11', '1', '121');
INSERT INTO `orderinfo` VALUES ('17', '13', '3', '99');
INSERT INTO `orderinfo` VALUES ('19', '15', '5', '218');
INSERT INTO `orderinfo` VALUES ('20', '16', '1', '108');
INSERT INTO `orderinfo` VALUES ('22', '18', '3', '59');
INSERT INTO `orderinfo` VALUES ('25', '21', '3', '15');
INSERT INTO `orderinfo` VALUES ('26', '21', '1', '100');
INSERT INTO `orderinfo` VALUES ('27', '22', '2', '80');
INSERT INTO `orderinfo` VALUES ('28', '23', '6', '1');
INSERT INTO `orderinfo` VALUES ('29', '24', '2', '1');
INSERT INTO `orderinfo` VALUES ('30', '25', '2', '10');
INSERT INTO `orderinfo` VALUES ('31', '26', '2', '7');
INSERT INTO `orderinfo` VALUES ('32', '26', '6', '5');
INSERT INTO `orderinfo` VALUES ('33', '26', '12', '10');
INSERT INTO `orderinfo` VALUES ('34', '27', '1', '10');
INSERT INTO `orderinfo` VALUES ('35', '27', '6', '1');
INSERT INTO `orderinfo` VALUES ('39', '30', '7', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(255) NOT NULL AUTO_INCREMENT COMMENT '订单标识id',
  `uid` int(255) DEFAULT NULL COMMENT '会员id',
  `oaddress` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `oTotalPrice` double(10,2) DEFAULT NULL COMMENT '订单总价',
  `ostime` datetime DEFAULT NULL COMMENT '订单开始时间',
  `oetime` datetime DEFAULT NULL COMMENT '订单完成时间',
  `ostate` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `ophone` varchar(255) DEFAULT '' COMMENT '收货人电话',
  `oname` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `opostcode` varchar(255) DEFAULT NULL COMMENT '收货地址邮编',
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('8', '1', '华南农业大学华山1栋', '300.00', '2017-06-01 18:29:39', '2017-07-21 00:03:56', '已收货', '100', '陈锐辉', '520000');
INSERT INTO `orders` VALUES ('10', '3', '华南农业大学华山3栋', '12558.00', '2017-04-01 18:38:17', null, '已支付', '102', '潘小华', '520000');
INSERT INTO `orders` VALUES ('11', '4', '华南农业大学华山4栋', '12100.00', '2017-03-08 00:00:33', '2017-07-22 03:54:25', '已收货', '10', '梁文校', '520000');
INSERT INTO `orders` VALUES ('13', '1', '华南农业大学华山1栋', '49500.00', '2017-01-20 18:45:06', '2017-07-21 00:08:08', '已收货', '100', '盛婉柔', '520000');
INSERT INTO `orders` VALUES ('15', '3', '华南农业大学华山3栋', '654.00', '2016-11-09 18:45:22', null, '已支付', '102', '梁文校', '520000');
INSERT INTO `orders` VALUES ('16', '4', '华南农业大学华山4栋', '10800.00', '2016-10-02 18:45:31', null, '已支付', '103', '黄佳鑫', '520000');
INSERT INTO `orders` VALUES ('18', '1', '华南农业大学华山1栋', '29500.00', '2016-08-05 18:46:08', '2017-07-21 00:06:45', '已收货', '100', '陈锐辉', '520000');
INSERT INTO `orders` VALUES ('21', '1', '华农华山区18栋', '17500.00', '2017-07-20 22:15:51', '2017-07-21 00:05:58', '已收货', '18819259435', '曹祚潇', '510642');
INSERT INTO `orders` VALUES ('22', '1', '广东省广州市天河区五山路华南农业大学泰山区24栋', '4000.00', '2017-05-10 22:23:40', '2017-07-21 00:04:22', '已收货', '699352', '贺世宇', '513200');
INSERT INTO `orders` VALUES ('23', '1', '华农华山区18栋', '5999.00', '2017-07-20 23:34:13', '2017-07-21 00:03:48', '已收货', '18819259435', '贺世宇', '520000');
INSERT INTO `orders` VALUES ('24', '1', '华农华山区18栋', '50.00', '2017-07-20 23:48:42', '2017-07-21 00:03:19', '已收货', '18819259435', '曹祚潇', '510642');
INSERT INTO `orders` VALUES ('25', '1', '广东省清远市连山县吉田镇市场路个体街36号', '500.00', '2016-12-01 23:49:51', '2017-07-21 00:08:45', '已收货', '18819259435', '曹祚潇', '510642');
INSERT INTO `orders` VALUES ('26', '1', '华农华山区18栋', '79335.00', '2017-06-01 00:29:25', '2017-07-22 01:34:23', '已收货', '18819259435', '曹祚潇', '510642');
INSERT INTO `orders` VALUES ('27', '1', '华农华山区18栋308', '6999.00', '2017-07-21 12:10:21', '2017-07-21 12:10:38', '已收货', '18819259435', '曹祚潇', '510642');
INSERT INTO `orders` VALUES ('30', '1', '华农华山区18栋', '4999.00', '2017-07-21 15:28:24', null, '已支付', '18819259435', '曹祚潇', '510642');

-- ----------------------------
-- Table structure for preorder
-- ----------------------------
DROP TABLE IF EXISTS `preorder`;
CREATE TABLE `preorder` (
  `pid` int(255) NOT NULL AUTO_INCREMENT COMMENT '购物车预订单id',
  `uid` int(255) DEFAULT NULL COMMENT '会员id',
  `cid` int(255) DEFAULT NULL COMMENT '商品id',
  `csize` int(255) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`pid`),
  KEY `uid` (`uid`),
  KEY `preorder_ibfk_2` (`cid`),
  CONSTRAINT `preorder_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `preorder_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `commodity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preorder
-- ----------------------------
INSERT INTO `preorder` VALUES ('13', '3', '3', '42');
INSERT INTO `preorder` VALUES ('48', '1', '7', '1');
INSERT INTO `preorder` VALUES ('49', '1', '2', '1');
INSERT INTO `preorder` VALUES ('50', '1', '11', '1');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `rid` int(255) NOT NULL AUTO_INCREMENT COMMENT '评论标识id',
  `oid` int(255) DEFAULT NULL COMMENT '订单id',
  `cid` int(255) DEFAULT NULL COMMENT '商品id',
  `rtime` datetime DEFAULT NULL COMMENT '评论时间',
  `rtext` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `grade` double(3,2) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `review_ibfk_1` (`oid`),
  KEY `cid` (`cid`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE SET NULL,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `commodity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '10', '3', '2017-07-14 11:13:22', '千杯不醉', '5.00');
INSERT INTO `review` VALUES ('2', '13', '3', '2017-07-14 12:13:55', '一杯即倒', '4.80');
INSERT INTO `review` VALUES ('3', null, '1', '2017-07-21 00:31:24', '很棒', '4.70');
INSERT INTO `review` VALUES ('4', '26', '12', '2017-07-21 00:40:05', '格力空调，老牌子了。一点都不凉！~~~', '3.00');
INSERT INTO `review` VALUES ('5', '26', '2', '2017-07-21 00:41:59', '荷兰牛奶好好喝，我下次还会买伊利', '4.50');
INSERT INTO `review` VALUES ('6', '26', '6', '2017-07-21 00:42:41', 'iphone!!!', '4.50');
INSERT INTO `review` VALUES ('7', '26', '6', '2017-07-21 00:42:52', '111', '3.50');
INSERT INTO `review` VALUES ('9', '27', '6', '2017-07-21 12:11:04', 'android系统很流畅，下次还来买', '2.00');
INSERT INTO `review` VALUES ('10', null, '1', '2017-07-21 14:43:10', '难喝', '1.50');
INSERT INTO `review` VALUES ('11', null, '9', '2017-07-21 14:47:41', '索尼大法好', '3.80');
INSERT INTO `review` VALUES ('12', '27', '1', '2017-08-24 15:58:03', '答复', '4.00');

-- ----------------------------
-- Table structure for stype
-- ----------------------------
DROP TABLE IF EXISTS `stype`;
CREATE TABLE `stype` (
  `stid` int(255) NOT NULL AUTO_INCREMENT COMMENT '小分类标识id',
  `stname` varchar(255) DEFAULT NULL COMMENT '小分类名称',
  `btid` int(255) DEFAULT NULL COMMENT '大分类id',
  PRIMARY KEY (`stid`),
  KEY `btid` (`btid`),
  CONSTRAINT `stype_ibfk_1` FOREIGN KEY (`btid`) REFERENCES `btype` (`btid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stype
-- ----------------------------
INSERT INTO `stype` VALUES ('1', '牛奶', '1');
INSERT INTO `stype` VALUES ('2', '饼干', '1');
INSERT INTO `stype` VALUES ('3', '酒水', '2');
INSERT INTO `stype` VALUES ('4', '果冻', '2');
INSERT INTO `stype` VALUES ('5', '手机', '3');
INSERT INTO `stype` VALUES ('6', '耳机', '3');
INSERT INTO `stype` VALUES ('7', '电视', '4');
INSERT INTO `stype` VALUES ('8', '空调', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(255) NOT NULL AUTO_INCREMENT COMMENT '会员标识id',
  `unickname` varchar(255) NOT NULL COMMENT '昵称，不重复',
  `upassword` char(255) DEFAULT NULL COMMENT '密码',
  `uemail` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `uaddress` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `uphone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `uidcard` varchar(255) DEFAULT NULL COMMENT '省份证号',
  `uname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `uquestion` varchar(255) DEFAULT NULL COMMENT '提示问题',
  `uanswer` varchar(255) DEFAULT NULL COMMENT '提示问题答案',
  `upostcode` varchar(255) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `unickname` (`unickname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zuoxiao', 'e1afdc3949ba59abbe56e057f2ff883e', '18884656@qq.com', '华农华山区18栋', '18819259435', '201430340101', '曹祚潇', '我姓什么？', '曹', '510643');
INSERT INTO `user` VALUES ('2', '老陈', 'e1afdc3949ba59abbe56e057f2ff883e', '18884656@163.com', '华山区18栋', '1315456456', '201430340102', '陈锐辉', '我姓什么？', '陈', '510642');
INSERT INTO `user` VALUES ('3', 'shiyu', 'e1afdc3949ba59abbe56e057f2ff883e', '201430340104@scau.com', '华山18栋', '18819259999', '201430340104', '贺世宇', '我姓什么', '贺', '510642');
INSERT INTO `user` VALUES ('4', '贺总', 'e1afdc3949ba59abbe56e057f2ff883e', '201430340104@scau.com', '华山18栋', '18819259999', '201430340104', '贺世宇', '我姓什么', '贺', '510642');
INSERT INTO `user` VALUES ('5', '黄佳鑫', 'e1afdc3949ba59abbe56e057f2ff883e', '201430340104@scau.com', '华山18栋', '18819259999', '201430340104', '黄佳鑫', '我姓什么', '黄', '510642');

-- ----------------------------
-- Table structure for user_hobby
-- ----------------------------
DROP TABLE IF EXISTS `user_hobby`;
CREATE TABLE `user_hobby` (
  `uid` int(255) DEFAULT NULL COMMENT '用户id',
  `cid` int(255) DEFAULT NULL COMMENT '商品id',
  `rank` decimal(10,2) DEFAULT NULL COMMENT '推荐等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_hobby
-- ----------------------------
INSERT INTO `user_hobby` VALUES ('1', '1', '90.24');
INSERT INTO `user_hobby` VALUES ('1', '10', '90.24');
INSERT INTO `user_hobby` VALUES ('1', '11', '96.69');
INSERT INTO `user_hobby` VALUES ('1', '12', '69.06');
INSERT INTO `user_hobby` VALUES ('1', '13', '105.72');
INSERT INTO `user_hobby` VALUES ('1', '14', '54.10');
INSERT INTO `user_hobby` VALUES ('1', '15', '66.00');
INSERT INTO `user_hobby` VALUES ('1', '2', '82.41');
INSERT INTO `user_hobby` VALUES ('1', '3', '96.89');
INSERT INTO `user_hobby` VALUES ('1', '4', '75.60');
INSERT INTO `user_hobby` VALUES ('1', '5', '82.00');
INSERT INTO `user_hobby` VALUES ('1', '6', '64.85');
INSERT INTO `user_hobby` VALUES ('1', '7', '94.61');
INSERT INTO `user_hobby` VALUES ('1', '8', '74.78');
INSERT INTO `user_hobby` VALUES ('1', '9', '90.24');
INSERT INTO `user_hobby` VALUES ('2', '1', '121.03');
INSERT INTO `user_hobby` VALUES ('2', '10', '123.23');
INSERT INTO `user_hobby` VALUES ('2', '11', '121.46');
INSERT INTO `user_hobby` VALUES ('2', '12', '91.36');
INSERT INTO `user_hobby` VALUES ('2', '13', '152.33');
INSERT INTO `user_hobby` VALUES ('2', '14', '69.39');
INSERT INTO `user_hobby` VALUES ('4', '7', '103.49');
INSERT INTO `user_hobby` VALUES ('2', '15', '99.33');
INSERT INTO `user_hobby` VALUES ('2', '2', '117.14');
INSERT INTO `user_hobby` VALUES ('4', '8', '74.54');
INSERT INTO `user_hobby` VALUES ('2', '3', '127.38');
INSERT INTO `user_hobby` VALUES ('4', '9', '95.13');
INSERT INTO `user_hobby` VALUES ('2', '4', '98.04');
INSERT INTO `user_hobby` VALUES ('5', '1', '115.05');
INSERT INTO `user_hobby` VALUES ('5', '10', '110.93');
INSERT INTO `user_hobby` VALUES ('2', '5', '121.50');
INSERT INTO `user_hobby` VALUES ('5', '11', '118.98');
INSERT INTO `user_hobby` VALUES ('2', '6', '96.21');
INSERT INTO `user_hobby` VALUES ('2', '7', '124.70');
INSERT INTO `user_hobby` VALUES ('5', '12', '81.71');
INSERT INTO `user_hobby` VALUES ('2', '8', '95.83');
INSERT INTO `user_hobby` VALUES ('2', '9', '121.55');
INSERT INTO `user_hobby` VALUES ('5', '13', '136.17');
INSERT INTO `user_hobby` VALUES ('5', '14', '56.00');
INSERT INTO `user_hobby` VALUES ('3', '1', '82.47');
INSERT INTO `user_hobby` VALUES ('5', '15', '84.97');
INSERT INTO `user_hobby` VALUES ('3', '10', '82.15');
INSERT INTO `user_hobby` VALUES ('3', '11', '81.01');
INSERT INTO `user_hobby` VALUES ('5', '2', '105.10');
INSERT INTO `user_hobby` VALUES ('5', '3', '114.06');
INSERT INTO `user_hobby` VALUES ('5', '4', '87.39');
INSERT INTO `user_hobby` VALUES ('3', '12', '58.69');
INSERT INTO `user_hobby` VALUES ('3', '13', '90.83');
INSERT INTO `user_hobby` VALUES ('5', '5', '106.61');
INSERT INTO `user_hobby` VALUES ('3', '14', '40.89');
INSERT INTO `user_hobby` VALUES ('5', '6', '88.82');
INSERT INTO `user_hobby` VALUES ('3', '15', '64.66');
INSERT INTO `user_hobby` VALUES ('5', '7', '108.86');
INSERT INTO `user_hobby` VALUES ('5', '8', '82.82');
INSERT INTO `user_hobby` VALUES ('3', '2', '79.21');
INSERT INTO `user_hobby` VALUES ('5', '9', '113.97');
INSERT INTO `user_hobby` VALUES ('3', '3', '81.01');
INSERT INTO `user_hobby` VALUES ('3', '4', '58.83');
INSERT INTO `user_hobby` VALUES ('3', '5', '70.06');
INSERT INTO `user_hobby` VALUES ('3', '6', '63.03');
INSERT INTO `user_hobby` VALUES ('3', '7', '81.01');
INSERT INTO `user_hobby` VALUES ('3', '8', '55.04');
INSERT INTO `user_hobby` VALUES ('3', '9', '95.19');
INSERT INTO `user_hobby` VALUES ('4', '1', '97.73');
INSERT INTO `user_hobby` VALUES ('4', '10', '96.73');
INSERT INTO `user_hobby` VALUES ('4', '11', '101.37');
INSERT INTO `user_hobby` VALUES ('4', '12', '69.30');
INSERT INTO `user_hobby` VALUES ('4', '13', '116.64');
INSERT INTO `user_hobby` VALUES ('4', '14', '49.48');
INSERT INTO `user_hobby` VALUES ('4', '15', '75.86');
INSERT INTO `user_hobby` VALUES ('4', '2', '97.12');
INSERT INTO `user_hobby` VALUES ('4', '3', '99.69');
INSERT INTO `user_hobby` VALUES ('4', '4', '72.33');
INSERT INTO `user_hobby` VALUES ('4', '5', '90.05');
INSERT INTO `user_hobby` VALUES ('4', '6', '73.98');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `uid` int(255) DEFAULT NULL,
  `cid` int(255) DEFAULT NULL,
  `grade` double(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('4', '8', '4.52');
INSERT INTO `warehouse` VALUES ('4', '5', '3.45');
INSERT INTO `warehouse` VALUES ('2', '15', '3.10');
INSERT INTO `warehouse` VALUES ('2', '15', '4.86');
INSERT INTO `warehouse` VALUES ('5', '5', '4.45');
INSERT INTO `warehouse` VALUES ('4', '4', '3.37');
INSERT INTO `warehouse` VALUES ('3', '15', '3.67');
INSERT INTO `warehouse` VALUES ('4', '12', '4.98');
INSERT INTO `warehouse` VALUES ('2', '6', '3.42');
INSERT INTO `warehouse` VALUES ('4', '14', '3.80');
INSERT INTO `warehouse` VALUES ('5', '5', '3.82');
INSERT INTO `warehouse` VALUES ('5', '9', '3.11');
INSERT INTO `warehouse` VALUES ('4', '7', '4.61');
INSERT INTO `warehouse` VALUES ('5', '2', '3.97');
INSERT INTO `warehouse` VALUES ('5', '11', '3.19');
INSERT INTO `warehouse` VALUES ('1', '12', '3.73');
INSERT INTO `warehouse` VALUES ('1', '9', '3.74');
INSERT INTO `warehouse` VALUES ('2', '11', '3.68');
INSERT INTO `warehouse` VALUES ('1', '6', '3.63');
INSERT INTO `warehouse` VALUES ('4', '6', '3.10');
INSERT INTO `warehouse` VALUES ('3', '12', '3.09');
INSERT INTO `warehouse` VALUES ('1', '15', '4.05');
INSERT INTO `warehouse` VALUES ('2', '15', '2.37');
INSERT INTO `warehouse` VALUES ('1', '14', '3.86');
INSERT INTO `warehouse` VALUES ('4', '7', '3.98');
INSERT INTO `warehouse` VALUES ('5', '12', '3.87');
INSERT INTO `warehouse` VALUES ('2', '12', '4.81');
INSERT INTO `warehouse` VALUES ('3', '10', '3.57');
INSERT INTO `warehouse` VALUES ('5', '8', '3.18');
INSERT INTO `warehouse` VALUES ('4', '14', '4.65');
INSERT INTO `warehouse` VALUES ('4', '1', '3.70');
INSERT INTO `warehouse` VALUES ('4', '12', '4.02');
INSERT INTO `warehouse` VALUES ('2', '12', '3.55');
INSERT INTO `warehouse` VALUES ('1', '2', '3.13');
INSERT INTO `warehouse` VALUES ('4', '5', '3.55');
INSERT INTO `warehouse` VALUES ('5', '11', '3.27');
INSERT INTO `warehouse` VALUES ('5', '1', '3.59');
INSERT INTO `warehouse` VALUES ('5', '6', '3.62');
INSERT INTO `warehouse` VALUES ('2', '6', '2.51');
INSERT INTO `warehouse` VALUES ('3', '6', '3.45');
INSERT INTO `warehouse` VALUES ('1', '5', '3.05');
INSERT INTO `warehouse` VALUES ('2', '5', '3.79');
INSERT INTO `warehouse` VALUES ('2', '6', '4.69');
INSERT INTO `warehouse` VALUES ('2', '14', '1.46');
INSERT INTO `warehouse` VALUES ('2', '2', '3.67');
INSERT INTO `warehouse` VALUES ('2', '1', '3.45');
INSERT INTO `warehouse` VALUES ('3', '10', '3.72');
INSERT INTO `warehouse` VALUES ('4', '5', '3.68');
INSERT INTO `warehouse` VALUES ('3', '5', '0.01');
INSERT INTO `warehouse` VALUES ('5', '2', '3.46');
INSERT INTO `warehouse` VALUES ('2', '15', '3.28');
INSERT INTO `warehouse` VALUES ('4', '10', '3.98');
INSERT INTO `warehouse` VALUES ('5', '13', '3.57');
INSERT INTO `warehouse` VALUES ('2', '7', '3.83');
INSERT INTO `warehouse` VALUES ('1', '15', '4.69');
INSERT INTO `warehouse` VALUES ('3', '14', '3.60');
INSERT INTO `warehouse` VALUES ('2', '7', '3.35');
INSERT INTO `warehouse` VALUES ('5', '13', '4.72');
INSERT INTO `warehouse` VALUES ('1', '14', '3.36');
INSERT INTO `warehouse` VALUES ('1', '5', '4.02');
INSERT INTO `warehouse` VALUES ('3', '2', '3.22');
INSERT INTO `warehouse` VALUES ('5', '9', '4.88');
INSERT INTO `warehouse` VALUES ('3', '13', '3.97');
INSERT INTO `warehouse` VALUES ('1', '6', '2.39');
INSERT INTO `warehouse` VALUES ('2', '11', '3.39');
INSERT INTO `warehouse` VALUES ('2', '10', '4.80');
INSERT INTO `warehouse` VALUES ('5', '9', '3.91');
INSERT INTO `warehouse` VALUES ('2', '6', '3.06');
INSERT INTO `warehouse` VALUES ('3', '1', '3.96');
INSERT INTO `warehouse` VALUES ('3', '11', '3.22');
INSERT INTO `warehouse` VALUES ('3', '7', '3.99');
INSERT INTO `warehouse` VALUES ('1', '10', '3.36');
INSERT INTO `warehouse` VALUES ('4', '9', '3.72');
INSERT INTO `warehouse` VALUES ('3', '10', '3.77');
INSERT INTO `warehouse` VALUES ('2', '1', '2.83');
INSERT INTO `warehouse` VALUES ('4', '9', '3.80');
INSERT INTO `warehouse` VALUES ('2', '14', '3.79');
INSERT INTO `warehouse` VALUES ('1', '7', '3.58');
INSERT INTO `warehouse` VALUES ('3', '6', '4.20');
INSERT INTO `warehouse` VALUES ('1', '11', '3.39');
INSERT INTO `warehouse` VALUES ('2', '7', '3.38');
INSERT INTO `warehouse` VALUES ('3', '11', '3.08');
INSERT INTO `warehouse` VALUES ('4', '15', '4.22');
INSERT INTO `warehouse` VALUES ('2', '2', '3.38');
INSERT INTO `warehouse` VALUES ('3', '8', '3.45');
INSERT INTO `warehouse` VALUES ('2', '11', '2.22');
INSERT INTO `warehouse` VALUES ('3', '15', '1.12');
INSERT INTO `warehouse` VALUES ('1', '1', '3.51');
INSERT INTO `warehouse` VALUES ('1', '1', '3.32');
INSERT INTO `warehouse` VALUES ('4', '2', '3.76');
INSERT INTO `warehouse` VALUES ('2', '15', '2.11');
INSERT INTO `warehouse` VALUES ('2', '11', '3.59');
INSERT INTO `warehouse` VALUES ('4', '6', '2.88');
INSERT INTO `warehouse` VALUES ('4', '4', '3.98');
INSERT INTO `warehouse` VALUES ('4', '9', '3.15');
INSERT INTO `warehouse` VALUES ('3', '3', '3.49');
INSERT INTO `warehouse` VALUES ('3', '14', '3.67');
INSERT INTO `warehouse` VALUES ('2', '15', '4.00');
INSERT INTO `warehouse` VALUES ('4', '15', '3.72');
INSERT INTO `warehouse` VALUES ('3', '6', '4.52');
DROP TRIGGER IF EXISTS `updateCommoditySize`;
DELIMITER ;;
CREATE TRIGGER `updateCommoditySize` AFTER INSERT ON `orderinfo` FOR EACH ROW BEGIN
update commodity
set cremain=cremain-new.csize
where cid=new.cid;
end
;;
DELIMITER ;
