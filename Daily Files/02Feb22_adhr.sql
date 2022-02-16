-- ################################################################
-- INNER JOIN
-- 18.0 Display employee details such that ename,deptname and location of work is printed by the query
-- ################################################################
--using where clause
SELECT 
    emp.ename, dept.dname, branch.location
FROM 
    emp, dept,branch
WHERE 
    emp.deptno=dept.deptno and dept.branchno=branch.branchno;
--Using join   
SELECT 
    emp.ename, dept.dname, branch.location
FROM 
    emp JOIN dept 
    ON emp.deptno=dept.deptno
    JOIN branch 
    ON dept.branchno=branch.branchno;
-- ################################################################ 
-- LIST All employees details suhc as  EMPNAME, JOB, MGR, HIGREDATE, SAL,DNAME
-- left join to dept table 
-- All employee details along with dname even if some employee has null value in deptno.
--    EMP [ EMPNAME, JOB, MGR, HIGREDATE, SAL]
--    DEPT[ DNAME]
--   EMP.DEPTNO=DEPT.DEPTNO
-- ################################################################ 
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
    EMP LEFT OUTER JOIN DEPT
    ON
    EMP.DEPTNO=DEPT.DEPTNO;
-- ################################################################ 
-- Display ename,job,mgr,sal,hiredate,dname from emp and dept 
-- such that all deptartment names are displayed in ouput
-- Display ename,job,mgr,sal,hiredate,dname from emp showing right join with dept 
 ################################################################ 
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
    EMP RIGHT OUTER JOIN DEPT
    ON
    EMP.DEPTNO=DEPT.DEPTNO;
-- ################################################################ 
-- Display ename,job,mgr,sal,hiredate,dname from emp and dept 
-- EVEN FOR THE NULL VALUES IN BOTH TABLES
 -- ################################################################ 
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
    EMP FULL OUTER JOIN DEPT
ON
    EMP.DEPTNO=DEPT.DEPTNO
ORDER BY DNAME ;
--
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,e.deptno,DNAME
FROM
    EMP e JOIN DEPT d
ON
    e.DEPTNO=d.DEPTNO
ORDER BY DNAME ;


SELECT ENAME, E.job, MGR,HIREDATE,SAL,D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO=D.DEPTNO(+)

SELECT ENAME, E.job, MGR,HIREDATE,SAL,D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO(+)=D.DEPTNO
-- ################################################################ 
-- list ename,job,sal,branchname
-- emp
-- branch
-- ################################################################ 
SELECT 
    ename,job,sal,branchname
FROM
        EMP e join Dept d
    on 
        e.deptno=d.deptno
    join
        branch b
    on
        d.branchno=b.branchno;
-- ################################################################ 
-- list empname, job,sal,branchname,dname
-- ################################################################ 
SELECT 
    ename,job,sal,branchname,dname
FROM
        emp e join dept d
    on 
        e.deptno=d.deptno
    join
        branch b
    on
        d.branchno=b.branchno;
-- ################################################################ 
-- LIST ALL DNAME AND EMP COUNT FOR EACH DEPT 
-- ################################################################ 
SELECT
    dname,COUNT(empno)
FROM
    dept JOIN emp
ON
    dept.deptno=emp.deptno
GROUP BY 
    dname;
-- ################################################################ 
-- LIST ALL BRANCHNAME AND EMP COUNT FOR EACH BRANCH
-- ################################################################ 
SELECT 
    branchname,COUNT(empno)
FROM
    branch JOIN dept
    ON branch.branchno=dept.branchno
    JOIN emp
    ON dept.deptno=emp.deptno
GROUP BY
    branchname;
-- ################################################################ 
--LIST BRANCHNAME,DNAME,SUM OF SAL FOR THOSE BRANCH AND DEPT WHERE THE SUM IS >5000
-- ################################################################ 
SELECT
    branchname,dname,sum(sal)
FROM
    emp JOIN dept
    ON emp.deptno=dept.deptno
    JOIN branch
    ON dept.branchno=branch.branchno
GROUP BY
    branchname,dname
HAVING sum(sal)>5000;
-- ################################################################ 
-- List empno,ename,mgr,manger name 
-- ################################################################
SELECT
    e.empno,e.ename,e.mgr,m.ename as manager
FROM
    emp e JOIN emp m
    ON
    e.mgr = m.empno;


CREATE TABLE date_tab (
   ts_col      TIMESTAMP,
   tsltz_col   TIMESTAMP WITH LOCAL TIME ZONE,
   tstz_col    TIMESTAMP WITH TIME ZONE);
-- Default Time zone with Session
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');

INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 -8:00', 
   TIMESTAMP'1999-12-02 10:00:00 -8:00',
   TIMESTAMP'1999-12-02 10:00:00 -8:00');
SELECT * FROM DATE_TAB;

-- Timezone is -8:00
ALTER SESSION SET TIME_ZONE = '-8:00';
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');

INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 -8:00', 
   TIMESTAMP'1999-12-02 10:00:00 -8:00',
   TIMESTAMP'1999-12-02 10:00:00 -8:00');
SELECT * FROM DATE_TAB;   
-- Timezone is +5:30
ALTER SESSION SET TIME_ZONE = '+5:30';
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');

INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 -8:00', 
   TIMESTAMP'1999-12-02 10:00:00 -8:00',
   TIMESTAMP'1999-12-02 10:00:00 -8:00');
SELECT * FROM DATE_TAB;
	
COMMIT;