/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : coderhub

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 24/04/2022 22:23:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `displayNameEn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `displayName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `countryEn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `draftYear` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `height` double NULL DEFAULT NULL,
  `weight` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `playerId` int NULL DEFAULT NULL,
  `teamName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `teamCity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `teamName_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teamName_id`(`teamName_id`) USING BTREE,
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`teamName_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (1, 'Kyrie Irving', '凯里 欧文', 'Australia', '澳洲', '2011', 1.88, '88.5 公斤', '后卫', 202681, '篮网', '布鲁克林', 3);
INSERT INTO `players` VALUES (2, 'Jimmy Butler', '吉米 巴特勒', 'United States', '美国', '2011', 2.01, '104.3 公斤', '前锋', 202710, '热火', '迈阿密', 9);
INSERT INTO `players` VALUES (3, 'Donovan Mitchell', '多诺万 米切尔', 'United States', '美国', '2017', 1.85, '97.5 公斤', '后卫', 1628378, '爵士', '犹他', 30);
INSERT INTO `players` VALUES (4, 'Jalen Brunson', '贾伦 布伦森', 'United States', '美国', '2018', 1.85, '86.2 公斤', '后卫', 1628973, '独行侠', '达拉斯', NULL);
INSERT INTO `players` VALUES (5, 'Jayson Tatum', '杰森 塔图姆', 'United States', '美国', '2017', 2.03, '95.3 公斤', '前锋-后卫', 1628369, '凯尔特人', '波士顿', NULL);
INSERT INTO `players` VALUES (6, 'Tyrese Maxey', '泰雷塞 马克西', 'United States', '美国', '2020', 1.88, '90.7 公斤', '后卫', 1630178, '76人', '费城', NULL);
INSERT INTO `players` VALUES (7, 'Jordan Poole', '乔丹 普尔', 'United States', '美国', '2019', 1.93, '88.0 公斤', '后卫', 1629673, '勇士', '金州', 18);
INSERT INTO `players` VALUES (8, 'Devin Booker', '德文 布克', 'United States', '美国', '2015', 1.96, '93.4 公斤', '后卫', 1626164, '太阳', '菲尼克斯', 26);
INSERT INTO `players` VALUES (9, 'Anthony Edwards', '安东尼 爱德华兹', 'United States', '美国', '2020', 1.93, '102.1 公斤', '后卫', 1630162, '森林狼', '明尼苏达', 23);
INSERT INTO `players` VALUES (10, 'Brandon Ingram', '布兰登 英格拉姆', 'United States', '美国', '2016', 2.03, '86.2 公斤', '前锋', 1627742, '鹈鹕', '新奥尔良', 24);
INSERT INTO `players` VALUES (11, 'Ja Morant', '贾 莫兰特', 'United States', '美国', '2019', 1.9, '78.9 公斤', '后卫', 1629630, '灰熊', '孟菲斯', 22);
INSERT INTO `players` VALUES (12, 'Giannis Antetokounmpo', '扬尼斯 安特托昆博', 'Greece', '希腊', '2013', 2.11, '109.8 公斤', '前锋', 203507, '雄鹿', '密尔沃基', 10);
INSERT INTO `players` VALUES (13, 'Bojan Bogdanovic', '博扬 博格达诺维奇', 'Croatia', '克罗地亚', '2011', 2.01, '102.5 公斤', '前锋', 202711, '爵士', '犹他', 30);
INSERT INTO `players` VALUES (14, 'Nikola Jokic', '尼古拉 约基奇', 'Serbia', '塞尔维亚', '2014', 2.11, '128.8 公斤', '中锋', 203999, '掘金', '丹佛', 17);
INSERT INTO `players` VALUES (15, 'Stephen Curry', '斯蒂芬 库里', 'United States', '美国', '2009', 1.88, '83.9 公斤', '后卫', 201939, '勇士', '金州', 18);
INSERT INTO `players` VALUES (16, 'Joel Embiid', '乔尔 恩比德', 'Cameroon', '喀麦隆', '2014', 2.13, '127.0 公斤', '中锋-前锋', 203954, '76人', '费城', NULL);
INSERT INTO `players` VALUES (17, 'CJ McCollum', 'CJ 麦科勒姆', 'United States', '美国', '2013', 1.9, '86.2 公斤', '后卫', 203468, '开拓者', '波特兰', 27);
INSERT INTO `players` VALUES (18, 'Nikola Vucevic', '尼古拉 武切维奇', 'Montenegro', '黑山', '2011', 2.08, '117.9 公斤', '中锋', 202696, '魔术', '奥兰多', 12);
INSERT INTO `players` VALUES (19, 'Chris Paul', '克里斯 保罗', 'United States', NULL, '2005', 1.83, '79.4 公斤', '后卫', 101108, '太阳', '菲尼克斯', 26);
INSERT INTO `players` VALUES (20, 'OG Anunoby', 'OG 阿努诺比', 'United Kingdom', '英国', '2017', 2.01, '105.2 公斤', '前锋', 1628384, '猛龙', '多伦多', 14);
INSERT INTO `players` VALUES (21, 'Jaylen Brown', '杰伦 布朗', 'United States', '美国', '2016', 1.98, '101.2 公斤', '后卫-前锋', 1627759, '凯尔特人', '波士顿', NULL);
INSERT INTO `players` VALUES (22, 'Kevin Durant', '凯文 杜兰特', 'United States', '美国', '2007', 2.08, '108.9 公斤', '前锋', 201142, '雷霆', '俄克拉荷马', 25);
INSERT INTO `players` VALUES (23, 'Tobias Harris', '托拜厄斯 哈里斯', 'United States', '美国', '2011', 2.01, '102.5 公斤', '前锋', 202699, '76人', '费城', NULL);
INSERT INTO `players` VALUES (24, 'Pascal Siakam', '帕斯卡尔 西亚卡姆', 'Cameroon', '喀麦隆', '2016', 2.03, '104.3 公斤', '前锋', 1627783, '猛龙', '多伦多', 14);
INSERT INTO `players` VALUES (25, 'Karl Anthony Towns', '卡尔-安东尼 唐斯', 'United States', '美国', '2015', 2.11, '112.5 公斤', '中锋-前锋', 1626157, '森林狼', '明尼苏达', 23);
INSERT INTO `players` VALUES (26, 'Al Horford', '艾尔 霍福德', 'Dominican Republic', '多明尼加共和国', '2007', 2.06, '108.9 公斤', '中锋-前锋', 201143, '凯尔特人', '波士顿', NULL);
INSERT INTO `players` VALUES (27, 'Marcus Smart', '马库斯 斯马特', 'United States', '美国', '2014', 1.93, '99.8 公斤', '后卫', 203935, '凯尔特人', '波士顿', NULL);
INSERT INTO `players` VALUES (28, 'Klay Thompson', '克莱 汤普森', 'United States', '美国', '2011', 1.98, '99.8 公斤', '后卫', 202691, '勇士', '金州', 18);
INSERT INTO `players` VALUES (29, 'Spencer Dinwiddie', '斯宾塞 丁维迪', 'United States', '美国', '2014', 1.98, '97.5 公斤', '后卫', 203915, '独行侠', '达拉斯', NULL);
INSERT INTO `players` VALUES (30, 'Fred VanVleet', '弗雷德 范弗里特', 'United States', '美国', '2016', 1.85, '89.4 公斤', '后卫', 1627832, '猛龙', '多伦多', 14);
INSERT INTO `players` VALUES (31, 'Will Barton', '威尔 巴顿', 'United States', '美国', '2012', 1.96, '82.1 公斤', '后卫', 203115, '掘金', '丹佛', 17);
INSERT INTO `players` VALUES (32, 'DeMar DeRozan', '德马尔 德罗赞', 'United States', '美国', '2009', 1.98, '99.8 公斤', '后卫-前锋', 201942, '公牛', '芝加哥', 5);
INSERT INTO `players` VALUES (33, 'James Harden', '詹姆斯 哈登', 'United States', '美国', '2009', 1.96, '99.8 公斤', '后卫', 201935, '火箭', '休斯顿', 19);
INSERT INTO `players` VALUES (34, 'Zach LaVine', '扎克 拉文', 'United States', '美国', '2014', 1.96, '90.7 公斤', '后卫-前锋', 203897, '公牛', '芝加哥', 5);
INSERT INTO `players` VALUES (35, 'Brook Lopez', '布鲁克 洛佩兹', 'United States', '美国', '2008', 2.13, '127.9 公斤', '中锋', 201572, '雄鹿', '密尔沃基', 10);
INSERT INTO `players` VALUES (36, 'Bogdan Bogdanovic', '博格丹 博格达诺维奇', 'Serbia', '塞尔维亚', '2014', 1.98, '102.1 公斤', '后卫', 203992, '老鹰', '亚特兰大', 1);
INSERT INTO `players` VALUES (37, 'Maxi Kleber', '马克西 克勒贝尔', 'Germany', '德国', '2014', 2.08, '108.9 公斤', '前锋', 1628467, '独行侠', '达拉斯', NULL);
INSERT INTO `players` VALUES (38, 'Desmond Bane', '戴斯蒙德 贝恩', 'United States', '美国', '2020', 1.96, '97.5 公斤', '后卫', 1630217, '灰熊', '孟菲斯', 22);
INSERT INTO `players` VALUES (39, 'Dillon Brooks', '狄龙 布鲁克斯', 'Canada', '加拿大', '2017', 2.01, '102.1 公斤', '后卫-前锋', 1628415, '灰熊', '孟菲斯', 22);
INSERT INTO `players` VALUES (40, 'Trae Young', '特雷 杨', 'United States', '美国', '2018', 1.85, '74.4 公斤', '后卫', 1629027, '老鹰', '亚特兰大', 1);
INSERT INTO `players` VALUES (41, 'Deandre Ayton', '德安德烈 艾顿', 'Bahamas', '巴哈马', '2018', 2.11, '113.4 公斤', '中锋', 1629028, '太阳', '菲尼克斯', 26);
INSERT INTO `players` VALUES (42, 'Jordan Clarkson', '乔丹 克拉克森', 'United States', '美国', '2014', 1.93, '88.0 公斤', '后卫', 203903, '爵士', '犹他', 30);
INSERT INTO `players` VALUES (43, 'Scottie Barnes', '斯科蒂 巴恩斯', 'United States', '美国', '2021', 2.01, '102.1 公斤', '前锋', 1630567, '猛龙', '多伦多', 14);
INSERT INTO `players` VALUES (44, 'Malik Beasley', '马利克 比斯利', 'United States', '美国', '2016', 1.93, '84.8 公斤', '后卫', 1627736, '森林狼', '明尼苏达', 23);
INSERT INTO `players` VALUES (45, 'Mikal Bridges', '米卡尔 布里奇斯', 'United States', '美国', '2018', 1.98, '94.8 公斤', '前锋', 1628969, '太阳', '菲尼克斯', 26);
INSERT INTO `players` VALUES (46, 'Jrue Holiday', '朱 霍勒迪', 'United States', '美国', '2009', 1.9, '93.0 公斤', '后卫', 201950, '雄鹿', '密尔沃基', 10);
INSERT INTO `players` VALUES (47, 'De\'Andre Hunter', '德安德烈 亨特', 'United States', '美国', '2019', 2.03, '100.2 公斤', '前锋-后卫', 1629631, '老鹰', '亚特兰大', 1);
INSERT INTO `players` VALUES (48, 'Andrew Wiggins', '安德鲁 维金斯', 'Canada', '加拿大', '2014', 2.01, '89.4 公斤', '前锋', 203952, '勇士', '金州', 18);
INSERT INTO `players` VALUES (49, 'Goran Dragic', '戈兰 德拉季奇', 'Slovenia', '斯洛文尼亚', '2008', 1.9, '86.2 公斤', '后卫', 201609, '篮网', '布鲁克林', 3);
INSERT INTO `players` VALUES (50, 'Jaren Jackson Jr.', '贾伦 杰克逊', 'United States', '美国', '2018', 2.11, '109.8 公斤', '前锋-中锋', 1628991, '灰熊', '孟菲斯', 22);

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `teamName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `teamNameEn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `teamCity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `teamCityEn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `displayConference` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `division` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES (1, '老鹰', 'Hawks', '亚特兰大', 'Atlanta', '东部', '东南分区', 1610612737);
INSERT INTO `teams` VALUES (2, '凯尔特人', 'Celtics', '波士顿', 'Boston', '东部', '大西洋分区', 1610612738);
INSERT INTO `teams` VALUES (3, '篮网', 'Nets', '布鲁克林', 'Brooklyn', '东部', '大西洋分区', 1610612751);
INSERT INTO `teams` VALUES (4, '黄蜂', 'Hornets', '夏洛特', 'Charlotte', '东部', '东南分区', 1610612766);
INSERT INTO `teams` VALUES (5, '公牛', 'Bulls', '芝加哥', 'Chicago', '东部', '中央分区', 1610612741);
INSERT INTO `teams` VALUES (6, '骑士', 'Cavaliers', '克利夫兰', 'Cleveland', '东部', '中央分区', 1610612739);
INSERT INTO `teams` VALUES (7, '活塞', 'Pistons', '底特律', 'Detroit', '东部', '中央分区', 1610612765);
INSERT INTO `teams` VALUES (8, '步行者', 'Pacers', '印第安纳', 'Indiana', '东部', '中央分区', 1610612754);
INSERT INTO `teams` VALUES (9, '热火', 'Heat', '迈阿密', 'Miami', '东部', '东南分区', 1610612748);
INSERT INTO `teams` VALUES (10, '雄鹿', 'Bucks', '密尔沃基', 'Milwaukee', '东部', '中央分区', 1610612749);
INSERT INTO `teams` VALUES (11, '尼克斯', 'Knicks', '纽约', 'New York', '东部', '大西洋分区', 1610612752);
INSERT INTO `teams` VALUES (12, '魔术', 'Magic', '奥兰多', 'Orlando', '东部', '东南分区', 1610612753);
INSERT INTO `teams` VALUES (13, '76人', '76ers', '费城', 'Philadelphia', '东部', '大西洋分区', 1610612755);
INSERT INTO `teams` VALUES (14, '猛龙', 'Raptors', '多伦多', 'Toronto', '东部', '大西洋分区', 1610612761);
INSERT INTO `teams` VALUES (15, '奇才', 'Wizards', '华盛顿', 'Washington', '东部', '东南分区', 1610612764);
INSERT INTO `teams` VALUES (16, '独行侠', 'Mavericks', '达拉斯', 'Dallas', '西部', '西南分区', 1610612742);
INSERT INTO `teams` VALUES (17, '掘金', 'Nuggets', '丹佛', 'Denver', '西部', '西北分区', 1610612743);
INSERT INTO `teams` VALUES (18, '勇士', 'Warriors', '金州', 'Golden State', '西部', '太平洋分区', 1610612744);
INSERT INTO `teams` VALUES (19, '火箭', 'Rockets', '休斯顿', 'Houston', '西部', '西南分区', 1610612745);
INSERT INTO `teams` VALUES (20, '快船', 'Clippers', '洛杉矶', 'LA', '西部', '太平洋分区', 1610612746);
INSERT INTO `teams` VALUES (21, '湖人', 'Lakers', '洛杉矶', 'Los Angeles', '西部', '太平洋分区', 1610612747);
INSERT INTO `teams` VALUES (22, '灰熊', 'Grizzlies', '孟菲斯', 'Memphis', '西部', '西南分区', 1610612763);
INSERT INTO `teams` VALUES (23, '森林狼', 'Timberwolves', '明尼苏达', 'Minnesota', '西部', '西北分区', 1610612750);
INSERT INTO `teams` VALUES (24, '鹈鹕', 'Pelicans', '新奥尔良', 'New Orleans', '西部', '西南分区', 1610612740);
INSERT INTO `teams` VALUES (25, '雷霆', 'Thunder', '俄克拉荷马城', 'Oklahoma City', '西部', '西北分区', 1610612760);
INSERT INTO `teams` VALUES (26, '太阳', 'Suns', '菲尼克斯', 'Phoenix', '西部', '太平洋分区', 1610612756);
INSERT INTO `teams` VALUES (27, '开拓者', 'Trail Blazers', '波特兰', 'Portland', '西部', '西北分区', 1610612757);
INSERT INTO `teams` VALUES (28, '国王', 'Kings', '萨克拉门托', 'Sacramento', '西部', '太平洋分区', 1610612758);
INSERT INTO `teams` VALUES (29, '马刺', 'Spurs', '圣安东尼奥', 'San Antonio', '西部', '西南分区', 1610612759);
INSERT INTO `teams` VALUES (30, '爵士', 'Jazz', '犹他', 'Utah', '西部', '西北分区', 1610612762);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT 0,
  `telPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phoneNum`(`telPhone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'wangyang', 431244235, '6516516516', '2022-04-20 10:41:41', '2022-04-20 10:48:18');

SET FOREIGN_KEY_CHECKS = 1;
