/* 重建并使用数据库db_mysql_study */
/*=============================================================================*/
use information_schema;
drop database if exists db_mysql_study;
create database db_mysql_study default charset utf8mb4 collate utf8mb4_general_ci;
use db_mysql_study;
/*=============================================================================*/

/* 创建部门信息表 */
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

/* 添加一些部门信息 */
/*=============================================================================*/
insert into tb_dept(dept_name,dept_info) values('人事部','人员管理部门');
insert into tb_dept(dept_name,dept_info) values('开发部','最酷炫的，专门搞事情的部门');
insert into tb_dept(dept_name,dept_info) values('测试部','专门找开发部麻烦的部门');
/*=============================================================================*/

/* 查询部门信息 */
select * from tb_dept;
