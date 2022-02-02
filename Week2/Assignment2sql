--1	 Display all the information of the EMP table?
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp;
--2	 Display unique Jobs from EMP table?
SELECT 
    distinct job 
FROM 
    emp;
--3	 List the emps in the asc order of their Salaries?
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
ORDER BY sal;
--4	 List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno 
FROM
    emp 
ORDER BY 
    deptno asc,
    job desc;
--5	 Display all the unique job groups in the descending order?
SELECT 
    distinct job 
FROM 
    emp
ORDER BY 
    job desc;
--6	 Display all the details of all ‘Mgrs’
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE empno in ( 
            SELECT
                mgr
            FROM
                emp);
--7	 List the emps who joined before 1981
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE hiredate < ('01-01-1981');
--8	 List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
SELECT 
    empno,ename,sal, round(sal/30) as daily_salary,12*sal as annsal 
FROM 
    emp
ORDER BY annsal;
--9	 Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT 
    empno,ename,job,hiredate, round(months_between(SYSDATE,hiredate)) as exp
FROM 
    emp
WHERE
    empno IN (
                SELECT 
                    mgr
                FROM
                    emp);
--10	 List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
SELECT 
    empno,ename,sal,round(months_between(SYSDATE,hiredate)) as exp
FROM 
    emp
WHERE
    empno IN (
                SELECT 
                    empno
                FROM
                    emp
                WHERE mgr='7369');
--11	 Display all the details of the emps whose Comm  Is more than their Sal
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE comm>sal;
--13	 List the emps along with their Exp and Daily Sal is more than Rs 100
SELECT empno,ename,round(months_between(SYSDATE,hiredate)) as exp
FROM
    emp
WHERE (sal/30) >100; 
--14	 List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE job='CLERK' OR job='ANALYST'
ORDER BY job desc;
--15	 List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE hiredate='01-05-1981' OR hiredate='03-12-1981' OR hiredate='17-12-1981' OR hiredate='19-01-1980'
ORDER BY hiredate;
--16	 List the emp who are working for the Deptno 10 or20
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE deptno=10 OR deptno=20;
--17	 List the emps who are joined in the year 81
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE hiredate between '01-01-1981' and '31-12-1981';
--19	 List the emps Who Annual sal ranging from 22000 and 45000
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE (sal*12) > 22000 AND (sal*12) < 45000;
--20	 List the Enames those are having five characters in their Names
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE length(ename)=5;
--21	 List the Enames those are starting with ‘S’ and with five characters
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE length(ename)=5 AND ename LIKE 'S%';
--22	 List the emps those are having four chars and third character must be ‘r’
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE length(ename)=4 AND ename LIKE '__R%';
--23	 List the Five character names starting with ‘S’ and ending with ‘H’
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE length(ename)=5 AND ename LIKE 'S%H';
--24	 List the emps who joined in January
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE to_char(hiredate,'mon')='jan';
--27	 List the emps whose names having a character set ‘ll’ together
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE ename LIKE '%LL%';
--29	 List the emps who does not belong to Deptno 20
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE deptno != 20;
--30	 List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE job NOT IN ('PRESIDENT','MANAGER')
ORDER BY sal;
--31	 List the emps whose Empno not starting with digit78
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE empno NOT LIKE '78%';
--33	 List the emps who are working under ‘MGR’
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE mgr IN (
                SELECT 
                    empno 
                FROM 
                    emp 
                WHERE job='MANAGER');
--34	 List the emps who joined in any year but not belongs to the month of March
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE to_char(hiredate,'mon')!='mar';
--35	 List all the Clerks of Deptno 20
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE job ='CLERK' AND deptno=20;
--36	 List the emps of Deptno 30 or 10 joined in the year 1981
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE (deptno=30 OR deptno=10) AND to_char(hiredate,'YYYY')='1981';
--37	 Display the details of SMITH
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM 
    emp
WHERE ename='SMITH';
--38	 Display the location of SMITH
SELECT 
    location
FROM 
    branch
WHERE branchno = (
                    SELECT
                        branchno
                    FROM 
                        emp
                    WHERE ename='SMITH');
-- ------------------------------------THE END-------------------------------------