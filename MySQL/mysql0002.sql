/* 切换到自己的数据库 */
use db_mysql_study;

/* 
  创建数据表，tb_前缀表示是表，dept表示部门，连起来就是部门信息表
  表里面包含了相关字段信息，用于描述表的结构组成
  comment是字段和表的说明信息
  character set utf8mb4 collate utf8mb4_general_ci是指定表的编码，如果数据库指定了，可以省略
  字段描述格式为 字段名称 字段的数据类型，多个字段之间用逗号分隔
  integer为整数类型，varchar是字符串，括号里面是最大字符数量，timestamp是时间戳

 */
create table tb_dept
(
  deptId integer comment '部门编号',
  deptName varchar(50) comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  lastupdate timestamp comment '信息最后修改时间'
)comment '部门信息表' character set utf8mb4 collate utf8mb4_general_ci;

/* 如果存在就删除表 */
use db_mysql_study;

drop table if exists tb_dept;

/* 删除前后查询表信息列表 */
show tables;

/* 删除并重建表信息 */
use db_mysql_study;

drop table if exists tb_dept;

create table tb_dept
(
  deptId integer comment '部门编号',
  deptName varchar(50) comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  lastupdate timestamp comment '信息最后修改时间'
)comment '部门信息表';

select * from tb_dept;

show tables;

/* 添加表数据，数值字段的数据直接输入数值，字符串类型要放在单引号里面,now()函数是获取系统当前时间戳 */
insert into tb_dept(deptId,deptName,deptInfo,lastupdate) values(1,'总裁办公室','霸道总裁专属位置',now());

/* 最简单的查询语句，查看数据表的记录 */
select * from tb_dept;

/* 添加多笔记录 */
insert into tb_dept(deptId,deptName,deptInfo,lastupdate) values(2,'人事部','人员管理部门',now());
insert into tb_dept(deptId,deptName,deptInfo,lastupdate) values(3,'开发部','最酷炫的，专门搞事情的部门',now());

select * from tb_dept;

/* 作业：在学生管理数据库里面创建班级表，在自己的数据库中创建自己构想的表，字段都是自定义 */