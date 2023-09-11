use db_mysql_study;

/*
  包含关系的数据表
  decimal是十进制数（整数位，小数位）
  dept_id是填写部门的id
*/
/*=============================================================================*/
create table tb_employee
(
  emp_id integer auto_increment primary key comment '编号',
  dept_id integer comment '所属部门的部门编号',
  emp_name varchar(20) not null comment '姓名',
  sex enum('m','f') not null comment '性别',
  salary decimal(10,2) not null comment '工资',
  lastupdate timestamp on update now() default now() not null comment '信息最后修改时间'
)comment '员工信息表';
/*=============================================================================*/

/* 添加数据的时候需要指定员工部门所在的部门编号 */
insert into tb_employee(dept_id,emp_name,sex,salary) values(1,'张三丰','m',10000.12);
insert into tb_employee(dept_id,emp_name,sex,salary) values(2,'灭绝师太','f',8888);
insert into tb_employee(dept_id,emp_name,sex,salary) values(2,'风清扬','m',6456.78);
insert into tb_employee(dept_id,emp_name,sex,salary) values(2,'独孤求败','m',5000);
insert into tb_employee(dept_id,emp_name,sex,salary) values(3,'黄蓉','f',3456.78);

/* 查询数据 */
select * from tb_employee;

/* 通过表关系联合查询多表记录 */
select * from tb_employee e
inner join tb_dept d
on e.dept_id=d.dept_id;

/* 常见的关系数据，省份和城市联动 */
create table tb_province_info
(
  pid integer auto_increment primary key comment '编号',
  province varchar(255) unique not null comment '省份'
)comment '省份信息表';

create table tb_city_info
(
  cid integer auto_increment primary key comment '编号',
  pid integer not null comment '所在省份',
  city varchar(255) not null comment '城市'
)comment '城市信息表';

/* 添加数据 */
insert into tb_province_info(province) values('湖南');
insert into tb_province_info(province) values('湖北');

insert into tb_city_info(pid,city) values(1,'长沙');
insert into tb_city_info(pid,city) values(1,'常德');
insert into tb_city_info(pid,city) values(1,'张家界');

insert into tb_city_info(pid,city) values(2,'武汉');
insert into tb_city_info(pid,city) values(2,'宜昌');

/*联合查询*/
select * from tb_city_info c
inner join tb_province_info p
on c.pid=p.pid;