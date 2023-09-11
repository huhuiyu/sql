/* 重建并使用数据库school_manager */
/*=============================================================================*/
use information_schema;
drop database if exists school_manager;
create database school_manager default charset utf8mb4 collate utf8mb4_general_ci;
use school_manager;
/*=============================================================================*/

/* 教师信息表 */
/*=============================================================================*/
create table tb_teacher
(
  tid integer auto_increment primary key comment '主键，教师编号',
  name varchar(20) not null comment '姓名',
  sex enum('m','f') not null comment '性别',
  salary decimal(10,2) not null comment '工资',
  checkindate timestamp default now() not null comment '入职日期'
)comment '教师信息表';
/*=============================================================================*/

/* 班级信息表 */
/*=============================================================================*/
create table tb_class
(
  cid integer auto_increment primary key comment '主键，班级编号',
  tid integer not null comment '班主任',
  cname varchar(20) unique not null comment '班级名称',
  info varchar(200) not null comment '班级描述'
)comment '班级信息表';
/*=============================================================================*/

/* 学生信息表 */
/*=============================================================================*/
create table tb_student
(
  sid integer auto_increment primary key comment '主键，学生编号',
  cid integer not null comment '学生所属班级',
  sname varchar(20) not null comment '学生姓名',
  sex enum('m','f') not null comment '性别',
  birthday timestamp comment '出生日期',
  disable enum('y','n') default 'n' not null comment '是否失效'
)comment '学生信息表';
/*=============================================================================*/

/* 课程信息表 */
/*=============================================================================*/
create table tb_subject
(
  sid varchar(20) primary key comment '主键，科目编号',
  sname varchar(50) unique not null comment '科目名称'
)comment '科目信息表';
/*=============================================================================*/

/* 课程教师信息表 */
/*=============================================================================*/
create table tb_subject_teacher
(
  sid integer auto_increment primary key comment '主键，课程教师信息编号',
  sub_id varchar(50) not null comment '科目编号',
  tid integer not null comment '授课老师'
)comment '课程教师信息表';
/*=============================================================================*/

/* 成绩信息表 */
/*=============================================================================*/
create table tb_score
(
  sid integer auto_increment primary key comment '主键，成绩编号',
  stu_id integer not null comment '学生编号',
  sub_id varchar(20) not null comment '科目编号',
  score decimal(6,2) not null comment '成绩'
)comment '成绩信息表';
/*=============================================================================*/

/* 教师信息 */
insert into tb_teacher(name,sex,salary,checkindate) values('赵洛育','m',7431.8,'1987-10-09');
insert into tb_teacher(name,sex,salary,checkindate) values('刘洪利','m',3650.4,'1984-03-22');
insert into tb_teacher(name,sex,salary,checkindate) values('李慧颖','f',6950,'1988-02-01');
insert into tb_teacher(name,sex,salary,checkindate) values('何士如','m',6445.2,'1988-03-11');
insert into tb_teacher(name,sex,salary,checkindate) values('李红英','f',9034.8,'1984-10-08');
insert into tb_teacher(name,sex,salary,checkindate) values('谢晓辉','m',5556.8,'1992-12-30');
insert into tb_teacher(name,sex,salary,checkindate) values('赵燕子','f',7120.1,'1985-01-01');

select * from tb_teacher;

/* 班级信息 */
insert into tb_class(tid,cname,info) values(7,'计算机1701','计算机专业2017级一班');
insert into tb_class(tid,cname,info) values(2,'计算机1801','计算机专业2018级一班');
insert into tb_class(tid,cname,info) values(7,'计算机1901','计算机专业2019级一班');
insert into tb_class(tid,cname,info) values(7,'计算机1902','计算机专业2019级二班');
insert into tb_class(tid,cname,info) values(2,'计算机1903','计算机专业2019级三班');

select * from tb_class;

/* 学生信息 */
insert into tb_student(cid,sname,sex,birthday) values(1,'张杰','m','1999-01-01');
insert into tb_student(cid,sname,sex,birthday) values(1,'韩梅梅','f','1999-02-01');

insert into tb_student(cid,sname,sex,birthday) values(2,'蔡徐坤','m','2000-06-07');
insert into tb_student(cid,sname,sex,birthday) values(2,'赵勇','m','2000-07-11');
insert into tb_student(cid,sname,sex,birthday) values(2,'张美丽','f','2000-05-21');
insert into tb_student(cid,sname,sex,birthday,disable) values(2,'姚芳','f','2000-03-30','y');

insert into tb_student(cid,sname,sex,birthday) values(3,'谢慧梅','f','2001-06-06');
insert into tb_student(cid,sname,sex,birthday,disable) values(3,'张科望','m','2001-11-11','y');
insert into tb_student(cid,sname,sex,birthday) values(3,'李慧','f','2001-09-21');
insert into tb_student(cid,sname,sex,birthday) values(3,'李明旺','m','2001-09-01');
insert into tb_student(cid,sname,sex,birthday) values(3,'杨明强','m','2001-02-28');

insert into tb_student(cid,sname,sex,birthday) values(4,'杨颖','f','2001-09-21');
insert into tb_student(cid,sname,sex,birthday) values(4,'范冰冰','f','2001-09-01');
insert into tb_student(cid,sname,sex,birthday) values(4,'苏红旗','m','2001-02-28');
insert into tb_student(cid,sname,sex,birthday) values(4,'龚敏','m','2001-04-12');
insert into tb_student(cid,sname,sex,birthday) values(4,'尚金妮','f','2001-04-13');
insert into tb_student(cid,sname,sex,birthday) values(4,'钱凯','m','2001-03-15');

insert into tb_student(cid,sname,sex,birthday) values(5,'韩海洋','m','2001-03-03');
insert into tb_student(cid,sname,sex,birthday) values(5,'蒋庆波','m','2001-05-21');
insert into tb_student(cid,sname,sex,birthday) values(5,'田甜','f','2001-04-27');
insert into tb_student(cid,sname,sex,birthday) values(5,'向冰洁','f','2001-11-13');
insert into tb_student(cid,sname,sex,birthday) values(5,'武启力','m','2001-10-26');

select * from tb_student;

/* 课程信息 */
insert into tb_subject (sid,sname) values ('1_001','计算机基础');
insert into tb_subject (sid,sname) values ('1_002','Office入门');
insert into tb_subject (sid,sname) values ('1_003','HTML');
insert into tb_subject (sid,sname) values ('2_001','JavaScript');
insert into tb_subject (sid,sname) values ('2_002','Java面向对象编程语言');
insert into tb_subject (sid,sname) values ('2_003','MySQL数据库');
insert into tb_subject (sid,sname) values ('2_004','Photoshop图像设计');
insert into tb_subject (sid,sname) values ('2_005','mybatis框架技术');
insert into tb_subject (sid,sname) values ('3_001','springboot框架技术');
insert into tb_subject (sid,sname) values ('3_002','android手机开发');
insert into tb_subject (sid,sname) values ('3_003','react框架技术');

select * from tb_subject;

/*课程教师信息*/
insert into tb_subject_teacher(sub_id,tid) values('1_001',3);
insert into tb_subject_teacher(sub_id,tid) values('1_002',1);
insert into tb_subject_teacher(sub_id,tid) values('1_003',4);
insert into tb_subject_teacher(sub_id,tid) values('2_001',1);
insert into tb_subject_teacher(sub_id,tid) values('2_002',1);
insert into tb_subject_teacher(sub_id,tid) values('2_003',5);
insert into tb_subject_teacher(sub_id,tid) values('2_004',6);
insert into tb_subject_teacher(sub_id,tid) values('2_005',4);
insert into tb_subject_teacher(sub_id,tid) values('2_005',3);
insert into tb_subject_teacher(sub_id,tid) values('3_001',4);
insert into tb_subject_teacher(sub_id,tid) values('3_002',4);
insert into tb_subject_teacher(sub_id,tid) values('3_003',3);

select * from tb_subject_teacher;

/* 成绩信息 */
insert into tb_score(stu_id,sub_id,score) values(1,'1_003',88);
insert into tb_score(stu_id,sub_id,score) values(1,'2_001',83);
insert into tb_score(stu_id,sub_id,score) values(1,'2_002',66);
insert into tb_score(stu_id,sub_id,score) values(1,'2_003',62);
insert into tb_score(stu_id,sub_id,score) values(1,'2_005',73);
insert into tb_score(stu_id,sub_id,score) values(1,'3_001',87);
insert into tb_score(stu_id,sub_id,score) values(1,'3_002',73);
insert into tb_score(stu_id,sub_id,score) values(1,'3_003',97);

insert into tb_score(stu_id,sub_id,score) values(2,'1_003',97);
insert into tb_score(stu_id,sub_id,score) values(2,'2_001',76);
insert into tb_score(stu_id,sub_id,score) values(2,'2_002',89);
insert into tb_score(stu_id,sub_id,score) values(2,'2_003',76);
insert into tb_score(stu_id,sub_id,score) values(2,'2_005',78);
insert into tb_score(stu_id,sub_id,score) values(2,'3_001',72);
insert into tb_score(stu_id,sub_id,score) values(2,'3_002',82);
insert into tb_score(stu_id,sub_id,score) values(2,'3_003',76);

insert into tb_score(stu_id,sub_id,score) values(3,'1_001',88);
insert into tb_score(stu_id,sub_id,score) values(3,'1_002',62);
insert into tb_score(stu_id,sub_id,score) values(3,'1_003',78);
insert into tb_score(stu_id,sub_id,score) values(3,'2_001',98);
insert into tb_score(stu_id,sub_id,score) values(3,'2_002',88);
insert into tb_score(stu_id,sub_id,score) values(3,'2_003',86);

insert into tb_score(stu_id,sub_id,score) values(4,'1_001',50);
insert into tb_score(stu_id,sub_id,score) values(4,'1_002',75);
insert into tb_score(stu_id,sub_id,score) values(4,'1_003',50);
insert into tb_score(stu_id,sub_id,score) values(4,'2_001',83);
insert into tb_score(stu_id,sub_id,score) values(4,'2_002',75);
insert into tb_score(stu_id,sub_id,score) values(4,'2_003',87);

insert into tb_score(stu_id,sub_id,score) values(5,'1_001',53);
insert into tb_score(stu_id,sub_id,score) values(5,'1_002',100);
insert into tb_score(stu_id,sub_id,score) values(5,'1_003',84);
insert into tb_score(stu_id,sub_id,score) values(5,'2_001',75);
insert into tb_score(stu_id,sub_id,score) values(5,'2_002',61);
insert into tb_score(stu_id,sub_id,score) values(5,'2_003',57);

insert into tb_score(stu_id,sub_id,score) values(6,'1_001',97);
insert into tb_score(stu_id,sub_id,score) values(6,'1_002',99);

insert into tb_score(stu_id,sub_id,score) values(7,'1_001',79);
insert into tb_score(stu_id,sub_id,score) values(7,'1_002',86);
insert into tb_score(stu_id,sub_id,score) values(7,'1_003',79);
insert into tb_score(stu_id,sub_id,score) values(7,'2_001',60);

insert into tb_score(stu_id,sub_id,score) values(8,'1_001',56);

insert into tb_score(stu_id,sub_id,score) values(9,'1_001',78);
insert into tb_score(stu_id,sub_id,score) values(9,'1_002',98);
insert into tb_score(stu_id,sub_id,score) values(9,'1_003',92);
insert into tb_score(stu_id,sub_id,score) values(9,'2_001',95);

insert into tb_score(stu_id,sub_id,score) values(10,'1_001',82);
insert into tb_score(stu_id,sub_id,score) values(10,'1_002',88);
insert into tb_score(stu_id,sub_id,score) values(10,'1_003',57);
insert into tb_score(stu_id,sub_id,score) values(10,'2_001',51);

insert into tb_score(stu_id,sub_id,score) values(11,'1_001',95);
insert into tb_score(stu_id,sub_id,score) values(11,'1_002',90);
insert into tb_score(stu_id,sub_id,score) values(11,'1_003',94);
insert into tb_score(stu_id,sub_id,score) values(11,'2_001',99);

insert into tb_score(stu_id,sub_id,score) values(12,'1_001',54);
insert into tb_score(stu_id,sub_id,score) values(12,'1_003',99);
insert into tb_score(stu_id,sub_id,score) values(12,'2_001',99);

insert into tb_score(stu_id,sub_id,score) values(13,'1_001',79);
insert into tb_score(stu_id,sub_id,score) values(13,'1_002',75);
insert into tb_score(stu_id,sub_id,score) values(13,'1_003',87);
insert into tb_score(stu_id,sub_id,score) values(13,'2_001',88);

insert into tb_score(stu_id,sub_id,score) values(14,'1_001',80);
insert into tb_score(stu_id,sub_id,score) values(14,'1_002',70);
insert into tb_score(stu_id,sub_id,score) values(14,'1_003',51);
insert into tb_score(stu_id,sub_id,score) values(14,'2_001',60);

insert into tb_score(stu_id,sub_id,score) values(15,'1_001',58);
insert into tb_score(stu_id,sub_id,score) values(15,'1_002',64);
insert into tb_score(stu_id,sub_id,score) values(15,'1_003',74);
insert into tb_score(stu_id,sub_id,score) values(15,'2_001',50);

insert into tb_score(stu_id,sub_id,score) values(16,'1_001',70);
insert into tb_score(stu_id,sub_id,score) values(16,'1_002',52);
insert into tb_score(stu_id,sub_id,score) values(16,'1_003',61);
insert into tb_score(stu_id,sub_id,score) values(16,'2_001',82);

insert into tb_score(stu_id,sub_id,score) values(17,'1_001',55);
insert into tb_score(stu_id,sub_id,score) values(17,'2_001',86);

insert into tb_score(stu_id,sub_id,score) values(18,'1_001',100);
insert into tb_score(stu_id,sub_id,score) values(18,'1_002',73);
insert into tb_score(stu_id,sub_id,score) values(18,'1_003',60);
insert into tb_score(stu_id,sub_id,score) values(18,'2_001',100);

insert into tb_score(stu_id,sub_id,score) values(19,'1_001',60);
insert into tb_score(stu_id,sub_id,score) values(19,'1_002',100);
insert into tb_score(stu_id,sub_id,score) values(19,'1_003',98);
insert into tb_score(stu_id,sub_id,score) values(19,'2_001',62);

insert into tb_score(stu_id,sub_id,score) values(21,'1_001',62);
insert into tb_score(stu_id,sub_id,score) values(21,'1_002',82);
insert into tb_score(stu_id,sub_id,score) values(21,'1_003',92);
insert into tb_score(stu_id,sub_id,score) values(21,'2_001',68);

insert into tb_score(stu_id,sub_id,score) values(22,'1_001',75);
insert into tb_score(stu_id,sub_id,score) values(22,'1_002',84);
insert into tb_score(stu_id,sub_id,score) values(22,'1_003',58);

select * from tb_score;
