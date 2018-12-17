/*
Navicat MySQL Data Transfer

Source Server         : php17
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tpshop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-14 22:37:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tpshop_address
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_address`;
CREATE TABLE `tpshop_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `consignee` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL COMMENT '软删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_address
-- ----------------------------
INSERT INTO `tpshop_address` VALUES ('1', '4', '曹操', '北京市顺义区黑马程序员', '13102460166', '1523501542', '1523501542', null);
INSERT INTO `tpshop_address` VALUES ('2', '4', '孙权', '北京市昌平区修正大厦', '13102460166', '1523502219', '1523502219', null);

-- ----------------------------
-- Table structure for tpshop_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_attribute`;
CREATE TABLE `tpshop_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '类型id',
  `attr_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '属性类型 0唯一属性 1单选属性',
  `attr_input_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '录入方式: 0输入框 1下拉列表 2多选框',
  `attr_values` varchar(255) NOT NULL DEFAULT '' COMMENT '供选择的属性值',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_attribute
-- ----------------------------
INSERT INTO `tpshop_attribute` VALUES ('8', '选择颜色', '3', '1', '2', '渐变黑,渐变蓝,渐变红', '1541572283', '1541572283', null);
INSERT INTO `tpshop_attribute` VALUES ('9', '选择版本', '3', '1', '2', '全网通（64G）,全网通（128G）,全网通（256G）,全网通（512G）', '1541572329', '1541572329', null);
INSERT INTO `tpshop_attribute` VALUES ('10', '选择套装', '3', '1', '2', '官方标配', '1541572360', '1541572360', null);
INSERT INTO `tpshop_attribute` VALUES ('11', '品牌名称', '3', '0', '1', 'iphone,华为,小米,vivo', '1541572412', '1541572412', null);
INSERT INTO `tpshop_attribute` VALUES ('12', '运行内存', '3', '0', '1', '2G,4G,8G,10G,16G', '1541572446', '1541572446', null);
INSERT INTO `tpshop_attribute` VALUES ('13', '商品毛重', '3', '0', '0', '', '1541572461', '1541572461', null);
INSERT INTO `tpshop_attribute` VALUES ('14', '热点', '3', '0', '0', '', '1541572475', '1541572475', null);
INSERT INTO `tpshop_attribute` VALUES ('15', '选择版本', '4', '1', '2', 'i3,i5,i7', '1541572521', '1541572536', null);
INSERT INTO `tpshop_attribute` VALUES ('16', '选择配置', '4', '1', '2', '8G独显,256SSD独显,新品上市,以旧换新', '1541572601', '1541572601', null);
INSERT INTO `tpshop_attribute` VALUES ('17', '增值服务', '4', '1', '2', '保修3年,5年,10年', '1541572638', '1541572638', null);
INSERT INTO `tpshop_attribute` VALUES ('18', '商品名称', '4', '0', '0', '', '1541572665', '1541572665', null);
INSERT INTO `tpshop_attribute` VALUES ('19', '内存容量', '4', '0', '1', '4G,8G,16G', '1541572687', '1541572687', null);

-- ----------------------------
-- Table structure for tpshop_auth
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_auth`;
CREATE TABLE `tpshop_auth` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(20) NOT NULL COMMENT '权限名称',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父id',
  `auth_c` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器',
  `auth_a` varchar(32) NOT NULL DEFAULT '' COMMENT '操作方法',
  `is_nav` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否作为菜单显示 1是 0否',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_auth
-- ----------------------------
INSERT INTO `tpshop_auth` VALUES ('1', '权限管理', '0', '', '', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('2', '商品管理', '0', '', '', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('3', '订单管理', '0', '', '', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('4', '管理员列表', '1', 'Manager', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('5', '管理员新增', '1', 'Manager', 'create', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('6', '角色管理', '1', 'Role', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('7', '权限管理', '1', 'Auth', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('8', '商品列表', '2', 'Goods', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('9', '商品新增', '2', 'Goods', 'create', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('10', '商品类型', '2', 'Type', 'index', '1', '1520408547', null, null);
INSERT INTO `tpshop_auth` VALUES ('11', '订单列表', '3', 'Order', 'index', '1', '1520408547', '1542079470', '1542079470');
INSERT INTO `tpshop_auth` VALUES ('12', '添加订单', '3', 'Order', 'create', '1', '1520408547', '1542079476', '1542079476');
INSERT INTO `tpshop_auth` VALUES ('13', '商品删除', '2', 'Goods', 'delete', '0', '1521272189', '1521272189', null);
INSERT INTO `tpshop_auth` VALUES ('14', '商品属性', '2', 'Attribute', 'index', '1', '1521507069', '1521507069', null);
INSERT INTO `tpshop_auth` VALUES ('15', '商品类型新增', '2', 'Type', 'create', '1', '1541508438', '1541508762', '1541508762');
INSERT INTO `tpshop_auth` VALUES ('16', '商品类型新增', '2', 'Type', 'create', '1', '1541508785', '1541508785', null);

-- ----------------------------
-- Table structure for tpshop_cart
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_cart`;
CREATE TABLE `tpshop_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_attr_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性ids（多个id用,分隔）',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_cart
-- ----------------------------
INSERT INTO `tpshop_cart` VALUES ('15', '4', '214', '73,74,79', '2', '1542029175', '1542162313', '1542080830');
INSERT INTO `tpshop_cart` VALUES ('16', '4', '214', '73,75,79', '3', '1542029290', '1542162316', '1542080834');
INSERT INTO `tpshop_cart` VALUES ('17', '4', '214', '73,75,79', '3', '1542029658', '1542162316', '1542080834');
INSERT INTO `tpshop_cart` VALUES ('18', '4', '214', '73,74,79', '2', '1542029868', '1542162313', '1542080830');
INSERT INTO `tpshop_cart` VALUES ('19', '4', '214', '73,75,79', '3', '1542072817', '1542162316', '1542080834');
INSERT INTO `tpshop_cart` VALUES ('20', '4', '214', '73,75,79', '3', '1542074695', '1542162316', '1542080834');
INSERT INTO `tpshop_cart` VALUES ('25', '4', '214', '74', '3', '1542081181', '1542162667', null);
INSERT INTO `tpshop_cart` VALUES ('26', '4', '214', '75', '2', '1542081390', '1542162311', null);
INSERT INTO `tpshop_cart` VALUES ('27', '4', '214', '73,74,79', '2', '1542090153', '1542162313', null);
INSERT INTO `tpshop_cart` VALUES ('28', '4', '214', '73,75,79', '3', '1542101709', '1542162316', null);

-- ----------------------------
-- Table structure for tpshop_category
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_category`;
CREATE TABLE `tpshop_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类',
  `is_show` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示 1显示',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1038 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_category
-- ----------------------------
INSERT INTO `tpshop_category` VALUES ('1', '家用电器', '0', '0', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('2', '电视', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('3', '空调', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('4', '洗衣机', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('5', '冰箱', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('6', '厨卫大电', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('7', '厨房小电', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('8', '生活电器', '1', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('9', '手机/运营商/数码', '0', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('10', '手机通讯', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('11', '运营商', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('12', '手机配件', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('13', '摄影摄像', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('14', '数码配件', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('15', '影音娱乐', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('16', '智能设备', '9', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('17', '电脑/办公', '0', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('18', '电脑整机', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('19', '电脑配件', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('20', '外设产品', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('21', '游戏设备', '17', '1', '1522819513', '1522819513', null);
INSERT INTO `tpshop_category` VALUES ('22', '网络产品', '17', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('23', '办公设备', '17', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('24', '文具耗材', '17', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('25', '家居/家具/家装/厨具', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('26', '厨具', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('27', '家纺', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('28', '生活日用', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('29', '家装软饰', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('30', '灯具', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('31', '家具', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('32', '家装主材', '25', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('33', '男装/女装/童装/内衣', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('34', '女装', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('35', '男装', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('36', '内衣', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('37', '配饰', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('38', '童装', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('39', '童鞋', '33', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('40', '美妆个护/宠物', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('41', '面部护肤', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('42', '洗发护发', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('43', '身体护理', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('44', '口腔护理', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('45', '女性护理', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('46', '香水彩妆', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('47', '清洁用品', '40', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('48', '女鞋/箱包/钟表/珠宝', '0', '1', '1522819514', '1522819514', null);
INSERT INTO `tpshop_category` VALUES ('49', '时尚女鞋', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('50', '潮流女包', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('51', '精品男包', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('52', '功能箱包', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('53', '奢侈品', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('54', '精选大牌', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('55', '钟表', '48', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('56', '男鞋/运动/户外', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('57', '流行男鞋', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('58', '运动鞋包', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('59', '运动服饰', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('60', '健身训练', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('61', '骑行运动', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('62', '体育用品', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('63', '户外鞋服', '56', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('64', '房产/汽车/汽车用品', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('65', '房产', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('66', '汽车车型', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('67', '汽车价格', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('68', '汽车品牌', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('69', '维修保养', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('70', '汽车装饰', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('71', '车载电器', '64', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('72', '母婴/玩具乐器', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('73', '奶粉', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('74', '营养辅食', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('75', '尿裤湿巾', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('76', '喂养用品', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('77', '洗护用品', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('78', '寝居服饰', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('79', '妈妈专区', '72', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('80', '食品/酒类/生鲜/特产', '0', '1', '1522819515', '1522819515', null);
INSERT INTO `tpshop_category` VALUES ('81', '新鲜水果', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('82', '蔬菜蛋品', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('83', '精选肉类', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('84', '海鲜水产', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('85', '冷饮冻食', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('86', '中外名酒', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('87', '进口食品', '80', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('88', '艺术/礼品鲜花/农资绿植', '0', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('89', '艺术品', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('90', '火机烟具', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('91', '礼品', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('92', '鲜花速递', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('93', '绿植园艺', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('94', '种子', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('95', '农药', '88', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('96', '医药保健/计生情趣', '0', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('97', '中西药品', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('98', '营养健康', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('99', '营养成分', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('100', '滋补养生', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('101', '计生情趣', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('102', '保健器械', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('103', '护理护具', '96', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('104', '图书/音像/电子书', '0', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('105', '邮币', '104', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('106', '少儿', '104', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('107', '教育', '104', '1', '1522819516', '1522819516', null);
INSERT INTO `tpshop_category` VALUES ('108', '文艺', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('109', '经管励志', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('110', '人文社科', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('111', '生活', '104', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('112', '机票/酒店/旅游/生活', '0', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('113', '交通出行', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('114', '酒店预订', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('115', '旅游度假', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('116', '商旅服务', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('117', '演出票务', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('118', '生活缴费', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('119', '生活服务', '112', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('120', '理财/众筹/白条/保险', '0', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('121', '理财', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('122', '众筹', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('123', '东家', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('124', '白条', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('125', '支付', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('126', '保险', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('127', '股票', '120', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('128', '曲面电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('129', '超薄电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('130', 'HDR电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('131', 'OLED电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('132', '4K超清电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('133', '人工智能电视', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('134', '55英寸', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('135', '65英寸', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('136', '电视配件', '2', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('137', '壁挂式空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('138', '柜式空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('139', '中央空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('140', '节能空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('141', '智能空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('142', '变频空调', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('143', '以旧换新', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('144', '空调配件', '3', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('145', '滚筒洗衣机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('146', '洗烘一体机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('147', '波轮洗衣机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('148', '迷你洗衣机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('149', '烘干机', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('150', '洗衣机配件', '4', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('151', '多门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('152', '对开门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('153', '三门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('154', '双门', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('155', '冷柜/冰吧', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('156', '酒柜', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('157', '冰箱配件', '5', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('158', '油烟机', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('159', '燃气灶', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('160', '烟灶套装', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('161', '消毒柜', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('162', '洗碗机', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('163', '电热水器', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('164', '燃气热水器', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('165', '嵌入式厨电', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('166', '商用厨房电器', '6', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('167', '破壁机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('168', '电烤箱', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('169', '电饭煲', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('170', '电压力锅', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('171', '咖啡机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('172', '豆浆机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('173', '料理机', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('174', '电炖锅', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('175', '电饼铛', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('176', '多用途锅', '7', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('177', '吸尘器/除螨仪', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('178', '空气净化器', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('179', '电风扇', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('180', '扫地机器人', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('181', '蒸汽拖把/拖地机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('182', '干衣机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('183', '电话机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('184', '饮水机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('185', '净水器', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('186', '除湿机', '8', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('187', '手机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('188', '游戏手机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('189', '老人机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('190', '对讲机', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('191', '以旧换新', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('192', '手机维修', '10', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('193', '合约机', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('194', '选号码', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('195', '固话宽带', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('196', '办套餐', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('197', '充话费/流量', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('198', '中国电信', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('199', '中国移动', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('200', '中国联通', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('201', '京东通信', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('202', '170选号', '11', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('203', '手机壳', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('204', '贴膜', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('205', '手机存储卡', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('206', '数据线', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('207', '充电器', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('208', '无线充电器', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('209', '手机耳机', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('210', '创意配件', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('211', '手机饰品', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('212', '手机电池', '12', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('213', '数码相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('214', '单电/微单相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('215', '单反相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('216', '拍立得', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('217', '运动相机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('218', '摄像机', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('219', '镜头', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('220', '户外器材', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('221', '影棚器材', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('222', '冲印服务', '13', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('223', '存储卡', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('224', '三脚架/云台', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('225', '相机包', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('226', '滤镜', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('227', '闪光灯/手柄', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('228', '相机清洁/贴膜', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('229', '机身附件', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('230', '镜头附件', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('231', '读卡器', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('232', '支架', '14', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('233', '耳机/耳麦', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('234', '音箱/音响', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('235', '智能音箱', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('236', '便携/无线音箱', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('237', '收音机', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('238', '麦克风', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('239', 'MP3/MP4', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('240', '专业音频', '15', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('241', '智能手环', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('242', '智能手表', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('243', '智能眼镜', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('244', '智能机器人', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('245', '运动跟踪器', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('246', '健康监测', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('247', '智能配饰', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('248', '智能家居', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('249', '体感车', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('250', '无人机', '16', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('251', '笔记本', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('252', '游戏本', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('253', '平板电脑', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('254', '平板电脑配件', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('255', '台式机', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('256', '一体机', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('257', '服务器/工作站', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('258', '笔记本配件', '18', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('259', '显示器', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('260', 'CPU', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('261', '主板', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('262', '显卡', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('263', '硬盘', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('264', '内存', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('265', '机箱', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('266', '电源', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('267', '散热器', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('268', '刻录机/光驱', '19', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('269', '鼠标', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('270', '键盘', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('271', '键鼠套装', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('272', '网络仪表仪器', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('273', 'U盘', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('274', '移动硬盘', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('275', '鼠标垫', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('276', '摄像头', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('277', '线缆', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('278', '手写板', '20', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('279', '游戏机', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('280', '游戏耳机', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('281', '手柄/方向盘', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('282', '游戏软件', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('283', '游戏周边', '21', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('284', '路由器', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('285', '网络机顶盒', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('286', '交换机', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('287', '网络存储', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('288', '网卡', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('289', '4G/3G上网', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('290', '网络配件', '22', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('291', '投影机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('292', '投影配件', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('293', '多功能一体机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('294', '打印机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('295', '传真设备', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('296', '验钞/点钞机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('297', '扫描设备', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('298', '复合机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('299', '碎纸机', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('300', '考勤门禁', '23', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('301', '硒鼓/墨粉', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('302', '墨盒', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('303', '色带', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('304', '纸类', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('305', '办公文具', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('306', '学生文具', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('307', '文件收纳', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('308', '本册/便签', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('309', '计算器', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('310', '笔类', '24', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('311', '水具酒具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('312', '烹饪锅具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('313', '餐具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('314', '厨房配件', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('315', '刀剪菜板', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('316', '锅具套装', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('317', '茶具/咖啡具', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('318', '保温杯', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('319', '保鲜盒', '26', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('320', '床品套件', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('321', '被子', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('322', '枕芯', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('323', '蚊帐', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('324', '凉席', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('325', '毛巾浴巾', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('326', '地毯地垫', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('327', '床垫/床褥', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('328', '毯子', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('329', '抱枕靠垫', '27', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('330', '收纳用品', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('331', '雨伞雨具', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('332', '净化除味', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('333', '浴室用品', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('334', '洗晒/熨烫', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('335', '缝纫/针织用品', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('336', '清洁工具', '28', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('337', '装饰字画', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('338', '装饰摆件', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('339', '手工/十字绣', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('340', '相框/照片墙', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('341', '墙贴/装饰贴', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('342', '花瓶花艺', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('343', '香薰蜡烛', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('344', '节庆饰品', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('345', '钟饰', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('346', '帘艺隔断', '29', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('347', '吸顶灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('348', '吊灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('349', '台灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('350', '筒灯射灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('351', '装饰灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('352', 'LED灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('353', '氛围照明', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('354', '落地灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('355', '庭院灯', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('356', '应急灯/手电', '30', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('357', '卧室家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('358', '客厅家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('359', '餐厅家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('360', '书房家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('361', '儿童家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('362', '储物家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('363', '阳台/户外', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('364', '办公家具', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('365', '床', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('366', '床垫', '31', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('367', '瓷砖', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('368', '地板', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('369', '油漆涂料', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('370', '壁纸', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('371', '涂刷辅料', '32', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('372', '新品推荐', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('373', '连衣裙', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('374', 'T恤', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('375', '衬衫', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('376', '雪纺衫', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('377', '短外套', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('378', '卫衣', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('379', '针织衫', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('380', '风衣', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('381', '半身裙', '34', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('382', '当季热卖', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('383', '新品推荐', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('384', 'T恤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('385', '牛仔裤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('386', '休闲裤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('387', '衬衫', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('388', '短裤', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('389', 'POLO衫', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('390', '羽绒服', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('391', '棉服', '35', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('392', '文胸', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('393', '睡衣/家居服', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('394', '男士内裤', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('395', '女士内裤', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('396', '吊带/背心', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('397', '文胸套装', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('398', '情侣睡衣', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('399', '塑身美体', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('400', '少女文胸', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('401', '休闲棉袜', '36', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('402', '女士围巾/披肩', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('403', '男士丝巾/围巾', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('404', '光学镜架/镜片', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('405', '太阳镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('406', '防辐射眼镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('407', '老花镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('408', '游泳镜', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('409', '领带/领结/领带夹', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('410', '毛线帽', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('411', '棒球帽', '37', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('412', '套装', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('413', '卫衣', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('414', '裤子', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('415', '外套/大衣', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('416', '毛衣/针织衫', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('417', '衬衫', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('418', '户外/运动服', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('419', 'T恤', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('420', '裙子', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('421', '亲子装', '38', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('422', '运动鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('423', '靴子', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('424', '帆布鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('425', '皮鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('426', '棉鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('427', '凉鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('428', '拖鞋', '39', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('429', '补水保湿', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('430', '卸妆', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('431', '洁面', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('432', '爽肤水', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('433', '乳液面霜', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('434', '精华', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('435', '眼霜', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('436', '防晒', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('437', '面膜', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('438', '剃须', '41', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('439', '洗发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('440', '护发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('441', '染发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('442', '造型', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('443', '假发', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('444', '美发工具', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('445', '套装', '42', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('446', '补水保湿', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('447', '沐浴', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('448', '润肤', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('449', '精油', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('450', '颈部', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('451', '手足', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('452', '纤体塑形', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('453', '美胸', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('454', '套装', '43', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('455', '牙膏/牙粉', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('456', '牙刷/牙线', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('457', '漱口水', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('458', '套装', '44', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('459', '卫生巾', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('460', '卫生护垫', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('461', '私密护理', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('462', '脱毛膏', '45', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('463', 'BB霜', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('464', '化妆棉', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('465', '香水', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('466', '底妆', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('467', '眉笔', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('468', '睫毛膏', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('469', '眼线', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('470', '眼影', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('471', '唇膏/彩', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('472', '腮红', '46', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('473', '纸品湿巾', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('474', '衣物清洁', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('475', '清洁工具', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('476', '家庭清洁', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('477', '一次性用品', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('478', '驱虫用品', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('479', '皮具护理', '47', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('480', '新品推荐', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('481', '单鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('482', '休闲鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('483', '帆布鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('484', '妈妈鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('485', '布鞋/绣花鞋', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('486', '女靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('487', '踝靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('488', '马丁靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('489', '雪地靴', '49', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('490', '真皮包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('491', '单肩包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('492', '手提包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('493', '斜挎包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('494', '双肩包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('495', '钱包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('496', '手拿包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('497', '卡包/零钱包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('498', '钥匙包', '50', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('499', '男士钱包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('500', '双肩包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('501', '单肩/斜挎包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('502', '商务公文包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('503', '男士手包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('504', '卡包名片夹', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('505', '钥匙包', '51', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('506', '女士拉杆箱', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('507', '拉杆箱', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('508', '拉杆包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('509', '旅行包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('510', '电脑包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('511', '休闲运动包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('512', '书包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('513', '登山包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('514', '腰包/胸包', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('515', '旅行配件', '52', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('516', '箱包', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('517', '钱包', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('518', '服饰', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('519', '腰带', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('520', '鞋靴', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('521', '太阳镜/眼镜框', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('522', '饰品', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('523', '配件', '53', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('524', 'GUCCI', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('525', 'COACH', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('526', '雷朋', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('527', '施华洛世奇', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('528', 'MK', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('529', '阿玛尼', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('530', '菲拉格慕', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('531', 'VERSACE', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('532', '普拉达', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('533', '巴宝莉', '54', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('534', '天梭', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('535', '浪琴', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('536', '欧米茄', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('537', '泰格豪雅', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('538', 'DW', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('539', '卡西欧', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('540', '西铁城', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('541', '天王', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('542', '瑞表', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('543', '国表', '55', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('544', '新品推荐', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('545', '休闲鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('546', '商务休闲鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('547', '正装鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('548', '帆布鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('549', '凉鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('550', '拖鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('551', '功能鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('552', '增高鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('553', '工装鞋', '57', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('554', '跑步鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('555', '休闲鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('556', '篮球鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('557', '帆布鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('558', '板鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('559', '拖鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('560', '运动包', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('561', '足球鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('562', '乒羽网鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('563', '训练鞋', '58', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('564', 'T恤', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('565', '运动套装', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('566', '运动裤', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('567', '卫衣/套头衫', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('568', '夹克/风衣', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('569', '羽绒服', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('570', '运动配饰', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('571', '棉服', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('572', '紧身衣', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('573', '运动背心', '59', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('574', '跑步机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('575', '动感单车', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('576', '健身车', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('577', '椭圆机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('578', '综合训练器', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('579', '划船机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('580', '甩脂机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('581', '倒立机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('582', '武术搏击', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('583', '踏步机', '60', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('584', '山地车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('585', '公路车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('586', '折叠车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('587', '骑行服', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('588', '电动车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('589', '电动滑板车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('590', '城市自行车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('591', '平衡车', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('592', '穿戴装备', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('593', '自行车配件', '61', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('594', '乒乓球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('595', '羽毛球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('596', '篮球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('597', '足球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('598', '轮滑滑板', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('599', '网球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('600', '高尔夫', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('601', '台球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('602', '排球', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('603', '棋牌麻将', '62', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('604', '户外风衣', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('605', '徒步鞋', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('606', 'T恤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('607', '冲锋衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('608', '速干衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('609', '越野跑鞋', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('610', '滑雪服', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('611', '羽绒服/棉服', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('612', '休闲衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('613', '抓绒衣裤', '63', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('614', '最新开盘', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('615', '普通住宅', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('616', '别墅', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('617', '商业办公', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('618', '海外房产', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('619', '文旅地产', '65', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('620', '微型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('621', '小型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('622', '紧凑型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('623', '中型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('624', '中大型车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('625', '豪华车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('626', 'MPV', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('627', 'SUV', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('628', '跑车', '66', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('629', '5万以下', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('630', '5-8万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('631', '8-10万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('632', '10-15万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('633', '15-25万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('634', '25-40万', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('635', '40万以上', '67', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('636', '宝马', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('637', '五菱宝骏', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('638', '上汽大众', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('639', '比亚迪', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('640', '东风启辰', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('641', '陆风', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('642', '吉利', '68', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('643', '机油', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('644', '轮胎', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('645', '添加剂', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('646', '防冻液', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('647', '滤清器', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('648', '蓄电池', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('649', '雨刷', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('650', '刹车片/盘', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('651', '火花塞', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('652', '车灯', '69', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('653', '座垫座套', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('654', '脚垫', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('655', '头枕腰靠', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('656', '方向盘套', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('657', '后备箱垫', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('658', '车载支架', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('659', '车钥匙扣', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('660', '香水', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('661', '炭包/净化剂', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('662', '扶手箱', '70', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('663', '行车记录仪', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('664', '车载充电器', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('665', '车机导航', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('666', '车载蓝牙', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('667', '智能驾驶', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('668', '对讲电台', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('669', '倒车雷达', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('670', '导航仪', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('671', '安全预警仪', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('672', '车载净化器', '71', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('673', '1段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('674', '2段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('675', '3段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('676', '4段', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('677', '孕妈奶粉', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('678', '特殊配方奶粉', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('679', '有机奶粉', '73', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('680', '米粉/菜粉', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('681', '面条/粥', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('682', '果泥/果汁', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('683', '益生菌/初乳', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('684', 'DHA', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('685', '钙铁锌/维生素', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('686', '清火/开胃', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('687', '宝宝零食', '74', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('688', 'NB', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('689', 'S', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('690', 'M', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('691', 'L', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('692', 'XL', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('693', 'XXL', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('694', '拉拉裤', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('695', '成人尿裤', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('696', '婴儿湿巾', '75', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('697', '奶瓶奶嘴', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('698', '吸奶器', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('699', '暖奶消毒', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('700', '辅食料理机', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('701', '牙胶安抚', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('702', '食物存储', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('703', '儿童餐具', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('704', '水壶/水杯', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('705', '围兜/防溅衣', '76', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('706', '宝宝护肤', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('707', '日常护理', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('708', '洗发沐浴', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('709', '洗澡用具', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('710', '洗衣液/皂', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('711', '理发器', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('712', '婴儿口腔清洁', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('713', '座便器', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('714', '驱蚊防晒', '77', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('715', '睡袋/抱被', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('716', '婴儿枕', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('717', '毛毯/棉被', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('718', '婴童床品', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('719', '浴巾/浴衣', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('720', '毛巾/口水巾', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('721', '婴儿礼盒', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('722', '婴儿内衣', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('723', '婴儿外出服', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('724', '隔尿垫巾', '78', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('725', '防辐射服', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('726', '孕妈装', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('727', '孕妇护肤', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('728', '妈咪包/背婴带', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('729', '待产护理', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('730', '产后塑身', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('731', '文胸/内裤', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('732', '防溢乳垫', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('733', '孕期营养', '79', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('734', '苹果', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('735', '香蕉', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('736', '梨', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('737', '橙子', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('738', '奇异果/猕猴桃', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('739', '火龙果', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('740', '榴莲', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('741', '车厘子', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('742', '百香果', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('743', '草莓', '81', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('744', '蛋品', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('745', '叶菜类', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('746', '根茎类', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('747', '葱姜蒜椒', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('748', '鲜菌菇', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('749', '茄果瓜类', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('750', '半加工蔬菜', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('751', '半加工豆制品', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('752', '玉米', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('753', '山药', '82', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('754', '猪肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('755', '牛肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('756', '羊肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('757', '鸡肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('758', '鸭肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('759', '冷鲜肉', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('760', '特色肉类', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('761', '内脏类', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('762', '冷藏熟食', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('763', '牛排', '83', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('764', '鱼类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('765', '虾类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('766', '蟹类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('767', '贝类', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('768', '海参', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('769', '鱿鱼/章鱼', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('770', '活鲜', '84', '1', '1522819517', '1522819517', null);
INSERT INTO `tpshop_category` VALUES ('771', '三文鱼', '84', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('772', '鳕鱼', '84', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('773', '海鲜礼盒', '84', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('774', '水饺/馄饨', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('775', '汤圆/元宵', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('776', '面点', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('777', '烘焙半成品', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('778', '奶酪/黄油', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('779', '方便速食', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('780', '火锅丸串', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('781', '冰淇淋', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('782', '冷藏饮料', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('783', '低温奶', '85', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('784', '白酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('785', '葡萄酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('786', '洋酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('787', '啤酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('788', '黄酒/养生酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('789', '收藏酒/陈年老酒', '86', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('790', '牛奶', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('791', '饼干蛋糕', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('792', '糖/巧克力', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('793', '零食', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('794', '水', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('795', '饮料', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('796', '咖啡粉', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('797', '冲调品', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('798', '油', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('799', '方便食品', '87', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('800', '油画', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('801', '版画', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('802', '水墨画', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('803', '书法', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('804', '雕塑', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('805', '艺术画册', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('806', '艺术衍生品', '89', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('807', '电子烟', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('808', '烟油', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('809', '打火机', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('810', '烟嘴', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('811', '烟盒', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('812', '烟斗', '90', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('813', '创意礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('814', '电子礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('815', '工艺礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('816', '美妆礼品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('817', '婚庆节庆', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('818', '礼盒礼券', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('819', '礼品定制', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('820', '军刀军具', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('821', '古董文玩', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('822', '收藏品', '91', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('823', '鲜花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('824', '每周一花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('825', '永生花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('826', '香皂花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('827', '卡通花束', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('828', '干花', '92', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('829', '桌面绿植', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('830', '苗木', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('831', '绿植盆栽', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('832', '多肉植物', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('833', '花卉', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('834', '种子种球', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('835', '花盆花器', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('836', '园艺土肥', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('837', '园艺工具', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('838', '园林机械', '93', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('839', '花草林木类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('840', '蔬菜/菌类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('841', '瓜果类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('842', '大田作物类', '94', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('843', '杀虫剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('844', '杀菌剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('845', '除草剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('846', '植物生长调节剂', '95', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('847', '感冒咳嗽', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('848', '补肾壮阳', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('849', '补气养血', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('850', '止痛镇痛', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('851', '耳鼻喉用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('852', '眼科用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('853', '口腔用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('854', '皮肤用药', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('855', '肠胃消化', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('856', '风湿骨外伤', '97', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('857', '调节免疫', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('858', '调节三高', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('859', '缓解疲劳', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('860', '美体塑身', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('861', '美容养颜', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('862', '肝肾养护', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('863', '肠胃养护', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('864', '明目益智', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('865', '骨骼健康', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('866', '改善睡眠', '98', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('867', '维生素/矿物质', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('868', '蛋白质', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('869', '鱼油/磷脂', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('870', '螺旋藻', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('871', '番茄红素', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('872', '叶酸', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('873', '葡萄籽', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('874', '左旋肉碱', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('875', '辅酶Q10', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('876', '益生菌', '99', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('877', '阿胶', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('878', '蜂蜜/蜂产品', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('879', '枸杞', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('880', '燕窝', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('881', '冬虫夏草', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('882', '人参/西洋参', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('883', '三七', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('884', '鹿茸', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('885', '雪蛤', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('886', '青钱柳', '100', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('887', '避孕套', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('888', '排卵验孕', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('889', '润滑液', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('890', '男用延时', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('891', '飞机杯', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('892', '倒模', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('893', '仿真娃娃', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('894', '震动棒', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('895', '跳蛋', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('896', '仿真阳具', '101', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('897', '血压计', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('898', '血糖仪', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('899', '血氧仪', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('900', '体温计', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('901', '体重秤', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('902', '胎心仪', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('903', '制氧机', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('904', '呼吸机', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('905', '雾化器', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('906', '助听器', '102', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('907', '口罩', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('908', '眼罩/耳塞', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('909', '跌打损伤', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('910', '暖贴', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('911', '鼻喉护理', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('912', '眼部保健', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('913', '美体护理', '103', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('914', '邮票', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('915', '钱币', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('916', '邮资封片', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('917', '磁卡', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('918', '票证', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('919', '礼品册', '105', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('920', '0-2岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('921', '3-6岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('922', '7-10岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('923', '11-14岁', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('924', '儿童文学', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('925', '绘本', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('926', '科普', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('927', '幼儿启蒙', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('928', '手工游戏', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('929', '智力开发', '106', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('930', '教材', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('931', '中小学教辅', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('932', '考试', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('933', '外语学习', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('934', '字典词典', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('935', '课外读物', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('936', '英语四六级', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('937', '会计类考试', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('938', '国家公务员', '107', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('939', '小说', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('940', '文学', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('941', '青春文学', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('942', '传记', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('943', '动漫', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('944', '艺术', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('945', '摄影', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('946', '书法', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('947', '音乐', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('948', '绘画', '108', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('949', '管理', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('950', '金融与投资', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('951', '经济', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('952', '励志与成功', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('953', '市场营销', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('954', '股票', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('955', '智能经济', '109', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('956', '历史', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('957', '心理学', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('958', '政治/军事', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('959', '国学/古籍', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('960', '哲学/宗教', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('961', '社会科学', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('962', '法律', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('963', '文化', '110', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('964', '育儿/家教', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('965', '孕产/胎教', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('966', '健身保健', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('967', '旅游/地图', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('968', '美食', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('969', '时尚美妆', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('970', '家居', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('971', '手工DIY', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('972', '两性', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('973', '体育', '111', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('974', '国内机票', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('975', '国际机票', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('976', '火车票', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('977', '机场服务', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('978', '机票套餐', '113', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('979', '国内酒店', '114', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('980', '国际酒店', '114', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('981', '超值精选酒店', '114', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('982', '国内旅游', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('983', '出境旅游', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('984', '全球签证', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('985', '景点门票', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('986', '邮轮', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('987', '旅行保险', '115', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('988', '企业差旅', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('989', '团队建设', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('990', '奖励旅游', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('991', '会议周边', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('992', '会议展览', '116', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('993', '电影选座', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('994', '演唱会', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('995', '音乐会', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('996', '话剧歌剧', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('997', '体育赛事', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('998', '舞蹈芭蕾', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('999', '戏曲综艺', '117', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1000', '水费', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1001', '电费', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1002', '煤气费', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1003', '城市通', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1004', '油卡充值', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1005', '加油卡', '118', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1006', '家政保洁', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1007', '摄影写真', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1008', '丽人/养生', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1009', '代理代办', '119', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1010', '京东小金库', '121', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1011', '基金理财', '121', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1012', '定期理财', '121', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1013', '智能硬件', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1014', '流行文化', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1015', '生活美学', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1016', '公益', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1017', '其他权益众筹', '122', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1018', '类固收', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1019', '私募股权', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1020', '阳光私募', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1021', '投资策略', '123', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1022', '京东白条', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1023', '白条联名卡', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1024', '京东钢镚', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1025', '旅游白条', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1026', '安居白条', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1027', '校园金融', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1028', '京东金采', '124', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1029', '京东支付', '125', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1030', '车险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1031', '健康险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1032', '意外险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1033', '旅行险', '126', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1034', '实时资讯', '127', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1035', '市场行情', '127', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1036', '投资达人', '127', '1', '1522819518', '1522819518', null);
INSERT INTO `tpshop_category` VALUES ('1037', '量化平台', '127', '1', '1522819518', '1522819518', null);

-- ----------------------------
-- Table structure for tpshop_goods
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_goods`;
CREATE TABLE `tpshop_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_number` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '商品数量',
  `goods_introduce` text COMMENT '详细介绍',
  `goods_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '商品logo图',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) unsigned DEFAULT NULL COMMENT '软删除时间',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型id',
  `cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_goods
-- ----------------------------
INSERT INTO `tpshop_goods` VALUES ('213', '荣耀Magic2 麒麟980AI智能芯片', '4299.00', '100', '<p><img src=\"/ueditor/php/upload/image/20181107/1541572916.png\" alt=\"1541572916.png\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541572917.png\" alt=\"1541572917.png\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541572918.png\" alt=\"1541572918.png\" /></p><p><br /></p>', '\\uploads\\20181107\\41381f5891dd6f47665799acc4af339d.jpg', '1541572947', '1541574341', null, '3', '187');
INSERT INTO `tpshop_goods` VALUES ('214', 'ipone', '5999.00', '10000', '<p><img src=\"/ueditor/php/upload/image/20181107/1541573167.jpg\" alt=\"1541573167.jpg\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541573167.png\" alt=\"1541573167.png\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541573168.png\" alt=\"1541573168.png\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541573168.jpg\" alt=\"1541573168.jpg\" /></p><p><br /></p>', '\\uploads\\20181107\\864297baa7e9122aea706849122d424c.png', '1541573217', '1542076868', null, '3', '187');
INSERT INTO `tpshop_goods` VALUES ('215', 'ipad', '5999.00', '100', '<p><img src=\"/ueditor/php/upload/image/20181107/1541573321.jpg\" alt=\"1541573321.jpg\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541573321.jpg\" alt=\"1541573321.jpg\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541573322.png\" alt=\"1541573322.png\" /></p><p><img src=\"/ueditor/php/upload/image/20181107/1541573322.png\" alt=\"1541573322.png\" /></p><p><br /></p>', '\\uploads\\20181107\\acaa0405c3c50a7e5953e659a056ba8f.png', '1541573359', '1541573359', null, '4', '251');

-- ----------------------------
-- Table structure for tpshop_goodspics
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_goodspics`;
CREATE TABLE `tpshop_goodspics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `pics_big` varchar(255) NOT NULL DEFAULT '' COMMENT '相册大图地址 800*800',
  `pics_sma` varchar(255) NOT NULL DEFAULT '' COMMENT '相册小图地址 400*400',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_goodspics
-- ----------------------------
INSERT INTO `tpshop_goodspics` VALUES ('63', '213', '\\uploads\\20181107\\big_ac96035c3297ead0c7f62600136e977b.jpg', '\\uploads\\20181107\\small_ac96035c3297ead0c7f62600136e977b.jpg', '1541572990', '1541572990', null);
INSERT INTO `tpshop_goodspics` VALUES ('64', '213', '\\uploads\\20181107\\big_39c502d6866417d3573e26a1d768be56.jpg', '\\uploads\\20181107\\small_39c502d6866417d3573e26a1d768be56.jpg', '1541572990', '1541572990', null);
INSERT INTO `tpshop_goodspics` VALUES ('65', '213', '\\uploads\\20181107\\big_4a1a10fd75933240064687c9a54bdd32.jpg', '\\uploads\\20181107\\small_4a1a10fd75933240064687c9a54bdd32.jpg', '1541572990', '1541572990', null);
INSERT INTO `tpshop_goodspics` VALUES ('66', '213', '\\uploads\\20181107\\big_a0094bf2b95a7fd91c8460d1d6205e95.jpg', '\\uploads\\20181107\\small_a0094bf2b95a7fd91c8460d1d6205e95.jpg', '1541572990', '1541572990', null);
INSERT INTO `tpshop_goodspics` VALUES ('67', '213', '\\uploads\\20181107\\big_e660f112774867e9dbd3e33e08b9fda9.png', '\\uploads\\20181107\\small_e660f112774867e9dbd3e33e08b9fda9.png', '1541572990', '1541572990', null);
INSERT INTO `tpshop_goodspics` VALUES ('68', '213', '\\uploads\\20181107\\big_ebad91fb13a3b7b90b21019bd9605183.png', '\\uploads\\20181107\\small_ebad91fb13a3b7b90b21019bd9605183.png', '1541572990', '1541572990', null);
INSERT INTO `tpshop_goodspics` VALUES ('69', '213', '\\uploads\\20181107\\big_ed673ff4bdd7c0e1dccb97b4201cfc3e.png', '\\uploads\\20181107\\small_ed673ff4bdd7c0e1dccb97b4201cfc3e.png', '1541572990', '1541572990', null);
INSERT INTO `tpshop_goodspics` VALUES ('70', '214', '\\uploads\\20181107\\big_5851a4297686f0567005fc7a7a3a283e.png', '\\uploads\\20181107\\small_5851a4297686f0567005fc7a7a3a283e.png', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goodspics` VALUES ('71', '214', '\\uploads\\20181107\\big_d277876c27cbac4b209c34ec61ca3657.png', '\\uploads\\20181107\\small_d277876c27cbac4b209c34ec61ca3657.png', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goodspics` VALUES ('72', '214', '\\uploads\\20181107\\big_cee04ca39fc20b4fed1be32452130931.png', '\\uploads\\20181107\\small_cee04ca39fc20b4fed1be32452130931.png', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goodspics` VALUES ('73', '214', '\\uploads\\20181107\\big_bfb37acd9705c69f4408c4a857b640e0.jpg', '\\uploads\\20181107\\small_bfb37acd9705c69f4408c4a857b640e0.jpg', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goodspics` VALUES ('74', '214', '\\uploads\\20181107\\big_9d65254789674d92d16d3e369f788411.png', '\\uploads\\20181107\\small_9d65254789674d92d16d3e369f788411.png', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goodspics` VALUES ('75', '214', '\\uploads\\20181107\\big_16e701935c19e9adbd4cf232cacb2c1f.png', '\\uploads\\20181107\\small_16e701935c19e9adbd4cf232cacb2c1f.png', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goodspics` VALUES ('76', '215', '\\uploads\\20181107\\big_5e3e716860fda4c28d4922661a9cccb6.png', '\\uploads\\20181107\\small_5e3e716860fda4c28d4922661a9cccb6.png', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goodspics` VALUES ('77', '215', '\\uploads\\20181107\\big_e78a8bb60d10f0375af9c816d12d17b4.jpg', '\\uploads\\20181107\\small_e78a8bb60d10f0375af9c816d12d17b4.jpg', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goodspics` VALUES ('78', '215', '\\uploads\\20181107\\big_861825721720cb9553a2491306a4b7e1.png', '\\uploads\\20181107\\small_861825721720cb9553a2491306a4b7e1.png', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goodspics` VALUES ('79', '215', '\\uploads\\20181107\\big_5a68e8a7f1cd2ccfab960bb93256b704.png', '\\uploads\\20181107\\small_5a68e8a7f1cd2ccfab960bb93256b704.png', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goodspics` VALUES ('80', '215', '\\uploads\\20181107\\big_2de9e71656ca9fbc0466334bcf5c52a3.png', '\\uploads\\20181107\\small_2de9e71656ca9fbc0466334bcf5c52a3.png', '1541573360', '1541573360', null);

-- ----------------------------
-- Table structure for tpshop_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_goods_attr`;
CREATE TABLE `tpshop_goods_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `attr_id` int(11) NOT NULL COMMENT '属性id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_goods_attr
-- ----------------------------
INSERT INTO `tpshop_goods_attr` VALUES ('60', '213', '8', '渐变黑', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('61', '213', '8', '渐变蓝', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('62', '213', '8', '渐变红', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('63', '213', '9', '全网通（128G）', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('64', '213', '9', '全网通（256G）', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('65', '213', '9', '全网通（512G）', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('66', '213', '10', '官方标配', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('67', '213', '11', '华为', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('68', '213', '12', '8G', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('69', '213', '13', '1kg', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('70', '213', '14', 'asdasd', '1541573065', '1541573065', null);
INSERT INTO `tpshop_goods_attr` VALUES ('71', '214', '8', '渐变黑', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('72', '214', '8', '渐变蓝', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('73', '214', '8', '渐变红', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('74', '214', '9', '全网通（64G）', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('75', '214', '9', '全网通（128G）', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('76', '214', '9', '全网通（256G）', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('77', '214', '9', '全网通（512G）', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('79', '214', '10', '官方标配', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('80', '214', '11', 'iphone', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('81', '214', '12', '2G', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('82', '214', '13', '1kg', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('83', '214', '14', 'asdasd', '1541573219', '1541573219', null);
INSERT INTO `tpshop_goods_attr` VALUES ('84', '215', '15', 'i5', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goods_attr` VALUES ('85', '215', '15', 'i7', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goods_attr` VALUES ('86', '215', '16', '256SSD独显', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goods_attr` VALUES ('87', '215', '16', '新品上市', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goods_attr` VALUES ('88', '215', '17', '保修3年', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goods_attr` VALUES ('89', '215', '17', '5年', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goods_attr` VALUES ('90', '215', '18', 'adasdadsasd', '1541573360', '1541573360', null);
INSERT INTO `tpshop_goods_attr` VALUES ('91', '215', '19', '8G', '1541573360', '1541573360', null);

-- ----------------------------
-- Table structure for tpshop_manager
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_manager`;
CREATE TABLE `tpshop_manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `last_login_time` int(11) unsigned DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1可用 2禁用',
  `role_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '角色id',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_manager
-- ----------------------------
INSERT INTO `tpshop_manager` VALUES ('1', 'admin', '937a9b0a02c243ab8f5d6da37b13bbd6', 'admin@itcast.cn', 'admin', '1542508346', '1', '1', '1520408547', '1540991859', null);
INSERT INTO `tpshop_manager` VALUES ('2', 'sunquan', '937a9b0a02c243ab8f5d6da37b13bbd6', 'sunquan@itcast.cn', '骑鱼的猫', '1541416325', '1', '2', '1520408547', null, null);
INSERT INTO `tpshop_manager` VALUES ('3', 'liubei', '937a9b0a02c243ab8f5d6da37b13bbd6', 'liubei@itcast.cn', '地球是我搓圆的--', '1540947723', '1', '2', '1520408547', '1540906351', null);
INSERT INTO `tpshop_manager` VALUES ('4', 'caocao', '937a9b0a02c243ab8f5d6da37b13bbd6', 'caocao@itcast.cn', '除了帅我一无所有', '1540989457', '1', '2', '1520408547', '1540906645', null);
INSERT INTO `tpshop_manager` VALUES ('5', 'dongzhuo', '937a9b0a02c243ab8f5d6da37b13bbd6', 'dongzhuo@itcast.cn', '朕好萌', '0', '2', '3', '1520408547', '1540906543', null);
INSERT INTO `tpshop_manager` VALUES ('6', 'yuanshao', '937a9b0a02c243ab8f5d6da37b13bbd6', 'yuanshao@itcast.cn', '骑着蜗牛周游世界', '0', '2', '3', '1520408547', null, null);
INSERT INTO `tpshop_manager` VALUES ('7', 'diaochan', '937a9b0a02c243ab8f5d6da37b13bbd6', 'diaochan@itcast.cn', '住我心，免房租', '0', '1', '3', '1520408547', '1540907446', null);
INSERT INTO `tpshop_manager` VALUES ('8', 'qeqe', '937a9b0a02c243ab8f5d6da37b13bbd6', 'qweqwe@qq.com', 'adadadsa', null, '1', '2', '1541507686', '1541507731', '1541507731');
INSERT INTO `tpshop_manager` VALUES ('9', 'asdas', '246d7bae51cbb9f61e43500d1da4f1a8', 'asda@qq.com', 'asda', null, '1', '3', '1541574767', '1541575207', '1541575207');

-- ----------------------------
-- Table structure for tpshop_order
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_order`;
CREATE TABLE `tpshop_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '下单用户id',
  `consignee_name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `consignee_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `consignee_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人地址',
  `shipping_type` varchar(64) NOT NULL DEFAULT '' COMMENT '配送方式 yuantong圆通 shentong申通 yunda韵达 zhongtong中通 shunfeng顺丰',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态 0未付款 1已付款',
  `pay_type` varchar(64) NOT NULL DEFAULT '' COMMENT '支付方式 card银联 wechat微信 alipay支付宝',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_order
-- ----------------------------
INSERT INTO `tpshop_order` VALUES ('16', '1542074504371124', '17997.00', '4', '孙权', '13102460166', '北京市昌平区修正大厦', 'Yuantong', '0', 'alipay', '1542074504', '1542074504', null);
INSERT INTO `tpshop_order` VALUES ('17', '1542076668244813', '17997.00', '4', '曹操', '13102460166', '北京市顺义区黑马程序员', 'Yuantong', '0', 'wechat', '1542076668', '1542076668', null);
INSERT INTO `tpshop_order` VALUES ('18', '1542076701686091', '0.00', '4', '曹操', '13102460166', '北京市顺义区黑马程序员', 'Yuantong', '0', 'wechat', '1542076701', '1542076701', null);
INSERT INTO `tpshop_order` VALUES ('19', '1542076732904585', '0.00', '4', '曹操', '13102460166', '北京市顺义区黑马程序员', 'Yuantong', '0', 'wechat', '1542076732', '1542076732', null);
INSERT INTO `tpshop_order` VALUES ('20', '1542076747171145', '0.00', '4', '曹操', '13102460166', '北京市顺义区黑马程序员', 'Yuantong', '0', 'wechat', '1542076747', '1542076747', null);
INSERT INTO `tpshop_order` VALUES ('21', '1542076817112442', '0.00', '4', '曹操', '13102460166', '北京市顺义区黑马程序员', 'Yuantong', '0', 'wechat', '1542076817', '1542076817', null);
INSERT INTO `tpshop_order` VALUES ('22', '1542076868881474', '5999.00', '4', '孙权', '13102460166', '北京市昌平区修正大厦', 'Yuantong', '0', 'alipay', '1542076868', '1542076868', null);

-- ----------------------------
-- Table structure for tpshop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_order_goods`;
CREATE TABLE `tpshop_order_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `goods_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '商品logo图',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `goods_attr_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性ids',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_order_goods
-- ----------------------------
INSERT INTO `tpshop_order_goods` VALUES ('18', '16', '19', 'ipone', '5999.00', '\\uploads\\20181107\\864297baa7e9122aea706849122d424c.png', '3', '73,75,79', '1542074504', '1542074504', null);
INSERT INTO `tpshop_order_goods` VALUES ('19', '17', '20', 'ipone', '5999.00', '\\uploads\\20181107\\864297baa7e9122aea706849122d424c.png', '3', '73,75,79', '1542076668', '1542076668', null);
INSERT INTO `tpshop_order_goods` VALUES ('20', '22', '21', 'ipone', '5999.00', '\\uploads\\20181107\\864297baa7e9122aea706849122d424c.png', '1', '73,74,79', '1542076868', '1542076868', null);

-- ----------------------------
-- Table structure for tpshop_role
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_role`;
CREATE TABLE `tpshop_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色/用户组名称',
  `role_auth_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '权限ids,1,2,5，权限表中的主键集合',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_role
-- ----------------------------
INSERT INTO `tpshop_role` VALUES ('2', '主管', '1,4,5,6,7,2,8,9,10,13,14,16', '1520408547', '1541573958', null);
INSERT INTO `tpshop_role` VALUES ('3', '经理', '1,5,6,2,8,9,10,13,3,11,12', '1520408547', '1541573986', null);
INSERT INTO `tpshop_role` VALUES ('8', 'asdsdfasd', '2,8,9,10,13,14,16,3,12', '1541321453', '1541574013', null);
INSERT INTO `tpshop_role` VALUES ('9', 'ada', '2,9,10,13,14,3,11,12', '1541322196', '1541574040', null);

-- ----------------------------
-- Table structure for tpshop_type
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_type`;
CREATE TABLE `tpshop_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_type
-- ----------------------------
INSERT INTO `tpshop_type` VALUES ('3', '手机', '1541572191', '1541572191', null);
INSERT INTO `tpshop_type` VALUES ('4', '电脑', '1541572213', '1541572213', null);
INSERT INTO `tpshop_type` VALUES ('5', '家居', '1541572230', '1541572230', null);

-- ----------------------------
-- Table structure for tpshop_user
-- ----------------------------
DROP TABLE IF EXISTS `tpshop_user`;
CREATE TABLE `tpshop_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `is_check` tinyint(2) NOT NULL DEFAULT '0' COMMENT '激活状态 0未激活 1已激活',
  `email_code` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱激活验证码',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方帐号openid',
  `create_time` int(11) unsigned DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tpshop_user
-- ----------------------------
INSERT INTO `tpshop_user` VALUES ('1', '17717654139', '17717654139', '3eed70b238d57cddadebf6f74728f4ea', '', '0', '1', '', '', '1541684371', '1541684371', null);
INSERT INTO `tpshop_user` VALUES ('4', '550583092@qq.com', '', '937a9b0a02c243ab8f5d6da37b13bbd6', '550583092@qq.com', '0', '1', '1161', '', '1541762210', '1541762233', null);
INSERT INTO `tpshop_user` VALUES ('7', 'Right Now', '', '', '', '0', '1', '', '7F18FAC29DC7CB97CA72CC77624FA210', '1541772877', '1541772877', null);
