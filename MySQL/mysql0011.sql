use db_mysql_study;
/*=============================================================================*/
/* 联合查询 */
select e.*,d.*
from tb_employee e
inner join tb_dept d on e.dept_id=d.dept_id;

select e.eid,e.emp_name,e.salary,d.dept_name
from tb_employee e
inner join tb_dept d on e.dept_id=d.dept_id;

select e.eid,e.emp_name,e.salary,d.dept_name
from tb_employee e
inner join tb_dept d on e.dept_id=d.dept_id;

select e.eid,e.emp_name,e.salary,d.dept_name
from tb_employee e
inner join tb_dept d on e.dept_id=d.dept_id
where d.dept_id in (2,3)
order by e.salary;

insert into tb_employee(dept_id,emp_name,sex,salary,birthday) values(100,'部门错误','m',8900.78,'1999-11-11');

select e.*,d.*
from tb_employee e
left join tb_dept d on e.dept_id=d.dept_id;

select e.*,d.*
from tb_employee e
right join tb_dept d on e.dept_id=d.dept_id;

select e.*,d.*
from tb_employee e,tb_dept d;

/*  子查询 */
select distinct dept_id from tb_employee;

/* 子查询作为in的条件时，只能是单一列 */
select * from tb_dept
where not dept_id in (select distinct dept_id from tb_employee);

select avg(salary) from tb_employee;

select * from tb_employee
where salary>=(select avg(salary) from tb_employee);

select *,salary - (select avg(salary) from tb_employee),sign(salary - (select avg(salary) from tb_employee)) from tb_employee;

select emp_name,salary,sex,ceiling(salary_avg) from
(
  select *,(select avg(salary) from tb_employee) 'salary_avg',sign(salary-(select avg(salary) from tb_employee)) 'salary_sign' from tb_employee
) a
where salary_sign>=0;

select *,(select avg(salary) from tb_employee where dept_id=e.dept_id) from tb_employee e
order by e.dept_id;

/* 值转换 */
select *,case sex when 'f' then '女员工' when 'm' then '男员工' else '不存在的' end '性别'
from tb_employee;

select *,case when salary<2500 then '哦荷' when salary<4500 then '啊哈' when salary<7500 then '嗯哼' else '嘿嘿嘿' end '工资'
from tb_employee;

select *,case when salary<2500 then '⭐' when salary<4500 then '⭐⭐' when salary<7500 then '⭐⭐⭐' else '⭐⭐⭐⭐' end '工资'
from tb_employee;

/* 合并记录 */
select dept_id '编号',dept_name '名称' from tb_dept
union
select eid '编号',emp_name '名称' from tb_employee;