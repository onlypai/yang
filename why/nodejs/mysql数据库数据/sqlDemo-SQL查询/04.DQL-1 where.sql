# 创建球员表
CREATE TABLE IF NOT EXISTS `players`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`displayNameEn` VARCHAR(30),
	`displayName` VARCHAR(30),
	`countryEn` VARCHAR(30),
	`country` VARCHAR(30),
	`draftYear` VARCHAR(10),
	`height` DOUBLE,
	`weight` VARCHAR(20),
	`position` VARCHAR(20),
	`playerId` INT,
	`teamName` VARCHAR(20),
	`teamCity` VARCHAR(20)
);

# 查询所有字段以及所有数据
SELECT * FROM `players`;
# 查询指定字段
SELECT displayName, country FROM `players`;
# 对字段结果起别名  （as可以省略不写）
SELECT displayName as disName, country as disCt FROM `players`;





#where查询条件

# 1.简单条件运算符⭐：>、 <、 = 、!= 、<>(不等于)、 >=、 <=
SELECT displayName, draftYear FROM `players` WHERE draftYear = 2011;

# 2.逻辑运算符⭐
/*
	NOT 或 !   逻辑非
	AND 或 &&  逻辑与   （BETWEEN ... AND ...关键字也可以，首尾包含等于）
	OR  或 ||  逻辑或
	XOR        逻辑异或
*/
# 与
SELECT * FROM players WHERE draftYear > 2008 AND draftYear < 2016;
SELECT * FROM players WHERE draftYear > 2008 && draftYear < 2016;
SELECT * FROM players WHERE draftYear BETWEEN 2008 AND 2016;
# 或
SELECT * FROM players WHERE draftYear > 2018 OR country != '美国';

# 值为NULL的  IS NULL⭐   IS NOT NULL
-- UPDATE players SET country = NULL WHERE displayName = '克里斯 保罗';
SELECT * FROM players WHERE country IS NULL;

# 3.模糊查询 LIKE ⭐
/*
	% 匹配0个或多个的任意字符
	_ 匹配一个的任意字符
*/
SELECT * FROM players WHERE position LIKE '_卫'; # 第二个字符为'卫'的
SELECT * FROM players WHERE teamName LIKE '__狼'; # 第三个字符为'狼'的
SELECT * FROM players WHERE teamName LIKE '%林%';# 带有'林'的

# 4.IN 取多个值中的一个，可以使用 逻辑或 代替
SELECT * FROM players WHERE position IN ('后卫', '前锋', '中锋');





# 结果排序 ORDER BY⭐
/*
	ASC  升序
	DESC 降序
*/
# 先根据选秀年份升序，年份相同的根据身高降序
SELECT * FROM players WHERE position IN ('后卫', '前锋', '中锋') ORDER BY draftYear ASC, height DESC;






# 分页查询
/*
	OFFSET偏移量  LIMIT条数
 方式1.LIMIT limitNum OFFSET offsetNum
 方式2.LIMIT offsetNum, limitNum
*/
SELECT * FROM players LIMIT 10 OFFSET 20;
SELECT * FROM players LIMIT 20, 10;










