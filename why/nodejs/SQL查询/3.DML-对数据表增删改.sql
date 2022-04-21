# DML

# 插入
INSERT INTO user (name, telphone, age, createTime, updateTime) VALUES ('wangyang', 34, '43124235', '2020-10-23', '2022-02-23');

# creatTime 和 updateTime 自动设置
# 给这俩字段加上默认值
ALTER TABLE `user` MODIFY createTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `user` MODIFY updateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


INSERT INTO user (name, age, telphone) VALUES ('tasang', 33, '4312244235');

# 删除
# 删除表中所有数据
DELETE FROM `user`;
# 根据条件删除    WHERE条件语句⭐
DELETE FROM `user` WHERE `id`=2;

# 更新
# 一般是跟上条件来更新，不跟条件默认更新表中所有数据
UPDATE `user` SET name='wangyang', telphone='6516516516' WHERE id=1; 