use db_mysql_study;
/*=============================================================================*/

/* 选择字段显示(次序数量都可以随意) */
select dept_id,dept_name,dept_info,enable,lastupdate from tb_dept;

select dept_name from tb_dept;

select emp_name,salary,dept_id from tb_employee;

/* 限定查询记录的数量,limit 最大记录数量,limit 起始记录值,最大记录数量 */
select dept_name,dept_info from tb_dept limit 2;
select * from tb_employee limit 5,3;

/* 列别名称 as关键字可以省略 */
select dept_name as '部门名称',dept_info '部门描述' from tb_dept;

/* 去掉重复记录，如果distinct关键字后面有多列，表示去掉多列相加的结果的重复结果 */
select distinct dept_id from tb_employee;

select distinct sex from tb_employee;

select distinct dept_id,sex from tb_employee;

/* 排序,desc是倒序排列，如果order by后面有多列，会按照字段的次序决定排序优先级，不同列可以分别指定是否倒序 */
select * from tb_employee order by emp_name;

select * from tb_employee order by emp_name desc;

select * from tb_employee order by sex;

select * from tb_employee order by salary;

select * from tb_employee order by sex,salary;

select * from tb_employee order by sex desc,salary;

/* 查询结果过滤 */
/* 等值过滤 */
select * from tb_employee where sex='m';

select * from tb_employee where dept_id=2;

/* 组合条件 */
select * from tb_employee where dept_id=2 and sex='f';

select * from tb_employee where dept_id=2 or sex='f';

/* 取反 */
select * from tb_employee where not dept_id=2;

select * from tb_employee where not (dept_id=1 or sex='f');

/* 取值范围 */
select * from tb_employee where birthday < '1996-01-01';

select * from tb_employee where birthday >= '1996-09-01';

select * from tb_employee where birthday <= '1994-01-01' or birthday >= '1996-12-30';

select * from tb_employee where birthday >= '1994-01-01' and birthday <= '1996-12-30';

select * from tb_employee where birthday between '1994-01-01' and '1996-12-30';

select * from tb_employee where eid in (1,2,4,7);

/* 模糊查询 */
select * from tb_employee where emp_name like '张%';

select * from tb_employee where emp_name like '张_';

select * from tb_employee where emp_name like '%三%';

select * from tb_employee where emp_name like '__';

/* 聚合与分组，如果select中出现了聚合函数列，那么所有不是聚合函数的列都必须出现在group by中 */
select count(*) from tb_employee;

select sum(salary) from tb_employee;

select avg(salary) from tb_employee;

select max(salary) from tb_employee;

select min(salary) from tb_employee;

select max(birthday),min(birthday) from tb_employee;

select max(emp_name),min(emp_name) from tb_employee;

select sex,count(*) from tb_employee group by sex;

select dept_id,sum(salary) from tb_employee group by dept_id;

select sex,avg(salary) from tb_employee group by sex;

select dept_id,max(salary) from tb_employee group by dept_id;

select sex,min(salary) from tb_employee group by sex;

select sex,max(birthday),min(birthday) from tb_employee group by sex;
