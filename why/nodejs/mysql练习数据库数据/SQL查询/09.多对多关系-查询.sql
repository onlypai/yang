# 查询所有进行了选课的学生，以及对应的课程（两个内连接）
SELECT a.id, a.name stuName, a.age stuAge, c.id cId, c.name cName, c.price cPrice
FROM students a
JOIN students_select_courses b ON a.id = b.student_id
JOIN courses c ON b.course_id = c.id; 

# 查询所有学生的选课情况（左连接）
SELECT a.id, a.name stuName, a.age stuAge, c.id cId, c.name cName, c.price cPrice
FROM students a
LEFT JOIN students_select_courses b ON a.id = b.student_id
LEFT JOIN courses c ON b.course_id = c.id;

# 查询所有没有选课的学生（在上面基础上挑出）
SELECT a.id, a.name stuName, a.age stuAge, c.id cId, c.name cName, c.price cPrice
FROM students a
LEFT JOIN students_select_courses b ON a.id = b.student_id
LEFT JOIN courses c ON b.course_id = c.id
WHERE c.id IS NULL;

# 查询所有没有被选择的课程
SELECT a.id, a.name stuName, a.age stuAge, c.id cId, c.name cName, c.price cPrice
FROM students a
RIGHT JOIN students_select_courses b ON a.id = b.student_id
RIGHT JOIN courses c ON b.course_id = c.id
WHERE a.id IS NULL;

# 查询某一个学生的选课情况
SELECT a.id, a.name stuName, a.age stuAge, c.id cId, c.name cName, c.price cPrice
FROM students a
LEFT JOIN students_select_courses b ON a.id = b.student_id
LEFT JOIN courses c ON b.course_id = c.id
WHERE a.id = 1;