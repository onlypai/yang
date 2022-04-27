CREATE TABLE IF NOT EXISTS users (
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(30) NOT NULL UNIQUE,
 password VARCHAR(50) NOT NULL,
 createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
#用户注册
INSERT into users (name, password) VALUES(?,?);

#查看用户是否存在
SELECT * FROM users WHERE name = ?;


#创建用户动态表
#FOREIGN KEY(user_id) REFERENCES users(id)    user_id外键约束users表中的id：一个人可能发表多个动态（一对多）
CREATE TABLE IF NOT EXISTS `moment`(
id int PRIMARY KEY AUTO_INCREMENT,
content VARCHAR(1000) not null,
user_id INT NOT NULL,
`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY(user_id) REFERENCES users(id)
);

# 插入动态
INSERT INTO moment (content, user_id) VALUES (?,?);


#创建评论表
CREATE TABLE IF NOT EXISTS `comment`(
id INT PRIMARY KEY AUTO_INCREMENT,
content VARCHAR(1000) NOT NULL,
moment_id INT NOT NULL,
user_id INT NOT NULL,
comment_id INT DEFAULT NULL,
`createAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
`updateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY(moment_id) REFERENCES moment(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(comment_id) REFERENCES comment(id) ON DELETE CASCADE ON UPDATE CASCADE
);