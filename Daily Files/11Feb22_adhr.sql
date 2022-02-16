
SELECT EMPNO FROM EMP;
--###########################################################################
--Exception name in PL SQL :  NO_DATA_FOUND
-- accept values from user at runtime : &customer_id
-- DISPLAY ENAME OF EMPLOYEE WHERE USE ENTERS EMPNO
-- &empno=> you are expecting value from the user
--###########################################################################
SET SERVEROUTPUT ON;
DECLARE 
    v_ename emp.ename%type;
    v_empno emp.empno%type:=&empno;
BEGIN
    SELECT
        ename into v_ename
    FROM 
        emp
    WHERE 
        empno=v_empno;
    DBMS_OUTPUT.PUT_LINE('FOR EMPNO'||v_empno);    
    DBMS_OUTPUT.PUT_LINE('ename is '||v_ename);
END;
--###########################################################################
-- DISPLAY ENAME OF EMPLOYEE WHERE USE ENTERS EMPNO
-- IF NO RECORD FOUND HANDLE THE EXCEPTION AND GIVE MESSAGE
-- EMPNO :  No record found
--###########################################################################
DECLARE 
    v_ename emp.ename%type;
    v_empno emp.empno%type:=&empno;
BEGIN
    SELECT
        ename into v_ename
    FROM 
        emp
    WHERE 
        empno=v_empno;
    DBMS_OUTPUT.PUT_LINE('FOR EMPNO'||v_empno);    
    DBMS_OUTPUT.PUT_LINE('ename is '||v_ename);
    EXCEPTION
        WHEN NO_DATA_FOUND 
                THEN    
                     DBMS_OUTPUT.PUT_LINE('EMPNO'||v_empno||' NO RECORDS FOUND');    
END;
--###########################################################################
-- Get ename,job,hiredate for employee working in deptno 10
-- v_ename,v_job,v_hiredate,v_deptno
--###########################################################################
DECLARE
    v_ename emp.ename%type;
    v_job emp.job%TYPE;
    v_hiredate emp.hiredate%type;
    v_deptno emp.deptno%type:=&deptno;
BEGIN
        SELECT
                ename,job,hiredate
                INTO
                v_ename,v_job,v_hiredate
        FROM 
                emp
        WHERE
                deptno=v_deptno;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('FOR DEPTNO '||v_deptno||' NO RECORDS FOUND');    
            WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('FOR DEPTNO '||v_deptno||' MORE THAN ONE RECORD RETURN');         
END;


--###########################################################################
-- INCREASE THE SALARY OF EMPLOYEE IF <MAX(SAL)
-- GET EMPNO GET THE NEW SALARY
-- if newSal>Max(sal) Raise salary_to_high
--###########################################################################
-- Create custom exception without exception handling
--###########################################################################
DECLARE 
    v_salary_to_high Exception;
    PRAGMA exception_init(v_salary_to_high,-20101);
    v_maxsal emp.sal%type;
    v_newsal emp.sal%type:=&new_sal;
    v_empno emp.empno%type:=&empno;
BEGIN
     SELECT MAX(SAL) INTO v_maxsal FROM EMP;
     IF v_newsal > v_maxsal 
        THEN RAISE v_salary_to_high;
     ELSE
        UPDATE EMP SET SAL=v_newsal WHERE empno=v_empno;
     END IF;
END;
--###########################################################################
-- Create custom exception without exception handling
--raise_application_error(-20101,'new sal > max(sal) hence salary not updated');
--###########################################################################
DECLARE 
    v_salary_to_high Exception;
    PRAGMA exception_init(v_salary_to_high,-20101);
    v_maxsal emp.sal%type;
    v_newsal emp.sal%type:=&new_sal;
    v_empno emp.empno%type:=&empno;
BEGIN
     SELECT MAX(SAL) INTO v_maxsal FROM EMP;
     IF v_newsal > v_maxsal 
        THEN raise_application_error(-20101,'new sal > max(sal) hence salary not updated');
     ELSE
        UPDATE EMP SET SAL=v_newsal WHERE empno=v_empno;
     END IF;
END;


--###########################################################################
-- Create custom exception with exception handling and custom message
--###########################################################################

DECLARE 
    v_salary_to_high Exception;
    PRAGMA exception_init(v_salary_to_high,-20101);
    v_maxsal emp.sal%type;
    v_newsal emp.sal%type:=&new_sal;
    v_empno emp.empno%type:=&empno;
BEGIN
     SELECT MAX(SAL) INTO v_maxsal FROM EMP;
     IF v_newsal > v_maxsal 
        THEN RAISE v_salary_to_high;
     ELSE
        UPDATE EMP SET SAL=v_newsal WHERE empno=v_empno;
     END IF;
     EXCEPTION
        WHEN v_salary_to_high THEN DBMS_OUTPUT.PUT_LINE(v_newsal||' is to high than max(sal) hence update not allowed');
END;
--###########################################################################
-- TABLENAME%rowtype
-- INSTED OF CREATING SEPARATE VARIALBES FOR ALL COLUMNS OF A TABLE 
-- WE CAN USE %ROWTYPE WHICH CREATE A RECORD[COL1,....] FROM THE TABLE
--###########################################################################
DECLARE 
    v_emp_record emp%ROWTYPE; 
BEGIN
    SELECT 
        EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO INTO v_emp_record FROM emp WHERE EMPNO=7788;
--v_emp_record[0]        
    DBMS_OUTPUT.PUT_LINE(v_emp_record.EMPNO);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.ENAME);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.JOB);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.MGR);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.HIREDATE);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.SAL);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.COMM);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.DEPTNO);
END;
--###########################################################################
--it will start point and endpoint within the file /page to read the data
-- File system
--Read only
--ReadWrite
--Append
--PL/SQL Cursor
--fetch record from underline entities
--modification
--###########################################################################
--A cursor is a pointer that points to a result of a query. 
--PL/SQL has two types of cursors: implicit cursors and explicit cursors.
--###########################################################################
--Implicit cursors
--Whenever Oracle executes an SQL statement such as 
--SELECT INTO, INSERT, UPDATE, and DELETE, it automatically creates an implicit cursor.
--###########################################################################
--Explicit cursors
--An explicit cursor is an SELECT statement declared explicitly in the declaration section of the current block or a package specification.
--For an explicit cursor, you have control over its execution cycle from OPEN, FETCH, and CLOSE.
--Oracle defines an execution cycle that executes an SQL statement and associates a cursor with it.
--###########################################################################
--Declaration:  CURSOR cursor_name IS query;
--Open Cursro:  OPEN cursor_name;
--Fetch:        FETCH cursor_name INTO variable_list;
--Close:        CLOSE cursor_name;
--###########################################################################
-- USING CURSOR FETCH RECORDS OF DEPTNO 10 
-- PRINT ORGINAL SAL AND UPDATE SAL(SAL=SAL+3000) FOR EVERY EMPNO
--###########################################################################
DECLARE 
        CURSOR c_emp IS SELECT * FROM EMP WHERE DEPTNO=10; -- WILL WORK ON EMP TABLES RECORD
        rec_emp emp%ROWTYPE;   -- EVERY RECORD WILL BE STORED IN THIS VARIABLE
BEGIN
        OPEN c_emp;
        
        LOOP
            FETCH c_emp INTO rec_emp;
            EXIT WHEN c_emp%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' original sal=' ||rec_emp.sal);
            rec_emp.sal:=rec_emp.sal+2000;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' update sal=' ||rec_emp.sal);                            
          END LOOP;          
        CLOSE c_emp;
END;
--###########################################################################
-- CREATE A CURSOR FOR SELECT * FROM EMP AND RECROD FOR EMP%ROWTYPE
-- IF REC_EMP.COMM IS NULL UPDATE COMM TO 0
--###########################################################################
DECLARE 
    CURSOR v_emp_cursor IS SELECT * FROM emp;
    v_emp_record emp%ROWTYPE;
BEGIN
        OPEN v_emp_cursor;
        LOOP
               FETCH v_emp_cursor INTO v_emp_record;
               EXIT WHEN v_emp_cursor%NOTFOUND;
               IF v_emp_record.comm IS NULL 
                THEN 
                    UPDATE EMP SET COMM=0 WHERE EMPNO=v_emp_record.empno;
               END IF;
        END LOOP;
        CLOSE v_emp_cursor;
END;

SELECT * FROM EMP;
ROLLBACK ;
--###########################################################################
-- CREATE A CURSOR FOR SELECT * FROM EMP AND RECROD FOR EMP%ROWTYPE
-- IF REC_EMP.COMM IS NULL UPDATE COMM TO 0
-- USING FOR LOOP
-- NO NEED TO EXPLICIT OPEN CURSOR OR CLOSE CURSOR FOR LOOP HANDLES BOTH
--###########################################################################
DECLARE 
    CURSOR v_emp_cursor IS SELECT * FROM emp;    
BEGIN
--        OPEN v_emp_cursor;
        FOR  v_record in v_emp_cursor
            LOOP
                IF v_record.comm is null 
                    THEN UPDATE EMP SET COMM=0 WHERE EMPNO=v_record.empno;
                END IF;
                IF v_record.comm=0       
                    THEN UPDATE EMP SET COMM=100 WHERE EMPNO=v_record.empno;                
                END IF;
            END LOOP;
--        CLOSE v_emp_cursor;
END;
SELECT * FROM EMP;
ROLLBACK ;
--###########################################################################
--PL/SQL cursor with parameters example
-- USING CURSOR WITH PARAMTERS (DEPTNO) AND RECORDS DISPLAY ENAME,JOB FROM DEPTNO30
--###########################################################################
DECLARE 
    CURSOR v_cursor(p_deptno emp.deptno%type) IS select * from emp where deptno=p_deptno; 
BEGIN
          FOR v_record in v_cursor(30)
            LOOP
                DBMS_OUTPUT.PUT_LINE(v_record.ename|| ' '|| v_record.job);
            END LOOP;
END;

--###########################################################################
DECLARE 
    CURSOR v_cursor(p_deptno emp.deptno%type) IS select * from emp where deptno=p_deptno; 
    v_record emp%rowtype;
BEGIN
            OPEN v_cursor(30);
            LOOP
                FETCH v_cursor into v_record; 
                EXIT WHEN v_cursor%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(v_record.ename|| ' '|| v_record.job);
            END LOOP;
            CLOSE v_cursor;
END;

--###########################################################################
-- parameterized cursor with default value
--###########################################################################
DECLARE 
    CURSOR v_cursor(p_deptno emp.deptno%type:=30) IS select * from emp where deptno=p_deptno; 
    v_record emp%rowtype;
BEGIN
            DBMS_OUTPUT.PUT_LINE('Parameterized cursor with default value in basic loop');
            OPEN v_cursor;
            LOOP
                FETCH v_cursor into v_record; 
                EXIT WHEN v_cursor%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(v_record.ename|| ' '|| v_record.job);
            END LOOP;
            CLOSE v_cursor;
END;

DECLARE 
    CURSOR v_cursor(p_deptno emp.deptno%type:=30) IS select * from emp where deptno=p_deptno;     
BEGIN
            DBMS_OUTPUT.PUT_LINE('Parameterized cursor with default value in for loop');
            FOR v_record IN v_cursor
            LOOP
                DBMS_OUTPUT.PUT_LINE(v_record.ename|| ' '|| v_record.job);
            END LOOP;
            
END;
--###########################################################################
-- create a function to get employee details 
--###########################################################################
