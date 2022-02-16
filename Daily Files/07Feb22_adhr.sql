--########################################################################
-- Display the employee details (empno,ename,dname,job,sal,location).
-- emp (empno,ename,job,sal)
-- dept(dname)
-- branch(location)
--########################################################################
SELECT
    e.empno,e.ename,e.job,e.sal,d.dname,b.location
FROM
    emp e join dept d
on
    e.deptno=d.deptno
    join branch b
    on b.branchno=d.branchno
Order by d.deptno;
--########################################################################
-- View
--########################################################################
CREATE VIEW vw_empdetails
AS
SELECT
    e.empno,e.ename,e.job,e.sal,d.dname,b.location
FROM
    emp e join dept d
on
    e.deptno=d.deptno
    join branch b
    on b.branchno=d.branchno
Order by d.deptno;

SELECT * FROM vw_empdetails;
SELECT * FROM vw_empdetails where dname='ACCOUNTING';
SELECT empno,ename,dname from vw_empdetails;
SELECT empno,ename,dname from vw_empdetails where dname='ACCOUNTING';
-- Display employee name and manager name for all departments
SELECT
-- get employees in first 5 rows
-- 1 getting empdetails(deptno,empno,ename,job,sal) sorted on deptno,sal
SELECT
deptno,empno,ename,job,sal
FROM
emp
ORDER BY deptno,sal;
-- 2. create an inline view to show first 5 records
-- getting top 5 records based on sal in desceding order
SELECT
*
FROM
( SELECT
deptno,empno,ename,job,sal
FROM
emp
ORDER BY sal desc
)
WHERE
ROWNUM <= 5;