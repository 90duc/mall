/*
Navicat MySQL Data Transfer

Source Server         : cs
Source Server Version : 50715
Source Host           : 127.0.0.1:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-07-30 12:58:00
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
  UNIQUE KEY `btid` (`btid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of btype
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '澳洲牛奶', '1', '1', '69.00', '10');
INSERT INTO `commodity` VALUES ('2', '荷兰牛奶', '1', '1', '59.00', '8');
INSERT INTO `commodity` VALUES ('3', 'xo', '2', '3', '299.00', '50');
INSERT INTO `commodity` VALUES ('4', '人头马', '2', '3', '399.00', '2');
INSERT INTO `commodity` VALUES ('5', '维他奶', '1', '2', '3.00', '90');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('1', '1', '1', '1');
INSERT INTO `orderinfo` VALUES ('2', '1', '3', '2');
INSERT INTO `orderinfo` VALUES ('3', '2', '2', '1');
INSERT INTO `orderinfo` VALUES ('4', '2', '4', '2');
INSERT INTO `orderinfo` VALUES ('5', '3', '3', '10');
INSERT INTO `orderinfo` VALUES ('6', '4', '3', '8');
INSERT INTO `orderinfo` VALUES ('7', '5', '5', '10');
INSERT INTO `orderinfo` VALUES ('8', '6', '5', '10');
INSERT INTO `orderinfo` VALUES ('9', '7', '5', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '华南农业大学华山18栋309', '699.00', '2017-01-14 11:08:24', '2017-07-15 11:09:28', '已支付', '', null, null);
INSERT INTO `orders` VALUES ('2', null, '华农', '857.00', '2017-01-18 00:00:00', null, '已支付', '18819259435', 'czx', '510642');
INSERT INTO `orders` VALUES ('3', '1', null, '2990.00', '2017-07-18 22:16:36', null, '已支付', '', null, null);
INSERT INTO `orders` VALUES ('4', '1', '华农华山区18栋', '2392.00', '2017-07-18 22:19:22', '2017-07-12 11:45:22', '已支付', '18819259435', '曹祚潇', '510642');
INSERT INTO `orders` VALUES ('5', '1', null, '30.00', '2017-05-23 22:35:45', null, '已支付', '', null, null);
INSERT INTO `orders` VALUES ('6', '1', null, '30.00', '2017-01-02 22:36:31', null, '已支付', '', null, null);
INSERT INTO `orders` VALUES ('7', '1', null, '30.00', '2017-07-10 23:21:43', null, '已取消', '', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preorder
-- ----------------------------
INSERT INTO `preorder` VALUES ('2', '1', '4', '3');
INSERT INTO `preorder` VALUES ('3', null, '3', '9');
INSERT INTO `preorder` VALUES ('4', null, '3', '9');
INSERT INTO `preorder` VALUES ('5', null, '3', '9');
INSERT INTO `preorder` VALUES ('6', null, '3', '9');
INSERT INTO `preorder` VALUES ('7', null, '3', '9');
INSERT INTO `preorder` VALUES ('8', null, '3', '9');
INSERT INTO `preorder` VALUES ('9', null, '3', '9');

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
  PRIMARY KEY (`rid`),
  KEY `review_ibfk_1` (`oid`),
  KEY `cid` (`cid`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE SET NULL,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `commodity` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '1', '3', '2017-07-14 11:13:22', '千杯不醉');
INSERT INTO `review` VALUES ('2', '1', '3', '2017-07-14 12:13:55', '一杯即倒');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stype
-- ----------------------------
INSERT INTO `stype` VALUES ('1', '牛奶1', '1');
INSERT INTO `stype` VALUES ('2', '饼干', '1');
INSERT INTO `stype` VALUES ('3', '酒水', '2');
INSERT INTO `stype` VALUES ('4', '果冻', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zuoxiao', '123456', '18884656@qq.com', '华农华山区18栋', '18819259435', '201430340101', '曹祚潇', '我姓什么？', '曹', '510642');
INSERT INTO `user` VALUES ('2', '老陈', '201430340102', '18884656@163.com', '华山区18栋', '1315456456', '201430340102', '陈锐辉', '我姓什么？', '陈', '510642');
INSERT INTO `user` VALUES ('3', '贺哥', '201430340104', '201430340104@scau.com', '华山18栋', '18819259999', '201430340104', '贺世宇', '我姓什么', '贺', '510642');
INSERT INTO `user` VALUES ('4', '贺总', '201430340104', '201430340104@scau.com', '华山18栋', '18819259999', '201430340104', '贺世宇', '我姓什么', '贺', '510642');
DROP TRIGGER IF EXISTS `updateCommoditySize`;
DELIMITER ;;
CREATE TRIGGER `updateCommoditySize` AFTER INSERT ON `orderinfo` FOR EACH ROW BEGIN
update commodity
set cremain=cremain-new.csize
where cid=new.cid;
end
;;
DELIMITER ;
