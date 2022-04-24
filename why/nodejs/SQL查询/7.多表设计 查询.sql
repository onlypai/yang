# 多表查询
SELECT * FROM players, teams; # 30*50=1500条数据，笛卡尔乘积，直积

# 对获取的笛卡尔乘积进行筛选
SELECT * FROM players a, teams b WHERE a.teamName_id = b.id;

# 一般不会进行这种查询方式，会用多表之间的连接
/*
	左连接
	右连接
	内连接
	全连接
	*/

# 左连接
# 查询所有 球员（包含没有球队信息的球员）以及对应的球队信息  图1
# OUTER 字段可以不写
SELECT * FROM players a LEFT OUTER JOIN teams b ON a.teamName_id = b.id;
# 查询所有没有球队信息的球员  图2
SELECT * FROM players a LEFT JOIN teams b ON a.teamName_id = b.id WHERE b.id IS NULL;

# 右连接
# 查询所有 球队（包含没有球员的球队）以及对应的球员信息  图3
SELECT * FROM players a RIGHT OUTER JOIN teams b ON a.teamName_id = b.id;
# 查询所有没有球员信息的球队  图4
SELECT * FROM players a RIGHT JOIN teams b ON a.teamName_id = b.id WHERE a.teamName_id IS NULL;

# 内连接  图5
INNER JOIN 或 CROSS JOIN 或 JOIN 
SELECT * FROM players a JOIN teams b ON a.teamName_id = b.id;

# 全连接  
# 图6   （将图1和图3联合就成了图6）
(SELECT * FROM players a LEFT OUTER JOIN teams b ON a.teamName_id = b.id)
UNION
(SELECT * FROM players a RIGHT OUTER JOIN teams b ON a.teamName_id = b.id);
# 图 7  （将图2和图4联合就成了图7）
(SELECT * FROM players a LEFT JOIN teams b ON a.teamName_id = b.id WHERE b.id IS NULL)
UNION
(SELECT * FROM players a RIGHT JOIN teams b ON a.teamName_id = b.id WHERE a.teamName_id IS NULL);













