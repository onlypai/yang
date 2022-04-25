# 创建学生表
CREATE TABLE IF NOT EXISTS students (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL,
	age INT
);

# 创建课程表
CREATE TABLE IF NOT EXISTS courses (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL,
	price DOUBLE
);
# 插入数据
INSERT into students (name, age) VALUES('wang', 18);
INSERT into students (name, age) VALUES('tom', 45);
INSERT into students (name, age) VALUES('lily', 25);
INSERT into students (name, age) VALUES('rong', 18);
INSERT into students (name, age) VALUES('yang', 20);

INSERT into courses (name, price) VALUES('篮球', 500);
INSERT into courses (name, price) VALUES('羽毛球', 20);
INSERT into courses (name, price) VALUES('游泳', 203);
INSERT into courses (name, price) VALUES('乒乓球', 20);
INSERT into courses (name, price) VALUES('足球', 10);

# 创建关系表
CREATE TABLE IF NOT EXISTS students_select_courses (
	id INT PRIMARY KEY AUTO_INCREMENT,
	student_id INT NOT NULL,
	course_id INT NOT NULL,
	-- PRIMARY KEY(student_id, course_id),联合主键
	FOREIGN KEY (student_id) REFERENCES students(id) ON UPDATE CASCADE,
	FOREIGN KEY (course_id) REFERENCES courses(id) ON UPDATE CASCADE
);


# 学生选课
INSERT INTO students_select_courses (student_id, course_id) VALUES (1, 1);
INSERT INTO students_select_courses (student_id, course_id) VALUES (1, 2);
INSERT INTO students_select_courses (student_id, course_id) VALUES (1, 3);
INSERT INTO students_select_courses (student_id, course_id) VALUES (2, 4);
INSERT INTO students_select_courses (student_id, course_id) VALUES (3, 1);
INSERT INTO students_select_courses (student_id, course_id) VALUES (3, 2);
INSERT INTO students_select_courses (student_id, course_id) VALUES (4, 4);
