
-----------------------------------------------------------------------------
                               6 June 2023
-----------------------------------------------------------------------------

1) Answer.

   select ename,sal from emp where sal>(select sal from emp where empno=7566);

-----------------------------------------------------------------------------------

2) Answer.

   select ename,sal from  emp where sal = (select max(sal) from emp);

----------------------------------------------------------------------------------

3) Answer.

   second highest salary?

select max(sal) from  emp where sal< (select max(sal) from emp);
 
Multiple row subquery:
-- operators used here is IN , ANY, ALL
 
<ANY   => <MAX
> ANY => >MIN
=ANY  => IN
>ALL  =>  >MAX
<ALL  =>  <MIN

---------------------------------------------------------------------------------

4) Answer.

  select empno,ename,deptno,sal from emp where sal in(select sal from emp where deptno=30);

-------------------------------------------------------------------------------------

5) Answer.

   select empno,ename,deptno,sal from emp where sal >ANY(select sal from emp where deptno=30);
 
select sal from emp where deptno=30;

--------------------------------------------------------------------------------------

6) Answer.

   select empno,ename,deptno,sal from emp where sal <ANY(select sal from emp where deptno=30);

---------------------------------------------------------------------------------------

7) Answer.

select empno,ename,deptno,sal from emp where sal <ALL(select sal from emp where deptno=30);

select empno,ename,deptno,sal from emp where sal >ALL(select sal from emp where deptno=30);

select empno,ename,deptno,sal from emp where sal <ANY(select sal from emp where deptno=30);

select empno,ename,deptno,sal from emp where sal >ANY(select sal from emp where deptno=30);


----------------------------------------------------------------------------------------------