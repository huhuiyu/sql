/* 重建并使用数据库db_mysql_study */
/*=============================================================================*/
use information_schema;
drop database if exists db_mysql_study;
create database db_mysql_study default charset utf8mb4 collate utf8mb4_general_ci;
use db_mysql_study;
/*=============================================================================*/

/* 部门表 */
/*=============================================================================*/
create table tb_dept
(
  dept_id integer auto_increment primary key comment '部门编号',
  dept_name varchar(50) unique not null comment '部门名称',
  dept_info varchar(200) comment '部门描述信息',
  enable enum('y','n') default 'y' not null comment '部门是否启用',
  lastupdate timestamp on update now() default now() not null comment '信息最后修改时间'
)comment '部门信息表';
/*=============================================================================*/

/* 员工表 */
/*=============================================================================*/
create table tb_employee
(
  eid integer auto_increment primary key comment '编号',
  dept_id integer comment '所属部门的部门编号',
  emp_name varchar(20) not null comment '姓名',
  sex enum('m','f') not null comment '性别',
  salary decimal(10,2) not null comment '工资',
  birthday timestamp not null comment '出生日期'
)comment '员工信息表';
/*=============================================================================*/

/* 添加部门信息 */
insert into tb_dept(dept_name,dept_info) values('人事部','人员管理部门');
insert into tb_dept(dept_name,dept_info) values('开发部','最酷炫的，专门搞事情的部门');
insert into tb_dept(dept_name,dept_info) values('测试部','专门找开发部麻烦的部门');
insert into tb_dept(dept_name,dept_info) values('客服部','应付客户的部门');

/* 添加员工信息 */
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(3,'张科望','m',5500,'1996-01-09');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(2,'成文明','m',3010,'1993-10-09');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(1,'谢慧梅','f',2100,'1992-12-07');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(2,'赵勇','m',4100,'1993-03-01');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(2,'张三疯','m',3100,'1993-01-01');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(3,'张丽','f',9898,'1994-01-03');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(3,'成芝灵','f',6666,'1995-06-07');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(2,'姚芳','f',7000,'2000-06-19');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(3,'李梅','f',6300,'1998-11-11');
insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(2,'李明旺','m',8900,'1997-11-11');

/* 查询信息 */
select * from tb_employee e
inner join tb_dept d on e.dept_id=d.dept_id;

/*
  作业：
  创建校园管理数据库
  创建班级信息表和学生信息表
  要求两张表要有关联关系，要求使用学到过的全部约束和数据类型
 */