use db_mysql_study;

/* 
  数据库为了避免表中间出现完全相同的记录，添加了primary key（主键）的字段约束
  而添加了该约束的字段不能有相同的值，能快速且唯一定位一笔表的记录
 */
drop table if exists tb_dept;

create table tb_dept
(
  deptId integer primary key comment '部门编号',
  deptName varchar(50) comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  lastupdate timestamp comment '信息最后修改时间'
)comment '部门信息表';

/* 现在不能添加相同deptId值的记录了 */
insert into tb_dept(deptId,deptName,deptInfo,lastupdate) values(2,'人事部','人员管理部门',now());
insert into tb_dept(deptId,deptName,deptInfo,lastupdate) values(2,'人事部1','人员管理部门1',now());

/* 执行查询，不会添加多比相同的记录 */
select * from tb_dept;

/* 
  主键不能重复，如果能够自动编号会简单很多
  autu_increment可以完成这个功能
  添加了该约束的字段（必须是数值类型）可以自动编号，不论添加是否成功
 */
drop table if exists tb_dept;

create table tb_dept
(
  deptId integer auto_increment primary key comment '部门编号',
  deptName varchar(50) comment '部门名称',
  deptInfo varchar(200) comment '部门描述信息',
  lastupdate timestamp comment '信息最后修改时间'
)comment '部门信息表';

/* 添加的时候不再需要填写部门编号 */
insert into tb_dept(deptName,deptInfo,lastupdate) values('总裁办公室','霸道总裁专属位置',now());
insert into tb_dept(deptName,deptInfo,lastupdate) values('人事部','人员管理部门',now());
insert into tb_dept(deptName,deptInfo,lastupdate) values('开发部','最酷炫的，专门搞事情的部门',now());

select * from tb_dept;

/* 作业：在学生管理数据库里面创建班级表，在自己的数据库中创建自己构想的表，字段都是自定义，但是需要体现主键和自动增长*/