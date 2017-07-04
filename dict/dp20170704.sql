/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : dpadmin

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-07-04 16:35:52
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dp_admin_attachment
-- ----------------------------
INSERT INTO `dp_admin_attachment` VALUES ('1', '1', 'logo.png', 'admin', 'uploads/images/20170623/364e7c3669f3df67157b0d31bb8403ae.png', '', '', 'image/png', 'png', '6995', '853aa52e723a1296d9176599eaacd0dc', 'bccb2f00cd5198218b20d4ad943b73ec8e99633e', 'local', '0', '1498205985', '1498205985', '100', '1');
INSERT INTO `dp_admin_attachment` VALUES ('2', '2', 'ucenter.png', 'admin', 'uploads/images/20170630/b46f152ac93eb0a2bf91f843cac08b52.png', '', '', 'image/png', 'png', '132698', '8f5ccbbe9e4dafbe2fb0ab5c923aa31c', '5eaefb78bde28797b739525c537fea1d01b6bc63', 'local', '0', '1498794156', '1498794156', '100', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of dp_admin_log
-- ----------------------------
INSERT INTO `dp_admin_log` VALUES ('1', '1', '1', '2130706433', 'admin_user', '2', '超级管理员 添加了用户：张三', '1', '1498198746');
INSERT INTO `dp_admin_log` VALUES ('2', '7', '1', '2130706433', 'admin_role', '2', '超级管理员 添加了角色：普通管理员', '1', '1498198907');
INSERT INTO `dp_admin_log` VALUES ('3', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：普通管理员', '1', '1498198945');
INSERT INTO `dp_admin_log` VALUES ('4', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：字段(access)，原值(0)，新值：(true)', '1', '1498198953');
INSERT INTO `dp_admin_log` VALUES ('5', '2', '1', '2130706433', 'admin_user', '2', '超级管理员 编辑了用户：张三', '1', '1498199032');
INSERT INTO `dp_admin_log` VALUES ('6', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：普通管理员', '1', '1498199453');
INSERT INTO `dp_admin_log` VALUES ('7', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1498205322');
INSERT INTO `dp_admin_log` VALUES ('8', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1498206008');
INSERT INTO `dp_admin_log` VALUES ('9', '20', '1', '2130706433', 'database', '0', '超级管理员 备份了数据库：dp_admin_access,dp_admin_action,dp_admin_attachment,dp_admin_config,dp_admin_hook,dp_admin_hook_plugin,dp_admin_log,dp_admin_menu,dp_admin_module,dp_admin_packet,dp_admin_plugin,dp_admin_role,dp_admin_user', '1', '1498206785');
INSERT INTO `dp_admin_log` VALUES ('10', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：商品', '1', '1498446588');
INSERT INTO `dp_admin_log` VALUES ('11', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：门户', '1', '1498448722');
INSERT INTO `dp_admin_log` VALUES ('12', '36', '1', '2130706433', 'admin_module', '0', '超级管理员 卸载了模块：商品', '1', '1498449129');
INSERT INTO `dp_admin_log` VALUES ('13', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：商品', '1', '1498449202');
INSERT INTO `dp_admin_log` VALUES ('14', '36', '1', '2130706433', 'admin_module', '0', '超级管理员 卸载了模块：门户', '1', '1498449450');
INSERT INTO `dp_admin_log` VALUES ('15', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：门户', '1', '1498449469');
INSERT INTO `dp_admin_log` VALUES ('16', '39', '1', '2130706433', 'admin_module', '0', '超级管理员 导出了模块：商品', '1', '1498455759');
INSERT INTO `dp_admin_log` VALUES ('17', '36', '1', '2130706433', 'admin_module', '0', '超级管理员 卸载了模块：商品', '1', '1498456147');
INSERT INTO `dp_admin_log` VALUES ('18', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：商品', '1', '1498456159');
INSERT INTO `dp_admin_log` VALUES ('19', '36', '1', '2130706433', 'admin_module', '0', '超级管理员 卸载了模块：门户', '1', '1498461615');
INSERT INTO `dp_admin_log` VALUES ('20', '36', '1', '2130706433', 'admin_module', '0', '超级管理员 卸载了模块：商品', '1', '1498461624');
INSERT INTO `dp_admin_log` VALUES ('21', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：商品', '1', '1498461747');
INSERT INTO `dp_admin_log` VALUES ('22', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：订单', '1', '1498462010');
INSERT INTO `dp_admin_log` VALUES ('23', '36', '1', '2130706433', 'admin_module', '0', '超级管理员 卸载了模块：订单', '1', '1498463629');
INSERT INTO `dp_admin_log` VALUES ('24', '36', '1', '2130706433', 'admin_module', '0', '超级管理员 卸载了模块：商品', '1', '1498463633');
INSERT INTO `dp_admin_log` VALUES ('25', '2', '1', '2130706433', 'admin_user', '1', '超级管理员 编辑了用户：超级管理员', '1', '1498527980');
INSERT INTO `dp_admin_log` VALUES ('26', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1498529362');
INSERT INTO `dp_admin_log` VALUES ('27', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1498529373');
INSERT INTO `dp_admin_log` VALUES ('28', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1498529747');
INSERT INTO `dp_admin_log` VALUES ('29', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1498529800');
INSERT INTO `dp_admin_log` VALUES ('30', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1498529857');
INSERT INTO `dp_admin_log` VALUES ('31', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1498529916');
INSERT INTO `dp_admin_log` VALUES ('32', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1498529942');
INSERT INTO `dp_admin_log` VALUES ('33', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1498529953');
INSERT INTO `dp_admin_log` VALUES ('34', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1498529999');
INSERT INTO `dp_admin_log` VALUES ('35', '2', '1', '2130706433', 'admin_user', '2', '超级管理员 编辑了用户：张三', '1', '1498532586');
INSERT INTO `dp_admin_log` VALUES ('36', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1498546295');
INSERT INTO `dp_admin_log` VALUES ('37', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1498546299');
INSERT INTO `dp_admin_log` VALUES ('38', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1498617030');
INSERT INTO `dp_admin_log` VALUES ('39', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1498635567');
INSERT INTO `dp_admin_log` VALUES ('40', '31', '1', '2130706433', 'admin_menu', '20', '超级管理员 编辑了节点：节点ID(20)', '1', '1498716217');
INSERT INTO `dp_admin_log` VALUES ('41', '31', '1', '2130706433', 'admin_menu', '20', '超级管理员 编辑了节点：节点ID(20)', '1', '1498716392');
INSERT INTO `dp_admin_log` VALUES ('42', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1498788056');
INSERT INTO `dp_admin_log` VALUES ('43', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1498788062');
INSERT INTO `dp_admin_log` VALUES ('44', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1498788096');
INSERT INTO `dp_admin_log` VALUES ('45', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1498788110');
INSERT INTO `dp_admin_log` VALUES ('46', '30', '1', '2130706433', 'admin_menu', '500', '超级管理员 添加了节点：所属模块(index),所属节点ID(499),节点标题(会员管理),节点链接(index/user/index)', '1', '1498789617');
INSERT INTO `dp_admin_log` VALUES ('47', '30', '1', '2130706433', 'admin_menu', '501', '超级管理员 添加了节点：所属模块(index),所属节点ID(499),节点标题(商品管理),节点链接(index/product/index)', '1', '1498789684');
INSERT INTO `dp_admin_log` VALUES ('48', '31', '1', '2130706433', 'admin_menu', '499', '超级管理员 编辑了节点：节点ID(499)', '1', '1498789795');
INSERT INTO `dp_admin_log` VALUES ('49', '31', '1', '2130706433', 'admin_menu', '501', '超级管理员 编辑了节点：节点ID(501)', '1', '1498789861');
INSERT INTO `dp_admin_log` VALUES ('50', '30', '1', '2130706433', 'admin_menu', '502', '超级管理员 添加了节点：所属模块(index),所属节点ID(499),节点标题(订单管理),节点链接(index/order/index)', '1', '1498789903');
INSERT INTO `dp_admin_log` VALUES ('51', '2', '1', '2130706433', 'admin_user', '2', '超级管理员 编辑了用户：张三', '1', '1498791942');
INSERT INTO `dp_admin_log` VALUES ('52', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：普通管理员', '1', '1498794127');
INSERT INTO `dp_admin_log` VALUES ('53', '34', '1', '2130706433', 'admin_menu', '51', '超级管理员 禁用了节点：节点ID(51),节点标题(文件上传),节点链接(admin/attachment/upload)', '1', '1498804123');
INSERT INTO `dp_admin_log` VALUES ('54', '33', '1', '2130706433', 'admin_menu', '51', '超级管理员 启用了节点：节点ID(51),节点标题(文件上传),节点链接(admin/attachment/upload)', '1', '1498804167');
INSERT INTO `dp_admin_log` VALUES ('55', '30', '1', '2130706433', 'admin_menu', '503', '超级管理员 添加了节点：所属模块(admin),所属节点ID(499),节点标题(新增),节点链接(admin/user/add)', '1', '1498804339');
INSERT INTO `dp_admin_log` VALUES ('56', '30', '1', '2130706433', 'admin_menu', '504', '超级管理员 添加了节点：所属模块(admin),所属节点ID(499),节点标题(编辑),节点链接(admin/user/edit)', '1', '1498804370');
INSERT INTO `dp_admin_log` VALUES ('57', '30', '1', '2130706433', 'admin_menu', '505', '超级管理员 添加了节点：所属模块(admin),所属节点ID(499),节点标题(删除),节点链接(admin/user/delete)', '1', '1498804394');
INSERT INTO `dp_admin_log` VALUES ('58', '30', '1', '2130706433', 'admin_menu', '506', '超级管理员 添加了节点：所属模块(admin),所属节点ID(499),节点标题(启用),节点链接(admin/user/enable)', '1', '1498804579');
INSERT INTO `dp_admin_log` VALUES ('59', '30', '1', '2130706433', 'admin_menu', '507', '超级管理员 添加了节点：所属模块(admin),所属节点ID(499),节点标题(禁用),节点链接(admin/user/disable)', '1', '1498804618');
INSERT INTO `dp_admin_log` VALUES ('60', '30', '1', '2130706433', 'admin_menu', '508', '超级管理员 添加了节点：所属模块(admin),所属节点ID(499),节点标题(快速编辑),节点链接(admin/user/quikedit)', '1', '1498804740');
INSERT INTO `dp_admin_log` VALUES ('61', '30', '1', '2130706433', 'admin_menu', '509', '超级管理员 添加了节点：所属模块(admin),所属节点ID(499),节点标题(快速编辑),节点链接(admin/user/quikedit)', '1', '1498804805');
INSERT INTO `dp_admin_log` VALUES ('62', '30', '1', '2130706433', 'admin_menu', '510', '超级管理员 添加了节点：所属模块(admin),所属节点ID(500),节点标题(新增),节点链接(admin/product/add)', '1', '1498804977');
INSERT INTO `dp_admin_log` VALUES ('63', '30', '1', '2130706433', 'admin_menu', '511', '超级管理员 添加了节点：所属模块(admin),所属节点ID(500),节点标题(编辑),节点链接(admin/product/edit)', '1', '1498804994');
INSERT INTO `dp_admin_log` VALUES ('64', '30', '1', '2130706433', 'admin_menu', '512', '超级管理员 添加了节点：所属模块(admin),所属节点ID(500),节点标题(删除),节点链接(admin/product/delete)', '1', '1498805047');
INSERT INTO `dp_admin_log` VALUES ('65', '30', '1', '2130706433', 'admin_menu', '513', '超级管理员 添加了节点：所属模块(admin),所属节点ID(500),节点标题(上架),节点链接(admin/product/enable)', '1', '1498805097');
INSERT INTO `dp_admin_log` VALUES ('66', '30', '1', '2130706433', 'admin_menu', '514', '超级管理员 添加了节点：所属模块(admin),所属节点ID(500),节点标题(下架),节点链接(admin/product/disable)', '1', '1498805140');
INSERT INTO `dp_admin_log` VALUES ('67', '30', '1', '2130706433', 'admin_menu', '515', '超级管理员 添加了节点：所属模块(admin),所属节点ID(500),节点标题(保存),节点链接(admin/product/save)', '1', '1498805173');
INSERT INTO `dp_admin_log` VALUES ('68', '30', '1', '2130706433', 'admin_menu', '516', '超级管理员 添加了节点：所属模块(admin),所属节点ID(1),节点标题(会员),节点链接()', '1', '1498805729');
INSERT INTO `dp_admin_log` VALUES ('69', '31', '1', '2130706433', 'admin_menu', '516', '超级管理员 编辑了节点：节点ID(516)', '1', '1498805817');
INSERT INTO `dp_admin_log` VALUES ('70', '30', '1', '2130706433', 'admin_menu', '517', '超级管理员 添加了节点：所属模块(admin),所属节点ID(1),节点标题(商品),节点链接()', '1', '1498805964');
INSERT INTO `dp_admin_log` VALUES ('71', '30', '1', '2130706433', 'admin_menu', '518', '超级管理员 添加了节点：所属模块(admin),所属节点ID(500),节点标题(快速编辑),节点链接(admin/product/quickedit)', '1', '1498806252');
INSERT INTO `dp_admin_log` VALUES ('72', '30', '1', '2130706433', 'admin_menu', '519', '超级管理员 添加了节点：所属模块(admin),所属节点ID(1),节点标题(订单),节点链接()', '1', '1498806649');
INSERT INTO `dp_admin_log` VALUES ('73', '31', '1', '2130706433', 'admin_menu', '501', '超级管理员 编辑了节点：节点ID(501)', '1', '1498806718');
INSERT INTO `dp_admin_log` VALUES ('74', '30', '1', '2130706433', 'admin_menu', '520', '超级管理员 添加了节点：所属模块(admin),所属节点ID(501),节点标题(新增),节点链接(admin/order/add)', '1', '1498806940');
INSERT INTO `dp_admin_log` VALUES ('75', '30', '1', '2130706433', 'admin_menu', '521', '超级管理员 添加了节点：所属模块(admin),所属节点ID(501),节点标题(编辑),节点链接(admin/order/edit)', '1', '1498806966');
INSERT INTO `dp_admin_log` VALUES ('76', '30', '1', '2130706433', 'admin_menu', '522', '超级管理员 添加了节点：所属模块(admin),所属节点ID(501),节点标题(删除),节点链接(admin/order/delete)', '1', '1498807031');
INSERT INTO `dp_admin_log` VALUES ('77', '30', '1', '2130706433', 'admin_menu', '523', '超级管理员 添加了节点：所属模块(admin),所属节点ID(501),节点标题(保存),节点链接(admin/order/save)', '1', '1498807051');
INSERT INTO `dp_admin_log` VALUES ('78', '30', '1', '2130706433', 'admin_menu', '524', '超级管理员 添加了节点：所属模块(admin),所属节点ID(501),节点标题(快速编辑),节点链接(admin/order/quickedit)', '1', '1498807086');
INSERT INTO `dp_admin_log` VALUES ('79', '30', '1', '2130706433', 'admin_menu', '525', '超级管理员 添加了节点：所属模块(admin),所属节点ID(516),节点标题(分销管理),节点链接(admin/distribution/index)', '1', '1498807446');
INSERT INTO `dp_admin_log` VALUES ('80', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：普通管理员', '1', '1498809948');
INSERT INTO `dp_admin_log` VALUES ('81', '16', '1', '2130706433', 'admin_config', '19', '超级管理员 编辑了配置：字段(status)，原值(1)，新值：(false)', '1', '1499146274');
INSERT INTO `dp_admin_log` VALUES ('82', '16', '1', '2130706433', 'admin_config', '19', '超级管理员 编辑了配置：字段(status)，原值(0)，新值：(true)', '1', '1499146280');
INSERT INTO `dp_admin_log` VALUES ('83', '16', '1', '2130706433', 'admin_config', '19', '超级管理员 编辑了配置：字段(status)，原值(1)，新值：(false)', '1', '1499146313');
INSERT INTO `dp_admin_log` VALUES ('84', '16', '1', '2130706433', 'admin_config', '19', '超级管理员 编辑了配置：字段(status)，原值(0)，新值：(true)', '1', '1499146322');
INSERT INTO `dp_admin_log` VALUES ('85', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1499147210');
INSERT INTO `dp_admin_log` VALUES ('86', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1499147234');
INSERT INTO `dp_admin_log` VALUES ('87', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1499151413');
INSERT INTO `dp_admin_log` VALUES ('88', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1499151446');
INSERT INTO `dp_admin_log` VALUES ('89', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1499151520');
INSERT INTO `dp_admin_log` VALUES ('90', '30', '1', '2130706433', 'admin_menu', '526', '超级管理员 添加了节点：所属模块(admin),所属节点ID(517),节点标题(商品分类),节点链接(admin/product/category)', '1', '1499151946');
INSERT INTO `dp_admin_log` VALUES ('91', '30', '1', '2130706433', 'admin_menu', '527', '超级管理员 添加了节点：所属模块(admin),所属节点ID(526),节点标题(新增),节点链接(admin/category/add)', '1', '1499152146');
INSERT INTO `dp_admin_log` VALUES ('92', '31', '1', '2130706433', 'admin_menu', '526', '超级管理员 编辑了节点：节点ID(526)', '1', '1499152174');
INSERT INTO `dp_admin_log` VALUES ('93', '30', '1', '2130706433', 'admin_menu', '528', '超级管理员 添加了节点：所属模块(admin),所属节点ID(526),节点标题(编辑),节点链接(admin/category/edit)', '1', '1499152231');
INSERT INTO `dp_admin_log` VALUES ('94', '30', '1', '2130706433', 'admin_menu', '529', '超级管理员 添加了节点：所属模块(admin),所属节点ID(526),节点标题(删除),节点链接(admin/category/delete)', '1', '1499152273');
INSERT INTO `dp_admin_log` VALUES ('95', '30', '1', '2130706433', 'admin_menu', '530', '超级管理员 添加了节点：所属模块(admin),所属节点ID(526),节点标题(保存),节点链接(admin/category/save)', '1', '1499152305');
INSERT INTO `dp_admin_log` VALUES ('96', '30', '1', '2130706433', 'admin_menu', '531', '超级管理员 添加了节点：所属模块(admin),所属节点ID(526),节点标题(快速编辑),节点链接(admin/category/quickedit)', '1', '1499152358');
INSERT INTO `dp_admin_log` VALUES ('97', '30', '1', '2130706433', 'admin_menu', '532', '超级管理员 添加了节点：所属模块(admin),所属节点ID(517),节点标题(商品规格),节点链接(admin/specification/index)', '1', '1499152744');
INSERT INTO `dp_admin_log` VALUES ('98', '30', '1', '2130706433', 'admin_menu', '533', '超级管理员 添加了节点：所属模块(admin),所属节点ID(532),节点标题(新增),节点链接(admin/specification/add)', '1', '1499152810');
INSERT INTO `dp_admin_log` VALUES ('99', '30', '1', '2130706433', 'admin_menu', '534', '超级管理员 添加了节点：所属模块(admin),所属节点ID(532),节点标题(编辑),节点链接(admin/specification/edit)', '1', '1499152845');
INSERT INTO `dp_admin_log` VALUES ('100', '30', '1', '2130706433', 'admin_menu', '535', '超级管理员 添加了节点：所属模块(admin),所属节点ID(532),节点标题(删除),节点链接(admin/specification/delete)', '1', '1499152869');
INSERT INTO `dp_admin_log` VALUES ('101', '30', '1', '2130706433', 'admin_menu', '536', '超级管理员 添加了节点：所属模块(admin),所属节点ID(532),节点标题(保存),节点链接(admin/specification/save)', '1', '1499152899');
INSERT INTO `dp_admin_log` VALUES ('102', '30', '1', '2130706433', 'admin_menu', '537', '超级管理员 添加了节点：所属模块(admin),所属节点ID(532),节点标题(快速编辑),节点链接(admin/specification/quickedit)', '1', '1499152925');

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
) ENGINE=MyISAM AUTO_INCREMENT=538 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of dp_admin_menu
-- ----------------------------
INSERT INTO `dp_admin_menu` VALUES ('1', '0', 'admin', '首页', 'fa fa-fw fa-home', 'module', 'admin/index/index', '_self', '0', '1467617722', '1498788709', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('2', '1', 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module', '', '_self', '0', '1467618170', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('3', '2', 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module', 'admin/index/wipecache', '_self', '0', '1467618273', '1498806759', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('4', '0', 'admin', '系统', 'fa fa-fw fa-gear', 'module', 'admin/system/index', '_self', '0', '1467618361', '1498788709', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('5', '4', 'admin', '系统功能', 'si si-wrench', 'module', '', '_self', '0', '1467618441', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('6', '5', 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module', 'admin/system/index', '_self', '0', '1467618490', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('7', '5', 'admin', '配置管理', 'fa fa-fw fa-gears', 'module', 'admin/config/index', '_self', '0', '1467618618', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('8', '7', 'admin', '新增', '', 'module', 'admin/config/add', '_self', '0', '1467618648', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('9', '7', 'admin', '编辑', '', 'module', 'admin/config/edit', '_self', '0', '1467619566', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('10', '7', 'admin', '删除', '', 'module', 'admin/config/delete', '_self', '0', '1467619583', '1498806759', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('11', '7', 'admin', '启用', '', 'module', 'admin/config/enable', '_self', '0', '1467619609', '1498806759', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('12', '7', 'admin', '禁用', '', 'module', 'admin/config/disable', '_self', '0', '1467619637', '1498806759', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('13', '5', 'admin', '节点管理', 'fa fa-fw fa-bars', 'module', 'admin/menu/index', '_self', '0', '1467619882', '1498806759', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('14', '13', 'admin', '新增', '', 'module', 'admin/menu/add', '_self', '0', '1467619902', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('15', '13', 'admin', '编辑', '', 'module', 'admin/menu/edit', '_self', '0', '1467620331', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('16', '13', 'admin', '删除', '', 'module', 'admin/menu/delete', '_self', '0', '1467620363', '1498806759', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('17', '13', 'admin', '启用', '', 'module', 'admin/menu/enable', '_self', '0', '1467620386', '1498806759', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('18', '13', 'admin', '禁用', '', 'module', 'admin/menu/disable', '_self', '0', '1467620404', '1498806759', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('19', '68', 'user', '权限管理', 'fa fa-fw fa-key', 'module', '', '_self', '0', '1467688065', '1477710702', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('20', '19', 'user', '用户管理', 'fa fa-fw fa-user', 'module', 'user/index/index', '_self', '0', '1467688137', '1498716392', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('21', '20', 'user', '新增', '', 'module', 'user/index/add', '_self', '0', '1467688177', '1477710702', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('22', '20', 'user', '编辑', '', 'module', 'user/index/edit', '_self', '0', '1467688202', '1477710702', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('23', '20', 'user', '删除', '', 'module', 'user/index/delete', '_self', '0', '1467688219', '1477710702', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('24', '20', 'user', '启用', '', 'module', 'user/index/enable', '_self', '0', '1467688238', '1477710702', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('25', '20', 'user', '禁用', '', 'module', 'user/index/disable', '_self', '0', '1467688256', '1477710702', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('211', '64', 'admin', '日志详情', '', 'module', 'admin/log/details', '_self', '0', '1480299320', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('32', '4', 'admin', '扩展中心', 'si si-social-dropbox', 'module', '', '_self', '0', '1467688853', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('33', '32', 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module', 'admin/module/index', '_self', '0', '1467689008', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('34', '33', 'admin', '导入', '', 'module', 'admin/module/import', '_self', '0', '1467689153', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('35', '33', 'admin', '导出', '', 'module', 'admin/module/export', '_self', '0', '1467689173', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('36', '33', 'admin', '安装', '', 'module', 'admin/module/install', '_self', '0', '1467689192', '1498806759', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('37', '33', 'admin', '卸载', '', 'module', 'admin/module/uninstall', '_self', '0', '1467689241', '1498806759', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('38', '33', 'admin', '启用', '', 'module', 'admin/module/enable', '_self', '0', '1467689294', '1498806759', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('39', '33', 'admin', '禁用', '', 'module', 'admin/module/disable', '_self', '0', '1467689312', '1498806759', '6', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('40', '33', 'admin', '更新', '', 'module', 'admin/module/update', '_self', '0', '1467689341', '1498806759', '7', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('41', '32', 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module', 'admin/plugin/index', '_self', '0', '1467689527', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('42', '41', 'admin', '导入', '', 'module', 'admin/plugin/import', '_self', '0', '1467689650', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('43', '41', 'admin', '导出', '', 'module', 'admin/plugin/export', '_self', '0', '1467689665', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('44', '41', 'admin', '安装', '', 'module', 'admin/plugin/install', '_self', '0', '1467689680', '1498806759', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('45', '41', 'admin', '卸载', '', 'module', 'admin/plugin/uninstall', '_self', '0', '1467689700', '1498806759', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('46', '41', 'admin', '启用', '', 'module', 'admin/plugin/enable', '_self', '0', '1467689730', '1498806759', '5', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('47', '41', 'admin', '禁用', '', 'module', 'admin/plugin/disable', '_self', '0', '1467689747', '1498806759', '6', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('48', '41', 'admin', '设置', '', 'module', 'admin/plugin/config', '_self', '0', '1467689789', '1498806759', '7', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('49', '41', 'admin', '管理', '', 'module', 'admin/plugin/manage', '_self', '0', '1467689846', '1498806759', '8', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('50', '5', 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module', 'admin/attachment/index', '_self', '0', '1467690161', '1498806759', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('51', '70', 'admin', '文件上传', '', 'module', 'admin/attachment/upload', '_self', '0', '1467690240', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('52', '50', 'admin', '下载', '', 'module', 'admin/attachment/download', '_self', '0', '1467690334', '1498806759', '1', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('53', '50', 'admin', '启用', '', 'module', 'admin/attachment/enable', '_self', '0', '1467690352', '1498806759', '2', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('54', '50', 'admin', '禁用', '', 'module', 'admin/attachment/disable', '_self', '0', '1467690369', '1498806759', '3', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('55', '50', 'admin', '删除', '', 'module', 'admin/attachment/delete', '_self', '0', '1467690396', '1498806759', '4', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('56', '41', 'admin', '删除', '', 'module', 'admin/plugin/delete', '_self', '0', '1467858065', '1498806759', '11', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('57', '41', 'admin', '编辑', '', 'module', 'admin/plugin/edit', '_self', '0', '1467858092', '1498806759', '10', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('60', '41', 'admin', '新增', '', 'module', 'admin/plugin/add', '_self', '0', '1467858421', '1498806759', '9', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('61', '41', 'admin', '执行', '', 'module', 'admin/plugin/execute', '_self', '0', '1467879016', '1498806759', '12', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('62', '13', 'admin', '保存', '', 'module', 'admin/menu/save', '_self', '0', '1468073039', '1498806759', '6', '1', '1');
INSERT INTO `dp_admin_menu` VALUES ('64', '5', 'admin', '系统日志', 'fa fa-fw fa-book', 'module', 'admin/log/index', '_self', '0', '1476111944', '1498806759', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('65', '5', 'admin', '数据库管理', 'fa fa-fw fa-database', 'module', 'admin/database/index', '_self', '0', '1476111992', '1498806759', '7', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('66', '32', 'admin', '数据包管理', 'fa fa-fw fa-database', 'module', 'admin/packet/index', '_self', '0', '1476112326', '1498806759', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('67', '19', 'user', '角色管理', 'fa fa-fw fa-users', 'module', 'user/role/index', '_self', '0', '1476113025', '1477710702', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('68', '0', 'user', '管理员', 'fa fa-fw fa-user', 'module', 'user/index/index', '_self', '0', '1476193348', '1498788709', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('69', '32', 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module', 'admin/hook/index', '_self', '0', '1476236193', '1498806759', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('70', '2', 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module', 'admin/index/index', '_self', '0', '1476237472', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('71', '67', 'user', '新增', '', 'module', 'user/role/add', '_self', '0', '1476256935', '1477710702', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('72', '67', 'user', '编辑', '', 'module', 'user/role/edit', '_self', '0', '1476256968', '1477710702', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('73', '67', 'user', '删除', '', 'module', 'user/role/delete', '_self', '0', '1476256993', '1477710702', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('74', '67', 'user', '启用', '', 'module', 'user/role/enable', '_self', '0', '1476257023', '1477710702', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('75', '67', 'user', '禁用', '', 'module', 'user/role/disable', '_self', '0', '1476257046', '1477710702', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('76', '20', 'user', '授权', '', 'module', 'user/index/access', '_self', '0', '1476375187', '1477710702', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('77', '69', 'admin', '新增', '', 'module', 'admin/hook/add', '_self', '0', '1476668971', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('78', '69', 'admin', '编辑', '', 'module', 'admin/hook/edit', '_self', '0', '1476669006', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('79', '69', 'admin', '删除', '', 'module', 'admin/hook/delete', '_self', '0', '1476669375', '1498806759', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('80', '69', 'admin', '启用', '', 'module', 'admin/hook/enable', '_self', '0', '1476669427', '1498806759', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('81', '69', 'admin', '禁用', '', 'module', 'admin/hook/disable', '_self', '0', '1476669564', '1498806759', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('183', '66', 'admin', '安装', '', 'module', 'admin/packet/install', '_self', '0', '1476851362', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('184', '66', 'admin', '卸载', '', 'module', 'admin/packet/uninstall', '_self', '0', '1476851382', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('185', '5', 'admin', '行为管理', 'fa fa-fw fa-bug', 'module', 'admin/action/index', '_self', '0', '1476882441', '1498806759', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('186', '185', 'admin', '新增', '', 'module', 'admin/action/add', '_self', '0', '1476884439', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('187', '185', 'admin', '编辑', '', 'module', 'admin/action/edit', '_self', '0', '1476884464', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('188', '185', 'admin', '启用', '', 'module', 'admin/action/enable', '_self', '0', '1476884493', '1498806759', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('189', '185', 'admin', '禁用', '', 'module', 'admin/action/disable', '_self', '0', '1476884534', '1498806759', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('190', '185', 'admin', '删除', '', 'module', 'admin/action/delete', '_self', '0', '1476884551', '1498806759', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('191', '65', 'admin', '备份数据库', '', 'module', 'admin/database/export', '_self', '0', '1476972746', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('192', '65', 'admin', '还原数据库', '', 'module', 'admin/database/import', '_self', '0', '1476972772', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('193', '65', 'admin', '优化表', '', 'module', 'admin/database/optimize', '_self', '0', '1476972800', '1498806759', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('194', '65', 'admin', '修复表', '', 'module', 'admin/database/repair', '_self', '0', '1476972825', '1498806759', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('195', '65', 'admin', '删除备份', '', 'module', 'admin/database/delete', '_self', '0', '1476973457', '1498806759', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('210', '41', 'admin', '快速编辑', '', 'module', 'admin/plugin/quickedit', '_self', '0', '1477713981', '1498806759', '13', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('209', '185', 'admin', '快速编辑', '', 'module', 'admin/action/quickedit', '_self', '0', '1477713939', '1498806759', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('208', '7', 'admin', '快速编辑', '', 'module', 'admin/config/quickedit', '_self', '0', '1477713808', '1498806759', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('207', '69', 'admin', '快速编辑', '', 'module', 'admin/hook/quickedit', '_self', '0', '1477713770', '1498806759', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('212', '2', 'admin', '个人设置', 'fa fa-fw fa-user', 'module', 'admin/index/profile', '_self', '0', '1489049767', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('213', '70', 'admin', '检查版本更新', '', 'module', 'admin/index/checkupdate', '_self', '0', '1490588610', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('503', '499', 'admin', '新增', '', 'module', 'admin/user/add', '_self', '0', '1498804339', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('499', '516', 'admin', '会员管理', 'fa fa-fw fa-user', 'module', 'admin/user/index', '_self', '0', '1498789617', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('500', '517', 'admin', '商品管理', 'fa fa-fw fa-shopping-cart', 'module', 'admin/product/index', '_self', '0', '1498789684', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('501', '519', 'admin', '订单管理', 'fa fa-fw fa-copy', 'module', 'admin/order/index', '_self', '0', '1498789903', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('504', '499', 'admin', '编辑', '', 'module', 'admin/user/edit', '_self', '0', '1498804370', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('505', '499', 'admin', '删除', '', 'module', 'admin/user/delete', '_self', '0', '1498804394', '1498806759', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('506', '499', 'admin', '启用', '', 'module', 'admin/user/enable', '_self', '0', '1498804579', '1498806759', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('507', '499', 'admin', '禁用', '', 'module', 'admin/user/disable', '_self', '0', '1498804618', '1498806759', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('508', '499', 'admin', '保存', '', 'module', 'admin/user/save', '_self', '0', '1498804740', '1498806759', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('509', '499', 'admin', '快速编辑', '', 'module', 'admin/user/quickedit', '_self', '0', '1498804805', '1498806759', '7', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('510', '500', 'admin', '新增', '', 'module', 'admin/product/add', '_self', '0', '1498804977', '1498806759', '1', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('511', '500', 'admin', '编辑', '', 'module', 'admin/product/edit', '_self', '0', '1498804995', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('512', '500', 'admin', '删除', '', 'module', 'admin/product/delete', '_self', '0', '1498805047', '1498806759', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('513', '500', 'admin', '上架', '', 'module', 'admin/product/enable', '_self', '0', '1498805097', '1498806759', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('514', '500', 'admin', '下架', '', 'module', 'admin/product/disable', '_self', '0', '1498805140', '1498806759', '5', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('515', '500', 'admin', '保存', '', 'module', 'admin/product/save', '_self', '0', '1498805173', '1498806759', '6', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('516', '1', 'admin', '会员', 'fa fa-fw fa-user-circle', 'module', '', '_self', '0', '1498805729', '1498806759', '2', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('517', '1', 'admin', '商品', 'fa fa-fw fa-product-hunt', 'module', '', '_self', '0', '1498805964', '1498806759', '3', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('518', '500', 'admin', '快速编辑', '', 'module', 'admin/product/quickedit', '_self', '0', '1498806252', '1498806759', '7', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('519', '1', 'admin', '订单', 'fa fa-fw fa-reorder', 'module', '', '_self', '0', '1498806649', '1498806759', '4', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('520', '501', 'admin', '新增', '', 'module', 'admin/order/add', '_self', '0', '1498806940', '1498806940', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('521', '501', 'admin', '编辑', '', 'module', 'admin/order/edit', '_self', '0', '1498806966', '1498806966', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('522', '501', 'admin', '删除', '', 'module', 'admin/order/delete', '_self', '0', '1498807031', '1498807031', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('523', '501', 'admin', '保存', '', 'module', 'admin/order/save', '_self', '0', '1498807051', '1498807051', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('524', '501', 'admin', '快速编辑', '', 'module', 'admin/order/quickedit', '_self', '0', '1498807086', '1498807086', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('525', '516', 'admin', '分销管理', 'fa fa-fw fa-sitemap', 'module', 'admin/distribution/index', '_self', '0', '1498807446', '1498807446', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('526', '517', 'admin', '商品分类', 'fa fa-fw fa-th', 'module', 'admin/category/index', '_self', '0', '1499151946', '1499152174', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('527', '526', 'admin', '新增', '', 'module', 'admin/category/add', '_self', '0', '1499152146', '1499152146', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('528', '526', 'admin', '编辑', '', 'module', 'admin/category/edit', '_self', '0', '1499152231', '1499152231', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('529', '526', 'admin', '删除', '', 'module', 'admin/category/delete', '_self', '0', '1499152273', '1499152273', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('530', '526', 'admin', '保存', '', 'module', 'admin/category/save', '_self', '0', '1499152305', '1499152305', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('531', '526', 'admin', '快速编辑', '', 'module', 'admin/category/quickedit', '_self', '0', '1499152358', '1499152358', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('532', '517', 'admin', '商品规格', 'fa fa-fw fa-stack-exchange', 'module', 'admin/specification/index', '_self', '0', '1499152744', '1499152744', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('533', '532', 'admin', '新增', '', 'module', 'admin/specification/add', '_self', '0', '1499152810', '1499152810', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('534', '532', 'admin', '编辑', '', 'module', 'admin/specification/edit', '_self', '0', '1499152845', '1499152845', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('535', '532', 'admin', '删除', '', 'module', 'admin/specification/delete', '_self', '0', '1499152869', '1499152869', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('536', '532', 'admin', '保存', '', 'module', 'admin/specification/save', '_self', '0', '1499152899', '1499152899', '100', '0', '1');
INSERT INTO `dp_admin_menu` VALUES ('537', '532', 'admin', '快速编辑', '', 'module', 'admin/specification/quickedit', '_self', '0', '1499152925', '1499152925', '100', '0', '1');

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
INSERT INTO `dp_admin_user` VALUES ('1', 'admin', '超级管理员', '$2y$10$XYO0G./2.zPgYqsCPxf7b.bstQz3eluHHTiP13MKi0WUKNH6SNbMq', '', '0', '18888888888', '0', '1', '0.00', '0', '1', '0', '0', '1476065410', '1499131465', '1499131464', '2130706433', '100', '1');
INSERT INTO `dp_admin_user` VALUES ('2', 'user001', '张三', '$2y$10$8AKuaOmWBwj14WWawy0W0euVvbqWAMV.8AFRq1Vf2Jem0SJyXz0p6', 'user001@gmail.com', '0', '15924909999', '0', '2', '0.00', '0', '2', '0', '0', '1498198746', '1498810016', '1498810016', '2130706433', '100', '1');

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
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `ref_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '推荐人手机号码',
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户/会员表';

-- ----------------------------
-- Records of dp_user
-- ----------------------------
INSERT INTO `dp_user` VALUES ('1', 'pp001', 'alipiapia', '$2y$10$hca465wKC38uyF4bJ3bD2.cH2C.2faLSF.sKMX1YBc81AV7i04lDC', '$2y$10$n8lvK5Ryz14xgcDaciEPVOuWCwxr1cQQu2kY0NMlqcqwAP5L4JBgK', 'pp@qq.com', '15924900001', '15924900000', '0.00', '0', '0', '1498706855', '1499131496', '1499131496', '2130706433', '100', '0');
