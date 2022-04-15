# 查看所有数据库
SHOW DATABASE;
# 使用某个数据库
USE coderhub;
# 查看正在使用的数据库
SELECT DATABASE();

# 创建数据库
CREATE DATABASE douyu;
CREATE DATABASE IF NOT EXISTS douyu;
# 创建数据库并指定字符集和编码格式
CREATE DATABASE IF NOT EXISTS douyu DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

# 删除数据库
DROP DATABASE IF EXISTS douyu;

# 修改数据库编码
ALTER DATABASE douyu CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;