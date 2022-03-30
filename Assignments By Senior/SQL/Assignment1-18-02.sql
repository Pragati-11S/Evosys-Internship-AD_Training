CREATE TABLE Department( 
DeptID NUMBER NOT NULL,
DeptName VARCHAR(50),
CONSTRAINT PK_Department PRIMARY KEY(DeptID)
);

CREATE TABLE Employee( 
EmpID NUMBER NOT NULL,
EmpName VARCHAR(50),
Email VARCHAR(50),
Mobile_no VARCHAR(10),
JoiningDate DATE,
City VARCHAR(20),
Salary NUMBER,
DeptID NUMBER NOT NULL,
CONSTRAINT PK_Employee PRIMARY KEY(EmpID),
CONSTRAINT FK_Employee_Department FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Department(DeptID, DeptName) VALUES (1, 'AD');
INSERT INTO Department(DeptID, DeptName) VALUES (2, 'TechERP');
INSERT INTO Department(DeptID, DeptName) VALUES (3, 'HCM');
INSERT INTO Department(DeptID, DeptName) VALUES (4, 'HR');
INSERT INTO Department(DeptID, DeptName) VALUES (5, 'Innovation');

INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (101, 'Sam', 'sam@gmail.com', '9874563214', TO_DATE('1999-05-29','yyyy-mm-dd'), 'Tokyo', 25000, 2);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (102, 'Charles', 'charles@gmail.com', '988452214', TO_DATE('1998-06-12','yyyy-mm-dd'), 'Wales', 75000, 1);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (103, 'Daniel', 'daniel@gmail.com', '9874124214', TO_DATE('1999-05-04','yyyy-mm-dd'), 'Paris', 50000, 2);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (104, 'Lisa', 'lisa@gmail.com', '9812143214', TO_DATE('2000-05-29','yyyy-mm-dd'), 'London', 35000, 5);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (105, 'Karen', 'karen@gmail.com', '9875654278', TO_DATE('2004-07-19','yyyy-mm-dd'), 'Amsterdam', 65000, 4);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (106, 'Nancy', 'nancy@gmail.com', '9874561452', TO_DATE('2001-05-15','yyyy-mm-dd'), 'Dubai', 45000, 5);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (107, 'Chris', 'chris@gmail.com', '9874985476', TO_DATE('1997-05-29','yyyy-mm-dd'), 'UAE', 85000, 1);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (108, 'Samuel', 'samuel@gmail.com', '9874651214', TO_DATE('2001-12-05','yyyy-mm-dd'), 'Manchester', 80000, 4);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (109, 'Noah', 'noah@gmail.com', '9877413214', TO_DATE('1998-11-29','yyyy-mm-dd'), 'Sheffield', 35000, 5);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (110, 'Olivir', 'olivir@gmail.com', '9874563012', TO_DATE('1998-11-11','yyyy-mm-dd'), 'Bristol', 65000, 2);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (111, 'Ava', 'ava@gmail.com', '9874563109', TO_DATE('1997-12-15','yyyy-mm-dd'), 'Liverpool', 45000, 3);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (112, 'Olivia', 'olivia@gmail.com', '9874569874', TO_DATE('1999-02-18','yyyy-mm-dd'), 'Wakefield', 75000, 2);
INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) VALUES (113, 'Eva', 'eva@gmail.com', '9854123678', TO_DATE('1999-11-29','yyyy-mm-dd'), 'Newcastle', 55000, 3);

SELECT * FROM Department;
SELECT * FROM Employee;

--SQL
--1. Write a query to list all the employees with their department name.
SELECT 
    e.EmpName, d.DeptName
FROM
    Employee e, Department d
WHERE e.DeptID = d.DeptID;

--2. Write a query to display employees with salary more than 40000.
SELECT 
    EmpName, Salary
FROM
    Employee 
WHERE Salary > 40000;

--3. Write a query to display employees joined after entered 31st Jan, 2001.
SELECT 
    EmpName, JoiningDate
FROM
    Employee
WHERE JoiningDate > to_date('1999-01-31', 'yyyy-mm-dd' );

--4. Create new table employee1 with column employee_name, employee_mobile_no,email, copy data from employee table.
CREATE TABLE Employee1 
    AS (
        SELECT 
            EmpName, Mobile_no, Email
        FROM 
            Employee);

--5. Add address column in employee1 table.
ALTER TABLE Employee1 
ADD Address VARCHAR(50);

--6. Modify  employee_mobile_no column of employee1 table and change data type.
ALTER TABLE Employee1 
ADD temp_mobile NUMBER;

UPDATE Employee1 
SET temp_mobile = to_number(Mobile_no);

ALTER TABLE Employee1
DROP COLUMN Mobile_no;

ALTER TABLE Employee1
RENAME COLUMN temp_mobile TO Mobile_no;

SELECT * FROM Employee1;
--PL SQL:
--1. Write a procedure to add department with output variable "result".
CREATE OR REPLACE PROCEDURE insertdept(
	   p_deptid IN Department.DeptID%TYPE,
	   p_deptname IN Department.DeptName%TYPE)
IS
BEGIN
  INSERT INTO Department(DeptID, DeptName) 
  VALUES (p_deptid, p_deptname); 
  COMMIT;
END;
/

BEGIN
   insertdept(8,'Support1');
   DBMS_OUTPUT.PUT_LINE('Department added successfully');
END;

SELECT * FROM Department;   
----------------------------------------------OR-------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE add_department( result OUT Department.DeptName%type,p_input Department.DeptID%type ) AS
BEGIN
    SELECT DeptName INTO result
    FROM Department
    WHERE DeptID=p_input;
END;
/

DECLARE
    v_result Department.DeptName%type;
BEGIN
    add_department(v_result,5);
    DBMS_OUTPUT.put_line(v_result);
END;
/

--2. Write a procedure to add Employee with output variable "result".
CREATE OR REPLACE PROCEDURE insertemp(
	   p_empid IN Employee.EmpID%TYPE,
	   p_empname IN Employee.EmpName%TYPE,
       p_email IN Employee.Email%TYPE,
       p_mobile IN Employee.Mobile_no%TYPE,
       p_joining IN Employee.JoiningDate%TYPE,
       p_city IN Employee.City%TYPE,
       p_salary IN Employee.Salary%TYPE, 
       p_deptid IN Employee.DeptID%TYPE)
IS
BEGIN
  INSERT INTO Employee(EmpID, EmpName, Email, Mobile_no, JoiningDate, City, Salary, DeptID) 
  VALUES (p_empid, p_empname, p_email, p_mobile, p_joining, p_city, p_salary, p_deptid); 
  COMMIT;
END;
/

BEGIN
   insertemp(114, 'Louis', 'louis@gmail.com', '988823678', TO_DATE('1998-11-15','yyyy-mm-dd'), 'Manchester', 65000, 7);
   DBMS_OUTPUT.PUT_LINE('Employee added successfully');
END;

SELECT * FROM Employee; 
-------------------------------------------------------OR-----------------------------------------------------------
CREATE OR REPLACE PROCEDURE add_employee( result OUT Employee.EmpName%type, p_input Employee.EmpID%type ) AS
BEGIN
    SELECT EmpName INTO result
    FROM Employee
    WHERE EmpID=p_input;
END;
/
DECLARE
    v1_result Employee.EmpName%type;
BEGIN
    add_employee(v1_result,101);
    DBMS_OUTPUT.put_line(v1_result);
END;
/

--3. Write a procedure to update Employees department (Input -> empid, department_name)
--	in case if department not present throw appropriate error.
CREATE OR REPLACE PROCEDURE update_employee(p_inputemp Employee.EmpID%type, p_inputdept Department.DeptName%type, Update_Count OUT NUMBER ) AS
BEGIN
    UPDATE Employee
    SET
        DeptID = (
                    SELECT DeptID FROM Department WHERE DeptName = p_inputdept)  
    WHERE EmpID=p_inputemp;
    Update_Count := SQL%ROWCOUNT;
    IF Update_Count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No records found for Department Name ' || p_inputdept);
    END IF;
END;
/
--DESC update_employee;
DECLARE
    up_count NUMBER;
BEGIN    
    update_employee(114,'AD',up_count);
    DBMS_OUTPUT.put_line('Employee Table updated');
END;
/
SELECT * FROM Employee;

--4. Write a function that returns Employee Department name based on emp id.
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION empdnm (empno1 number) return varchar2 is 
 deptname varchar (30);
BEGIN   
     SELECT d.DeptName
     INTO   deptname
     FROM   Department d
     JOIN   Employee e on e.DeptID = d.DeptID
     WHERE  e.EmpID = empno1;
RETURN(deptname);
END;
/
DECLARE 
   deptn varchar(30); 
   empid Employee.EmpID%type:=&EmployeeID;
BEGIN 
   deptn := empdnm(empid); 
   dbms_output.put_line('Department of Employee with EmployeeID ' || empid || ' is ' || deptn); 
END; 
/

--5. Write a function that returns Employee joining date in (10-Mar-2021) format based on emp_id 
CREATE OR REPLACE FUNCTION empjoining (empno1 number) RETURN DATE is 
 Joiningdate DATE;
BEGIN   
     SELECT JoiningDate
     INTO   Joiningdate
     FROM   Employee
     WHERE  EmpID = empno1;
RETURN(Joiningdate);
END;
/
DECLARE 
   joiningdate DATE; 
   empid Employee.EmpID%type:=&EmployeeID;
BEGIN 
   joiningdate := empjoining(empid); 
   dbms_output.put_line('Joining Date of Employee with EmployeeID ' || empid || ' is '  || joiningdate); 
END; 
/