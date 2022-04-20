/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80025
Source Host           : localhost:3306
Source Database       : coderhub

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2022-04-20 16:38:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for monitor
-- ----------------------------
DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '监控id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控名称（冗余，从总设备台账中录入）',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控编号',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频流链接',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='监控信息表';

-- ----------------------------
-- Records of monitor
-- ----------------------------
INSERT INTO `monitor` VALUES ('2', '太阳能热水机房门口', '20220302193543803714', 'rtsp://admin:123456@172.17.10.20:554/media/video2/multicast', '2022-03-02 19:46:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('3', '裁判员休息室门口走廊', '20220302193543397355', 'rtsp://admin:123456@172.17.10.21:554/media/video2/multicast', '2022-03-02 19:47:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('4', '新风排烟机房门口', '20220302193605286428', 'rtsp://admin:123456@172.18.10.20:554/media/video2/multicast', '2022-03-02 19:49:46', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('5', '技术官员门厅1', '20220302193543151717', 'rtsp://admin:123456@172.17.10.22:554/media/video2/multicast', '2022-03-03 09:22:02', '2022-03-19 17:58:11');
INSERT INTO `monitor` VALUES ('6', '技术官员门厅2', '20220302193543962163', 'rtsp://admin:123456@172.17.10.23:554/media/video2/multicast', '2022-03-03 09:22:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('7', '1#弱电间走廊', '20220302193544665285', 'rtsp://admin:123456@172.17.10.24:554/media/video2/multicast', '2022-03-03 09:23:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('8', '1#弱电间旁电梯厅', '20220302193544362825', 'rtsp://admin:123456@172.17.10.25:554/media/video2/multicast', '2022-03-03 09:24:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('9', '器材库内', '20220302193544350849', 'rtsp://admin:123456@172.17.10.26:554/media/video2/multicast', '2022-03-03 09:25:40', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('10', '客队运动员门厅外侧走廊', '20220302193544609753', 'rtsp://admin:123456@172.17.10.27:554/media/video2/multicast', '2022-03-03 09:26:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('11', '客队运动员门厅1', '20220302193544594530', 'rtsp://admin:123456@172.17.10.28:554/media/video2/multicast', '2022-03-03 09:26:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('12', '客队运动员门厅2', '20220302193544696973', 'rtsp://admin:123456@172.17.10.29:554/media/video2/multicast', '2022-03-03 09:27:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('13', '客队运动员门厅内侧走廊', '20220302193544710426', 'rtsp://admin:123456@172.17.10.31:554/media/video2/multicast', '2022-03-03 09:29:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('14', '检录处1', '20220302193544154349', 'rtsp://admin:123456@172.17.10.32:554/media/video2/multicast', '2022-03-03 09:30:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('15', '志愿者办公室门口', '20220302193544254925', 'rtsp://admin:123456@172.17.10.33:554/media/video2/multicast', '2022-03-03 09:31:40', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('16', '1#器材储藏室', '20220302193544395978', 'rtsp://admin:123456@172.17.10.34:554/media/video2/multicast', '2022-03-03 09:33:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('17', '组委会就餐区1', '20220302193544198930', 'rtsp://admin:123456@172.17.10.36:554/media/video2/multicast', '2022-03-03 09:37:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('18', '组委会就餐区门外走廊1', '20220302193544746043', 'rtsp://admin:123456@172.17.10.37:554/media/video2/multicast', '2022-03-03 09:39:55', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('19', '组委会就餐区门外走廊2', '20220302193544239423', 'rtsp://admin:123456@172.17.10.38:554/media/video2/multicast', '2022-03-03 09:40:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('20', '组委会就餐区2', '20220302193544301028', 'rtsp://admin:123456@172.17.10.39:554/media/video2/multicast', '2022-03-03 09:41:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('21', '2#包厢门厅', '20220302193544646651', 'rtsp://admin:123456@172.17.10.40:554/media/video2/multicast', '2022-03-03 09:43:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('22', '2#电梯外走廊', '20220302193544453696', 'rtsp://admin:123456@172.17.10.41:554/media/video2/multicast', '2022-03-03 09:44:30', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('23', '竞赛指挥室外走廊1', '20220302193544183674', 'rtsp://admin:123456@172.17.10.42:554/media/video2/multicast', '2022-03-03 09:45:46', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('24', '竞赛指挥室外走廊2', '20220302193544453080', 'rtsp://admin:123456@172.17.10.43:554/media/video2/multicast', '2022-03-03 09:46:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('25', '竞赛指挥室门口', '20220302193544649549', 'rtsp://admin:123456@172.17.10.44:554/media/video2/multicast', '2022-03-03 09:47:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('26', '网络机房外走廊', '20220302193544983377', 'rtsp://admin:123456@172.17.10.45:554/media/video2/multicast', '2022-03-03 09:48:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('27', '网络机房内1', '20220302193544982594', 'rtsp://admin:123456@172.17.10.46:554/media/video2/multicast', '2022-03-03 09:49:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('28', '网络机房内2', '20220302193544907182', 'rtsp://admin:123456@172.17.10.47:554/media/video2/multicast', '2022-03-03 09:49:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('29', '转播机房内', '20220302193544146653', 'rtsp://admin:123456@172.17.10.48:554/media/video2/multicast', '2022-03-03 09:49:56', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('30', '组委会门厅1', '20220302193544314275', 'rtsp://admin:123456@172.17.10.49:554/media/video2/multicast', '2022-03-03 09:50:49', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('31', '组委会门厅2', '20220302193544753327', 'rtsp://admin:123456@172.17.10.50:554/media/video2/multicast', '2022-03-03 09:51:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('32', '电视转播机房门口', '20220302193605940256', 'rtsp://admin:123456@172.18.10.21:554/media/video2/multicast', '2022-03-03 09:52:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('33', '电视转播机房内', '20220302193605424370', 'rtsp://admin:123456@172.18.10.22:554/media/video2/multicast', '2022-03-03 09:53:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('34', '1-4#电梯门口', '20220302193605314599', 'rtsp://admin:123456@172.18.10.23:554/media/video2/multicast', '2022-03-03 09:54:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('35', '1-4#电梯旁包厢门厅', '20220302193605715899', 'rtsp://admin:123456@172.18.10.24:554/media/video2/multicast', '2022-03-03 09:55:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('36', '消防值班室内1', '20220302193544322431', 'rtsp://admin:123456@172.17.10.51:554/media/video2/multicast', '2022-03-03 09:55:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('37', '消防值班室内2', '20220302193544256558', 'rtsp://admin:123456@172.17.10.52:554/media/video2/multicast', '2022-03-03 09:56:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('38', '1#弱电间旁走廊', '20220302193605162330', 'rtsp://admin:123456@172.18.10.25:554/media/video2/multicast', '2022-03-03 09:56:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('39', '消防机房内', '20220302193544126407', 'rtsp://admin:123456@172.17.10.53:554/media/video2/multicast', '2022-03-03 09:57:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('40', '组委会办公区走廊', '20220302193544958728', 'rtsp://admin:123456@172.17.10.54:554/media/video2/multicast', '2022-03-03 09:57:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('41', '1分区库房门口', '20220302193605602549', 'rtsp://admin:123456@172.18.10.26:554/media/video2/multicast', '2022-03-03 09:58:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('42', '贵宾电梯厅旁楼梯', '20220302193544417661', 'rtsp://admin:123456@172.17.10.55:554/media/video2/multicast', '2022-03-03 09:58:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('43', '1-1b#楼梯', '20220302193605390922', 'rtsp://admin:123456@172.18.10.27:554/media/video2/multicast', '2022-03-03 09:59:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('44', '2#弱电间旁楼梯', '20220302193544485804', 'rtsp://admin:123456@172.17.10.56:554/media/video2/multicast', '2022-03-03 10:00:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('45', '2#器材储藏室', '20220302193544750515', 'rtsp://admin:123456@172.17.10.57:554/media/video2/multicast', '2022-03-03 10:01:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('46', '贵宾电梯厅入门', '20220302193544333271', 'rtsp://admin:123456@172.17.10.58:554/media/video2/multicast', '2022-03-03 10:02:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('47', '2#弱电间旁包厢门厅', '20220302193544237034', 'rtsp://admin:123456@172.17.10.59:554/media/video2/multicast', '2022-03-03 10:03:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('48', '10kV分变电所门口', '20220302193544503944', 'rtsp://admin:123456@172.17.10.60:554/media/video2/multicast', '2022-03-03 10:04:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('49', '新闻媒体办公门口', '20220302193544141122', 'rtsp://admin:123456@172.17.10.61:554/media/video2/multicast', '2022-03-03 10:06:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('50', '组委会入口', '20220302193605725212', 'rtsp://admin:123456@172.18.10.28:554/media/video2/multicast', '2022-03-03 10:06:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('51', '组委会门厅', '20220302193605103121', 'rtsp://admin:123456@172.18.10.29:554/media/video2/multicast', '2022-03-03 10:06:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('52', '新闻媒体门厅1', '20220302193544566650', 'rtsp://admin:123456@172.17.10.62:554/media/video2/multicast', '2022-03-03 10:07:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('53', '组委会办公室门口', '20220302193605143884', 'rtsp://admin:123456@172.18.10.30:554/media/video2/multicast', '2022-03-03 10:07:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('54', '新闻发布厅1', '20220302193544166984', 'rtsp://admin:123456@172.17.10.63:554/media/video2/multicast', '2022-03-03 10:07:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('55', '贵宾休息室门口', '20220302193605105089', 'rtsp://admin:123456@172.18.10.31:554/media/video2/multicast', '2022-03-03 10:08:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('56', '新闻媒体门厅2', '20220302193544863621', 'rtsp://admin:123456@172.17.10.64:554/media/video2/multicast', '2022-03-03 10:08:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('57', '贵宾接待大厅电梯厅', '20220302193605655366', 'rtsp://admin:123456@172.18.10.32:554/media/video2/multicast', '2022-03-03 10:09:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('58', '3#弱电间门口走廊', '20220302193544104540', 'rtsp://admin:123456@172.17.10.65:554/media/video2/multicast', '2022-03-03 10:10:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('59', '新闻发布厅2', '20220302193544900789', 'rtsp://admin:123456@172.17.10.66:554/media/video2/multicast', '2022-03-03 10:10:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('60', '新闻发布厅内1', '20220302193605170411', 'rtsp://admin:123456@172.18.10.33:554/media/video2/multicast', '2022-03-03 10:10:40', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('61', '3#包厢门厅1', '20220302193544887495', 'rtsp://admin:123456@172.17.10.67:554/media/video2/multicast', '2022-03-03 10:11:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('62', '同声传译室门口', '20220302193605875856', 'rtsp://admin:123456@172.18.10.34:554/media/video2/multicast', '2022-03-03 10:12:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('63', '贵宾入口门厅', '20220302193544124548', 'rtsp://admin:123456@172.17.10.68:554/media/video2/multicast', '2022-03-03 10:12:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('64', '贵宾电梯厅', '20220302193544423050', 'rtsp://admin:123456@172.17.10.69:554/media/video2/multicast', '2022-03-03 10:12:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('65', '贵宾休息室外走廊', '20220302193544140607', 'rtsp://admin:123456@172.17.10.70:554/media/video2/multicast', '2022-03-03 10:13:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('66', '媒体休息室门口', '20220302193605406965', 'rtsp://admin:123456@172.18.10.35:554/media/video2/multicast', '2022-03-03 10:13:45', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('67', '媒体工作区外走廊', '20220302193544476735', 'rtsp://admin:123456@172.17.10.71:554/media/video2/multicast', '2022-03-03 10:14:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('68', '新闻发布厅内2', '20220302193605793319', 'rtsp://admin:123456@172.18.10.36:554/media/video2/multicast', '2022-03-03 10:14:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('69', '新闻媒体出入口', '20220302193605383319', 'rtsp://admin:123456@172.18.10.37:554/media/video2/multicast', '2022-03-03 10:15:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('70', '贵宾过厅', '20220302193544873971', 'rtsp://admin:123456@172.17.10.72:554/media/video2/multicast', '2022-03-03 10:15:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('72', '新闻大厅1', '20220302193605736266', 'rtsp://admin:123456@172.18.10.38:554/media/video2/multicast', '2022-03-03 10:16:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('73', '新闻官员办公外走廊2', '20220302193544926634', 'rtsp://admin:123456@172.17.10.74:554/media/video2/multicast', '2022-03-03 10:16:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('74', '新闻大厅2', '20220302193605247138', 'rtsp://admin:123456@172.18.10.39:554/media/video2/multicast', '2022-03-03 10:16:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('75', '10kV分变电所', '20220302193544152232', 'rtsp://admin:123456@172.17.10.75:554/media/video2/multicast', '2022-03-03 10:17:18', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('76', '媒体办公室门口', '20220302193605485619', 'rtsp://admin:123456@172.18.10.40:554/media/video2/multicast', '2022-03-03 10:17:28', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('77', '1-2a楼梯', '20220302193605979710', 'rtsp://admin:123456@172.18.10.41:554/media/video2/multicast', '2022-03-03 10:19:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('78', '1-2b楼梯', '20220302193605235707', 'rtsp://admin:123456@172.18.10.42:554/media/video2/multicast', '2022-03-03 10:20:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('79', '3#包厢门厅旁楼梯', '20220302193544223010', 'rtsp://admin:123456@172.17.10.76:554/media/video2/multicast', '2022-03-03 10:21:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('80', '主外席台观众出入口', '20220302193605436822', 'rtsp://admin:123456@172.18.10.43:554/media/video2/multicast', '2022-03-03 10:22:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('81', '3#包厢门厅2', '20220302193544149053', 'rtsp://admin:123456@172.17.10.77:554/media/video2/multicast', '2022-03-03 10:22:33', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('82', '10kV分变电所东走廊1', '20220302193544768456', 'rtsp://admin:123456@172.17.10.78:554/media/video2/multicast', '2022-03-03 10:23:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('83', '10kV分变电所东走廊2', '20220302193544424047', 'rtsp://admin:123456@172.17.10.79:554/media/video2/multicast', '2022-03-03 10:24:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('84', '1-1#电梯旁包厢门厅', '20220302193605201713', 'rtsp://admin:123456@172.18.10.44:554/media/video2/multicast', '2022-03-03 10:24:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('85', '工作人员门厅旁库房门口', '20220302193544898217', 'rtsp://admin:123456@172.17.10.80:554/media/video2/multicast', '2022-03-03 10:24:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('86', '工作人员门厅1', '20220302193544379971', 'rtsp://admin:123456@172.17.10.81:554/media/video2/multicast', '2022-03-03 10:25:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('87', '1-1#电梯口', '20220302193605499563', 'rtsp://admin:123456@172.18.10.45:554/media/video2/multicast', '2022-03-03 10:25:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('88', '工作人员门厅2', '20220302193544491976', 'rtsp://admin:123456@172.17.10.82:554/media/video2/multicast', '2022-03-03 10:25:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('89', '3分区新风排烟机房门口', '20220302193605963269', 'rtsp://admin:123456@172.18.10.46:554/media/video2/multicast', '2022-03-03 10:26:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('90', '4号弱电间外走廊', '20220302193544155844', 'rtsp://admin:123456@172.17.10.83:554/media/video2/multicast', '2022-03-03 10:26:38', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('91', '赛事技术用房门口', '20220302193605411037', 'rtsp://admin:123456@172.18.10.47:554/media/video2/multicast', '2022-03-03 10:27:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('92', '检录处2', '20220302193544340764', 'rtsp://admin:123456@172.17.10.84:554/media/video2/multicast', '2022-03-03 10:27:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('93', '组委会办公室门口', '20220302193605718050', 'rtsp://admin:123456@172.18.10.48:554/media/video2/multicast', '2022-03-03 10:28:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('94', '监测等候室外走廊', '20220302193544984681', 'rtsp://admin:123456@172.17.10.85:554/media/video2/multicast', '2022-03-03 10:28:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('95', '志愿者办公室外侧走廊', '20220302193544510590', 'rtsp://admin:123456@172.17.10.86:554/media/video2/multicast', '2022-03-03 10:28:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('96', '1-1a#楼梯', '20220302193605482353', 'rtsp://admin:123456@172.18.10.49:554/media/video2/multicast', '2022-03-03 10:29:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('97', '主队运动员门厅1', '20220302193544378242', 'rtsp://admin:123456@172.17.10.87:554/media/video2/multicast', '2022-03-03 10:29:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('98', '工作人员门厅内侧东走廊', '20220302193544571844', 'rtsp://admin:123456@172.17.10.88:554/media/video2/multicast', '2022-03-03 10:30:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('99', '主队运动员门厅2', '20220302193544240736', 'rtsp://admin:123456@172.17.10.89:554/media/video2/multicast', '2022-03-03 10:30:34', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('100', '4#弱电间旁电梯厅', '20220302193544190657', 'rtsp://admin:123456@172.17.10.90:554/media/video2/multicast', '2022-03-03 10:31:28', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('101', '体育照明配电间', '20220302193605312494', 'rtsp://admin:123456@172.18.10.50:554/media/video2/multicast', '2022-03-03 10:31:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('102', '主队运动员门厅旁走廊', '20220302193544475541', 'rtsp://admin:123456@172.17.10.91:554/media/video2/multicast', '2022-03-03 10:32:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('103', '4分区预留设备机房', '20220302193605178452', 'rtsp://admin:123456@172.18.10.51:554/media/video2/multicast', '2022-03-03 10:32:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('104', '包厢观众出入口', '20220302193605787939', 'rtsp://admin:123456@172.18.10.52:554/media/video2/multicast', '2022-03-03 10:33:12', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('105', '10kV分变电所2', '20220302193544682217', 'rtsp://admin:123456@172.17.10.92:554/media/video2/multicast', '2022-03-03 10:33:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('106', '1-8#电梯口', '20220302193605420471', 'rtsp://admin:123456@172.18.10.53:554/media/video2/multicast', '2022-03-03 10:34:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('107', '4#弱电间旁楼梯', '20220302193544756877', 'rtsp://admin:123456@172.17.10.93:554/media/video2/multicast', '2022-03-03 10:34:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('108', '检录处入口', '20220302193544844992', 'rtsp://admin:123456@172.17.10.94:554/media/video2/multicast', '2022-03-03 10:34:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('109', '训练馆走廊北', '20220302193544671672', 'rtsp://admin:123456@172.17.10.95:554/media/video2/multicast', '2022-03-03 10:36:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('110', '训练馆器材库1', '20220302193544756230', 'rtsp://admin:123456@172.17.10.96:554/media/video2/multicast', '2022-03-03 10:36:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('111', '训练馆器材库2', '20220302193544627095', 'rtsp://admin:123456@172.17.10.97:554/media/video2/multicast', '2022-03-03 10:37:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('112', '北赛后利用门厅内', '20220302193544654643', 'rtsp://admin:123456@172.17.10.98:554/media/video2/multicast', '2022-03-03 10:37:56', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('113', '北赛后利用门厅外', '20220302193544674137', 'rtsp://admin:123456@172.17.10.99:554/media/video2/multicast', '2022-03-03 10:38:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('114', '训练馆门厅', '20220302193544746262', 'rtsp://admin:123456@172.17.10.100:554/media/video2/multicast', '2022-03-03 10:38:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('115', '南赛后利用厅外', '20220302193544426779', 'rtsp://admin:123456@172.17.10.101:554/media/video2/multicast', '2022-03-03 10:39:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('119', '训练馆走廊南', '20220302193544765567', 'rtsp://admin:123456@172.17.10.106:554/media/video2/multicast', '2022-03-03 10:42:33', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('120', '配套服务用房北出入口', '20220302193605675035', 'rtsp://admin:123456@172.18.10.54:554/media/video2/multicast', '2022-03-03 10:45:40', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('121', '南赛后利用厅旁卫生间', '20220302193544463127', 'rtsp://admin:123456@172.17.10.107:554/media/video2/multicast', '2022-03-03 10:46:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('122', '4分区配套服务用房走廊1', '20220302193605884388', 'rtsp://admin:123456@172.18.10.55:554/media/video2/multicast', '2022-03-03 10:46:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('123', '南赛后利用厅内', '20220302193544132254', 'rtsp://admin:123456@172.17.10.108:554/media/video2/multicast', '2022-03-03 10:47:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('124', '4分区配套服务用房走廊2', '20220302193605534121', 'rtsp://admin:123456@172.18.10.56:554/media/video2/multicast', '2022-03-03 10:47:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('125', '训练馆分变电所内1', '20220302193544122392', 'rtsp://admin:123456@172.17.10.109:554/media/video2/multicast', '2022-03-03 10:47:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('126', '训练馆分变电所内2', '20220302193544671846', 'rtsp://admin:123456@172.17.10.110:554/media/video2/multicast', '2022-03-03 10:48:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('127', '配套服务用房东北出入口', '20220302193605417869', 'rtsp://admin:123456@172.18.10.57:554/media/video2/multicast', '2022-03-03 10:48:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('131', '4#弱电间旁大过道', '20220302193605647986', 'rtsp://admin:123456@172.18.10.58:554/media/video2/multicast', '2022-03-03 10:49:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('132', '技术官员门厅内侧走廊', '20220302193544747977', 'rtsp://admin:123456@172.17.10.30:554/media/video2/multicast', '2022-03-03 10:50:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('133', '1-1d楼梯', '20220302193605409599', 'rtsp://admin:123456@172.18.10.59:554/media/video2/multicast', '2022-03-03 10:50:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('134', '5分区配套服务用房北走廊', '20220302193605751076', 'rtsp://admin:123456@172.18.10.60:554/media/video2/multicast', '2022-03-03 10:52:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('135', '1#弱电间旁楼梯', '20220302193544962345', 'rtsp://admin:123456@172.17.10.35:554/media/video2/multicast', '2022-03-03 10:52:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('136', '服务台', '20220302193605513357', 'rtsp://admin:123456@172.18.10.61:554/media/video2/multicast', '2022-03-03 10:53:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('137', '配套服务门厅1', '20220302193605327511', 'rtsp://admin:123456@172.18.10.62:554/media/video2/multicast', '2022-03-03 10:54:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('138', '服务台前走廊', '20220302193605776852', 'rtsp://admin:123456@172.18.10.63:554/media/video2/multicast', '2022-03-03 10:55:46', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('139', '5分区配套服务用房南走廊', '20220302193605532335', 'rtsp://admin:123456@172.18.10.64:554/media/video2/multicast', '2022-03-03 10:57:28', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('140', '配套服务用房东南出入口', '20220302193605141341', 'rtsp://admin:123456@172.18.10.65:554/media/video2/multicast', '2022-03-03 10:58:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('141', '配套服务门厅2', '20220302193605316212', 'rtsp://admin:123456@172.18.10.66:554/media/video2/multicast', '2022-03-03 11:00:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('142', '1号弱电间旁电梯厅', '20220302194223965282', 'rtsp://admin:123456@172.17.10.113:554/media/video2/multicast', '2022-03-03 11:08:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('143', '1分区2号走廊1', '20220302194223710167', 'rtsp://admin:123456@172.17.10.114:554/media/video2/multicast', '2022-03-03 11:09:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('144', '1-2c楼梯', '20220302193605839684', 'rtsp://admin:123456@172.18.10.67:554/media/video2/multicast', '2022-03-03 11:09:34', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('145', '1分区1号走廊内通道南', '20220302194223222533', 'rtsp://admin:123456@172.17.10.115:554/media/video2/multicast', '2022-03-03 11:09:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('146', '1分区1号走廊1', '20220302194223877815', 'rtsp://admin:123456@172.17.10.116:554/media/video2/multicast', '2022-03-03 11:10:17', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('147', '1分区3号走廊1', '20220302194223335800', 'rtsp://admin:123456@172.17.10.117:554/media/video2/multicast', '2022-03-03 11:11:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('148', '1分区4号走廊1', '20220302194223570889', 'rtsp://admin:123456@172.17.10.118:554/media/video2/multicast', '2022-03-03 11:11:46', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('149', '5#弱电间旁包厢出入口', '20220302193605244412', 'rtsp://admin:123456@172.18.10.68:554/media/video2/multicast', '2022-03-03 11:12:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('150', '1分区4号走廊2', '20220302194223512737', 'rtsp://admin:123456@172.17.10.119:554/media/video2/multicast', '2022-03-03 11:12:55', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('151', '6分区配套服务用房走廊1', '20220302193605219341', 'rtsp://admin:123456@172.18.10.69:554/media/video2/multicast', '2022-03-03 11:13:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('152', '1分区3号走廊2', '20220302194223321177', 'rtsp://admin:123456@172.17.10.120:554/media/video2/multicast', '2022-03-03 11:13:42', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('153', '6分区配套服务用房走廊2', '20220302193605854547', 'rtsp://admin:123456@172.18.10.70:554/media/video2/multicast', '2022-03-03 11:14:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('154', '1号弱电间旁疏散出口', '20220302194223625133', 'rtsp://admin:123456@172.17.10.121:554/media/video2/multicast', '2022-03-03 11:14:30', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('155', '1分区2号走廊外环1', '20220302194223148433', 'rtsp://admin:123456@172.17.10.122:554/media/video2/multicast', '2022-03-03 11:15:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('156', '1分区2号走廊内楼梯', '20220302194223924396', 'rtsp://admin:123456@172.17.10.123:554/media/video2/multicast', '2022-03-03 11:16:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('157', '配套服务用房南出入口1', '20220302193605983346', 'rtsp://admin:123456@172.18.10.71:554/media/video2/multicast', '2022-03-03 11:16:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('158', '1-5#电梯口', '20220302193605353425', 'rtsp://admin:123456@172.18.10.72:554/media/video2/multicast', '2022-03-03 11:22:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('159', '隔油池门口', '20220302193605171197', 'rtsp://admin:123456@172.18.10.73:554/media/video2/multicast', '2022-03-03 11:23:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('160', '6#弱电间旁预留设备机房', '20220302193605997671', 'rtsp://admin:123456@172.18.10.74:554/media/video2/multicast', '2022-03-03 11:23:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('161', '消防水泵房外', '20220302193605176595', 'rtsp://admin:123456@172.18.10.75:554/media/video2/multicast', '2022-03-03 11:25:17', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('162', '1分区1号走廊内楼梯', '20220302194223986868', 'rtsp://admin:123456@172.17.10.124:554/media/video2/multicast', '2022-03-03 11:26:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('163', '1-1c楼梯', '20220302193605273101', 'rtsp://admin:123456@172.18.10.76:554/media/video2/multicast', '2022-03-03 13:29:34', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('164', '配套服务用房南出入口2', '20220302193605617677', 'rtsp://admin:123456@172.18.10.77:554/media/video2/multicast', '2022-03-03 13:30:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('165', '裁判员休息室外', '20220302193605298223', 'rtsp://admin:123456@172.18.10.78:554/media/video2/multicast', '2022-03-03 13:31:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('166', '体育器材库房', '20220302193605574834', 'rtsp://admin:123456@172.18.10.79:554/media/video2/multicast', '2022-03-03 13:32:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('167', '消防水泵房内1', '20220302193605243551', 'rtsp://admin:123456@172.18.10.80:554/media/video2/multicast', '2022-03-03 13:33:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('168', '网络机房1', '20220302193605192046', 'rtsp://admin:123456@172.18.10.81:554/media/video2/multicast', '2022-03-03 13:35:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('169', '消防设备间', '20220302193605822879', 'rtsp://admin:123456@172.18.10.82:554/media/video2/multicast', '2022-03-03 13:35:49', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('170', '消防监控中心1', '20220302193605690021', 'rtsp://admin:123456@172.18.10.83:554/media/video2/multicast', '2022-03-03 13:36:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('171', '消防监控中心外走廊', '20220302193605469081', 'rtsp://admin:123456@172.18.10.84:554/media/video2/multicast', '2022-03-03 13:37:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('172', '消防监控中心2', '20220302193605167182', 'rtsp://admin:123456@172.18.10.85:554/media/video2/multicast', '2022-03-03 13:50:12', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('173', '1-2#10kV分变电所外走廊', '20220302193605925878', 'rtsp://admin:123456@172.18.10.86:554/media/video2/multicast', '2022-03-03 13:52:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('174', '预留设备间1', '20220302193605710860', 'rtsp://admin:123456@172.18.10.87:554/media/video2/multicast', '2022-03-03 13:52:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('175', '网络机房2', '20220302193605540249', 'rtsp://admin:123456@172.18.10.88:554/media/video2/multicast', '2022-03-03 13:53:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('176', '通信机房', '20220302193605712931', 'rtsp://admin:123456@172.18.10.89:554/media/video2/multicast', '2022-03-03 13:54:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('177', '预留设备间2', '20220302193605926284', 'rtsp://admin:123456@172.18.10.90:554/media/video2/multicast', '2022-03-03 13:54:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('178', '7#弱电间门口', '20220302193605877956', 'rtsp://admin:123456@172.18.10.91:554/media/video2/multicast', '2022-03-03 13:55:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('179', '有线电视机房门口', '20220302193605640498', 'rtsp://admin:123456@172.18.10.92:554/media/video2/multicast', '2022-03-03 13:56:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('180', '后勤出入口', '20220302193605137669', 'rtsp://admin:123456@172.18.10.93:554/media/video2/multicast', '2022-03-03 13:57:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('181', '消防水泵外走廊1', '20220302193605287400', 'rtsp://admin:123456@172.18.10.94:554/media/video2/multicast', '2022-03-03 13:58:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('182', '消防水泵外走廊2', '20220302193605692944', 'rtsp://admin:123456@172.18.10.95:554/media/video2/multicast', '2022-03-03 13:58:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('183', '运动员急救室门口', '20220302193606490903', 'rtsp://admin:123456@172.18.10.96:554/media/video2/multicast', '2022-03-03 13:59:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('184', '1-2#10kV分变电所1', '20220302193606706403', 'rtsp://admin:123456@172.18.10.97:554/media/video2/multicast', '2022-03-03 14:01:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('185', '1-2#10kV分变电所2', '20220302193606976540', 'rtsp://admin:123456@172.18.10.98:554/media/video2/multicast', '2022-03-03 14:01:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('188', '消防水泵房', '20220302193606568037', 'rtsp://admin:123456@172.18.10.99:554/media/video2/multicast', '2022-03-03 14:03:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('189', '贵宾门厅内', '20220302194223307852', 'rtsp://admin:123456@172.17.10.128:554/media/video2/multicast', '2022-03-03 14:03:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('190', '观众急救室外', '20220302193606417923', 'rtsp://admin:123456@172.18.10.100:554/media/video2/multicast', '2022-03-03 14:04:39', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('191', '2分区3号走廊', '20220302194223621793', 'rtsp://admin:123456@172.17.10.129:554/media/video2/multicast', '2022-03-03 14:05:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('192', '2分区包厢电梯厅', '20220302194223858443', 'rtsp://admin:123456@172.17.10.130:554/media/video2/multicast', '2022-03-03 14:06:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('193', '2分区2号走廊1', '20220302194223599479', 'rtsp://admin:123456@172.17.10.131:554/media/video2/multicast', '2022-03-03 14:06:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('194', '2分区1号走廊1', '20220302194223742906', 'rtsp://admin:123456@172.17.10.132:554/media/video2/multicast', '2022-03-03 14:07:18', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('195', '新闻发布厅东走廊', '20220302193606469257', 'rtsp://admin:123456@172.18.10.101:554/media/video2/multicast', '2022-03-03 14:08:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('196', '2分区3号走廊内楼梯', '20220302194223910496', 'rtsp://admin:123456@172.17.10.133:554/media/video2/multicast', '2022-03-03 14:08:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('197', '8#弱电间外走廊', '20220302193606191257', 'rtsp://admin:123456@172.18.10.102:554/media/video2/multicast', '2022-03-03 14:09:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('198', '2号疏散大厅2', '20220302194223289741', 'rtsp://admin:123456@172.17.10.138:554/media/video2/multicast', '2022-03-03 14:09:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('199', '大媒体办公室东走廊', '20220302193606703009', 'rtsp://admin:123456@172.18.10.103:554/media/video2/multicast', '2022-03-03 14:09:57', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('200', '1号疏散大厅1', '20220302194223821166', 'rtsp://admin:123456@172.17.10.135:554/media/video2/multicast', '2022-03-03 14:11:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('201', '2号疏散大厅南电梯', '20220302194223287662', 'rtsp://admin:123456@172.17.10.140:554/media/video2/multicast', '2022-03-03 14:27:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('202', '3号疏散大厅包厢电梯厅', '20220302194223245104', 'rtsp://admin:123456@172.17.10.141:554/media/video2/multicast', '2022-03-03 14:29:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('203', '3分区1号走廊', '20220302194223339779', 'rtsp://admin:123456@172.17.10.142:554/media/video2/multicast', '2022-03-03 14:29:40', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('204', '2号疏散大厅电梯门厅', '20220302194223407939', 'rtsp://admin:123456@72.17.10.143:554/media/video2/multicast', '2022-03-03 14:30:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('205', '3分区3号走廊1', '20220302194223656876', 'rtsp://admin:123456@172.17.10.144:554/media/video2/multicast', '2022-03-03 14:32:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('206', '3分区2号走廊1', '20220302194223439175', 'rtsp://admin:123456@172.17.10.145:554/media/video2/multicast', '2022-03-03 14:33:28', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('207', '3分区1号走廊楼梯', '20220302194223477526', 'rtsp://admin:123456@172.17.10.149:554/media/video2/multicast', '2022-03-03 14:34:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('208', '3分区3号走廊3', '20220302194223897101', 'rtsp://admin:123456@172.17.10.150:554/media/video2/multicast', '2022-03-03 14:36:07', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('209', '3分区2号走廊3', '20220302194223478929', 'rtsp://admin:123456@172.17.10.151:554/media/video2/multicast', '2022-03-03 14:36:40', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('210', '8分区足球运动员热身区1', '20220302193606738521', 'rtsp://admin:123456@172.18.10.104:554/media/video2/multicast', '2022-03-03 14:38:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('211', '2#电梯包厢电梯厅', '20220302194223464968', 'rtsp://admin:123456@172.17.10.152:554/media/video2/multicast', '2022-03-03 14:38:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('212', '8分区足球运动员热身区2', '20220302193606878803', 'rtsp://admin:123456@172.18.10.105:554/media/video2/multicast', '2022-03-03 14:39:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('213', '4分区3号走廊', '20220302194223973291', 'rtsp://admin:123456@172.17.10.153:554/media/video2/multicast', '2022-03-03 14:39:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('214', '排烟机房门口', '20220302193606674186', 'rtsp://admin:123456@172.18.10.106:554/media/video2/multicast', '2022-03-03 14:39:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('215', '1分区1号走廊内通道北', '20220302194223390152', 'rtsp://admin:123456@172.17.10.154:554/media/video2/multicast', '2022-03-03 14:41:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('216', '教练休息室门口', '20220302193606710328', 'rtsp://admin:123456@172.18.10.107:554/media/video2/multicast', '2022-03-03 14:42:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('217', '4分区2号走廊内', '20220302194223208255', 'rtsp://admin:123456@172.17.10.155:554/media/video2/multicast', '2022-03-03 14:42:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('218', '成绩分发室外门厅', '20220302193606544615', 'rtsp://admin:123456@172.18.10.108:554/media/video2/multicast', '2022-03-03 14:43:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('219', '4分区1号走廊内', '20220302194223875104', 'rtsp://admin:123456@172.17.10.156:554/media/video2/multicast', '2022-03-03 14:43:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('220', '裁判员更衣室内走廊', '20220302193606322471', 'rtsp://admin:123456@172.18.10.109:554/media/video2/multicast', '2022-03-03 14:44:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('221', '4分区1号走廊外1', '20220302194223951228', 'rtsp://admin:123456@172.17.10.157:554/media/video2/multicast', '2022-03-03 14:45:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('222', '9分区足球运动员热身区1', '20220302193606302807', 'rtsp://admin:123456@172.18.10.110:554/media/video2/multicast', '2022-03-03 14:46:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('223', '3#弱电间旁走廊', '20220302193606795945', 'rtsp://admin:123456@172.18.10.111:554/media/video2/multicast', '2022-03-03 14:46:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('224', '裁判员更衣室外走廊', '20220302193606534549', 'rtsp://admin:123456@172.18.10.112:554/media/video2/multicast', '2022-03-03 14:47:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('225', '4分区2号走廊外1', '20220302194223720412', 'rtsp://admin:123456@172.17.10.158:554/media/video2/multicast', '2022-03-03 14:47:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('226', '2#电梯旁疏散出口', '20220302194223839541', 'rtsp://admin:123456@172.17.10.159:554/media/video2/multicast', '2022-03-03 14:48:17', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('227', '运动员出入口', '20220302193606847138', 'rtsp://admin:123456@172.18.10.113:554/media/video2/multicast', '2022-03-03 14:48:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('228', '4#弱电间外1', '20220302194223948353', 'rtsp://admin:123456@172.17.10.160:554/media/video2/multicast', '2022-03-03 14:49:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('229', '9分区足球运动员热身区2', '20220302193606132714', 'rtsp://admin:123456@172.18.10.114:554/media/video2/multicast', '2022-03-03 14:49:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('230', '9分区足球运动员热身区走廊', '20220302193606143219', 'rtsp://admin:123456@172.18.10.115:554/media/video2/multicast', '2022-03-03 14:49:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('231', '4#室外楼梯疏散出口1', '20220302194223147411', 'rtsp://admin:123456@172.17.10.161:554/media/video2/multicast', '2022-03-03 14:50:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('232', '4分区3号走廊内楼梯', '20220302194223904269', 'rtsp://admin:123456@172.17.10.162:554/media/video2/multicast', '2022-03-03 14:50:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('233', '9#弱电间走廊', '20220302193606583097', 'rtsp://admin:123456@172.18.10.116:554/media/video2/multicast', '2022-03-03 14:50:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('234', '裁判员休息室走廊', '20220302193606706997', 'rtsp://admin:123456@172.18.10.117:554/media/video2/multicast', '2022-03-03 14:51:38', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('235', '内主席台观众出入口', '20220302193606893396', 'rtsp://admin:123456@172.18.10.118:554/media/video2/multicast', '2022-03-03 14:52:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('236', '运动员门厅1', '20220302193606340494', 'rtsp://admin:123456@172.18.10.119:554/media/video2/multicast', '2022-03-03 14:53:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('237', '运动员门厅2', '20220302193606763527', 'rtsp://admin:123456@172.18.10.120:554/media/video2/multicast', '2022-03-03 14:54:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('238', '西北大过道1', '20220302193606322951', 'rtsp://admin:123456@172.18.10.121:554/media/video2/multicast', '2022-03-03 14:55:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('239', '正西区运动员出入口', '20220302193606384070', 'rtsp://admin:123456@172.18.10.122:554/media/video2/multicast', '2022-03-03 14:55:57', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('240', '1号互动平台外通廊1', '20220302194253976875', 'rtsp://admin:123456@172.17.10.170:554/media/video2/multicast', '2022-03-03 14:56:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('241', '1号互动平台内', '20220302194253859936', 'rtsp://admin:123456@172.17.10.171:554/media/video2/multicast', '2022-03-03 14:57:12', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('245', '1#弱电间外通廊', '20220302194253959308', 'rtsp://admin:123456@172.17.10.172:554/media/video2/multicast', '2022-03-03 14:57:46', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('246', '热身跑道1', '20220302193606839063', 'rtsp://admin:123456@172.18.10.123:554/media/video2/multicast', '2022-03-03 14:57:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('247', '1#电梯廊桥', '20220302194253758865', 'rtsp://admin:123456@172.17.10.173:554/media/video2/multicast', '2022-03-03 14:58:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('248', '1#电梯包厢电梯厅', '20220302194253526416', 'rtsp://admin:123456@172.17.10.174:554/media/video2/multicast', '2022-03-03 14:59:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('251', '10分区门斗5', '20220302193606635313', 'rtsp://admin:123456@172.18.10.124:554/media/video2/multicast', '2022-03-03 14:59:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('252', '1分区配套服务间外通廊', '20220302194253716460', 'rtsp://admin:123456@172.17.10.175:554/media/video2/multicast', '2022-03-03 14:59:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('253', '2#楼梯出口', '20220302194253272572', 'rtsp://admin:123456@172.17.10.176:554/media/video2/multicast', '2022-03-03 15:00:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('254', '检录大厅1', '20220302193606502008', 'rtsp://admin:123456@172.18.10.125:554/media/video2/multicast', '2022-03-03 15:00:36', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('255', '1分区疏散通廊北', '20220302194253425973', 'rtsp://admin:123456@172.17.10.177:554/media/video2/multicast', '2022-03-03 15:00:39', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('256', '1#弱电间旁楼梯', '20220302194253264544', 'rtsp://admin:123456@172.17.10.178:554/media/video2/multicast', '2022-03-03 15:01:18', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('257', '疏散大厅1', '20220302194253666901', 'rtsp://admin:123456@172.17.10.179:554/media/video2/multicast', '2022-03-03 15:02:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('258', '检录大厅2', '20220302193606793756', 'rtsp://admin:123456@172.18.10.126:554/media/video2/multicast', '2022-03-03 15:02:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('259', '2分区疏散通廊北', '20220302194253929690', 'rtsp://admin:123456@172.17.10.180:554/media/video2/multicast', '2022-03-03 15:02:38', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('260', '检录大厅后勤出入口1', '20220302193606527550', 'rtsp://admin:123456@172.18.10.127:554/media/video2/multicast', '2022-03-03 15:03:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('261', '检录大厅3', '20220302193606689319', 'rtsp://admin:123456@172.18.10.128:554/media/video2/multicast', '2022-03-03 15:04:07', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('262', '2#弱电间外通廊', '20220302194253475675', 'rtsp://admin:123456@172.17.10.181:554/media/video2/multicast', '2022-03-03 15:04:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('263', '2号互动平台外疏散通廊', '20220302194253686392', 'rtsp://admin:123456@172.17.10.182:554/media/video2/multicast', '2022-03-03 15:04:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('264', '2号互动平台内', '20220302194253381341', 'rtsp://admin:123456@172.17.10.183:554/media/video2/multicast', '2022-03-03 15:05:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('265', '检录大厅4', '20220302193606228564', 'rtsp://admin:123456@172.18.10.129:554/media/video2/multicast', '2022-03-03 15:05:07', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('266', '3F-1#卫生间门口', '20220302194253983547', 'rtsp://admin:123456@172.17.10.184:554/media/video2/multicast', '2022-03-03 15:05:38', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('267', '热身区运动员通道1', '20220302193606974584', 'rtsp://admin:123456@172.18.10.130:554/media/video2/multicast', '2022-03-03 15:05:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('268', '3F-5#卫生间门口', '20220302194254131994', 'rtsp://admin:123456@172.17.10.185:554/media/video2/multicast', '2022-03-03 15:07:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('269', '3号互动平台内', '20220302194254620296', 'rtsp://admin:123456@172.17.10.186:554/media/video2/multicast', '2022-03-03 15:07:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('270', '热身跑道2', '20220302193606961189', 'rtsp://admin:123456@172.18.10.131:554/media/video2/multicast', '2022-03-03 15:07:34', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('271', '3号互动平台外通廊', '20220302194254885083', 'rtsp://admin:123456@172.17.10.187:554/media/video2/multicast', '2022-03-03 15:07:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('272', '热身区运动员通道2', '20220302193606498634', 'rtsp://admin:123456@172.18.10.132:554/media/video2/multicast', '2022-03-03 15:08:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('273', '疏散大厅2', '20220302194254982020', 'rtsp://admin:123456@172.17.10.188:554/media/video2/multicast', '2022-03-03 15:08:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('274', '后勤出入口2', '20220302193606805928', 'rtsp://admin:123456@172.18.10.133:554/media/video2/multicast', '2022-03-03 15:08:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('275', '4分区疏散通廊西', '20220302194254295546', 'rtsp://admin:123456@172.17.10.189:554/media/video2/multicast', '2022-03-03 15:10:17', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('276', '4号互动平台外通廊', '20220302194254694621', 'rtsp://admin:123456@172.17.10.190:554/media/video2/multicast', '2022-03-03 15:10:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('277', '4号互动平台内', '20220302194254835813', 'rtsp://admin:123456@172.17.10.191:554/media/video2/multicast', '2022-03-03 15:10:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('278', '4#弱电间门口', '20220302194254333568', 'rtsp://admin:123456@172.17.10.192:554/media/video2/multicast', '2022-03-03 15:11:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('279', '2#电梯包厢电梯厅', '20220302194254236151', 'rtsp://admin:123456@172.17.10.193:554/media/video2/multicast', '2022-03-03 15:11:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('280', '2号电梯廊桥', '20220302194254745977', 'rtsp://admin:123456@172.17.10.194:554/media/video2/multicast', '2022-03-03 15:12:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('281', '4分区配套服务间外通廊', '20220302194254671416', 'rtsp://admin:123456@172.17.10.195:554/media/video2/multicast', '2022-03-03 15:12:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('282', '3#楼梯出口', '20220302194254748497', 'rtsp://admin:123456@172.17.10.196:554/media/video2/multicast', '2022-03-03 15:13:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('283', '4分区疏散通廊南', '20220302194254409267', 'rtsp://admin:123456@172.17.10.197:554/media/video2/multicast', '2022-03-03 15:13:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('284', '1分区疏散大厅空调机房门口', '20220302194339247935', 'rtsp://admin:123456@172.17.10.198:554/media/video2/multicast', '2022-03-03 15:15:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('285', '西北大过道2', '20220302193606230221', 'rtsp://admin:123456@172.18.10.134:554/media/video2/multicast', '2022-03-03 15:15:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('286', '1#电梯连廊', '20220302194339507296', 'rtsp://admin:123456@172.17.10.199:554/media/video2/multicast', '2022-03-03 15:16:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('287', '1#电梯包厢电梯厅', '20220302194339319030', 'rtsp://admin:123456@172.17.10.200:554/media/video2/multicast', '2022-03-03 15:17:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('288', '总变配电所1', '20220302193606190051', 'rtsp://admin:123456@172.18.10.135:554/media/video2/multicast', '2022-03-03 15:17:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('289', '1#电梯', '20220302194339922320', 'rtsp://admin:123456@172.17.10.203:554/media/video2/multicast', '2022-03-03 15:17:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('290', '体育器材库房1', '20220302193606857701', 'rtsp://admin:123456@172.18.10.136:554/media/video2/multicast', '2022-03-03 15:18:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('291', '1#弱电间门口', '20220302194339323610', 'rtsp://admin:123456@172.17.10.201:554/media/video2/multicast', '2022-03-03 15:18:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('292', '总变配电所2', '20220302193606796097', 'rtsp://admin:123456@172.18.10.137:554/media/video2/multicast', '2022-03-03 15:18:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('293', '1分区走廊北', '20220302194339539469', 'rtsp://admin:123456@172.17.10.202:554/media/video2/multicast', '2022-03-03 15:19:12', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('294', '体育器材库房2', '20220302193606842350', 'rtsp://admin:123456@172.18.10.138:554/media/video2/multicast', '2022-03-03 15:19:28', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('295', '东北大过道', '20220302193606288950', 'rtsp://admin:123456@172.18.10.139:554/media/video2/multicast', '2022-03-03 15:20:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('296', '2分区走廊北', '20220302194339678024', 'rtsp://admin:123456@172.17.10.204:554/media/video2/multicast', '2022-03-03 15:20:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('297', '总变配电所走廊1', '20220302193606704973', 'rtsp://admin:123456@172.18.10.140:554/media/video2/multicast', '2022-03-03 15:20:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('298', '6#电梯旁走廊', '20220302194339286624', 'rtsp://admin:123456@172.17.10.205:554/media/video2/multicast', '2022-03-03 15:21:18', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('299', '总变配电所走廊2', '20220302193606378545', 'rtsp://admin:123456@172.18.10.141:554/media/video2/multicast', '2022-03-03 15:21:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('300', '6#电梯外', '20220302194339510598', 'rtsp://admin:123456@172.17.10.206:554/media/video2/multicast', '2022-03-03 15:22:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('301', '6#电梯内', '20220302194339458989', 'rtsp://admin:123456@172.17.10.210:554/media/video2/multicast', '2022-03-03 15:26:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('302', '2分区库房门口', '20220302194339135878', 'rtsp://admin:123456@172.17.10.207:554/media/video2/multicast', '2022-03-03 15:27:55', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('303', '2分区赛山安保观察门口', '20220302194339380934', 'rtsp://admin:123456@172.17.10.208:554/media/video2/multicast', '2022-03-03 15:28:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('304', '2分区加压机房门口', '20220302194339906896', 'rtsp://admin:123456@172.17.10.209:554/media/video2/multicast', '2022-03-03 15:29:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('305', '3分区显示屏控制室门口', '20220302194339345054', 'rtsp://admin:123456@172.17.10.211:554/media/video2/multicast', '2022-03-03 15:30:38', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('306', '3分区新风与加压机房门口', '20220302194339988541', 'rtsp://admin:123456@172.17.10.212:554/media/video2/multicast', '2022-03-03 15:31:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('307', '3#电梯门口', '20220302194339238190', 'rtsp://admin:123456@172.17.10.213:554/media/video2/multicast', '2022-03-03 15:32:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('308', '3#电梯内', '20220302194339389005', 'rtsp://admin:123456@172.17.10.216:554/media/video2/multicast', '2022-03-03 15:32:36', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('309', '3#电梯外走廊', '20220302194339165821', 'rtsp://admin:123456@172.17.10.214:554/media/video2/multicast', '2022-03-03 15:32:49', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('310', '3分区走廊南', '20220302194339160537', 'rtsp://admin:123456@172.17.10.215:554/media/video2/multicast', '2022-03-03 15:33:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('311', '4分区排烟机房外', '20220302194339108467', 'rtsp://admin:123456@172.17.10.217:554/media/video2/multicast', '2022-03-03 15:34:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('312', '4分区疏散大厅空调机房外', '20220302194339351760', 'rtsp://admin:123456@172.17.10.218:554/media/video2/multicast', '2022-03-03 15:35:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('313', '4#弱电间旁库房外', '20220302194339452656', 'rtsp://admin:123456@172.17.10.219:554/media/video2/multicast', '2022-03-03 15:35:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('314', '2#电梯包厢电梯厅', '20220302194339386940', 'rtsp://admin:123456@172.17.10.220:554/media/video2/multicast', '2022-03-03 15:35:40', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('315', '2#电梯连廊', '20220302194339989068', 'rtsp://admin:123456@172.17.10.221:554/media/video2/multicast', '2022-03-03 15:35:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('316', '4分区走廊南1', '20220302194339664643', 'rtsp://admin:123456@172.17.10.222:554/media/video2/multicast', '2022-03-03 15:36:34', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('317', '4分区走廊南2', '20220302194339294778', 'rtsp://admin:123456@172.17.10.223:554/media/video2/multicast', '2022-03-03 15:36:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('318', '2#电梯内', '20220302194339104530', 'rtsp://admin:123456@172.17.10.224:554/media/video2/multicast', '2022-03-03 15:37:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('319', '1分区3通道', '20220302193828307365', 'rtsp://admin:123456@172.18.10.142:554/media/video2/multicast', '2022-03-03 15:44:49', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('320', '1分区2通道', '20220302193828142538', 'rtsp://admin:123456@172.18.10.143:554/media/video2/multicast', '2022-03-03 15:45:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('321', '2通道内圈', '20220302193828849159', 'rtsp://admin:123456@172.18.10.144:554/media/video2/multicast', '2022-03-03 15:46:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('322', '1通道内圈', '20220302193828893804', 'rtsp://admin:123456@172.18.10.145:554/media/video2/multicast', '2022-03-03 15:46:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('323', '西南观众平台外环1', '20220302193828222440', 'rtsp://admin:123456@172.18.10.146:554/media/video2/multicast', '2022-03-03 15:47:36', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('324', '1-4#电梯厅', '20220302193828798161', 'rtsp://admin:123456@172.18.10.147:554/media/video2/multicast', '2022-03-03 15:48:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('325', '西南室外平台入口1', '20220302193828878057', 'rtsp://admin:123456@172.18.10.148:554/media/video2/multicast', '2022-03-03 15:48:42', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('326', '西南观众平台外环2', '20220302193828324772', 'rtsp://admin:123456@172.18.10.149:554/media/video2/multicast', '2022-03-03 15:49:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('329', '西南观众平台外环3', '20220302193828217654', 'rtsp://admin:123456@172.18.10.150:554/media/video2/multicast', '2022-03-03 15:50:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('330', '西南观众平台外环4', '20220302193828472308', 'rtsp://admin:123456@172.18.10.151:554/media/video2/multicast', '2022-03-03 15:50:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('331', '西南观众平台外环5', '20220302193828431316', 'rtsp://admin:123456@172.18.10.152:554/media/video2/multicast', '2022-03-03 15:51:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('332', '西南观众平台外环6', '20220302193828890668', 'rtsp://admin:123456@172.18.10.153:554/media/video2/multicast', '2022-03-03 15:51:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('333', '1-8b#楼梯旁内圈', '20220302193828942762', 'rtsp://admin:123456@172.18.10.154:554/media/video2/multicast', '2022-03-03 15:51:56', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('334', '西南室外平台入口2', '20220302193828780290', 'rtsp://admin:123456@172.18.10.155:554/media/video2/multicast', '2022-03-03 15:52:45', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('335', '西南室外平台入口3', '20220302193828386088', 'rtsp://admin:123456@172.18.10.156:554/media/video2/multicast', '2022-03-03 15:53:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('345', '2分区内圈3', '20220302193828312601', 'rtsp://admin:123456@172.18.10.157:554/media/video2/multicast', '2022-03-03 16:18:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('346', '1分区4号走廊3', '20220302194223368012', 'rtsp://admin:123456@172.17.10.125:554/media/video2/multicast', '2022-03-03 16:23:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('347', '1分区3号走廊3', '20220302194223297080', 'rtsp://admin:123456@172.17.10.126:554/media/video2/multicast', '2022-03-03 16:24:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('348', '1分区2号走廊外环2', '20220302194223214280', 'rtsp://admin:123456@172.17.10.127:554/media/video2/multicast', '2022-03-03 16:25:17', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('349', '2号疏散大厅1', '20220302194223240384', 'rtsp://admin:123456@172.17.10.134:554/media/video2/multicast', '2022-03-03 16:26:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('350', '1号疏散大厅2', '20220302194223551619', 'rtsp://admin:123456@172.17.10.139:554/media/video2/multicast', '2022-03-03 16:28:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('351', '2分区2号走廊2', '20220302194223522881', 'rtsp://admin:123456@172.17.10.136:554/media/video2/multicast', '2022-03-03 16:29:39', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('352', '2分区2号走廊3', '20220302194223875444', 'rtsp://admin:123456@172.17.10.137:554/media/video2/multicast', '2022-03-03 16:30:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('353', '3分区3号走廊2', '20220302194223419582', 'rtsp://admin:123456@172.17.10.146:554/media/video2/multicast', '2022-03-03 16:31:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('354', '3分区2号走廊2', '20220302194223652389', 'rtsp://admin:123456@172.17.10.147:554/media/video2/multicast', '2022-03-03 16:32:17', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('355', '3号疏散大厅1', '20220302194223660301', 'rtsp://admin:123456@172.17.10.148:554/media/video2/multicast', '2022-03-03 16:33:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('356', '4分区1号走廊外2', '20220302194223836090', 'rtsp://admin:123456@172.17.10.163:554/media/video2/multicast', '2022-03-03 16:34:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('357', '4分区2号走廊外2', '20220302194223367120', 'rtsp://admin:123456@172.17.10.164:554/media/video2/multicast', '2022-03-03 16:35:03', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('358', '4#弱电间外2', '20220302194223814371', 'rtsp://admin:123456@172.17.10.165:554/media/video2/multicast', '2022-03-03 16:35:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('359', '4#室外楼梯疏散出口2', '20220302194223671378', 'rtsp://admin:123456@172.17.10.166:554/media/video2/multicast', '2022-03-03 16:36:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('360', '2分区3通道', '20220302193828827197', 'rtsp://admin:123456@172.18.10.158:554/media/video2/multicast', '2022-03-03 16:36:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('361', '1分区1号走廊外1', '20220302194223654215', 'rtsp://admin:123456@172.17.10.167:554/media/video2/multicast', '2022-03-03 16:37:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('362', '2分区内圈2', '20220302193828138524', 'rtsp://admin:123456@172.18.10.159:554/media/video2/multicast', '2022-03-03 16:37:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('363', '1-2#电梯厅', '20220302193828626100', 'rtsp://admin:123456@172.18.10.160:554/media/video2/multicast', '2022-03-03 16:38:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('364', '4#室外楼梯', '20220302194223527428', 'rtsp://admin:123456@172.17.10.168:554/media/video2/multicast', '2022-03-03 16:38:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('365', '2分区2通道', '20220302193828825738', 'rtsp://admin:123456@172.18.10.161:554/media/video2/multicast', '2022-03-03 16:38:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('366', '3#室外楼梯', '20220302194223877001', 'rtsp://admin:123456@172.17.10.169:554/media/video2/multicast', '2022-03-03 16:38:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('367', '2分区内圈1', '20220302193828226546', 'rtsp://admin:123456@172.18.10.162:554/media/video2/multicast', '2022-03-03 16:39:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('368', '2分区1通道', '20220302193828844326', 'rtsp://admin:123456@172.18.10.163:554/media/video2/multicast', '2022-03-03 16:39:36', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('369', '2分区内圈4', '20220302193828259518', 'rtsp://admin:123456@172.18.10.164:554/media/video2/multicast', '2022-03-03 16:40:49', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('370', '1-5a楼梯', '20220302193828910926', 'rtsp://admin:123456@172.18.10.165:554/media/video2/multicast', '2022-03-03 16:41:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('371', '1-5b楼梯', '20220302193828173353', 'rtsp://admin:123456@172.18.10.166:554/media/video2/multicast', '2022-03-03 16:42:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('372', '1-3b楼梯', '20220302193828686426', 'rtsp://admin:123456@172.18.10.167:554/media/video2/multicast', '2022-03-03 16:42:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('373', '3分区内圈2', '20220302193828311320', 'rtsp://admin:123456@172.18.10.168:554/media/video2/multicast', '2022-03-03 16:43:57', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('374', '3分区内圈1', '20220302193828786068', 'rtsp://admin:123456@172.18.10.169:554/media/video2/multicast', '2022-03-03 16:44:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('375', '训练场1', '20220302193544588811', 'rtsp://admin:123456@172.17.10.102:554/media/video2/multicast', '2022-03-03 16:44:39', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('376', '3分区1通道', '20220302193828366970', 'rtsp://admin:123456@172.18.10.170:554/media/video2/multicast', '2022-03-03 16:44:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('377', '训练场2', '20220302193544795748', 'rtsp://admin:123456@172.17.10.103:554/media/video2/multicast', '2022-03-03 16:45:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('378', '训练场3', '20220302193544272181', 'rtsp://admin:123456@172.17.10.104:554/media/video2/multicast', '2022-03-03 16:45:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('379', '3分区2通道', '20220302193828514603', 'rtsp://admin:123456@172.18.10.171:554/media/video2/multicast', '2022-03-03 16:45:30', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('380', '训练场4', '20220302193544393090', 'rtsp://admin:123456@172.17.10.105:554/media/video2/multicast', '2022-03-03 16:45:46', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('381', '训练场5', '20220302193544138199', 'rtsp://admin:123456@172.17.10.111:554/media/video2/multicast', '2022-03-03 16:46:07', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('382', '训练场6', '20220302193544476885', 'rtsp://admin:123456@172.17.10.112:554/media/video2/multicast', '2022-03-03 16:46:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('383', '1-9a楼梯旁平台内环', '20220302193828767131', 'rtsp://admin:123456@172.18.10.172:554/media/video2/multicast', '2022-03-03 16:46:28', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('384', '3分区外环4', '20220302193828745469', 'rtsp://admin:123456@172.18.10.173:554/media/video2/multicast', '2022-03-03 16:46:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('385', '马道层西南', '20220303154150604602', 'rtsp://admin:123456@172.17.10.225:554/media/video2/multicast', '2022-03-03 16:47:39', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('386', '马道层西', '20220303154150522514', 'rtsp://admin:123456@172.17.10.226:554/media/video2/multicast', '2022-03-03 16:48:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('387', '3分区外环1', '20220302193828784929', 'rtsp://admin:123456@172.18.10.174:554/media/video2/multicast', '2022-03-03 16:48:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('388', '马道层西北', '20220303154150933858', 'rtsp://admin:123456@172.17.10.227:554/media/video2/multicast', '2022-03-03 16:48:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('389', '1-3a楼梯', '20220302193828760993', 'rtsp://admin:123456@172.18.10.175:554/media/video2/multicast', '2022-03-03 16:48:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('390', '马道层北', '20220303154150341870', 'rtsp://admin:123456@172.17.10.228:554/media/video2/multicast', '2022-03-03 16:49:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('391', '1-1#电梯厅', '20220302193828932294', 'rtsp://admin:123456@172.18.10.176:554/media/video2/multicast', '2022-03-03 16:49:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('392', '马道层东北', '20220303154150820288', 'rtsp://admin:123456@172.17.10.229:554/media/video2/multicast', '2022-03-03 16:49:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('393', '3分区外环2', '20220302193828201067', 'rtsp://admin:123456@172.18.10.177:554/media/video2/multicast', '2022-03-03 16:49:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('394', '马道层北', '20220303154150855383', 'rtsp://admin:123456@172.17.10.230:554/media/video2/multicast', '2022-03-03 16:50:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('395', '马道层东南', '20220303154150854741', 'rtsp://admin:123456@172.17.10.231:554/media/video2/multicast', '2022-03-03 16:50:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('396', '3分区外环3', '20220302193828949182', 'rtsp://admin:123456@172.18.10.178:554/media/video2/multicast', '2022-03-03 16:50:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('397', '马道层南', '20220303154150505313', 'rtsp://admin:123456@172.17.10.232:554/media/video2/multicast', '2022-03-03 16:50:45', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('398', '1-1#电梯旁', '20220302193828497920', 'rtsp://admin:123456@172.18.10.179:554/media/video2/multicast', '2022-03-03 16:50:55', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('399', '1-8a楼梯', '20220302193828323354', 'rtsp://admin:123456@172.18.10.181:554/media/video2/multicast', '2022-03-03 16:53:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('400', '3分区内圈3', '20220302193828609887', 'rtsp://admin:123456@172.18.10.180:554/media/video2/multicast', '2022-03-03 16:53:55', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('401', '4分区内圈2', '20220302193828134579', 'rtsp://admin:123456@172.18.10.182:554/media/video2/multicast', '2022-03-03 16:57:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('402', '4分区1通道', '20220302193828137488', 'rtsp://admin:123456@172.18.10.183:554/media/video2/multicast', '2022-03-03 16:57:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('403', '4分区2通道', '20220302193828994476', 'rtsp://admin:123456@172.18.10.184:554/media/video2/multicast', '2022-03-03 16:58:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('404', '4分区内圈3', '20220302193828601721', 'rtsp://admin:123456@172.18.10.185:554/media/video2/multicast', '2022-03-03 16:58:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('405', '1-16#楼梯平台外环', '20220302193828964050', 'rtsp://admin:123456@172.18.10.186:554/media/video2/multicast', '2022-03-03 16:59:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('406', '1-8电梯旁外环', '20220302193828926737', 'rtsp://admin:123456@172.18.10.187:554/media/video2/multicast', '2022-03-03 17:01:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('407', '1-8#电梯厅', '20220302193828424562', 'rtsp://admin:123456@172.18.10.188:554/media/video2/multicast', '2022-03-03 17:01:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('408', '1-2-2d卫生间门口', '20220302193828844087', 'rtsp://admin:123456@172.18.10.189:554/media/video2/multicast', '2022-03-03 17:02:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('409', '4分区观众平台外环', '20220302193828695253', 'rtsp://admin:123456@172.18.10.190:554/media/video2/multicast', '2022-03-03 17:02:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('410', '4分区内圈1', '20220302193828868799', 'rtsp://admin:123456@172.18.10.191:554/media/video2/multicast', '2022-03-03 17:03:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('411', '1-15楼梯', '20220302193828936025', 'rtsp://admin:123456@172.18.10.192:554/media/video2/multicast', '2022-03-03 17:04:01', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('412', '1-16#楼梯', '20220302193828413893', 'rtsp://admin:123456@172.18.10.193:554/media/video2/multicast', '2022-03-03 17:04:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('413', '1-17楼梯', '20220302193828966787', 'rtsp://admin:123456@172.18.10.194:554/media/video2/multicast', '2022-03-03 17:05:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('414', '5分区1通道', '20220302193828405294', 'rtsp://admin:123456@172.18.10.195:554/media/video2/multicast', '2022-03-03 17:06:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('415', '5分区内圈1', '20220302193828511280', 'rtsp://admin:123456@172.18.10.196:554/media/video2/multicast', '2022-03-03 17:06:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('416', '5分区2通道', '20220302193828558872', 'rtsp://admin:123456@172.18.10.197:554/media/video2/multicast', '2022-03-03 17:07:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('417', '1-6#电梯厅', '20220302193828538603', 'rtsp://admin:123456@172.18.10.198:554/media/video2/multicast', '2022-03-03 17:08:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('418', '5分区内圈2', '20220302193828828102', 'rtsp://admin:123456@172.18.10.199:554/media/video2/multicast', '2022-03-03 17:08:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('419', '5分区内圈3', '20220302193828524454', 'rtsp://admin:123456@172.18.10.200:554/media/video2/multicast', '2022-03-03 17:09:39', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('420', '5分区3通道', '20220302193828520489', 'rtsp://admin:123456@172.18.10.201:554/media/video2/multicast', '2022-03-03 17:10:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('421', '1-4d楼梯', '20220302193828530857', 'rtsp://admin:123456@172.18.10.202:554/media/video2/multicast', '2022-03-03 17:11:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('422', '1-5d楼梯', '20220302193828249694', 'rtsp://admin:123456@172.18.10.203:554/media/video2/multicast', '2022-03-03 17:11:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('423', '1-5c楼梯', '20220302193828241563', 'rtsp://admin:123456@172.18.10.204:554/media/video2/multicast', '2022-03-03 17:12:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('424', '6分区内圈1', '20220302193828325557', 'rtsp://admin:123456@172.18.10.205:554/media/video2/multicast', '2022-03-03 17:13:17', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('425', '6分区通道1', '20220302193828338222', 'rtsp://admin:123456@172.18.10.206:554/media/video2/multicast', '2022-03-03 17:13:38', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('426', '6分区内圈2', '20220302193828350359', 'rtsp://admin:123456@172.18.10.207:554/media/video2/multicast', '2022-03-03 17:14:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('427', '6分区通道2', '20220302193828846493', 'rtsp://admin:123456@172.18.10.208:554/media/video2/multicast', '2022-03-03 17:14:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('428', '6分区内圈3', '20220302193828852229', 'rtsp://admin:123456@172.18.10.209:554/media/video2/multicast', '2022-03-03 17:15:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('429', '1-3c楼梯', '20220302193828872526', 'rtsp://admin:123456@172.18.10.210:554/media/video2/multicast', '2022-03-03 17:16:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('430', '1-5#电梯厅', '20220302193828537948', 'rtsp://admin:123456@172.18.10.211:554/media/video2/multicast', '2022-03-03 17:17:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('431', '6#弱电间外', '20220302193828528541', 'rtsp://admin:123456@172.18.10.212:554/media/video2/multicast', '2022-03-03 17:19:57', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('432', '东南室外平台入口1', '20220302193828531438', 'rtsp://admin:123456@172.18.10.213:554/media/video2/multicast', '2022-03-03 17:20:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('433', '1-10c楼梯', '20220302193828765619', 'rtsp://admin:123456@172.18.10.214:554/media/video2/multicast', '2022-03-03 17:22:56', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('434', '6分区观众平台外环2', '20220302193828601168', 'rtsp://admin:123456@172.18.10.215:554/media/video2/multicast', '2022-03-03 17:23:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('435', '6分区观众平台外环1', '20220302193828685311', 'rtsp://admin:123456@172.18.10.216:554/media/video2/multicast', '2022-03-03 17:24:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('436', '6分区内圈4', '20220302193828891815', 'rtsp://admin:123456@172.18.10.217:554/media/video2/multicast', '2022-03-03 17:25:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('437', '1-8c楼梯', '20220302193828246477', 'rtsp://admin:123456@172.18.10.218:554/media/video2/multicast', '2022-03-03 17:25:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('438', '东南室外平台入口2', '20220302193828911002', 'rtsp://admin:123456@172.18.10.219:554/media/video2/multicast', '2022-03-03 17:26:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('439', '东南室外平台入口3', '20220302193828165980', 'rtsp://admin:123456@172.18.10.220:554/media/video2/multicast', '2022-03-03 17:27:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('440', '1-7a楼梯', '20220302193828581220', 'rtsp://admin:123456@172.18.10.221:554/media/video2/multicast', '2022-03-03 17:29:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('441', '1-6d楼梯', '20220302193828491816', 'rtsp://admin:123456@172.18.10.222:554/media/video2/multicast', '2022-03-03 17:30:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('442', '1-7d楼梯', '20220302193828426470', 'rtsp://admin:123456@172.18.10.223:554/media/video2/multicast', '2022-03-03 17:30:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('443', '7分区观众平台外环1', '20220302193828704247', 'rtsp://admin:123456@172.18.10.224:554/media/video2/multicast', '2022-03-03 17:31:14', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('444', '7分区观众平台外环2', '20220302193828101244', 'rtsp://admin:123456@172.18.10.225:554/media/video2/multicast', '2022-03-03 17:31:49', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('445', '1-13#楼梯', '20220302193828537863', 'rtsp://admin:123456@172.18.10.226:554/media/video2/multicast', '2022-03-03 17:32:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('446', '1-14#楼梯', '20220302193828390761', 'rtsp://admin:123456@172.18.10.227:554/media/video2/multicast', '2022-03-03 17:33:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('447', '8分区观众平台外环1', '20220302193828467739', 'rtsp://admin:123456@172.18.10.228:554/media/video2/multicast', '2022-03-03 17:35:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('448', '8分区观众平台外环2', '20220302193828672379', 'rtsp://admin:123456@172.18.10.229:554/media/video2/multicast', '2022-03-03 17:36:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('449', '8分区观众平台外环3', '20220302193828732449', 'rtsp://admin:123456@172.18.10.230:554/media/video2/multicast', '2022-03-03 17:36:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('450', '8分区观众平台外环4', '20220302193828461645', 'rtsp://admin:123456@172.18.10.231:554/media/video2/multicast', '2022-03-03 17:37:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('451', '1-7b楼梯', '20220302193828281172', 'rtsp://admin:123456@172.18.10.232:554/media/video2/multicast', '2022-03-03 17:38:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('452', '1-6b楼梯', '20220302193828807039', 'rtsp://admin:123456@172.18.10.233:554/media/video2/multicast', '2022-03-03 17:38:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('453', '1-7c#楼梯', '20220302193828501186', 'rtsp://admin:123456@172.18.10.234:554/media/video2/multicast', '2022-03-03 17:38:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('454', '南室外平台出入口1', '20220302193828606132', 'rtsp://admin:123456@172.18.10.235:554/media/video2/multicast', '2022-03-03 17:39:47', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('455', '南室外平台出入口2', '20220302193828464327', 'rtsp://admin:123456@172.18.10.236:554/media/video2/multicast', '2022-03-03 17:40:12', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('456', '西区走廊1', '20220302194024349453', 'rtsp://admin:123456@172.18.10.241:554/media/video2/multicast', '2022-03-03 18:23:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('457', '西南扩声功放机房门口', '20220302194024531949', 'rtsp://admin:123456@172.18.10.242:554/media/video2/multicast', '2022-03-03 18:23:48', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('458', '1-4#电梯厅', '20220302194024714851', 'rtsp://admin:123456@172.18.10.243:554/media/video2/multicast', '2022-03-03 18:24:42', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('459', '西南显示屏控制室门口', '20220302194024685549', 'rtsp://admin:123456@172.18.10.244:554/media/video2/multicast', '2022-03-03 18:25:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('460', '1-4#电梯', '20220302194024930136', 'rtsp://admin:123456@172.18.10.245:554/media/video2/multicast', '2022-03-03 18:25:49', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('461', '西区走廊3', '20220302194024796952', 'rtsp://admin:123456@172.18.10.246:554/media/video2/multicast', '2022-03-03 18:26:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('462', '西区包厢门厅1', '20220302194024748675', 'rtsp://admin:123456@172.18.10.247:554/media/video2/multicast', '2022-03-03 18:28:18', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('463', '西区包厢门厅2', '20220302194024868036', 'rtsp://admin:123456@172.18.10.248:554/media/video2/multicast', '2022-03-03 18:28:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('464', '西区走廊2', '20220302194024574015', 'rtsp://admin:123456@172.18.10.249:554/media/video2/multicast', '2022-03-03 18:29:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('465', '东北扩声功放机房门口', '20220302194024177527', 'rtsp://admin:123456@172.18.11.10:554/media/video2/multicast', '2022-03-03 18:30:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('466', '1-1#电梯厅', '20220302194024365219', 'rtsp://admin:123456@172.18.11.11:554/media/video2/multicast', '2022-03-03 18:31:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('467', '西区走廊5', '20220302194024324847', 'rtsp://admin:123456@172.18.11.12:554/media/video2/multicast', '2022-03-03 18:31:56', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('468', '西区走廊4', '20220302194024945887', 'rtsp://admin:123456@172.18.11.13:554/media/video2/multicast', '2022-03-03 18:32:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('469', '1-1#电梯', '20220302194024113894', 'rtsp://admin:123456@172.18.11.14:554/media/video2/multicast', '2022-03-03 18:32:56', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('470', '北场地照明控制室门口', '20220302194024128481', 'rtsp://admin:123456@172.18.11.15:554/media/video2/multicast', '2022-03-03 18:33:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('471', '1-8#电梯厅', '20220302194024661465', 'rtsp://admin:123456@172.18.11.16:554/media/video2/multicast', '2022-03-03 18:33:59', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('472', '东区走廊1', '20220302194024420899', 'rtsp://admin:123456@172.18.11.17:554/media/video2/multicast', '2022-03-03 18:34:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('473', '东区走廊2', '20220302194024314912', 'rtsp://admin:123456@172.18.11.18:554/media/video2/multicast', '2022-03-03 18:35:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('474', '1-8#电梯', '20220302194024663678', 'rtsp://admin:123456@172.18.11.19:554/media/video2/multicast', '2022-03-03 18:35:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('475', '东区走廊3', '20220302194024967653', 'rtsp://admin:123456@172.18.11.20:554/media/video2/multicast', '2022-03-03 18:36:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('476', '东区包厢门厅1', '20220302194024144449', 'rtsp://admin:123456@172.18.11.21:554/media/video2/multicast', '2022-03-03 18:36:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('477', '东区包厢门厅2', '20220302194024745019', 'rtsp://admin:123456@172.18.11.22:554/media/video2/multicast', '2022-03-03 18:36:58', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('478', '东区走廊3', '20220302194024168567', 'rtsp://admin:123456@172.18.11.23:554/media/video2/multicast', '2022-03-03 18:37:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('479', '东区走廊4', '20220302194024461748', 'rtsp://admin:123456@172.18.11.24:554/media/video2/multicast', '2022-03-03 18:38:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('480', '东区走廊5', '20220302194024200104', 'rtsp://admin:123456@172.18.11.25:554/media/video2/multicast', '2022-03-03 18:38:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('481', '1-5#电梯厅', '20220302194024705109', 'rtsp://admin:123456@172.18.11.26:554/media/video2/multicast', '2022-03-03 18:39:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('482', '东南扩声功放机房门口', '20220302194024770986', 'rtsp://admin:123456@172.18.11.27:554/media/video2/multicast', '2022-03-03 18:39:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('483', '1-5#电梯', '20220302194024792239', 'rtsp://admin:123456@172.18.11.28:554/media/video2/multicast', '2022-03-03 18:40:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('484', '一分区3号通道', '20220302194154103428', 'rtsp://admin:123456@172.18.11.29:554/media/video2/multicast', '2022-03-04 09:16:55', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('485', '一分区2号通道', '20220302194154512815', 'rtsp://admin:123456@172.18.11.30:554/media/video2/multicast', '2022-03-04 09:18:25', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('486', '一分区3号通道', '20220302194154423069', 'rtsp://admin:123456@172.18.11.31:554/media/video2/multicast', '2022-03-04 09:19:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('487', '一分区观众平台', '20220302194155496236', 'rtsp://admin:123456@172.18.11.32:554/media/video2/multicast', '2022-03-04 09:19:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('488', '1-4b#楼梯', '20220302194155470633', 'rtsp://admin:123456@172.18.11.33:554/media/video2/multicast', '2022-03-04 09:20:04', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('489', '1-3b#楼梯1', '20220302194155269989', 'rtsp://admin:123456@172.18.11.34:554/media/video2/multicast', '2022-03-04 09:20:29', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('490', '1-3b#楼梯2', '20220302194155760423', 'rtsp://admin:123456@172.18.11.35:554/media/video2/multicast', '2022-03-04 09:20:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('491', '二分区4号通道', '20220302194155175634', 'rtsp://admin:123456@172.18.11.36:554/media/video2/multicast', '2022-03-04 09:37:57', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('492', '二分区3号通道', '20220302194155839769', 'rtsp://admin:123456@172.18.11.37:554/media/video2/multicast', '2022-03-04 09:39:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('493', '1-2#电梯厅1', '20220302194155817352', 'rtsp://admin:123456@172.18.11.38:554/media/video2/multicast', '2022-03-04 09:40:07', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('494', '二分区2号通道', '20220302194155271375', 'rtsp://admin:123456@172.18.11.39:554/media/video2/multicast', '2022-03-04 09:40:37', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('495', '二分区1号通道', '20220302194155875198', 'rtsp://admin:123456@172.18.11.40:554/media/video2/multicast', '2022-03-04 09:40:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('496', '大厅1', '20220304094246103585', 'rtsp://admin:123456@172.18.10.237:554/media/video2/multicast', '2022-03-04 09:44:00', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('497', '电梯厅', '20220304094246536853', 'rtsp://admin:123456@172.18.10.238:554/media/video2/multicast', '2022-03-04 09:44:27', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('498', '大厅2', '20220304094246522291', 'rtsp://admin:123456@172.18.10.239:554/media/video2/multicast', '2022-03-04 09:44:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('499', '大厅3', '20220304094246966784', 'rtsp://admin:123456@172.18.10.240:554/media/video2/multicast', '2022-03-04 09:45:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('500', '1-5a楼梯', '20220302194155332437', 'rtsp://admin:123456@172.18.11.41:554/media/video2/multicast', '2022-03-04 09:45:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('501', '1-2#电梯厅2', '20220302194155799213', 'rtsp://admin:123456@172.18.11.42:554/media/video2/multicast', '2022-03-04 09:46:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('502', '1-2#电梯厅3', '20220302194155961922', 'rtsp://admin:123456@172.18.11.43:554/media/video2/multicast', '2022-03-04 09:46:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('503', '1-5a楼梯', '20220302194155962889', 'rtsp://admin:123456@172.18.11.44:554/media/video2/multicast', '2022-03-04 09:47:20', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('504', '1-22a楼梯', '20220304094533283681', 'rtsp://admin:123456@172.18.11.79:554/media/video2/multicast', '2022-03-04 09:47:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('505', '1-22b楼梯', '20220304094533155648', 'rtsp://admin:123456@172.18.11.80:554/media/video2/multicast', '2022-03-04 09:48:06', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('506', '1-2#电梯', '20220302194155276996', 'rtsp://admin:123456@172.18.11.45:554/media/video2/multicast', '2022-03-04 09:48:21', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('507', '1-3#电梯', '20220302194155411633', 'rtsp://admin:123456@172.18.11.46:554/media/video2/multicast', '2022-03-04 09:48:34', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('508', '东北角01', '20220304094533136658', 'rtsp://admin:123456@172.18.11.81:554/media/video2/multicast', '2022-03-04 09:49:50', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('509', '东北角02', '20220304094533991165', 'rtsp://admin:123456@172.18.11.82:554/media/video2/multicast', '2022-03-04 09:50:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('510', '3分区3号通道', '20220302194155143040', 'rtsp://admin:123456@172.18.11.47:554/media/video2/multicast', '2022-03-04 09:51:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('511', '东北角03', '20220304094533536847', 'rtsp://admin:123456@172.18.11.83:554/media/video2/multicast', '2022-03-04 09:51:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('512', '3分区2号通道', '20220302194155937168', 'rtsp://admin:123456@172.18.11.48:554/media/video2/multicast', '2022-03-04 09:51:24', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('513', '3分区1号通道', '20220302194155960364', 'rtsp://admin:123456@172.18.11.49:554/media/video2/multicast', '2022-03-04 09:51:32', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('514', '3分区配套服务间门口', '20220302194155850051', 'rtsp://admin:123456@172.18.11.50:554/media/video2/multicast', '2022-03-04 09:51:46', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('515', '东02', '20220304094533247941', 'rtsp://admin:123456@172.18.11.84:554/media/video2/multicast', '2022-03-04 09:51:56', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('516', '1-3a楼梯1', '20220302194155805308', 'rtsp://admin:123456@172.18.11.51:554/media/video2/multicast', '2022-03-04 09:52:12', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('517', '1-3a楼梯2', '20220302194155819252', 'rtsp://admin:123456@172.18.11.52:554/media/video2/multicast', '2022-03-04 09:52:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('518', '1-4a楼梯', '20220302194155178448', 'rtsp://admin:123456@172.18.11.53:554/media/video2/multicast', '2022-03-04 09:53:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('519', '东01', '20220304094533712229', 'rtsp://admin:123456@172.18.11.85:554/media/video2/multicast', '2022-03-04 09:53:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('520', '西北角01', '20220304094533655262', 'rtsp://admin:123456@172.18.11.86:554/media/video2/multicast', '2022-03-04 09:54:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('521', '西北角02', '20220304094533544455', 'rtsp://admin:123456@172.18.11.87:554/media/video2/multicast', '2022-03-04 09:54:54', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('522', '4分区1号通道', '20220302194155135961', 'rtsp://admin:123456@172.18.11.54:554/media/video2/multicast', '2022-03-04 09:55:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('523', '4分区2号通道', '20220302194155401852', 'rtsp://admin:123456@172.18.11.55:554/media/video2/multicast', '2022-03-04 09:55:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('524', '西北角03', '20220304094533120550', 'rtsp://admin:123456@172.18.11.88:554/media/video2/multicast', '2022-03-04 09:55:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('525', '4分区3号通道', '20220302194155826181', 'rtsp://admin:123456@172.18.11.56:554/media/video2/multicast', '2022-03-04 09:55:41', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('526', '4分区配套服务间门口', '20220302194155618474', 'rtsp://admin:123456@172.18.11.57:554/media/video2/multicast', '2022-03-04 09:55:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('527', '西北角04', '20220304094533872747', 'rtsp://admin:123456@172.18.11.89:554/media/video2/multicast', '2022-03-04 09:56:09', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('528', '西01', '20220304094533503553', 'rtsp://admin:123456@172.18.11.90:554/media/video2/multicast', '2022-03-04 09:56:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('529', '西02', '20220304094533380881', 'rtsp://admin:123456@172.18.11.91:554/media/video2/multicast', '2022-03-04 09:57:22', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('530', '西03', '20220304094533362183', 'rtsp://admin:123456@172.18.11.92:554/media/video2/multicast', '2022-03-04 09:58:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('531', '1-3d楼梯1', '20220302194155847256', 'rtsp://admin:123456@172.18.11.58:554/media/video2/multicast', '2022-03-04 09:58:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('532', '西04', '20220304094533712280', 'rtsp://admin:123456@172.18.11.93:554/media/video2/multicast', '2022-03-04 09:59:13', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('533', '1-3d楼梯2', '20220302194155366672', 'rtsp://admin:123456@172.18.11.59:554/media/video2/multicast', '2022-03-04 09:59:18', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('534', '西南01', '20220304094533263719', 'rtsp://admin:123456@172.18.11.94:554/media/video2/multicast', '2022-03-04 09:59:51', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('535', '1-4d楼梯', '20220302194155923144', 'rtsp://admin:123456@172.18.11.60:554/media/video2/multicast', '2022-03-04 10:00:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('536', '西南02', '20220304094534580979', 'rtsp://admin:123456@172.18.11.95:554/media/video2/multicast', '2022-03-04 10:00:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('537', '西南03', '20220304094534573255', 'rtsp://admin:123456@172.18.11.96:554/media/video2/multicast', '2022-03-04 10:00:42', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('538', '东南01', '20220304094534803251', 'rtsp://admin:123456@172.18.11.97:554/media/video2/multicast', '2022-03-04 10:01:16', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('539', '5分区1号通道', '20220302194155482353', 'rtsp://admin:123456@172.18.11.61:554/media/video2/multicast', '2022-03-04 10:01:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('540', '东南02', '20220304094534944976', 'rtsp://admin:123456@172.18.11.98:554/media/video2/multicast', '2022-03-04 10:01:52', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('541', '5分区2号通道', '20220302194155594087', 'rtsp://admin:123456@172.18.11.62:554/media/video2/multicast', '2022-03-04 10:02:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('542', '东南03', '20220304094534876323', 'rtsp://admin:123456@172.18.11.99:554/media/video2/multicast', '2022-03-04 10:02:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('543', '东南04', '20220304094534777721', 'rtsp://admin:123456@172.18.11.100:554/media/video2/multicast', '2022-03-04 10:02:43', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('544', '东03', '20220304094534226121', 'rtsp://admin:123456@172.18.11.101:554/media/video2/multicast', '2022-03-04 10:03:11', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('545', '1-6#电梯厅', '20220302194155860338', 'rtsp://admin:123456@172.18.11.63:554/media/video2/multicast', '2022-03-04 10:03:31', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('546', '5分区3号通道', '20220302194155922389', 'rtsp://admin:123456@172.18.11.64:554/media/video2/multicast', '2022-03-04 10:05:26', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('547', '5分区4号通道', '20220302194155739203', 'rtsp://admin:123456@172.18.11.65:554/media/video2/multicast', '2022-03-04 10:05:35', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('548', '1-5d楼梯', '20220302194155327540', 'rtsp://admin:123456@172.18.11.66:554/media/video2/multicast', '2022-03-04 10:06:42', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('549', '5分区配套服务间门口', '20220302194155853119', 'rtsp://admin:123456@172.18.11.67:554/media/video2/multicast', '2022-03-04 10:07:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('550', '1-6#电梯厅出口', '20220302194155342985', 'rtsp://admin:123456@172.18.11.68:554/media/video2/multicast', '2022-03-04 10:08:23', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('551', '1-5c楼梯', '20220302194155577321', 'rtsp://admin:123456@172.18.11.69:554/media/video2/multicast', '2022-03-04 10:11:10', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('552', '1-6#电梯', '20220302194155241933', 'rtsp://admin:123456@172.18.11.70:554/media/video2/multicast', '2022-03-04 10:11:38', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('553', '1-7#电梯', '20220302194155326800', 'rtsp://admin:123456@172.18.11.71:554/media/video2/multicast', '2022-03-04 10:12:05', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('554', '6分区1号通道', '20220302194155670841', 'rtsp://admin:123456@172.18.11.72:554/media/video2/multicast', '2022-03-04 10:14:44', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('555', '6分区2号通道', '20220302194155411094', 'rtsp://admin:123456@172.18.11.73:554/media/video2/multicast', '2022-03-04 10:14:53', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('556', '6分区3号通道', '20220302194155233231', 'rtsp://admin:123456@172.18.11.74:554/media/video2/multicast', '2022-03-04 10:15:02', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('557', '6分区配套服务间门口', '20220302194155800754', 'rtsp://admin:123456@172.18.11.75:554/media/video2/multicast', '2022-03-04 10:15:15', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('558', '1-4c楼梯', '20220302194155361573', 'rtsp://admin:123456@172.18.11.76:554/media/video2/multicast', '2022-03-04 10:15:57', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('559', '1-3c楼梯1', '20220302194155186779', 'rtsp://admin:123456@172.18.11.77:554/media/video2/multicast', '2022-03-04 10:16:08', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('560', '1-3c楼梯2', '20220302194155705816', 'rtsp://admin:123456@172.18.11.78:554/media/video2/multicast', '2022-03-04 10:16:19', '2022-03-10 12:18:14');
INSERT INTO `monitor` VALUES ('561', '视频测试数据1', '20210302193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('562', '视频测试数据2', '20210402193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('563', '视频测试数据3', '20210502193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('564', '视频测试数据4', '20210602193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('565', '视频测试数据5', '20210702193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('566', '视频测试数据6', '20210802193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('567', '视频测试数据7', '20210902193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('568', '视频测试数据8', '20210501193543151717', 'rtsp://admin:admin123@192.168.3.151:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('569', '视频测试数据9', '20210501193543159718', 'rtsp://admin:admin123@192.168.3.72:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('570', '视频测试数据10', '20210991193543159718', 'rtsp://admin:admin123@192.168.3.72:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('571', '视频测试数据11', '23210991193543159718', 'rtsp://admin:admin123@192.168.3.72:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');
INSERT INTO `monitor` VALUES ('572', '视频测试数据12', '232123991193543159718', 'rtsp://admin:admin123@192.168.3.72:554/cam/realmonitor?channel=1&subtype=0', '2022-03-03 09:22:02', '2022-03-19 15:09:20');

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `displayNameEn` varchar(30) DEFAULT NULL,
  `displayName` varchar(30) DEFAULT NULL,
  `countryEn` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `draftYear` varchar(10) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `playerId` int DEFAULT NULL,
  `teamName` varchar(20) DEFAULT NULL,
  `teamCity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('1', 'Kyrie Irving', '凯里 欧文', 'Australia', '澳洲', '2011', '1.88', '88.5 公斤', '后卫', '202681', '篮网', '布鲁克林');
INSERT INTO `players` VALUES ('2', 'Jimmy Butler', '吉米 巴特勒', 'United States', '美国', '2011', '2.01', '104.3 公斤', '前锋', '202710', '热火', '迈阿密');
INSERT INTO `players` VALUES ('3', 'Donovan Mitchell', '多诺万 米切尔', 'United States', '美国', '2017', '1.85', '97.5 公斤', '后卫', '1628378', '爵士', '犹他');
INSERT INTO `players` VALUES ('4', 'Jalen Brunson', '贾伦 布伦森', 'United States', '美国', '2018', '1.85', '86.2 公斤', '后卫', '1628973', '独行侠', '达拉斯');
INSERT INTO `players` VALUES ('5', 'Jayson Tatum', '杰森 塔图姆', 'United States', '美国', '2017', '2.03', '95.3 公斤', '前锋-后卫', '1628369', '凯尔特人', '波士顿');
INSERT INTO `players` VALUES ('6', 'Tyrese Maxey', '泰雷塞 马克西', 'United States', '美国', '2020', '1.88', '90.7 公斤', '后卫', '1630178', '76人', '费城');
INSERT INTO `players` VALUES ('7', 'Jordan Poole', '乔丹 普尔', 'United States', '美国', '2019', '1.93', '88.0 公斤', '后卫', '1629673', '勇士', '金州');
INSERT INTO `players` VALUES ('8', 'Devin Booker', '德文 布克', 'United States', '美国', '2015', '1.96', '93.4 公斤', '后卫', '1626164', '太阳', '菲尼克斯');
INSERT INTO `players` VALUES ('9', 'Anthony Edwards', '安东尼 爱德华兹', 'United States', '美国', '2020', '1.93', '102.1 公斤', '后卫', '1630162', '森林狼', '明尼苏达');
INSERT INTO `players` VALUES ('10', 'Brandon Ingram', '布兰登 英格拉姆', 'United States', '美国', '2016', '2.03', '86.2 公斤', '前锋', '1627742', '鹈鹕', '新奥尔良');
INSERT INTO `players` VALUES ('11', 'Ja Morant', '贾 莫兰特', 'United States', '美国', '2019', '1.9', '78.9 公斤', '后卫', '1629630', '灰熊', '孟菲斯');
INSERT INTO `players` VALUES ('12', 'Giannis Antetokounmpo', '扬尼斯 安特托昆博', 'Greece', '希腊', '2013', '2.11', '109.8 公斤', '前锋', '203507', '雄鹿', '密尔沃基');
INSERT INTO `players` VALUES ('13', 'Bojan Bogdanovic', '博扬 博格达诺维奇', 'Croatia', '克罗地亚', '2011', '2.01', '102.5 公斤', '前锋', '202711', '爵士', '犹他');
INSERT INTO `players` VALUES ('14', 'Nikola Jokic', '尼古拉 约基奇', 'Serbia', '塞尔维亚', '2014', '2.11', '128.8 公斤', '中锋', '203999', '掘金', '丹佛');
INSERT INTO `players` VALUES ('15', 'Stephen Curry', '斯蒂芬 库里', 'United States', '美国', '2009', '1.88', '83.9 公斤', '后卫', '201939', '勇士', '金州');
INSERT INTO `players` VALUES ('16', 'Joel Embiid', '乔尔 恩比德', 'Cameroon', '喀麦隆', '2014', '2.13', '127.0 公斤', '中锋-前锋', '203954', '76人', '费城');
INSERT INTO `players` VALUES ('17', 'CJ McCollum', 'CJ 麦科勒姆', 'United States', '美国', '2013', '1.9', '86.2 公斤', '后卫', '203468', '鹈鹕', '新奥尔良');
INSERT INTO `players` VALUES ('18', 'Nikola Vucevic', '尼古拉 武切维奇', 'Montenegro', '黑山', '2011', '2.08', '117.9 公斤', '中锋', '202696', '公牛', '芝加哥');
INSERT INTO `players` VALUES ('19', 'Chris Paul', '克里斯 保罗', 'United States', null, '2005', '1.83', '79.4 公斤', '后卫', '101108', '太阳', '菲尼克斯');
INSERT INTO `players` VALUES ('20', 'OG Anunoby', 'OG 阿努诺比', 'United Kingdom', '英国', '2017', '2.01', '105.2 公斤', '前锋', '1628384', '猛龙', '多伦多');
INSERT INTO `players` VALUES ('21', 'Jaylen Brown', '杰伦 布朗', 'United States', '美国', '2016', '1.98', '101.2 公斤', '后卫-前锋', '1627759', '凯尔特人', '波士顿');
INSERT INTO `players` VALUES ('22', 'Kevin Durant', '凯文 杜兰特', 'United States', '美国', '2007', '2.08', '108.9 公斤', '前锋', '201142', '篮网', '布鲁克林');
INSERT INTO `players` VALUES ('23', 'Tobias Harris', '托拜厄斯 哈里斯', 'United States', '美国', '2011', '2.01', '102.5 公斤', '前锋', '202699', '76人', '费城');
INSERT INTO `players` VALUES ('24', 'Pascal Siakam', '帕斯卡尔 西亚卡姆', 'Cameroon', '喀麦隆', '2016', '2.03', '104.3 公斤', '前锋', '1627783', '猛龙', '多伦多');
INSERT INTO `players` VALUES ('25', 'Karl Anthony Towns', '卡尔-安东尼 唐斯', 'United States', '美国', '2015', '2.11', '112.5 公斤', '中锋-前锋', '1626157', '森林狼', '明尼苏达');
INSERT INTO `players` VALUES ('26', 'Al Horford', '艾尔 霍福德', 'Dominican Republic', '多明尼加共和国', '2007', '2.06', '108.9 公斤', '中锋-前锋', '201143', '凯尔特人', '波士顿');
INSERT INTO `players` VALUES ('27', 'Marcus Smart', '马库斯 斯马特', 'United States', '美国', '2014', '1.93', '99.8 公斤', '后卫', '203935', '凯尔特人', '波士顿');
INSERT INTO `players` VALUES ('28', 'Klay Thompson', '克莱 汤普森', 'United States', '美国', '2011', '1.98', '99.8 公斤', '后卫', '202691', '勇士', '金州');
INSERT INTO `players` VALUES ('29', 'Spencer Dinwiddie', '斯宾塞 丁维迪', 'United States', '美国', '2014', '1.98', '97.5 公斤', '后卫', '203915', '独行侠', '达拉斯');
INSERT INTO `players` VALUES ('30', 'Fred VanVleet', '弗雷德 范弗里特', 'United States', '美国', '2016', '1.85', '89.4 公斤', '后卫', '1627832', '猛龙', '多伦多');
INSERT INTO `players` VALUES ('31', 'Will Barton', '威尔 巴顿', 'United States', '美国', '2012', '1.96', '82.1 公斤', '后卫', '203115', '掘金', '丹佛');
INSERT INTO `players` VALUES ('32', 'DeMar DeRozan', '德马尔 德罗赞', 'United States', '美国', '2009', '1.98', '99.8 公斤', '后卫-前锋', '201942', '公牛', '芝加哥');
INSERT INTO `players` VALUES ('33', 'James Harden', '詹姆斯 哈登', 'United States', '美国', '2009', '1.96', '99.8 公斤', '后卫', '201935', '76人', '费城');
INSERT INTO `players` VALUES ('34', 'Zach LaVine', '扎克 拉文', 'United States', '美国', '2014', '1.96', '90.7 公斤', '后卫-前锋', '203897', '公牛', '芝加哥');
INSERT INTO `players` VALUES ('35', 'Brook Lopez', '布鲁克 洛佩兹', 'United States', '美国', '2008', '2.13', '127.9 公斤', '中锋', '201572', '雄鹿', '密尔沃基');
INSERT INTO `players` VALUES ('36', 'Bogdan Bogdanovic', '博格丹 博格达诺维奇', 'Serbia', '塞尔维亚', '2014', '1.98', '102.1 公斤', '后卫', '203992', '老鹰', '亚特兰大');
INSERT INTO `players` VALUES ('37', 'Maxi Kleber', '马克西 克勒贝尔', 'Germany', '德国', '2014', '2.08', '108.9 公斤', '前锋', '1628467', '独行侠', '达拉斯');
INSERT INTO `players` VALUES ('38', 'Desmond Bane', '戴斯蒙德 贝恩', 'United States', '美国', '2020', '1.96', '97.5 公斤', '后卫', '1630217', '灰熊', '孟菲斯');
INSERT INTO `players` VALUES ('39', 'Dillon Brooks', '狄龙 布鲁克斯', 'Canada', '加拿大', '2017', '2.01', '102.1 公斤', '后卫-前锋', '1628415', '灰熊', '孟菲斯');
INSERT INTO `players` VALUES ('40', 'Trae Young', '特雷 杨', 'United States', '美国', '2018', '1.85', '74.4 公斤', '后卫', '1629027', '老鹰', '亚特兰大');
INSERT INTO `players` VALUES ('41', 'Deandre Ayton', '德安德烈 艾顿', 'Bahamas', '巴哈马', '2018', '2.11', '113.4 公斤', '中锋', '1629028', '太阳', '菲尼克斯');
INSERT INTO `players` VALUES ('42', 'Jordan Clarkson', '乔丹 克拉克森', 'United States', '美国', '2014', '1.93', '88.0 公斤', '后卫', '203903', '爵士', '犹他');
INSERT INTO `players` VALUES ('43', 'Scottie Barnes', '斯科蒂 巴恩斯', 'United States', '美国', '2021', '2.01', '102.1 公斤', '前锋', '1630567', '猛龙', '多伦多');
INSERT INTO `players` VALUES ('44', 'Malik Beasley', '马利克 比斯利', 'United States', '美国', '2016', '1.93', '84.8 公斤', '后卫', '1627736', '森林狼', '明尼苏达');
INSERT INTO `players` VALUES ('45', 'Mikal Bridges', '米卡尔 布里奇斯', 'United States', '美国', '2018', '1.98', '94.8 公斤', '前锋', '1628969', '太阳', '菲尼克斯');
INSERT INTO `players` VALUES ('46', 'Jrue Holiday', '朱 霍勒迪', 'United States', '美国', '2009', '1.9', '93.0 公斤', '后卫', '201950', '雄鹿', '密尔沃基');
INSERT INTO `players` VALUES ('47', 'De\'Andre Hunter', '德安德烈 亨特', 'United States', '美国', '2019', '2.03', '100.2 公斤', '前锋-后卫', '1629631', '老鹰', '亚特兰大');
INSERT INTO `players` VALUES ('48', 'Andrew Wiggins', '安德鲁 维金斯', 'Canada', '加拿大', '2014', '2.01', '89.4 公斤', '前锋', '203952', '勇士', '金州');
INSERT INTO `players` VALUES ('49', 'Goran Dragic', '戈兰 德拉季奇', 'Slovenia', '斯洛文尼亚', '2008', '1.9', '86.2 公斤', '后卫', '201609', '篮网', '布鲁克林');
INSERT INTO `players` VALUES ('50', 'Jaren Jackson Jr.', '贾伦 杰克逊', 'United States', '美国', '2018', '2.11', '109.8 公斤', '前锋-中锋', '1628991', '灰熊', '孟菲斯');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `age` int DEFAULT '0',
  `telPhone` varchar(20) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phoneNum` (`telPhone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wangyang', '431244235', '6516516516', '2022-04-20 10:41:41', '2022-04-20 10:48:18');
