use db_mysql_study;

/*
   一般情况下，最后更新时间就是操作数据的时刻（now()）
   如果能自动默认填写为当前时间就简单了
   on update now()表示当记录修改的时候默认更新字段的值为now()
   default now()表示添加记录时，如果没有给出字段的值就默认now()
 */
drop table if exists tb_dept;

create table tb_dept
(
  deptId integer auto_increment primary key comment '部门编号',
  deptName varchar(50) unique not null comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  lastupdate timestamp on update now() default now() not null comment '信息最后修改时间'
)comment '部门信息表';

insert into tb_dept(deptName,deptInfo,lastupdate) values('人事部','人员管理部门','2010-10-10 09:10:11');
insert into tb_dept(deptName,deptInfo) values('开发部','最酷炫的，专门搞事情的部门');
insert into tb_dept(deptName,deptInfo) values('测试部','专门找开发部麻烦的部门');

select * from tb_dept;

/*
  扩展部门表，让部门可以停用和启用
  为什么是停用而不删除，就好比银行账号冻结，只是不让用，而不能删除
  enum数据类型叫做枚举，可以在括号内指定字段的取值范围
  例如：enum(1,10，20)表示字段的值只能是1,10,20三个中的一个
*/
drop table if exists tb_dept;

create table tb_dept
(
  deptId integer auto_increment primary key comment '部门编号',
  deptName varchar(50) unique not null comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  enable enum('y','n') default 'y' not null comment '部门是否启用',
  lastupdate timestamp on update now() default now() not null comment '信息最后修改时间'
)comment '部门信息表';

/* 错误的枚举值无法添加 */
insert into tb_dept(deptName,deptInfo,enable) values('enable测试','不在enum中的值无法添加','i');

/* 枚举和默认值搭配演示 */
insert into tb_dept(deptName,deptInfo) values('人事部','人员管理部门');
insert into tb_dept(deptName,deptInfo,enable) values('开发部','最酷炫的，专门搞事情的部门','y');
insert into tb_dept(deptName,deptInfo,enable) values('测试部','专门找开发部麻烦的部门','n');

select * from tb_dept;


/* 作业：在学生管理数据库里面创建班级表，在自己的数据库中创建自己构想的表，字段都是自定义，但是需要体现默认值和枚举*/