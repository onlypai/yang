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


