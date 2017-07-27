/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : dpadmin

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-07-27 11:41:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dp_brand
-- ----------------------------
DROP TABLE IF EXISTS `dp_brand`;
CREATE TABLE `dp_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '品牌名称',
  `desc` text NOT NULL COMMENT '详情',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商品品牌表';

-- ----------------------------
-- Records of dp_brand
-- ----------------------------
INSERT INTO `dp_brand` VALUES ('1', '百事', 'pepsi', '19', '100', '1', '1499411350', '1499651828');
INSERT INTO `dp_brand` VALUES ('2', '康师傅', '康师傅', '22', '100', '1', '1499416005', '1499651989');
INSERT INTO `dp_brand` VALUES ('3', '统一', '统一', '21', '100', '1', '1499416026', '1499651975');
INSERT INTO `dp_brand` VALUES ('4', '阿迪达斯', 'adidas', '18', '100', '1', '1499651812', '1499651812');
INSERT INTO `dp_brand` VALUES ('5', '福神', 'evisu', '20', '100', '1', '1499651962', '1499651962');

-- ----------------------------
-- Table structure for dp_cate
-- ----------------------------
DROP TABLE IF EXISTS `dp_cate`;
CREATE TABLE `dp_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '分类名称',
  `desc` text NOT NULL COMMENT '详情',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '图片',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标样式',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of dp_cate
-- ----------------------------
INSERT INTO `dp_cate` VALUES ('1', '水果', '水果', '25', 'iconbg iconbg07', '7', '1', '1499405067', '1499825697');
INSERT INTO `dp_cate` VALUES ('2', '服饰', '服饰', '26', 'iconbg iconbg06', '6', '1', '1499415242', '1499825674');
INSERT INTO `dp_cate` VALUES ('3', '生活用品', '生活用品', '27', 'iconbg iconbg04', '4', '1', '1499416087', '1499825556');
INSERT INTO `dp_cate` VALUES ('4', '今日秒杀', '今日秒杀', '31', 'iconbg iconbg08', '8', '1', '1499651461', '1499825753');
INSERT INTO `dp_cate` VALUES ('5', '微商爆款', '微商爆款', '6', 'iconbg iconbg05', '5', '1', '1499651519', '1499824397');
INSERT INTO `dp_cate` VALUES ('6', '即将预售', '即将预售', '29', 'iconbg iconbg01', '1', '1', '1499825260', '1499825446');
INSERT INTO `dp_cate` VALUES ('7', '热销中', '热销中', '30', 'iconbg iconbg02', '2', '1', '1499825488', '1499825488');
INSERT INTO `dp_cate` VALUES ('8', '过期销售', '过期销售', '28', 'iconbg iconbg03', '3', '1', '1499825525', '1499825525');

-- ----------------------------
-- Table structure for dp_product
-- ----------------------------
DROP TABLE IF EXISTS `dp_product`;
CREATE TABLE `dp_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `desc` text NOT NULL COMMENT '商品详情',
  `brand` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品品牌',
  `cate` varchar(255) DEFAULT NULL COMMENT '商品分类',
  `spec` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `pictures` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品进价/成本价',
  `member_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销/代理价格',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `clicks` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `sales` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `evaluate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否团购商品',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` tinyint(1) DEFAULT '0' COMMENT '是否预售',
  `group_end_time` int(11) NOT NULL COMMENT '团购截止日期',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of dp_product
-- ----------------------------
INSERT INTO `dp_product` VALUES ('1', '你的背包', '', '', '阿迪背包', '4', '3', '1,2,4', '24', '20', '9.00', '6.00', '8.00', '7.00', '1', '0', '4', '0', '0', '0', '0', '0', '0', '1504022400', '0.00', '100', '1', '1499405003', '1501123189');
INSERT INTO `dp_product` VALUES ('2', '休闲外套', '', '', '统一老坛酸菜11', '5', '2', '3,4', '17', '4,8', '5.00', '2.00', '4.00', '3.00', '996', '0', '4', '0', '0', '0', '0', '0', '0', '1514476800', '0.00', '100', '1', '1499416286', '1501125962');
INSERT INTO `dp_product` VALUES ('3', '新鲜水果', '', '', '新鲜水果批发', '3', '1', '4', '4', '8,4,3', '14.00', '11.00', '13.00', '12.00', '987', '0', '13', '0', '0', '0', '0', '0', '0', '1531411200', '0.00', '100', '1', '1499652274', '1501123158');
INSERT INTO `dp_product` VALUES ('4', '统一老坛酸菜', '', '', '酸菜', '3', '5', '1,2,3,4,5', '22', '23', '8.00', '5.00', '7.00', '6.00', '4', '0', '2', '0', '0', '0', '0', '0', '0', '1563552000', '0.00', '100', '1', '1499652274', '1501126824');
INSERT INTO `dp_product` VALUES ('5', '兰蔻面膜', '', '', '面膜', '2', '6', '1,4', '32', '32,33', '11.00', '8.00', '10.00', '9.00', '999', '0', '0', '0', '0', '0', '0', '0', '0', '1594915200', '0.00', '100', '1', '1499848127', '1501123130');
INSERT INTO `dp_product` VALUES ('6', '英冠足球', '', '', '足球', '4', '7', '4', '34', '35,36,34', '50.00', '20.00', '40.00', '30.00', '444', '0', '0', '0', '0', '0', '0', '0', '0', '1563984000', '0.00', '100', '1', '1499849407', '1501123114');
INSERT INTO `dp_product` VALUES ('7', '小麦片', '', '', '小麦片啊', '2', '8', '2', '22', '22,20', '5.00', '1.00', '3.00', '2.00', '991', '0', '9', '0', '0', '0', '0', '0', '0', '1506700800', '0.00', '100', '1', '1500348853', '1501126320');
INSERT INTO `dp_product` VALUES ('8', '百事可乐', '', '', '百事可乐', '1', '4', null, '37', '38,37', '7.00', '4.00', '6.00', '5.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1543420800', '0.00', '100', '1', '1501119409', '1501123072');

-- ----------------------------
-- Table structure for dp_spec
-- ----------------------------
DROP TABLE IF EXISTS `dp_spec`;
CREATE TABLE `dp_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `desc` text NOT NULL COMMENT '详情',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of dp_spec
-- ----------------------------
INSERT INTO `dp_spec` VALUES ('1', '500ml', '500毫升', '8', '10', '100', '1', '1499405094', '1501119637');
INSERT INTO `dp_spec` VALUES ('2', '1L', '1000毫升', '8', '10', '100', '1', '1499416118', '1501119678');
INSERT INTO `dp_spec` VALUES ('3', '800g', '800g', '7', '10', '100', '1', '1499416172', '1501118161');
INSERT INTO `dp_spec` VALUES ('4', '1件', '1件', '2', '9', '100', '1', '1499416200', '1501119494');
INSERT INTO `dp_spec` VALUES ('5', '1个', '1个', '6', '10', '100', '1', '1499666735', '1501054290');
INSERT INTO `dp_spec` VALUES ('6', '500g每袋', '500g每袋', '3', '10', '0', '1', '1501052672', '1501119803');
INSERT INTO `dp_spec` VALUES ('7', '一只', '一只', '1', '10', '0', '1', '1501055326', '1501119576');
INSERT INTO `dp_spec` VALUES ('8', '500g每桶', '500g每桶', '4', '10', '0', '1', '1501119653', '1501119854');
INSERT INTO `dp_spec` VALUES ('9', '一瓶', '一瓶', '5', '10', '0', '1', '1501119695', '1501119695');
INSERT INTO `dp_spec` VALUES ('10', '500g', '500g', '7', '9', '0', '1', '1501119716', '1501119716');
INSERT INTO `dp_spec` VALUES ('11', '一套', '一套', '2', '10', '0', '1', '1501119737', '1501119737');
INSERT INTO `dp_spec` VALUES ('12', '1000g每桶', '1000g每桶', '4', '9', '0', '1', '1501119866', '1501119866');
INSERT INTO `dp_spec` VALUES ('13', '1kg每袋', '1kg每袋', '3', '9', '0', '1', '1501120246', '1501120246');
