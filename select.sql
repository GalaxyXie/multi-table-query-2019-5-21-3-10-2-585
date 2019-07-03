# 1.查询同时存在1课程和2课程的情况
select studentId
from student_course
where courseId='1' and courseId='1';
# 2.查询同时存在1课程和2课程的情况
select studentId
from student_course
where courseId='1' and courseId='1';
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select t1.studentId,t2.name,
avg(t1.score) as avg_score
from
   student_course t1
left join student t2 on
   t1.studentId=t2.id
group by
	t1.studentId
having 
	avg(t1.score)>=60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select a.id, a.name , ifnull(cast(avg(b.score) as decimal(18,2)),0) avg_score
from student a left join student_course b
on a.id = b.studentId
group by a.id , a.name
having ifnull(cast(avg(b.score) as decimal(18,2)),0) = 0
order by a.id;
# 5.查询所有有成绩的SQL
select t1.id, t1.name, count(t2.courseId), sum(score)
from student t1 , student_course t2
where t1.id = t2.studentId
group by t1.id,t1.name
order by t1.id;
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student
where id in (
        select t1.studentId from
        student_course t1,
        student_course t2
    where
        t1.studentId = t2.studentId
        and t1.courseId = '01'
        and t2.courseId= '02');

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select
    t2.*
from
    student_course t1,
    student t2
where
    t2.id = t1.studentId
    and t1.score < '60'
    and t1.courseId = '01'
order by
    t1.score;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select student_course.courseId,AVG(student_course.score)from student_course 
GROUP BY student_course.courseId
ORDER BY AVG(student_course.score) desc ,student_course.courseId asc;
# 9.查询课程名称为"数学"。且分数低于60的学生姓名和分数
select a.id,b.courseId,b.score from student a
left join
student_course b 
on a.id=b.studentId;