# 查看所有的表
SHOW TABLES;

# 创建表
CREATE TABLE IF NOT EXISTS `students` (
	`name` VARCHAR(10),
	`age` INT,
	`score` INT
);

# 删除表
DROP TABLE IF EXISTS `students`;

# 查看表结构
DESC users;
SHOW CREATE TABLE `users`;

# 完整的创建一张表
CREATE TABLE IF NOT EXISTS `users`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	`age` INT DEFAULT 0,
	`phoneNum` VARCHAR(20) UNIQUE DEFAULT '',
	`createTime` TIMESTAMP
);


# 修改表
# 1、修改表名字
ALTER TABLE `users` RENAME TO `user`;
# 2、添加一个新的字段
ALTER TABLE `user` ADD `updateTime` TIMESTAMP;
# 3、修改字段名字
ALTER TABLE `user` CHANGE `phoneNum` `telPhone` VARCHAR(20);
# 4、修改字段类型
ALTER TABLE `user` MODIFY `name` VARCHAR(30);
# 5、删除某一个字段
-- ALTER TABLE `user` ADD `updatefsdfsdTime` TIMESTAMP;
ALTER TABLE `user` DROP `updatefsdfsdTime`;
# 删除多个字段
ALTER TABLE `user` DROP `updatefsdfsdTime`, DROP `asas`;


# 补充
# 根据一张表结构创建另一张表
CREATE TABLE `user2` LIKE `user`;
# 根据一张表中所有内容创建另一张表(仅内容，没有结构)
CREATE TABLE `suer3` (SELECT * FROM `user`);
