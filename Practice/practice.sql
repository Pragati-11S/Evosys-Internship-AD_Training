CREATE TABLE palette_a (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

CREATE TABLE palette_b (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

INSERT INTO palette_a (id, color)
VALUES (1, 'Red');

INSERT INTO palette_a (id, color)
VALUES (2, 'Green');

INSERT INTO palette_a (id, color)
VALUES (3, 'Blue');

INSERT INTO palette_a (id, color)
VALUES (4, 'Purple');

SELECT * FROM palette_a;
-- insert data for the palette_b
INSERT INTO palette_b (id, color)
VALUES (1, 'Green');

INSERT INTO palette_b (id, color)
VALUES (2, 'Red');

INSERT INTO palette_b (id, color)
VALUES (3, 'Cyan');

INSERT INTO palette_b (id, color)
VALUES (4, 'Brown');
--inner join
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
INNER JOIN palette_b b ON a.color = b.color;
--left join
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
LEFT JOIN palette_b b ON a.color = b.color;
--only rows from left table
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
LEFT JOIN palette_b b ON a.color = b.color
WHERE b.id IS NULL;
--right join
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
RIGHT JOIN palette_b b ON a.color = b.color;
--only rows from right table
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
RIGHT JOIN palette_b b ON a.color = b.color
WHERE a.id IS NULL;
--full outer join
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
FULL OUTER JOIN palette_b b ON a.color = b.color;
--only unique rows from both tables
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
FULL JOIN palette_b b ON a.color = b.color
WHERE a.id IS NULL OR b.id IS NULL;


--7-feb-2022 MERGE Assignment
CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    rank VARCHAR2(20)
);

CREATE TABLE member_staging AS 
SELECT * FROM members;
-- insert into members table    
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(1,'Abel','Wolf','Gold');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(2,'Clarita','Franco','Platinum');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(3,'Darryl','Giles','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(4,'Dorthea','Suarez','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(5,'Katrina','Wheeler','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(6,'Lilian','Garza','Silver');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(7,'Ossie','Summers','Gold');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(8,'Paige','Mcfarland','Platinum');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(9,'Ronna','Britt','Platinum');
INSERT INTO members(member_id, first_name, last_name, rank) VALUES(10,'Tressie','Short','Bronze');

-- insert into member_staging table
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(1,'Abel','Wolf','Silver');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(2,'Clarita','Franco','Platinum');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(3,'Darryl','Giles','Bronze');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(4,'Dorthea','Gate','Gold');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(5,'Katrina','Wheeler','Silver');
INSERT INTO member_staging(member_id, first_name, last_name, rank) VALUES(6,'Lilian','Stark','Silver');

MERGE INTO member_staging x
USING (SELECT member_id, first_name, last_name, rank FROM members) y
ON (x.member_id  = y.member_id)
WHEN MATCHED THEN
    UPDATE SET x.first_name = y.first_name, 
                        x.last_name = y.last_name, 
                        x.rank = y.rank
    WHERE x.first_name <> y.first_name OR 
           x.last_name <> y.last_name OR 
           x.rank <> y.rank 
WHEN NOT MATCHED THEN
    INSERT(x.member_id, x.first_name, x.last_name, x.rank)  
    VALUES(y.member_id, y.first_name, y.last_name, y.rank);

SELECT * FROM member_staging;
-----Updateable View
CREATE TABLE brands(
	brand_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	brand_name VARCHAR2(50) NOT NULL,
	PRIMARY KEY(brand_id)
);

CREATE TABLE cars (
	car_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	car_name VARCHAR2(255) NOT NULL,
	brand_id NUMBER NOT NULL,
	PRIMARY KEY(car_id),
	FOREIGN KEY(brand_id) 
	REFERENCES brands(brand_id) ON DELETE CASCADE
);

INSERT INTO brands(brand_name)
VALUES('Audi');
INSERT INTO brands(brand_name)
VALUES('BMW');
INSERT INTO brands(brand_name)
VALUES('Ford');
INSERT INTO brands(brand_name)
VALUES('Honda');
INSERT INTO brands(brand_name)
VALUES('Toyota');

INSERT INTO cars (car_name,brand_id)
VALUES('Audi R8 Coupe',
       1);
INSERT INTO cars (car_name,brand_id)
VALUES('Audi Q2',
       1);
INSERT INTO cars (car_name,brand_id)
VALUES('Audi S1',
       1);
INSERT INTO cars (car_name,brand_id)
VALUES('BMW 2-serie Cabrio',
       2);
INSERT INTO cars (car_name,brand_id)
VALUES('BMW i8',
       2);
INSERT INTO cars (car_name,brand_id)
VALUES('Ford Edge',
       3);
INSERT INTO cars (car_name,brand_id)
VALUES('Ford Mustang Fastback',
       3);
INSERT INTO cars (car_name,brand_id)
VALUES('Honda S2000',
       4);
INSERT INTO cars (car_name,brand_id)
VALUES('Honda Legend',
       4);
INSERT INTO cars (car_name,brand_id)
VALUES('Toyota GT86',
       5);
INSERT INTO cars (car_name,brand_id)
VALUES('Toyota C-HR',
       5);
       
CREATE VIEW cars_master AS 
SELECT
    car_id,
    car_name
FROM
    cars;

DELETE
FROM
    cars_master
WHERE
    car_id = 1;

UPDATE
    cars_master
SET
    car_name = 'Audi RS7 Sportback'
WHERE
    car_id = 2;

INSERT INTO cars_master
VALUES('Audi S1 Sportback');

CREATE VIEW all_cars AS 
SELECT
    car_id,
    car_name,
    c.brand_id,
    brand_name
FROM
    cars c
INNER JOIN brands b ON
    b.brand_id = c.brand_id; 

INSERT INTO all_cars(car_name, brand_id )
VALUES('Audi A5 Cabriolet', 1);

DELETE
FROM
    all_cars
WHERE
    brand_name = 'Honda';

SELECT
    *
FROM
    USER_UPDATABLE_COLUMNS
WHERE
    TABLE_NAME = 'ALL_CARS';
