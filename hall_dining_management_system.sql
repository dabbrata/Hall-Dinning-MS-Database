-- set console display for proper view....

set pagesize 500;
set linesize 1000;

-- Lab 01............................................................................

DROP TABLE Providestudent;
DROP TABLE Hallprovost;
DROP TABLE Staff;
DROP TABLE Student;
DROP TABLE Diningmanager;
DROP TABLE Foodprovider;
DROP TABLE Cook;


CREATE TABLE Student(
    Student_id Number(10) NOT NULL,
    Attached_hall varchar(30),
    Border_number Number(10) NOT NULL,
    Student_name varchar(30),
    Messing_fee Number(10),
    PRIMARY KEY (Student_id)
);

CREATE TABLE Hallprovost(
    Provost_id Number(10),
    Provost_name varchar(30),
    Designation varchar(30),
    Hall_name varchar(30),
    Total_amount Number(10),
    Stud_id Number(10) NOT NULL, 
    FOREIGN KEY (Stud_id) REFERENCES Student(Student_id) ON DELETE CASCADE
);


CREATE TABLE Cook(
    Cook_id Number(10) NOT NULL,
    Cook_name varchar(30),
    PRIMARY KEY(Cook_id)
);

CREATE TABLE Foodprovider(
    Provider_id Number(10) NOT NULL,
    Provider_name varchar(30),
    Std_id Number(10) NOT NULL,
    PRIMARY KEY(Provider_id)
);

CREATE TABLE Staff(
    Staff_id Number(10),
    Staff_Name varchar(30),
    Stud_border Number(10) NOT NULL,
    Prov_id Number(10) NOT NULL,
    FOREIGN KEY(Stud_border) REFERENCES Student(Student_id) ON DELETE CASCADE,
    FOREIGN KEY(Prov_id) REFERENCES Foodprovider(Provider_id) ON DELETE CASCADE
);

CREATE TABLE Diningmanager(
    Manager_id Number(10),
    Hall_name varchar(30),
    Manager_name varchar(30),
    Facilities varchar(30),
    Duration_months Number(11),
    Ck_id Number(10) NOT NULL,
    Pv_id Number(10) NOT NULL,
    FOREIGN KEY(Ck_id) REFERENCES Cook(Cook_id) ON DELETE CASCADE,
    FOREIGN KEY(Pv_id) REFERENCES Foodprovider(Provider_id) ON DELETE CASCADE
);

CREATE TABLE Providestudent(
    P_id Number(10) NOT NULL,
    S_id Number(10) NOT NULL,
    FOREIGN KEY(P_id) REFERENCES Foodprovider(Provider_id),
    FOREIGN key(S_id) REFERENCES Student(Student_id)
);

----Here all the inserted values......

INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807109,'BSMRH',1807109,'Dabbrata',600);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807107,'BSMRH',1807107,'Emdadul',1000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807106,'BSMRH',1807106,'Udoy',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807105,'BSMRH',1807105,'Kowshik',3000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807110,'BSMRH',1807110,'Jubayer',4000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807111,'BSMRH',1807111,'Amit',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807112,'BSMRH',1807112,'Mobarak',2500);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807114,'BSMRH',1807114,'Mishu',900);

INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807105);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807107);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807109);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807110);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807111);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807106);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807112);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',16000,1807114);

INSERT INTO Foodprovider(Provider_id,Provider_name,Std_id)VALUES(1111,'jamaluddin',1807109);
INSERT INTO Foodprovider(Provider_id,Provider_name,Std_id)VALUES(1112,'kamaluddin',1807107);
INSERT INTO Foodprovider(Provider_id,Provider_name,Std_id)VALUES(1113,'Saiful',1807111);

INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807107,1111);
INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807106,1112);
INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807105,1111);
INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807110,1113);
INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807111,1113);
INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807112,1111);
INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807114,1113);
INSERT INTO Staff(Staff_id,Staff_Name,Stud_border,Prov_id)VALUES(1001,'Kamal',1807109,1112);

INSERT INTO Cook(Cook_id,Cook_name)VALUES(2221,'Josim');
INSERT INTO Cook(Cook_id,Cook_name)VALUES(2222,'Amena');

INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','Extra income',6,2221,1111);
INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','More money',4,2222,1112);
INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','Food facility',6,2221,1112);
INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','Room facility',12,2222,1113);


-- show all tables.............
DESC Student;
DESC Hallprovost;
DESC Diningmanager;
DESC Staff;
DESC Foodprovider;
DESC Cook;

-- lab 02 and  lab 03...................................................................

-- show all table informations......

SELECT * FROM Student;
SELECT * FROM Hallprovost;
SELECT * FROM Diningmanager;
SELECT * FROM Staff;
SELECT * FROM Foodprovider;
SELECT * FROM Cook;

-- adding column by add operation......
ALTER TABLE Cook ADD temp_add_column varchar(30);
DESC Cook;
SELECT * FROM Cook;

-- droping column by drop operation.....
ALTER TABLE Cook DROP column temp_add_column;
DESC Cook;
SELECT * FROM Cook;

-- modifiyng column data type from varchar(30) to varchar(60)...........
ALTER TABLE Cook modify Cook_name varchar(60);
DESC Cook;
SELECT * FROM Cook;

-- rename column by rename operation.........

ALTER TABLE Cook rename column Cook_name to Cook_username;
DESC Cook;
SELECT * FROM Cook;

ALTER TABLE Cook rename column Cook_username to Cook_name;
DESC Cook;
SELECT * FROM Cook;

-- update operation by updating a value.........
UPDATE Cook SET Cook_name = 'Atiqur Rahman' WHERE Cook_id = 2222;
SELECT * FROM Cook;

UPDATE Cook SET Cook_name = 'Amena' WHERE Cook_id = 2222;
SELECT * FROM Cook;

-- delete a row from Cook table.....

DELETE FROM Cook WHERE Cook_id = 2221;
SELECT * FROM Cook;

INSERT INTO Cook (Cook_id,Cook_name)VALUES(2221,'Josim');
SELECT * FROM Cook;



-- Some calculation over Hallprovost table.....

--apply divide operation...
SELECT (Total_amount/2) AS Tot_amount_divide FROM Hallprovost;

--some condition to find specific column with row info from food provider table...
SELECT Provider_name FROM Foodprovider WHERE Provider_id = 1112;

--search in a specific range over Student table
SELECT Student_name,Attached_hall FROM Student WHERE Student_id BETWEEN 1807108 AND  1807113;
SELECT Student_name,Attached_hall FROM Student WHERE Student_id NOT BETWEEN 1807108 AND  1807113;

-- find value of specific range by comparing and operator
SELECT Student_name,Attached_hall,Border_number FROM Student WHERE Student_id >= 1807108 AND Student_id <= 1807113;
SELECT Student_name,Attached_hall,Border_number FROM Student WHERE Student_id >= 1807108 OR Student_id <= 1807113; -- compound condition search condition

-- set membership using IN keyword
SELECT Student_name,Attached_hall,Border_number FROM Student WHERE Student_id IN(1807105,1807110,1807113);
SELECT Student_name,Attached_hall,Border_number FROM Student WHERE Student_id NOT IN(1807105,1807110,1807113);

-- ORDERING BY column values
SELECT Student_name,Attached_hall,Border_number FROM Student ORDER BY Student_id;
SELECT Student_name,Attached_hall,Border_number FROM Student ORDER BY Student_id DESC;

-- ORDER BY COLUMN VALUES(WITH MULTIPLE COLUMNS)
SELECT Student_name, Border_number FROM Student ORDER BY Student_name,Student_id;
SELECT Student_name, Border_number FROM Student ORDER BY Student_name,Student_id DESC;

-- use and find distinct values from column
SELECT DISTINCT(Prov_id) FROM Staff;



-- Lab 04...........................................................................

-- pattern matching like searching where first char is M and others may have any
SELECT Student_id,Student_name FROM Student WHERE Student_name LIKE 'M%';
-- searching where exit 'a' char in the word from student_name
SELECT Student_id,Student_name FROM Student WHERE Student_name LIKE '%a%';

-- use of aggregate functions
SELECT MAX(Messing_fee) FROM Student;
SELECT MIN(Messing_fee) FROM Student;
SELECT SUM(Messing_fee) FROM Student;
SELECT COUNT(Messing_fee) FROM Student;
SELECT COUNT(*)FROM Student;
SELECT COUNT(DISTINCT(Messing_fee)) FROM Student;
SELECT AVG(Messing_fee) FROM Student;
SELECT AVG(NVL(Messing_fee,0)) FROM Student; --if null exist,then it will be treated as 0

-- GROUP BY clause
SELECT COUNT(Student_id),Messing_fee FROM Student GROUP BY Messing_fee;
SELECT COUNT(Student_id),Messing_fee FROM Student WHERE Border_number>1807109 GROUP BY Messing_fee;

-- HAVING clause
SELECT COUNT(Student_id),Messing_fee FROM Student GROUP BY Messing_fee HAVING Messing_fee > 1500;
SELECT COUNT(Student_id),Messing_fee FROM Student GROUP BY Messing_fee HAVING COUNT(Messing_fee) > 1;


-- lab 05...............................................................................................








































