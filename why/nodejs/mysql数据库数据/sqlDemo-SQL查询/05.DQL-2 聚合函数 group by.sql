# 聚合函数
/*
	AVG() 平均值
	SUM() 总数
	MAX() 最大值
	MIN() 最小值
	COUNT() 数量
	DISTINCT 去重
*/
# 所有后卫身高平均值
SELECT AVG(height) as avgHeight FROM players WHERE position = '后卫'; 
# 所有后卫身高平均值，身高相同去除重复的
SELECT AVG(DISTINCT height) as avgHeight FROM players WHERE position = '后卫'; 
# 国籍为美国的球员个数
SELECT COUNT(*) FROM players WHERE country = '美国';
# 国籍为美国的球员名字的个数
SELECT COUNT(displayName) FROM players WHERE country = '美国';



# GROUP BY 分组

# 这种没有分组的，默认当成一组，既查询国籍又查询年份总和就会查询失败⭐
-- SELECT country, AVG(height) FROM players;
# 查询不同国籍球员的平均身高（根据国籍分组，前面可以直接将国籍带着查出）
SELECT country, AVG(height) FROM players GROUP BY country;

# HAVING 用于对分组之后的结果再进行筛选⭐
# 在上面基础上再查询 球员平均身高大于2.00的国籍中球员的平均身高 
SELECT country, AVG(height) AS avgHeight FROM players GROUP BY country HAVING avgHeight > 2.00;

# 按国籍分组，球员选秀年份大于2012年的球员的平均身高
SELECT country, AVG(height), draftYear FROM players GROUP BY country HAVING draftYear > 2012;
# 球员选秀年份大于2012年的球员的平均身高，再根据国籍分组
SELECT country, AVG(height), draftYear FROM players WHERE draftYear >2012 GROUP BY country;
# WHERE 是对表做晒选，HAVING是对分组后的表进行筛选，WHERE 不能在 GROUP BY后面使用⭐
















