# 创建球队表
CREATE TABLE IF NOT EXISTS `teams` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`teamName` VARCHAR(20),
	`teamNameEn` VARCHAR(20),
	`teamCity` VARCHAR(20),
	`teamCityEn` VARCHAR(20),
	`displayConference` VARCHAR(20),
	`division` VARCHAR(20),
	`tId` INT
);

# 向players表添加一个teamName_id字段
ALTER TABLE players ADD `teamName_id` INT;
# 再把teamName_id字段修改为外键,(teams表的id)⭐
# 直接执行这一步设置不行，必须在上面先添加字段
ALTER TABLE players ADD FOREIGN KEY(teamName_id) REFERENCES teams(id);
# teamName_id的值只能是teams表的id值，其他值会报错

# 创建球员表时添加teamName_id外键
-- CREATE TABLE IF NOT EXISTS `players`(
-- 	`id` INT PRIMARY KEY AUTO_INCREMENT,
-- 	`displayNameEn` VARCHAR(30),
-- 	`displayName` VARCHAR(30),
-- 	`countryEn` VARCHAR(30),
-- 	`country` VARCHAR(30),
-- 	`draftYear` VARCHAR(10),
-- 	`height` DOUBLE,
-- 	`weight` VARCHAR(20),
-- 	`position` VARCHAR(20),
-- 	`playerId` INT,
-- 	`teamName` VARCHAR(20),
-- 	`teamCity` VARCHAR(20)，
-- 	`teamName_id` INT,
-- 	FOREIGN KEY(teamName_id) REFERENCES teams(id)
-- );

# 设置teamName_id的值
UPDATE  players SET teamName_id = 1 WHERE teamName = '老鹰';
-- UPDATE  players SET teamName_id = 2 WHERE teamName = '凯尔特人';
UPDATE  players SET teamName_id = 3 WHERE teamName = '篮网';
UPDATE  players SET teamName_id = 4 WHERE teamName = '黄蜂';
UPDATE  players SET teamName_id = 5 WHERE teamName = '公牛';
UPDATE  players SET teamName_id = 6 WHERE teamName = '骑士';
UPDATE  players SET teamName_id = 7 WHERE teamName = '活塞';
UPDATE  players SET teamName_id = 8 WHERE teamName = '步行者';
UPDATE  players SET teamName_id = 9 WHERE teamName = '热火';
UPDATE  players SET teamName_id = 10 WHERE teamName = '雄鹿';
UPDATE  players SET teamName_id = 11 WHERE teamName = '尼克斯';
UPDATE  players SET teamName_id = 12 WHERE teamName = '魔术';
-- UPDATE  players SET teamName_id = 13 WHERE teamName = '76人';
UPDATE  players SET teamName_id = 14 WHERE teamName = '猛龙';
UPDATE  players SET teamName_id = 15 WHERE teamName = '奇才';
-- UPDATE  players SET teamName_id = 16 WHERE teamName = '独行侠';
UPDATE  players SET teamName_id = 17 WHERE teamName = '掘金';
UPDATE  players SET teamName_id = 18 WHERE teamName = '勇士';
UPDATE  players SET teamName_id = 19 WHERE teamName = '火箭';
UPDATE  players SET teamName_id = 20 WHERE teamName = '快船';
UPDATE  players SET teamName_id = 21 WHERE teamName = '湖人';
UPDATE  players SET teamName_id = 22 WHERE teamName = '灰熊';
UPDATE  players SET teamName_id = 23 WHERE teamName = '森林狼';
UPDATE  players SET teamName_id = 24 WHERE teamName = '鹈鹕';
UPDATE  players SET teamName_id = 25 WHERE teamName = '雷霆';
UPDATE  players SET teamName_id = 26 WHERE teamName = '太阳';
UPDATE  players SET teamName_id = 27 WHERE teamName = '开拓者';
UPDATE  players SET teamName_id = 28 WHERE teamName = '国王';
UPDATE  players SET teamName_id = 29 WHERE teamName = '马刺';
UPDATE  players SET teamName_id = 30 WHERE teamName = '爵士';


# 外键存在时更新和删除数据
# ⭐默认teams表中的id字段不能修改和删除的（有外键约束的情况下）
# 希望可以更新呢？重新设置更新和删除的属性
# 1.根据名称删除外键
ALTER TABLE players DROP FOREIGN KEY players_ibfk_1;
# 2.重新设置外键约束
ALTER TABLE players ADD FOREIGN KEY (teamName_id) REFERENCES teams(id)
																									ON UPDATE CASCADE
																									ON DELETE RESTRICT;
# 这时修改teams表中的id字段，players表中teamName_id会联动完成修改




-- SELECT * from players a, teams b where a.teamName_id = b.id







