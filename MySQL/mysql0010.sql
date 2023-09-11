use db_mysql_study;
/*=============================================================================*/

/* 日期函数 */
/* 当前时间 */
select now(),current_date(),current_time(),unix_timestamp();

/*获取日期中年月日时分秒星期信息*/
select birthday,year(birthday),month(birthday),dayofmonth(birthday),hour(now()),minute(now()),second(now()) from tb_employee;

select * from tb_employee where year(birthday)=1993;

select * from tb_employee where month(birthday)=1;

select * from tb_employee where year(birthday) in (1992,1994,1996,1998,2000);

select dayofweek(now()),dayofyear(now()),week(now());

/* 日期加值计算 */
select now(),
date_add(now(),interval 10 day),date_add(now(),interval 10 month),date_add(now(),interval -10 year),
date_add(now(),interval 10 second),date_add(now(),interval -10 minute),date_add(now(),interval 10 hour);

/* 日期格式化 */
select date_format(birthday,'%Y年%m月%d日'), 
date_format(now(),'%H时%i分%s秒')
from tb_employee

/* 时间差值 */
select birthday,
timestampdiff(year,birthday,now()),timestampdiff(month,birthday,now()),
timestampdiff(day,birthday,now()),timestampdiff(hour,birthday,now()),
timestampdiff(minute,birthday,now()),timestampdiff(second,birthday,now())
from tb_employee;

select *,timestampdiff(year,birthday,now()) '年龄' from tb_employee;

select * from tb_employee where timestampdiff(year,birthday,now()) > 20;

/* 字符串函数 */
select emp_name,left(emp_name,1),right(emp_name,1),substr(emp_name,2,2) from tb_employee;

select substr('430702197406115231',7,8);

select concat(birthday,emp_name,sex) from tb_employee;

select concat_ws('##',birthday,emp_name,sex) from tb_employee;

select eid,emp_name,salary,birthday
,length(eid),length(emp_name),length(salary),length(birthday)
,char_length(eid),char_length(emp_name),char_length(salary),char_length(birthday) 
from tb_employee;

select emp_name
,replace(emp_name,substr(emp_name,1,1),'*')
,replace(emp_name,substr(emp_name,2),'**')
from tb_employee;

select concat('--',trim('  abc  def  '),'--'),concat('--','  abc  def  ','--');

select repeat('#',3);

select emp_name,concat(left(emp_name,1),repeat('*',char_length(emp_name)-1)) from tb_employee;

/* 数学函数 */
select avg(salary),round(avg(salary),1),floor(avg(salary)),ceiling(avg(salary)) from tb_employee;

select abs(-145),abs(145),sign(-145),sign(145),sign(0);
