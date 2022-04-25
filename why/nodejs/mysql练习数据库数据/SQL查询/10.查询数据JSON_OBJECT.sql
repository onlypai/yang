# 将联合查询到的数据转成 对象 （一对多）
SELECT 
a.id, a.displayName, 
JSON_OBJECT('id',b.id, 'name', b.teamName, 'city', b.teamCity) teams 
FROM players a 
LEFT OUTER JOIN teams b ON a.teamName_id = b.id;

#将查询到的多条数据组织成对象，放入一个 数组 中（多对多） 需要分组
# 查询所有进行了选课的学生，以及对应的课程
# 根据id分组，那么a.name, a.age也可以查出
SELECT a.id, a.name, a.age, JSON_ARRAYAGG(JSON_OBJECT('id',c.id, 'name',c.name,'price', c.price))
FROM students a
JOIN students_select_courses b ON a.id = b.student_id
JOIN courses c ON b.course_id = c.id
GROUP BY a.id; 