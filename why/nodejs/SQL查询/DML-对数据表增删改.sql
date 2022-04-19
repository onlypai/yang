# DML

# 插入
INSERT INTO user (name, telphone, age, createTime, updateTime) VALUES ('wangyang', 34, '43124235', '2020-10-23', '2022-02-23');

# creatTime 和 updateTime 自动设置
# 给这俩字段加上默认值
ALTER TABLE `user` MODIFY createTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `user` MODIFY updateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


INSERT INTO user (name, telphone, age) VALUES ('tang', 33, '431244235');