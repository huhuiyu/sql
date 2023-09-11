use db_mysql_study;

/* 不添加部门名称(不合理操作) */
insert into tb_dept(deptInfo,lastupdate) values('跳过部门名称添加',now());

select * from tb_dept;

/* 
  not null约束，字段必须填写数据
 */
drop table if exists tb_dept;

create table tb_dept
(
  deptId integer auto_increment primary key comment '部门编号',
  deptName varchar(50) not null comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  lastupdate timestamp comment '信息最后修改时间'
)comment '部门信息表';

/* 现在不能省略部门名称了 */
insert into tb_dept(deptInfo,lastupdate) values('跳过部门名称添加',now());

select * from tb_dept;

/* 添加相同的部门名称(不合理操作) */
insert into tb_dept(deptName,deptInfo,lastupdate) values('人事部','人员管理部门',now());
insert into tb_dept(deptName,deptInfo,lastupdate) values('人事部','重复的部门名称',now());

select * from tb_dept;


/* 
  unique约束，字段不能有相同的数据
 */
drop table if exists tb_dept;

create table tb_dept
(
  deptId integer auto_increment primary key comment '部门编号',
  deptName varchar(50) unique not null comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  lastupdate timestamp comment '信息最后修改时间'
)comment '部门信息表';

/* 相同的部门名称无法添加 */
insert into tb_dept(deptName,deptInfo,lastupdate) values('人事部','人员管理部门',now());
insert into tb_dept(deptName,deptInfo,lastupdate) values('人事部','重复的部门名称',now());

select * from tb_dept;

/* 作业：在学生管理数据库里面创建班级表，在自己的数据库中创建自己构想的表，字段都是自定义，但是需要体现非空和唯一*/