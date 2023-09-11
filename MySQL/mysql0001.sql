-- 查询数据库的名称列表
show databases;

-- 切换到指定名称的数据库（information_schema）
use information_schema;

-- 查看数据库中的表 
show tables;

/* 
  创建自己的数据库db_mysql_study，数据库相关信息尽量使用小写字母，单词用_分开
  default charset utf8mb4是将数据库编码设置位utf-8（可以支持中文字符）
  collate utf8mb4_general_ci是字符排序规则
*/

-- 完整的删除数据库再创建并使用的语句

-- 切换数据
use information_schema;
-- 数据库存在就删除（危险语句，只有确保需要重建才执行）
drop database if exists db_mysql_study;
-- 创建数据库
create database db_mysql_study default charset utf8mb4 collate utf8mb4_general_ci;
-- 切换到新建的数据库
use db_mysql_study;
-- 删除重建的数据库中没有表
show tables;

-- 作业：创建学生信息管理数据库和一个自己的数据库 