/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : dpadmin

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-07-15 23:26:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_access`;
CREATE TABLE `dp_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表';

-- ----------------------------
-- Records of dp_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for dp_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_action`;
CREATE TABLE `dp_admin_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of dp_admin_action
-- ----------------------------
INSERT INTO `dp_admin_action` VALUES ('1', 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', '1', '1480156399', '1480163853');
INSERT INTO `dp_admin_action` VALUES ('2', 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', '1', '1480164578', '1480297748');
INSERT INTO `dp_admin_action` VALUES ('3', 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', '1', '1480168582', '1480168616');
INSERT INTO `dp_admin_action` VALUES ('4', 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', '1', '1480169185', '1480169185');
INSERT INTO `dp_admin_action` VALUES ('5', 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', '1', '1480169214', '1480170581');
INSERT INTO `dp_admin_action` VALUES ('6', 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', '1', '1480221441', '1480221563');
INSERT INTO `dp_admin_action` VALUES ('7', 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', '1', '1480251473', '1480251473');
INSERT INTO `dp_admin_action` VALUES ('8', 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', '1', '1480252369', '1480252369');
INSERT INTO `dp_admin_action` VALUES ('9', 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', '1', '1480252580', '1480252580');
INSERT INTO `dp_admin_action` VALUES ('10', 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', '1', '1480252620', '1480252620');
INSERT INTO `dp_admin_action` VALUES ('11', 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', '1', '1480252651', '1480252651');
INSERT INTO `dp_admin_action` VALUES ('12', 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', '1', '1480253226', '1480253332');
INSERT INTO `dp_admin_action` VALUES ('13', 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', '1', '1480253267', '1480253340');
INSERT INTO `dp_admin_action` VALUES ('14', 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', '1', '1480253323', '1480253323');
INSERT INTO `dp_admin_action` VALUES ('15', 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', '1', '1480296196', '1480296196');
INSERT INTO `dp_admin_action` VALUES ('16', 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', '1', '1480296960', '1480296960');
INSERT INTO `dp_admin_action` VALUES ('17', 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', '1', '1480298479', '1480298479');
INSERT INTO `dp_admin_action` VALUES ('18', 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', '1', '1480298506', '1480298506');
INSERT INTO `dp_admin_action` VALUES ('19', 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', '1', '1480298532', '1480298532');
INSERT INTO `dp_admin_action` VALUES ('20', 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', '1', '1480298946', '1480298946');
INSERT INTO `dp_admin_action` VALUES ('21', 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', '1', '1480301990', '1480302022');
INSERT INTO `dp_admin_action` VALUES ('22', 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', '1', '1480302616', '1480302616');
INSERT INTO `dp_admin_action` VALUES ('23', 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', '1', '1480302798', '1480302798');
INSERT INTO `dp_admin_action` VALUES ('24', 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', '1', '1480302870', '1480302870');
INSERT INTO `dp_admin_action` VALUES ('25', 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', '1', '1480303198', '1480303198');
INSERT INTO `dp_admin_action` VALUES ('26', 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', '1', '1480303229', '1480303229');
INSERT INTO `dp_admin_action` VALUES ('27', 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', '1', '1480303264', '1480303264');
INSERT INTO `dp_admin_action` VALUES ('28', 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', '1', '1480303294', '1480303294');
INSERT INTO `dp_admin_action` VALUES ('29', 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', '1', '1480303409', '1480303409');
INSERT INTO `dp_admin_action` VALUES ('30', 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', '1', '1480305468', '1480305468');
INSERT INTO `dp_admin_action` VALUES ('31', 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', '1', '1480305513', '1480305513');
INSERT INTO `dp_admin_action` VALUES ('32', 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', '1', '1480305562', '1480305562');
INSERT INTO `dp_admin_action` VALUES ('33', 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', '1', '1480305630', '1480305630');
INSERT INTO `dp_admin_action` VALUES ('34', 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', '1', '1480305659', '1480305659');
INSERT INTO `dp_admin_action` VALUES ('35', 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', '1', '1480307558', '1480307558');
INSERT INTO `dp_admin_action` VALUES ('36', 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', '1', '1480307588', '1480307588');
INSERT INTO `dp_admin_action` VALUES ('37', 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', '1', '1480307618', '1480307618');
INSERT INTO `dp_admin_action` VALUES ('38', 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', '1', '1480307653', '1480307653');
INSERT INTO `dp_admin_action` VALUES ('39', 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', '1', '1480307682', '1480307682');
INSERT INTO `dp_admin_action` VALUES ('40', 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', '1', '1480308342', '1480308342');
INSERT INTO `dp_admin_action` VALUES ('41', 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', '1', '1480308372', '1480308372');
INSERT INTO `dp_admin_action` VALUES ('42', 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', '1', '1480309555', '1480309642');

-- ----------------------------
-- Table structure for dp_admin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_attachment`;
CREATE TABLE `dp_admin_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(64) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dp_admin_attachment
-- ----------------------------
INSERT INTO `dp_admin_attachment` VALUES ('1', '1', 'logo.png', 'admin', 'uploads/images/20170623/364e7c3669f3df67157b0d31bb8403ae.png', '', '', 'image/png', 'png', '6995', '853aa52e723a1296d9176599eaacd0dc', 'bccb2f00cd5198218b20d4ad943b73ec8e99633e', 'local', '0', '1498205985', '1498205985', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('2', '2', 'ucenter.png', 'admin', 'uploads/images/20170630/b46f152ac93eb0a2bf91f843cac08b52.png', '', '', 'image/png', 'png', '132698', '8f5ccbbe9e4dafbe2fb0ab5c923aa31c', '5eaefb78bde28797b739525c537fea1d01b6bc63', 'local', '0', '1498794156', '1498794156', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('3', '1', 'cs02.jpg', 'admin', 'uploads/images/20170706/4a5170a0f9712a64c7e3d985220e2947.jpg', '', '', 'image/jpeg', 'jpg', '59870', 'f7c704f5eb3a624da14543ad1b387f05', '4ff7aa0e59d442514618b30833e6e9bb74c58f1b', 'local', '0', '1499309318', '1499309318', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('4', '1', 'cs04.jpg', 'admin', 'uploads/images/20170706/fbc432cd00a7ce0841e5c2e00230feb4.jpg', '', '', 'image/jpeg', 'jpg', '98048', '24bbf37f2af852ee5241ab07d87224a6', '81f8a4a531529390804a8ee8f321fb6e8a88fe78', 'local', '0', '1499311189', '1499311189', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('5', '1', 'tishi2.png', 'admin', 'uploads/images/20170706/75287ec4822f253806726e8410455eea.png', '', '', 'image/png', 'png', '145180', 'e013e18a1b966c80617a4f25439ba304', '05315dadddb23921d2b58a46898cf55189aac047', 'local', '0', '1499313463', '1499313463', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('6', '1', 'i-icon05.png', 'admin', 'uploads/images/20170706/ed4f5c7efbb6d4ab49669b1d71876aac.png', '', '', 'image/png', 'png', '5145', '5c2b9521e885a2aa3d95ae3f6669d31f', '187506b78dfdbf35fb967509a7d8160802f58afc', 'local', '0', '1499319652', '1499319652', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('7', '1', 'hot_sale_discount-128.png', 'admin', 'uploads/images/20170706/9ec006870fdbad1893c78a200b423aa2.png', '', '', 'image/png', 'png', '5465', '5dd635e6d46fcd8c6971f74a4f7127d3', 'dcf108c80c1fd34a150fa4765b35c3424f23cb1f', 'local', '0', '1499319671', '1499319671', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('8', '1', 'cs03.jpg', 'admin', 'uploads/images/20170706/70a25a7cef403a886233feeac524f6d2.jpg', '', '', 'image/jpeg', 'jpg', '95517', 'b7b216f36b53f7f7c70bcc39e2161267', '81e996652e9c936e392c7073edce29ded64362f4', 'local', '0', '1499319687', '1499319687', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('9', '1', 'icon02.png', 'admin', 'uploads/images/20170707/a60524d5c0de1c791636ba86a3abcb35.png', '', '', 'image/png', 'png', '3667', 'a823c47906655cc2ab5d9beb85576407', '6684f2197c2a944bb4047677ca9bd466b6cfe5d3', 'local', '0', '1499404968', '1499404968', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('10', '1', 'icon02-1.png', 'admin', 'uploads/images/20170707/ddd53cab081c22f45dfae966fabb4b6f.png', '', '', 'image/png', 'png', '3598', '9e71ee28d7bc17c61ec00a3fb2ac187b', 'e74e89287995e99bb0ad737738ed9507abb5ac3b', 'local', '0', '1499404974', '1499404974', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('11', '1', 'icon03.png', 'admin', 'uploads/images/20170707/200fe87c01c8f1d4c74750e628069361.png', '', '', 'image/png', 'png', '4314', '85c648f6714fec4102d53159b39c0bbf', '495006a37a9e0c9ebb96ae4a1e7c5af0c6a04319', 'local', '0', '1499404979', '1499404979', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('12', '1', 'sprite_arrow_1.png', 'admin', 'uploads/images/20170707/641a877568bd9744b4feebc6665dbc9e.png', '', '', 'image/png', 'png', '396', '9fa01411de4683dc5d250d7d03cf030e', '56211fa2e3129b5894af3728bec58242e7957340', 'local', '0', '1499405042', '1499405042', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('13', '1', 'icon07.png', 'admin', 'uploads/images/20170707/262f457115fd2b1522b52ce93b33f6e5.png', '', '', 'image/png', 'png', '4007', '8d2c170c1513ac7197e56a5e87eb2276', '49faf87cecfe54b9201e9c800ada142d2fcab897', 'local', '0', '1499415240', '1499415240', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('14', '1', 'arrow-b.png', 'admin', 'uploads/images/20170707/dfaaa001ad7049bc54961d4810a23ccd.png', '', '', 'image/png', 'png', '3748', '0d918c3799c1d25a8f623f4429dfc258', 'b2c0881b23457abbf5afc55d0e4a7b06c9f1eaa8', 'local', '0', '1499416004', '1499416004', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('15', '1', 'address.png', 'admin', 'uploads/images/20170707/0262b1f7ab3f1ad4d3765e669dc389f1.png', '', '', 'image/png', 'png', '3473', 'b5e461c7b9ebbe1d0cbf2bec94be4a1c', '0096d8066c301b45efdb074a9cc3564dbbe27e8e', 'local', '0', '1499416025', '1499416025', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('16', '1', 'arrow-l.png', 'admin', 'uploads/images/20170707/4f0e3e3533aaf2efae32d227c3f4cbb3.png', '', '', 'image/png', 'png', '3339', '6bfc7d8f53f9c71582ff926d821b2218', '11fe728c228c01ceee1402d5441e35b041468be0', 'local', '0', '1499416086', '1499416086', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('17', '1', 'cs01.jpg', 'admin', 'uploads/images/20170707/cfb5361e983bd23f0fe7c4c6e974d117.jpg', '', '', 'image/jpeg', 'jpg', '6915', '387d49ffeb54d644963bfe29741021c2', 'e9d9fc282516a1db9301d5ebf0f25580549a007b', 'local', '0', '1499416252', '1499416252', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('18', '1', 'c4e65c0f621f5b908c76796a23180de1.jpg', 'admin', 'uploads/images/20170710/4b122ff9c05cdbacc6afb903767e5db2.jpg', '', '', 'image/jpeg', 'jpg', '24865', 'a1c6b81c6d8020f88d014d84d79817af', '9d95fe1b31ee36ea89b52e65cc32014b25d04307', 'local', '0', '1499651811', '1499651811', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('19', '1', '388a7213774a0c59a3c12b34df45abfc.png', 'admin', 'uploads/images/20170710/dbc445d44391c368a8a19bd698444069.png', '', '', 'image/png', 'png', '71683', '53a1271a6a4a2dc9bbd0c1d1333c29db', '8cce22b39ff0673d7945c7a25918c5e10c73250e', 'local', '0', '1499651827', '1499651827', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('20', '1', '6ade12b26e5965991f2af165871c9f1f.jpg', 'admin', 'uploads/images/20170710/8f6e37866b8e29b67e8a5798d31aacc4.jpg', '', '', 'image/jpeg', 'jpg', '11630', '4b477cba1f3642a6a370f20f47033395', '6768a5efc3f84a31622dae2624c4a439f05ef002', 'local', '0', '1499651961', '1499651961', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('21', '1', '4f72aa144cd44efb2adbcce0ff85576e.jpg', 'admin', 'uploads/images/20170710/f14b91c058cad35f631500bbdff43fba.jpg', '', '', 'image/jpeg', 'jpg', '14442', '587d193c04c67b7e80f1adb3a407f6a7', '4d46640414180fddf9d639ce37f9e95af16544f6', 'local', '0', '1499651974', '1499651974', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('22', '1', '8fbbaa63439b92c6c0d04c8076e078d6.jpg', 'admin', 'uploads/images/20170710/a57d51a58fd63a3dc053d5b9edb4e244.jpg', '', '', 'image/jpeg', 'jpg', '25316', 'a045f026c55ddc1c683b3c74f788009b', '2a68e437d1b8353c077b8d6dec337e7aeade43ca', 'local', '0', '1499651988', '1499651988', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('23', '1', 'de576618ef45240ede4642f808cbe5ea.jpg', 'admin', 'uploads/images/20170710/ce985abde7eaac8eb82b5d424f4f5284.jpg', '', '', 'image/jpeg', 'jpg', '44573', '4d0a0187a6d3b1e892b4e44a3de291ab', 'fe2bbeed2793c16edf27eb1b29e8db7cf9a74d97', 'local', '0', '1499666301', '1499666301', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('24', '1', '84b4630dc6cc76be83c6e4302b02ec87.jpg', 'admin', 'uploads/images/20170710/4a462afd59521f85b471df56c4b290f9.jpg', '', '', 'image/jpeg', 'jpg', '20394', 'bb7f054c28c21300da39f4ae3a447462', 'ef73b7e1e77bf5871e443dcc6bcb951894e6a121', 'local', '0', '1499667594', '1499667594', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('25', '1', 'i-icon07.png', 'admin', 'uploads/images/20170712/0e5f38ace910053565f988b5c70dc8c0.png', '', '', 'image/png', 'png', '4773', 'a41d398c8d0a0487d5f2fd6123931e51', 'f445d3dd915c5d5b6a60881458d6f01648345b76', 'local', '0', '1499824283', '1499824283', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('26', '1', 'i-icon06.png', 'admin', 'uploads/images/20170712/ad49205111c3669fbfc37655c2c448e6.png', '', '', 'image/png', 'png', '5435', '73e00f223f2b701a8f01c10e23db5df2', '9b53a4c9046ccfe6804287a3162479893edb5f71', 'local', '0', '1499824332', '1499824332', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('27', '1', 'i-icon04.png', 'admin', 'uploads/images/20170712/bea90a5c00760df9bda66d3729c5ca5c.png', '', '', 'image/png', 'png', '6833', '5aa7898f9ad93468152364d41ae64aa9', 'a7267567c041455a6074ec29a5358170bad269cd', 'local', '0', '1499824346', '1499824346', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('28', '1', 'i-icon03.png', 'admin', 'uploads/images/20170712/5fc9d347ab39331f1109fbfdc2fbaf44.png', '', '', 'image/png', 'png', '8692', '605ade0dccb38ff2a80efa41ccd0ab5d', '7751bdbb5c7a91f2823d74756e26ba1beb2979b0', 'local', '0', '1499824408', '1499824408', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('29', '1', 'i-icon01.png', 'admin', 'uploads/images/20170712/4ed0e4149f851cbbb37124ff008e9fd3.png', '', '', 'image/png', 'png', '3615', 'a32c18cff8d0d77ac1fbabb4f6bccbc6', '7d0d6796dee4000ca180d6e8f6b483362f8d0c9d', 'local', '0', '1499825253', '1499825253', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('30', '1', 'i-icon02.png', 'admin', 'uploads/images/20170712/ac7e79b9e724f6958b4729a1f1aca597.png', '', '', 'image/png', 'png', '7264', 'a3870916476e1471deb06af85232acf0', '93c06b5a7759edca4b19d1a0e4a98aa2010be7ac', 'local', '0', '1499825487', '1499825487', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('31', '1', 'i-icon08.png', 'admin', 'uploads/images/20170712/1cd3c634e65ffe749e622ddfb4ec8f79.png', '', '', 'image/png', 'png', '6452', '138e18e49e87ca3f686d63576a50777e', 'c3719b1237dad5b4f819482a38ddc9c0e84658f6', 'local', '0', '1499825752', '1499825752', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('32', '1', 'tif.png', 'admin', 'uploads/images/20170712/db0873bea6589271969e51b38a1f0619.png', '', '', 'image/png', 'png', '305579', 'abc12a8b8d9c12aef363349f21b46561', '398918e502cb4a5e07498e5c9a655bd41c9af87c', 'local', '0', '1499848090', '1499848090', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('33', '1', 'tiff.png', 'admin', 'uploads/images/20170712/150533baaac6edf10f11b0bd2817821c.png', '', '', 'image/png', 'png', '305650', '65541e102e5f71edf7734a2b590683bd', '23dd239a237b81a59721b7adac063a27cdc11658', 'local', '0', '1499848237', '1499848237', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('34', '1', '4256310502_772539421.310x310.jpg', 'admin', 'uploads/images/20170712/dafab690561a244bde1c6f8387494e6a.jpg', '', '', 'image/jpeg', 'jpg', '16615', '3bc799467c1fd9cf64bb2cc0f7f793d5', 'e8bd3c9963726529d80022d0e37640c8bd5fd75f', 'local', '0', '1499849366', '1499849366', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('35', '1', '2665048144_811667103.310x310.jpg', 'admin', 'uploads/images/20170712/12cf5ec68da5754fc0d17d8eb3bdd113.jpg', '', '', 'image/jpeg', 'jpg', '26487', '6b172eca2d9134bec4c001cf5ccddad3', '2c958e0e4231c2c8498ca15b1ad860f41483c79f', 'local', '0', '1499849372', '1499849372', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('36', '1', '4331068980_1360455244.220x220.jpg', 'admin', 'uploads/images/20170712/701f9e387dc37b6aa0d4c1a6c781a9f0.jpg', '', '', 'image/jpeg', 'jpg', '30849', 'c6750b29cd2a9cff093f5ffb3bc00ff0', '6367f62863d7dcea59e17417726564dcb8224a78', 'local', '0', '1499849374', '1499849374', '100', '1');

-- ----------------------------
-- Table structure for dp_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_config`;
CREATE TABLE `dp_admin_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of dp_admin_config
-- ----------------------------
INSERT INTO `dp_admin_config` VALUES ('1', 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', '2', '', '', '', '', '1475240395', '1477403914', '1', '1');
INSERT INTO `dp_admin_config` VALUES ('2', 'web_site_title', '站点标题', 'base', 'text', 'xx微商城', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240646', '1477710341', '2', '1');
INSERT INTO `dp_admin_config` VALUES ('3', 'web_site_slogan', '站点标语', 'base', 'text', '欢迎来到xx微商城', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240994', '1477710357', '3', '1');
INSERT INTO `dp_admin_config` VALUES ('4', 'web_site_logo', '站点LOGO', 'base', 'image', '1', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241067', '1475241067', '4', '1');
INSERT INTO `dp_admin_config` VALUES ('5', 'web_site_description', '站点描述', 'base', 'textarea', '这里是xx微商城', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', '2', '', '', '', '', '1475241186', '1475241186', '6', '1');
INSERT INTO `dp_admin_config` VALUES ('6', 'web_site_keywords', '站点关键词', 'base', 'text', 'thinkphp开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', '2', '', '', '', '', '1475241328', '1475241328', '7', '1');
INSERT INTO `dp_admin_config` VALUES ('7', 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2016 thinkphp All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241416', '1477710383', '8', '1');
INSERT INTO `dp_admin_config` VALUES ('8', 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241441', '1477710441', '9', '1');
INSERT INTO `dp_admin_config` VALUES ('9', 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241498', '1477710455', '10', '1');
INSERT INTO `dp_admin_config` VALUES ('10', 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241716', '1477649446', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('11', 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241835', '1495853193', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('12', 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475241897', '1477663520', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('13', 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475241975', '1477649489', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('14', 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475242015', '1477663529', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('15', 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475242056', '1477649506', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('16', 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', '2', '', '', '', '', '1475242066', '1476074507', '101', '1');
INSERT INTO `dp_admin_config` VALUES ('17', 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', '2', '', '', '', '', '1475250066', '1477316689', '102', '1');
INSERT INTO `dp_admin_config` VALUES ('18', 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', '2', '', '', '', '', '1476864205', '1476864231', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('19', 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', '2', '', '', '', '', '1476866355', '1476866355', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('21', 'data_backup_path', '数据库备份根路径', 'database', 'text', './data/', '', '路径必须以 / 结尾', '', '', '', '', '', '2', '', '', '', '', '1477017745', '1477018467', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('22', 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', '2', '', '', '', '', '1477017886', '1477017886', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('23', 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', '2', '', '', '', '', '1477017978', '1477018172', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('24', 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', '2', '', '', '', '', '1477018083', '1477018083', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('25', 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', '2', '', '', '', '', '1477579289', '1477579289', '103', '1');
INSERT INTO `dp_admin_config` VALUES ('26', 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '1', '', '', '', '', '', '', '', '2', '', '', '', '', '1477620643', '1477620643', '5', '1');
INSERT INTO `dp_admin_config` VALUES ('27', 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', '2', '', '', '', '', '1477644150', '1477649513', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('28', 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', '2', '', '', '', '', '1477646271', '1477649521', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('29', 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', '2', '', '', '', '', '1477649648', '1477649648', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('30', 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656390', '1477656390', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('31', 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656528', '1477656528', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('32', 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', '2', '', '', '', '', '1477656714', '1477661309', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('33', 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH,LOG_PATH,CACHE_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', '2', '', '', '', '', '1477727305', '1477727305', '100', '1');
INSERT INTO `dp_admin_config` VALUES ('34', 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', '2', '', '', '', '', '1478771958', '1478771958', '99', '1');
INSERT INTO `dp_admin_config` VALUES ('35', 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', '0', '', '', '', '', '1486714723', '1486715620', '104', '1');
INSERT INTO `dp_admin_config` VALUES ('36', 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', '0', '', '', '', '', '1487035843', '1487035843', '99', '1');

-- ----------------------------
-- Table structure for dp_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook`;
CREATE TABLE `dp_admin_hook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of dp_admin_hook
-- ----------------------------
INSERT INTO `dp_admin_hook` VALUES ('1', 'admin_index', '', '后台首页', '1', '1468174214', '1477757518', '1');
INSERT INTO `dp_admin_hook` VALUES ('2', 'plugin_index_tab_list', '', '插件扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `dp_admin_hook` VALUES ('3', 'module_index_tab_list', '', '模块扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `dp_admin_hook` VALUES ('4', 'page_tips', '', '每个页面的提示', '1', '1468174214', '1468174214', '1');
INSERT INTO `dp_admin_hook` VALUES ('5', 'signin_footer', '', '登录页面底部钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `dp_admin_hook` VALUES ('6', 'signin_captcha', '', '登录页面验证码钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `dp_admin_hook` VALUES ('7', 'signin', '', '登录控制器钩子', '1', '1479386875', '1479386875', '1');

-- ----------------------------
-- Table structure for dp_admin_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook_plugin`;
CREATE TABLE `dp_admin_hook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表';

-- ----------------------------
-- Records of dp_admin_hook_plugin
-- ----------------------------
INSERT INTO `dp_admin_hook_plugin` VALUES ('1', 'admin_index', 'SystemInfo', '1477757503', '1477757503', '1', '1');
INSERT INTO `dp_admin_hook_plugin` VALUES ('2', 'admin_index', 'DevTeam', '1477755780', '1477755780', '2', '1');

-- ----------------------------
-- Table structure for dp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_log`;
CREATE TABLE `dp_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of dp_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for dp_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_menu`;
CREATE TABLE `dp_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=544 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of dp_admin_menu
-- ----------------------------
INSERT INTO `dp_admin_menu` VALUES ('1', '0', 'admin', '首页', 'fa fa-fw fa-home', 'module', 'admin/index/index', '_self', '0', '1467617722', '1498788709', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('2', '1', 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module', '', '_self', '0', '1467618170', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('3', '2', 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module', 'admin/index/wipecache', '_self', '0', '1467618273', '1499306299', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('4', '0', 'admin', '系统', 'fa fa-fw fa-gear', 'module', 'admin/system/index', '_self', '0', '1467618361', '1498788709', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('5', '4', 'admin', '系统功能', 'si si-wrench', 'module', '', '_self', '0', '1467618441', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('6', '5', 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module', 'admin/system/index', '_self', '0', '1467618490', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('7', '5', 'admin', '配置管理', 'fa fa-fw fa-gears', 'module', 'admin/config/index', '_self', '0', '1467618618', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('8', '7', 'admin', '新增', '', 'module', 'admin/config/add', '_self', '0', '1467618648', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('9', '7', 'admin', '编辑', '', 'module', 'admin/config/edit', '_self', '0', '1467619566', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('10', '7', 'admin', '删除', '', 'module', 'admin/config/delete', '_self', '0', '1467619583', '1499306299', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('11', '7', 'admin', '启用', '', 'module', 'admin/config/enable', '_self', '0', '1467619609', '1499306299', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('12', '7', 'admin', '禁用', '', 'module', 'admin/config/disable', '_self', '0', '1467619637', '1499306299', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('13', '5', 'admin', '节点管理', 'fa fa-fw fa-bars', 'module', 'admin/menu/index', '_self', '0', '1467619882', '1499306299', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('14', '13', 'admin', '新增', '', 'module', 'admin/menu/add', '_self', '0', '1467619902', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('15', '13', 'admin', '编辑', '', 'module', 'admin/menu/edit', '_self', '0', '1467620331', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('16', '13', 'admin', '删除', '', 'module', 'admin/menu/delete', '_self', '0', '1467620363', '1499306299', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('17', '13', 'admin', '启用', '', 'module', 'admin/menu/enable', '_self', '0', '1467620386', '1499306299', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('18', '13', 'admin', '禁用', '', 'module', 'admin/menu/disable', '_self', '0', '1467620404', '1499306299', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('19', '68', 'user', '权限管理', 'fa fa-fw fa-key', 'module', '', '_self', '0', '1467688065', '1477710702', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('20', '19', 'user', '用户管理', 'fa fa-fw fa-user', 'module', 'user/index/index', '_self', '0', '1467688137', '1498716392', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('21', '20', 'user', '新增', '', 'module', 'user/index/add', '_self', '0', '1467688177', '1477710702', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('22', '20', 'user', '编辑', '', 'module', 'user/index/edit', '_self', '0', '1467688202', '1477710702', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('23', '20', 'user', '删除', '', 'module', 'user/index/delete', '_self', '0', '1467688219', '1477710702', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('24', '20', 'user', '启用', '', 'module', 'user/index/enable', '_self', '0', '1467688238', '1477710702', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('25', '20', 'user', '禁用', '', 'module', 'user/index/disable', '_self', '0', '1467688256', '1477710702', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('211', '64', 'admin', '日志详情', '', 'module', 'admin/log/details', '_self', '0', '1480299320', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('32', '4', 'admin', '扩展中心', 'si si-social-dropbox', 'module', '', '_self', '0', '1467688853', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('33', '32', 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module', 'admin/module/index', '_self', '0', '1467689008', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('34', '33', 'admin', '导入', '', 'module', 'admin/module/import', '_self', '0', '1467689153', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('35', '33', 'admin', '导出', '', 'module', 'admin/module/export', '_self', '0', '1467689173', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('36', '33', 'admin', '安装', '', 'module', 'admin/module/install', '_self', '0', '1467689192', '1499306299', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('37', '33', 'admin', '卸载', '', 'module', 'admin/module/uninstall', '_self', '0', '1467689241', '1499306299', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('38', '33', 'admin', '启用', '', 'module', 'admin/module/enable', '_self', '0', '1467689294', '1499306299', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('39', '33', 'admin', '禁用', '', 'module', 'admin/module/disable', '_self', '0', '1467689312', '1499306299', '6', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('40', '33', 'admin', '更新', '', 'module', 'admin/module/update', '_self', '0', '1467689341', '1499306299', '7', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('41', '32', 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module', 'admin/plugin/index', '_self', '0', '1467689527', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('42', '41', 'admin', '导入', '', 'module', 'admin/plugin/import', '_self', '0', '1467689650', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('43', '41', 'admin', '导出', '', 'module', 'admin/plugin/export', '_self', '0', '1467689665', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('44', '41', 'admin', '安装', '', 'module', 'admin/plugin/install', '_self', '0', '1467689680', '1499306299', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('45', '41', 'admin', '卸载', '', 'module', 'admin/plugin/uninstall', '_self', '0', '1467689700', '1499306299', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('46', '41', 'admin', '启用', '', 'module', 'admin/plugin/enable', '_self', '0', '1467689730', '1499306299', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('47', '41', 'admin', '禁用', '', 'module', 'admin/plugin/disable', '_self', '0', '1467689747', '1499306299', '6', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('48', '41', 'admin', '设置', '', 'module', 'admin/plugin/config', '_self', '0', '1467689789', '1499306299', '7', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('49', '41', 'admin', '管理', '', 'module', 'admin/plugin/manage', '_self', '0', '1467689846', '1499306299', '8', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('50', '5', 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module', 'admin/attachment/index', '_self', '0', '1467690161', '1499306299', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('51', '70', 'admin', '文件上传', '', 'module', 'admin/attachment/upload', '_self', '0', '1467690240', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('52', '50', 'admin', '下载', '', 'module', 'admin/attachment/download', '_self', '0', '1467690334', '1499306299', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('53', '50', 'admin', '启用', '', 'module', 'admin/attachment/enable', '_self', '0', '1467690352', '1499306299', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('54', '50', 'admin', '禁用', '', 'module', 'admin/attachment/disable', '_self', '0', '1467690369', '1499306299', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('55', '50', 'admin', '删除', '', 'module', 'admin/attachment/delete', '_self', '0', '1467690396', '1499306299', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('56', '41', 'admin', '删除', '', 'module', 'admin/plugin/delete', '_self', '0', '1467858065', '1499306299', '11', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('57', '41', 'admin', '编辑', '', 'module', 'admin/plugin/edit', '_self', '0', '1467858092', '1499306299', '10', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('60', '41', 'admin', '新增', '', 'module', 'admin/plugin/add', '_self', '0', '1467858421', '1499306299', '9', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('61', '41', 'admin', '执行', '', 'module', 'admin/plugin/execute', '_self', '0', '1467879016', '1499306299', '12', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('62', '13', 'admin', '保存', '', 'module', 'admin/menu/save', '_self', '0', '1468073039', '1499306299', '6', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('64', '5', 'admin', '系统日志', 'fa fa-fw fa-book', 'module', 'admin/log/index', '_self', '0', '1476111944', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('65', '5', 'admin', '数据库管理', 'fa fa-fw fa-database', 'module', 'admin/database/index', '_self', '0', '1476111992', '1499306299', '7', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('66', '32', 'admin', '数据包管理', 'fa fa-fw fa-database', 'module', 'admin/packet/index', '_self', '0', '1476112326', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('67', '19', 'user', '角色管理', 'fa fa-fw fa-users', 'module', 'user/role/index', '_self', '0', '1476113025', '1477710702', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('68', '0', 'user', '管理员', 'fa fa-fw fa-user', 'module', 'user/index/index', '_self', '0', '1476193348', '1498788709', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('69', '32', 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module', 'admin/hook/index', '_self', '0', '1476236193', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('70', '2', 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module', 'admin/index/index', '_self', '0', '1476237472', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('71', '67', 'user', '新增', '', 'module', 'user/role/add', '_self', '0', '1476256935', '1477710702', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('72', '67', 'user', '编辑', '', 'module', 'user/role/edit', '_self', '0', '1476256968', '1477710702', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('73', '67', 'user', '删除', '', 'module', 'user/role/delete', '_self', '0', '1476256993', '1477710702', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('74', '67', 'user', '启用', '', 'module', 'user/role/enable', '_self', '0', '1476257023', '1477710702', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('75', '67', 'user', '禁用', '', 'module', 'user/role/disable', '_self', '0', '1476257046', '1477710702', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('76', '20', 'user', '授权', '', 'module', 'user/index/access', '_self', '0', '1476375187', '1477710702', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('77', '69', 'admin', '新增', '', 'module', 'admin/hook/add', '_self', '0', '1476668971', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('78', '69', 'admin', '编辑', '', 'module', 'admin/hook/edit', '_self', '0', '1476669006', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('79', '69', 'admin', '删除', '', 'module', 'admin/hook/delete', '_self', '0', '1476669375', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('80', '69', 'admin', '启用', '', 'module', 'admin/hook/enable', '_self', '0', '1476669427', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('81', '69', 'admin', '禁用', '', 'module', 'admin/hook/disable', '_self', '0', '1476669564', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('183', '66', 'admin', '安装', '', 'module', 'admin/packet/install', '_self', '0', '1476851362', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('184', '66', 'admin', '卸载', '', 'module', 'admin/packet/uninstall', '_self', '0', '1476851382', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('185', '5', 'admin', '行为管理', 'fa fa-fw fa-bug', 'module', 'admin/action/index', '_self', '0', '1476882441', '1499306299', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('186', '185', 'admin', '新增', '', 'module', 'admin/action/add', '_self', '0', '1476884439', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('187', '185', 'admin', '编辑', '', 'module', 'admin/action/edit', '_self', '0', '1476884464', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('188', '185', 'admin', '启用', '', 'module', 'admin/action/enable', '_self', '0', '1476884493', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('189', '185', 'admin', '禁用', '', 'module', 'admin/action/disable', '_self', '0', '1476884534', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('190', '185', 'admin', '删除', '', 'module', 'admin/action/delete', '_self', '0', '1476884551', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('191', '65', 'admin', '备份数据库', '', 'module', 'admin/database/export', '_self', '0', '1476972746', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('192', '65', 'admin', '还原数据库', '', 'module', 'admin/database/import', '_self', '0', '1476972772', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('193', '65', 'admin', '优化表', '', 'module', 'admin/database/optimize', '_self', '0', '1476972800', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('194', '65', 'admin', '修复表', '', 'module', 'admin/database/repair', '_self', '0', '1476972825', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('195', '65', 'admin', '删除备份', '', 'module', 'admin/database/delete', '_self', '0', '1476973457', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('210', '41', 'admin', '快速编辑', '', 'module', 'admin/plugin/quickedit', '_self', '0', '1477713981', '1499306299', '13', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('209', '185', 'admin', '快速编辑', '', 'module', 'admin/action/quickedit', '_self', '0', '1477713939', '1499306299', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('208', '7', 'admin', '快速编辑', '', 'module', 'admin/config/quickedit', '_self', '0', '1477713808', '1499306299', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('207', '69', 'admin', '快速编辑', '', 'module', 'admin/hook/quickedit', '_self', '0', '1477713770', '1499306299', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('212', '2', 'admin', '个人设置', 'fa fa-fw fa-user', 'module', 'admin/index/profile', '_self', '0', '1489049767', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('213', '70', 'admin', '检查版本更新', '', 'module', 'admin/index/checkupdate', '_self', '0', '1490588610', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('503', '499', 'admin', '新增', '', 'module', 'admin/user/add', '_self', '0', '1498804339', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('499', '516', 'admin', '会员管理', 'fa fa-fw fa-user', 'module', 'admin/user/index', '_self', '0', '1498789617', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('500', '517', 'admin', '商品管理', 'fa fa-fw fa-shopping-cart', 'module', 'admin/product/index', '_self', '0', '1498789684', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('501', '519', 'admin', '订单管理', 'fa fa-fw fa-copy', 'module', 'admin/order/index', '_self', '0', '1498789903', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('504', '499', 'admin', '编辑', '', 'module', 'admin/user/edit', '_self', '0', '1498804370', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('505', '499', 'admin', '删除', '', 'module', 'admin/user/delete', '_self', '0', '1498804394', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('506', '499', 'admin', '启用', '', 'module', 'admin/user/enable', '_self', '0', '1498804579', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('507', '499', 'admin', '禁用', '', 'module', 'admin/user/disable', '_self', '0', '1498804618', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('508', '499', 'admin', '保存', '', 'module', 'admin/user/save', '_self', '0', '1498804740', '1499306299', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('509', '499', 'admin', '快速编辑', '', 'module', 'admin/user/quickedit', '_self', '0', '1498804805', '1499306299', '7', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('510', '500', 'admin', '新增', '', 'module', 'admin/product/add', '_self', '0', '1498804977', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('511', '500', 'admin', '编辑', '', 'module', 'admin/product/edit', '_self', '0', '1498804995', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('512', '500', 'admin', '删除', '', 'module', 'admin/product/delete', '_self', '0', '1498805047', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('513', '500', 'admin', '上架', '', 'module', 'admin/product/enable', '_self', '0', '1498805097', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('514', '500', 'admin', '下架', '', 'module', 'admin/product/disable', '_self', '0', '1498805140', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('515', '500', 'admin', '保存', '', 'module', 'admin/product/save', '_self', '0', '1498805173', '1499306299', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('516', '1', 'admin', '会员', 'fa fa-fw fa-user-circle', 'module', '', '_self', '0', '1498805729', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('517', '1', 'admin', '商品', 'fa fa-fw fa-product-hunt', 'module', '', '_self', '0', '1498805964', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('518', '500', 'admin', '快速编辑', '', 'module', 'admin/product/quickedit', '_self', '0', '1498806252', '1499306299', '7', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('519', '1', 'admin', '订单', 'fa fa-fw fa-reorder', 'module', '', '_self', '0', '1498806649', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('520', '501', 'admin', '新增', '', 'module', 'admin/order/add', '_self', '0', '1498806940', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('521', '501', 'admin', '编辑', '', 'module', 'admin/order/edit', '_self', '0', '1498806966', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('522', '501', 'admin', '删除', '', 'module', 'admin/order/delete', '_self', '0', '1498807031', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('523', '501', 'admin', '保存', '', 'module', 'admin/order/save', '_self', '0', '1498807051', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('524', '501', 'admin', '快速编辑', '', 'module', 'admin/order/quickedit', '_self', '0', '1498807086', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('525', '516', 'admin', '分销管理', 'fa fa-fw fa-sitemap', 'module', 'admin/distribution/index', '_self', '0', '1498807446', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('526', '517', 'admin', '分类管理', 'fa fa-fw fa-th', 'module', 'admin/cate/index', '_self', '0', '1499151946', '1499306448', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('527', '526', 'admin', '新增', '', 'module', 'admin/cate/add', '_self', '0', '1499152146', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('528', '526', 'admin', '编辑', '', 'module', 'admin/cate/edit', '_self', '0', '1499152231', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('529', '526', 'admin', '删除', '', 'module', 'admin/cate/delete', '_self', '0', '1499152273', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('530', '526', 'admin', '保存', '', 'module', 'admin/cate/save', '_self', '0', '1499152305', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('531', '526', 'admin', '快速编辑', '', 'module', 'admin/cate/quickedit', '_self', '0', '1499152358', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('532', '517', 'admin', '规格管理', 'fa fa-fw fa-stack-exchange', 'module', 'admin/spec/index', '_self', '0', '1499152744', '1499306467', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('533', '532', 'admin', '新增', '', 'module', 'admin/spec/add', '_self', '0', '1499152810', '1499306299', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('534', '532', 'admin', '编辑', '', 'module', 'admin/spec/edit', '_self', '0', '1499152845', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('535', '532', 'admin', '删除', '', 'module', 'admin/spec/delete', '_self', '0', '1499152869', '1499306299', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('536', '532', 'admin', '保存', '', 'module', 'admin/spec/save', '_self', '0', '1499152899', '1499306299', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('537', '532', 'admin', '快速编辑', '', 'module', 'admin/spec/quickedit', '_self', '0', '1499152925', '1499306299', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('538', '517', 'admin', '品牌管理', 'fa fa-fw fa-paw', 'module', 'admin/brand/index', '_self', '0', '1499306272', '1499306299', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('539', '538', 'admin', '新增', '', 'module', 'admin/brand/add', '_self', '0', '1499306338', '1499306338', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('540', '538', 'admin', '编辑', '', 'module', 'admin/brand/edit', '_self', '0', '1499306364', '1499306364', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('541', '538', 'admin', '删除', '', 'module', 'admin/brand/delete', '_self', '0', '1499306382', '1499306382', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('542', '538', 'admin', '保存', '', 'module', 'admin/brand/save', '_self', '0', '1499306401', '1499306401', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('543', '538', 'admin', '快速编辑', '', 'module', 'admin/brand/quickedit', '_self', '0', '1499306420', '1499306420', '100', '0', '1');

-- ----------------------------
-- Table structure for dp_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_module`;
CREATE TABLE `dp_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text COMMENT '配置信息',
  `access` text COMMENT '授权配置',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of dp_admin_module
-- ----------------------------
INSERT INTO `dp_admin_module` VALUES ('1', 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，dpadmin的核心模块', 'pp', 'http://www.thinkphp.cn', '', '', '1.0.0', 'admin.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `dp_admin_module` VALUES ('2', 'user', '管理员', 'fa fa-fw fa-user', '管理员模块，dpadmin自带模块', 'pp', 'http://www.thinkphp.cn', '', '', '1.0.0', 'user.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');

-- ----------------------------
-- Table structure for dp_admin_packet
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_packet`;
CREATE TABLE `dp_admin_packet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表';

-- ----------------------------
-- Records of dp_admin_packet
-- ----------------------------

-- ----------------------------
-- Table structure for dp_admin_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_plugin`;
CREATE TABLE `dp_admin_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of dp_admin_plugin
-- ----------------------------
INSERT INTO `dp_admin_plugin` VALUES ('1', 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', 'thinkphp', 'http://www.thinkphp.cn', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'system_info.ming.plugin', '0', '1477757503', '1477757503', '100', '1');
INSERT INTO `dp_admin_plugin` VALUES ('2', 'DevTeam', '开发团队成员信息', 'fa fa-fw fa-users', '开发团队成员信息', 'thinkphp', 'http://www.thinkphp.cn', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'dev_team.ming.plugin', '0', '1477755780', '1477755780', '100', '1');

-- ----------------------------
-- Table structure for dp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_role`;
CREATE TABLE `dp_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dp_admin_role
-- ----------------------------
INSERT INTO `dp_admin_role` VALUES ('1', '0', '超级管理员', '系统默认创建的角色，拥有最高权限', '', '0', '1476270000', '1468117612', '1', '1');
INSERT INTO `dp_admin_role` VALUES ('2', '1', '普通管理员', '普通管理员', '[\"1\",\"2\",\"70\",\"51\",\"213\",\"212\",\"3\",\"516\",\"499\",\"503\",\"504\",\"505\",\"506\",\"507\",\"508\",\"509\",\"525\",\"517\",\"500\",\"510\",\"511\",\"512\",\"513\",\"514\",\"515\",\"518\",\"519\",\"501\",\"520\",\"521\",\"522\",\"523\",\"524\"]', '100', '1498198908', '1498809948', '1', '1');

-- ----------------------------
-- Table structure for dp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_user`;
CREATE TABLE `dp_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户名',
  `username` varchar(32) NOT NULL,
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dp_admin_user
-- ----------------------------
INSERT INTO `dp_admin_user` VALUES ('1', 'admin', '超级管理员', '$2y$10$XYO0G./2.zPgYqsCPxf7b.bstQz3eluHHTiP13MKi0WUKNH6SNbMq', '', '0', '18888888888', '0', '1', '0.00', '0', '1', '0', '0', '1476065410', '1500034560', '1500034560', '2130706433', '100', '1');
INSERT INTO `dp_admin_user` VALUES ('2', 'user001', '张三', '$2y$10$8AKuaOmWBwj14WWawy0W0euVvbqWAMV.8AFRq1Vf2Jem0SJyXz0p6', 'user001@gmail.com', '0', '15924909999', '0', '2', '0.00', '0', '2', '0', '0', '1498198746', '1498810016', '1498810016', '2130706433', '100', '1');

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
-- Table structure for dp_order
-- ----------------------------
DROP TABLE IF EXISTS `dp_order`;
CREATE TABLE `dp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(255) NOT NULL DEFAULT '0' COMMENT '订单号',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `product_spec` int(11) NOT NULL DEFAULT '0' COMMENT '规格',
  `product_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `seller` int(11) NOT NULL DEFAULT '0' COMMENT '发货人',
  `buyer` int(11) NOT NULL DEFAULT '0' COMMENT '收货人',
  `buyer_address` int(11) NOT NULL DEFAULT '0' COMMENT '收货地址',
  `order_note` varchar(255) DEFAULT '' COMMENT '备注',
  `pay_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付状态(0未支付1支付中2已支付3支付失败)',
  `pay_type` varchar(20) DEFAULT '0' COMMENT '支付类型(1wxpay 2alipay)',
  `order_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态(0待付款1待发货2已发货/待确认收货3已签收/待评价4已评价5申请退款6退款成功)',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of dp_order
-- ----------------------------
INSERT INTO `dp_order` VALUES ('1', '2017071452995499', '4', '3.00', '4', '2', '6.00', '0.00', '0', '1', '2', '啥快递啊', '0', '0', '4', '1500039620', '1500039620');
INSERT INTO `dp_order` VALUES ('2', '2017071449529810', '1', '7.00', '4', '3', '21.00', '0.00', '0', '1', '2', '搜房网分为非', '0', '0', '0', '1500041841', '1500041841');
INSERT INTO `dp_order` VALUES ('4', '2017071549100555', '4', '3.00', '2', '1', '3.00', '0.00', '0', '1', '2', '刷单啊', '0', '0', '3', '1500087409', '1500087409');
INSERT INTO `dp_order` VALUES ('5', '2017071551999897', '4', '3.00', '2', '1', '3.00', '0.00', '0', '1', '2', '', '0', '0', '0', '1500089139', '1500089139');
INSERT INTO `dp_order` VALUES ('6', '2017071556555255', '4', '3.00', '2', '1', '3.00', '0.00', '0', '1', '2', '', '1', '0', '1', '1500089224', '1500091068');

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
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品进价/成本价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of dp_product
-- ----------------------------
INSERT INTO `dp_product` VALUES ('1', '你的背包', '', '', '阿迪背包', '4', '3', '1,2,4', '24', '20', '9.00', '8.00', '7.00', '6.00', '2', '0', '4', '0', '0', '0', '0', '0', '0', '1504022400', '0.00', '100', '1', '1499405003', '1500041841');
INSERT INTO `dp_product` VALUES ('2', '休闲外套', '', '', '统一老坛酸菜11', '5', '2', '3,4', '17', '4,8', '10.00', '9.00', '8.00', '7.00', '999', '0', '2', '0', '0', '0', '0', '0', '0', '1514476800', '0.00', '100', '1', '1499416286', '1499846909');
INSERT INTO `dp_product` VALUES ('3', '新鲜水果', '', '', '新鲜水果批发', '2', '1', '4', '4', '8,4,3', '100.00', '90.00', '80.00', '60.00', '999', '0', '3', '0', '0', '0', '0', '0', '0', '1531411200', '0.00', '100', '1', '1499652274', '1499846890');
INSERT INTO `dp_product` VALUES ('4', '统一老坛酸菜', '', '', '酸菜', '3', '5', '1,2,3,4,5', '22', '23', '5.00', '4.00', '3.00', '2.00', '0', '0', '5', '0', '0', '0', '0', '0', '0', '1500480000', '0.00', '100', '1', '1499652274', '1500089224');
INSERT INTO `dp_product` VALUES ('5', '兰蔻面膜', '', '', '面膜', '4', '6', '1,4', '32', '32,33', '566.00', '555.00', '500.00', '400.00', '999', '0', '0', '0', '0', '0', '0', '0', '0', '1500134400', '0.00', '100', '1', '1499848127', '1499848454');
INSERT INTO `dp_product` VALUES ('6', '英冠足球', '', '', '足球', '4', '7', '4', '34', '35,36,34', '888.00', '777.00', '666.00', '555.00', '444', '0', '0', '0', '0', '0', '0', '0', '0', '1563984000', '0.00', '100', '1', '1499849407', '1499849407');

-- ----------------------------
-- Table structure for dp_spec
-- ----------------------------
DROP TABLE IF EXISTS `dp_spec`;
CREATE TABLE `dp_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `desc` text NOT NULL COMMENT '详情',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of dp_spec
-- ----------------------------
INSERT INTO `dp_spec` VALUES ('1', '500ml', '500毫升', '0', '100', '1', '1499405094', '0');
INSERT INTO `dp_spec` VALUES ('2', '1L', '1000毫升', '0', '100', '1', '1499416118', '1499416118');
INSERT INTO `dp_spec` VALUES ('3', '800g', '800g', '0', '100', '1', '1499416172', '1499416172');
INSERT INTO `dp_spec` VALUES ('4', '1只', '1只', '0', '100', '1', '1499416200', '1499416200');
INSERT INTO `dp_spec` VALUES ('5', '1个', '1个', '0', '100', '1', '1499666735', '1499666735');

-- ----------------------------
-- Table structure for dp_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_user`;
CREATE TABLE `dp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '登录密码',
  `paypass` varchar(96) NOT NULL DEFAULT '' COMMENT '支付密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `ref_mobile` varchar(11) NOT NULL COMMENT '推荐人手机号码',
  `group_mobile` varchar(11) NOT NULL COMMENT '团队手机号码',
  `balance` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `signup_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户/会员表';

-- ----------------------------
-- Records of dp_user
-- ----------------------------
INSERT INTO `dp_user` VALUES ('1', 'pp001', 'alipiapia', '$2y$10$9wVp0gAP.10E.41jUNbZgu/MUBMn5XwejQRXZCE2oFYVtISMCbsLK', '$2y$10$/8Qomzq3SlL4cHpipeMm0OcH7YHevHGhPB7oxdQ7uh/gXolxhAivK', '12@qq.com', '15924900001', '15924900000', '13888888888', '91.00', '0', '0', '1499400175', '1500091068', '1500037134', '2130706433', '100', '1');
INSERT INTO `dp_user` VALUES ('2', 'pp002', 'yowe', '$2y$10$xwxlat.hQD.qNV3Rc.Y1pOViHsy086JJn//wfzlyz88wpqFWSB4Ei', '', 'de@qqq.com', '15924900002', '15924900001', '13888888888', '0.00', '0', '0', '1499827728', '1499997063', '1499997063', '2130706433', '100', '1');

-- ----------------------------
-- Table structure for dp_user_address
-- ----------------------------
DROP TABLE IF EXISTS `dp_user_address`;
CREATE TABLE `dp_user_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `address` varchar(1000) NOT NULL DEFAULT '' COMMENT '详细地址',
  `postcode` varchar(10) NOT NULL DEFAULT '' COMMENT '邮编',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认地址：0否 1是',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户收货地址表';

-- ----------------------------
-- Records of dp_user_address
-- ----------------------------
INSERT INTO `dp_user_address` VALUES ('2', '1', '王大锤', '18208702223', '五华区五华区五华区五华区', '', '0', '1', '1499755048', '1499757550');
INSERT INTO `dp_user_address` VALUES ('3', '2', '李小龙11', '15699999999', '小河边小河边小河边小河边小河边小河边小河边', '', '0', '1', '1499755782', '1499755782');
INSERT INTO `dp_user_address` VALUES ('4', '11', '哇哈哈', '18489554787', '盘龙区盘龙区盘龙区盘龙区盘龙区', '', '0', '1', '1499757537', '1499757537');
INSERT INTO `dp_user_address` VALUES ('5', '11', '小青龙', '18899995547', '小龙潭小龙潭小龙潭小龙潭', '', '0', '1', '1499760879', '1499760879');
INSERT INTO `dp_user_address` VALUES ('6', '11', '大龙潭', '15924778888', '哈哈哈111', '', '0', '1', '1499760976', '1499760976');
