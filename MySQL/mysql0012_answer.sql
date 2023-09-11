
use school_manager;

/* 查询工资大于或者等于6000的教师 */
select * from tb_teacher
where salary >= 6000;

/* 查询工资大于7000的男教师 */
select * from tb_teacher
where salary > 7000 and sex='m';

/* 查询1988年之前入职的教师 */
select * from tb_teacher
where year(checkindate) < 1988;

/* 查询班级编号是4的学生 */
select * from tb_student
where cid=4;

/* 查询2000年出生的学生 */
select * from tb_student
where year(birthday)=2000;

/* 查询2001年之前出生的女学生 */
select * from tb_student
where year(birthday)<2001 and sex='f';

/* 查询姓李的学生 */
select * from tb_student
where sname like '李%';

/* 查询姓名是两个字的学生 */
select * from tb_student
where char_length(sname)=2;

/* 查询姓名是三个字且姓张的学生 */
select * from tb_student
where sname like '张__';

/* 查询2000年出生的姓张的学生 */
select * from tb_student
where sname like '张%' and year(birthday)=2000;

/* 查询编号2开头的课程 */
select * from tb_subject
where sid like '2%';

/* 查询课程名称包含Java的课程 */
select * from tb_subject
where sname like '%Java%';

/* 查询课程名称包含框架且编号是3开头的课程 */
select * from tb_subject
where  left(sid,1)='3' and sname like '%框架%';

/* 查询课程编号为1_003的考试成绩 */
select * from tb_score
where sub_id='1_003';

/* 查询学生编号为1的考试成绩 */
select * from tb_score
where stu_id=1;

/* 查询学生编号为10的平均成绩 */
select avg(score) from tb_score
where stu_id=10;

/* 查询课程编号为1_002的考试不及格的 */
select * from tb_score
where sub_id='1_002' and score<60;

/* 查询分数大于或者等于90的考试信息 */
select * from tb_score
where score>=90;

/* 按照年龄由小到大排序显示学生信息 */
select * from tb_student
order by birthday desc;

/* 分性别按照年龄由大到小排序显示学生信息 */
select * from tb_student
order by sex,birthday;

/* 按照工资由高到低排序显示教师信息 */
select * from tb_teacher
order by salary desc;

/* 查询编号为3的学生考试成绩，并且由低到高显示成绩 */
select * from tb_score
where stu_id=3
order by score;

/* 查询课程1_002的考试成绩，并且由高到低显示成绩 */
select * from tb_score
where sub_id='1_002'
order by score desc;

/* 查询前十位学生 */
select * from tb_student
limit 10;

/* 查询第6-10位男学生 */
select * from tb_student
where sex='m'
limit 5,10;

/* 查询成绩最好的前五个 */
select * from tb_score
order by score desc
limit 5;

/* 统计学生人数 */
select count(*) from tb_student;

/* 按照性别统计学生人数 */
select sex,count(*) from tb_student
group by sex;

/* 按照出生年份统计学生人数 */
select year(birthday),count(*) from tb_student
group by year(birthday);

/* 按照科目统计平均成绩 */
select sub_id,avg(score) from tb_score
group by sub_id;

/* 按照学生统计平均成绩 */
select stu_id,avg(score) from tb_score
group by stu_id;

/* 按照性别统计教师平均工资 */
select sex,avg(salary) from tb_teacher
group by sex;

/* 查询考试成绩，并显示完整的学生信息 */
select  sc.*,st.*
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid;

/* 查询考试成绩，并显示完整的课程信息 */
select  sc.*,su.*
from tb_score sc
inner join tb_subject su on sc.sub_id=su.sid;

/* 查询考试成绩，并显示完整的学生信息和课程信息 */
select  sc.*,st.*,su.*
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid
inner join tb_subject su on sc.sub_id=su.sid;

/* 查询考试成绩，并显示完整的学生信息和班级信息 */
select  sc.*,st.*,c.*
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid
inner join tb_class c on st.cid=c.cid;

/* 查询考试成绩，并显示完整的学生信息和班级信息以及班主任信息 */
select  sc.*,st.*,c.*,t.*,su.*
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid
inner join tb_class c on st.cid=c.cid
inner join tb_teacher t on c.tid=t.tid;

/* 查询考试成绩，并显示完整的学生信息和班级信息以及班主任信息和课程信息  */
select  sc.*,st.*,c.*,t.*,su.*
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid
inner join tb_subject su on sc.sub_id=su.sid
inner join tb_class c on st.cid=c.cid
inner join tb_teacher t on c.tid=t.tid;

/* 查询考试成绩，显示学生姓名，课程名称，成绩，班级名称，班主任名称 */
select  st.sname,su.sname,sc.score,c.cname,t.name
from tb_score sc
inner join tb_student st on sc.stu_id=st.sid
inner join tb_subject su on sc.sub_id=su.sid
inner join tb_class c on st.cid=c.cid
inner join tb_teacher t on c.tid=t.tid;

/* 按照科目统计最高分和最低分 */
select sub_id,max(score),min(score)
from tb_score
group by sub_id;

/* 查询所有男生信息 */
select * from tb_student
where sex = 'm';

/* 按照学生出生年份统计数量 */
select year(birthday),count(*)
from tb_student
group by year(birthday);

/* 按照学生出生年份统计男女生数量 */
select year(birthday),sex,count(*)
from tb_student
group by year(birthday),sex;

/* 查询2000年出生且没有失效的学生信息 */
select * from tb_student
where  year(birthday)=2000 and disable='n';

/* 查询2000年以前出生的或者已经失效的学生信息 */
select * from tb_student
where  year(birthday)<2000 and disable='n';

/* 查询赵燕子老师班上的学生信息，只显示学生姓名，性别，出生日期，班级名称，班级描述信息 */
select s.sname,s.sex,s.birthday,c.cname,c.info
from tb_student s
inner join tb_class c on s.cid=c.cid
inner join tb_teacher t on c.tid=t.tid
where t.name='赵燕子';

/* 按照科目统计平均分，要求显示科目名称信息且平均分不要小数 */
select sc.sub_id,su.sname,floor(avg(score))
from tb_score sc
inner join tb_subject su on sc.sub_id=su.sid
group by sc.sub_id,su.sname;

/* 查询参加过3_003考试的学生信息 */
select * from tb_student
where sid in (select distinct stu_id from tb_score where sub_id='3_003');

/* 查询科目1_002分数最高的学生信息 */
select * from tb_student
where sid in 
(
select stu_id from tb_score
where sub_id='1_002' and score=(select max(score) from tb_score where sub_id='1_002')
);

/* 查询成绩信息，只显示学生姓名，课程编号，课程名称，成绩，班主任名称，班级名称 */
select st.sname,su.sid,su.sname,sc.score,t.name,c.cname
from tb_score sc
inner join tb_subject su on sc.sub_id=su.sid
inner join tb_student st on sc.stu_id=st.sid
inner join tb_class c on st.cid=c.cid
inner join tb_teacher t on c.tid=t.tid;

/* 查询学生信息，并显示所在班级名称和班主任姓名 */
select s.sid,s.sname,s.sex,s.birthday,c.cname,t.name from tb_student s 
inner join tb_class c on s.cid=c.cid
inner join tb_teacher t on c.tid=t.tid;

/* 查询授课信息，显示课程编号，课程名称，教师姓名 */
select st.sub_id,s.sname,t.name from tb_subject_teacher st
inner join tb_subject s on st.sub_id=s.sid
inner join tb_teacher t on st.tid=t.tid;

/* 查询授课老师信息 */
select * from tb_teacher
where tid in (select distinct tid from tb_subject_teacher);

/* 查询班主任信息 */
select * from tb_teacher
where tid in (select distinct tid from tb_class);

/* 查询成绩信息，只显示学生姓名，课程编号，课程名称，成绩，并按照科目由高到低显示成绩*/
select st.sname,su.sid,su.sname,sc.score
from tb_score sc
inner join tb_subject su on sc.sub_id=su.sid
inner join tb_student st on sc.stu_id=st.sid
order by su.sid,sc.score desc;

/* 显示没有考试成绩的课程信息 */
select * from tb_subject
where sid not in (select distinct sub_id from tb_score);

/* 显示没有考试成绩的学生信息 */
select * from tb_student
where sid not in (select distinct stu_id from tb_score);

/* 显示挂科的学生信息 */
select * from tb_student
where sid not in (select distinct stu_id from tb_score where score<60);

/* 查询课程成绩超过该课程平均分的成绩信息 */
select * from 
(
  select sc.*,(select avg(score) from tb_score where sub_id=sc.sub_id) 'sub_avg'
  from tb_score sc
  order by sc.sub_id
) a
where score>sub_avg;

/* 显示全体学生和教师信息，字段为编号，姓名，类型(学生，教师) */
select tid '编号',name '姓名', '教师' as '类型'  from tb_teacher
union
select sid '编号',sname '姓名', '学生' as '类型'  from tb_student;

/* 按照科目分别统计考试人数，只显示科目编号，科目名称，考试人数 */
select sc.sub_id,su.sname,count(*)
from tb_score sc
inner join tb_subject su on sc.sub_id=su.sid
group by sc.sub_id,su.sname;

/* 查询课程名称中包含a字母的课程信息 */
select * from tb_subject
where sname like '%a%';

/* 参加MySQL数据库考试的2000年出生的男学生信息 */
select * from tb_student
where sex='m' and year(birthday)=2000 and sid in
(
  select distinct stu_id from tb_score 
  where sub_id in (select sid from tb_subject where sname='MySQL数据库')
);

