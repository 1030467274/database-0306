# noinspection SqlWithoutWhereForFile

create table scott.new_emp
select *
from scott.emp;

select *
from scott.new_emp;

delete
from scott.new_emp;

insert into scott.new_emp
  (EMPNO, ENAME, DEPTNO)
select EMPNO, ENAME, DEPTNO
from scott.emp;


create or replace view scott.v_emp
as
select ename, job, DEPTNO
from scott.emp
where DEPTNO = 30;

select *
from scott.v_emp;

select ENAME, DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO
where ENAME = 'allen';

create or replace view scott.v_name
as
select e.EMPNO, e.ENAME, d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;

select *
from scott.v_name
where ENAME = 'allen';

-- install
-- conf
-- basic
-- dialect

-- sal 大于 scott 员工 sal ？
select sal
from scott.emp
where ENAME = 'sco_tt';

select *
from scott.emp
where sal > (
  select sal
  from scott.emp
  where ENAME = 'sco_tt'
); -- sub query 子查询


start transaction;
-- DMLs
delete
from scott.emp
where ENAME = 'jones';

savepoint a;

update scott.emp
set sal = 2000
where ENAME = 'martin';

savepoint b;

delete from scott.emp;

select *
from scott.emp;

rollback to b; -- 结束事务？
rollback to a;

rollback; -- 回滚
commit; -- 提交

-- DDL
create table scott.test(
  id int
);

select deptno, avg(sal)
# select sum(sal)
# select min(sal), max(sal)
# select count(*)
# select sum(ename)
from scott.emp
group by DEPTNO;

select JOB, max(HIREDATE)
from scott.emp
group by job
having JOB in ('clerk', 'manager'); -- 组检索 / where 行检索 / 投影 列检索

select abs(-1);
select bin(-1);
select pi();
select rtrim('   test   ');
select ltrim('   test   ');
select trim('   test   ');

select lower(ename)
from scott.emp;

update scott.emp
set ENAME = lower(ename);

select *
from scott.emp;

select current_date;
select now();

select date_add(now(), interval 1 year);
select dayofweek('2019-3-16');
select week(now());
select year(now());