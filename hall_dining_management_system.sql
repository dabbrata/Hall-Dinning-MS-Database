-- set console display for proper view....

set pagesize 500;
set linesize 1000;

-- Lab 01............................................................................
DROP TABLE PROVIDESTUDENT;
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
-- don't allow duplicate value and the fee below 500 and above 5000 insertion into student table
CREATE OR REPLACE TRIGGER checkFee BEFORE INSERT OR UPDATE ON Student
FOR EACH ROW
DECLARE
    min_fee constant number(6,2) := 500.0;
    max_fee constant number(6,2) := 5000.0;
BEGIN
    IF :NEW.Messing_fee > max_fee OR  :NEW.Messing_fee < min_fee THEN
    RAISE_APPLICATION_ERROR(-2000,'New salary is too small or large');
    END IF;
END;
/ 

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


-- create view over all the tables with some specific values
CREATE OR REPLACE VIEW newStudent AS
SELECT * FROM Student WHERE student_id BETWEEN 1807109 AND 1807112;
SELECT * FROM newStudent;  

CREATE OR REPLACE VIEW newHallprovost AS
SELECT * FROM Hallprovost WHERE stud_id =1807109;
SELECT * FROM newHallprovost;

CREATE OR REPLACE VIEW newFoodprovider AS
SELECT * FROM Foodprovider WHERE Provider_id IN (1111,1113);
SELECT * FROM newFoodprovider;

CREATE OR REPLACE VIEW newStaff AS
SELECT * FROM Staff WHERE stud_border like 1807109;
SELECT * FROM newStaff;

CREATE OR REPLACE VIEW newCook AS
SELECT * FROM Cook WHERE Cook_id = 2221;
SELECT * FROM newCook;

CREATE OR REPLACE VIEW newDiningmanager AS
SELECT * FROM Diningmanager WHERE Ck_id = 2222;
SELECT * FROM newDiningmanager;



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

-- use of IN
SELECT Student_id,Messing_fee FROM Student WHERE Student_name IN('Dabbrata','Emdadul','Udoy');
-- nested query
SELECT Student_id,Messing_fee FROM Student WHERE Student_name IN(SELECT Student_name FROM Student);


-- SET operations..............

-- union all operation
SELECT Student_id,Student_name FROM Student WHERE Student_id > 1807107 AND Student_id < 1807113
UNION ALL
SELECT Provider_id,Provider_name FROM Foodprovider WHERE Provider_id >= 1111 AND Provider_id < 1113;
-- union operation
SELECT Student_id,Student_name FROM Student WHERE Student_id > 1807107 AND Student_id < 1807113
UNION
SELECT Provider_id,Provider_name FROM Foodprovider WHERE Provider_id >= 1111 AND Provider_id < 1113;

-- Intersect operation
SELECT Student_id FROM Student WHERE Student_id > 1807107 AND Student_id < 1807113
INTERSECT
SELECT Stud_border FROM Staff WHERE Stud_border >= 1807105 AND Stud_border < 1807110;

-- Minus operation
SELECT Student_id FROM Student WHERE Student_id >= 1807105 AND Student_id < 1807113
MINUS
SELECT Stud_border FROM Staff WHERE Stud_border >= 1807105 AND Stud_border < 1807110;




-- lab 06.................................................................................................
-- join multiple tables
SELECT s.Student_id,s.Student_name,s.Messing_fee FROM Student s
JOIN
Foodprovider f ON s.Student_id = f.Std_id;

-- join (condition using multiple columns)
SELECT s.Student_id,s.Student_name,s.Messing_fee FROM Student s
JOIN
Foodprovider f ON s.Student_id = f.Std_id AND s.Student_name = f.Provider_name;

-- natural join
SELECT Cook_id,Cook_name FROM Cook NATURAL JOIN Diningmanager;
-- cross join
SELECT st.Staff_id,st.Stud_border,st.Staff_Name,d.Duration_months FROM Staff st CROSS JOIN Diningmanager d;
-- inner join
SELECT p.Provider_id,p.Provider_name,d.Duration_months FROM Foodprovider p INNER JOIN Diningmanager d ON p.Provider_id = d.Pv_id;

-- outer join
-- left outer join
SELECT s.Student_id,s.Student_name,s.Messing_fee,f.Provider_name FROM Student s LEFT OUTER JOIN Foodprovider f ON s.Student_id = f.Std_id;
-- rigth outer join
SELECT s.Student_id,s.Student_name,s.Messing_fee,f.Provider_name FROM Student s RIGHT OUTER JOIN Foodprovider f ON s.Student_id = f.Std_id;
-- full outer join
SELECT s.Student_id,s.Student_name,s.Messing_fee,f.Provider_name FROM Student s FULL OUTER JOIN Foodprovider f ON s.Student_id = f.Std_id;

-- self join
SELECT s.Student_id,s.Student_name FROM Student s JOIN Student st ON s.Student_id < st.Student_id;
-- find max using self join
SELECT s.Student_id,s.Student_name FROM Student s MINUS
SELECT s.Student_id,s.Student_name FROM Student s JOIN Student st ON s.Student_id < st.Student_id;




-- lab 07..........................................................................................................
-- PLSql started from here

-- find maximum amount of fee from student table of the students
SET SERVEROUTPUT ON
DECLARE
    max_student_fee Student.Messing_fee%type;
BEGIN
    SELECT Max(Messing_fee) INTO max_student_fee FROM Student;
    DBMS_OUTPUT.PUT_LINE('The maximum fee is : '||max_student_fee);
END;
/
-- add two table(foodprovider with staff) and find specific one and initialize the variable with values
SET SERVEROUTPUT ON
DECLARE
  P_name Foodprovider.Provider_name%type;
  S_id  Foodprovider.Std_id%type := 1807109;
BEGIN
  SELECT Provider_name INTO P_name
  FROM Foodprovider, Staff
  WHERE Foodprovider.Std_id = Staff.Stud_border AND
  Std_id = S_id;  
  DBMS_OUTPUT.PUT_LINE('Name of foodprovider: ' || P_name);
END;
/
-- extra condiiton and calculation applied over query from student table

SET SERVEROUTPUT ON
DECLARE
    amount_fee  Student.Messing_fee%type;
    s_name  VARCHAR2(100);
    discount_fee Student.Messing_fee%type;
	
BEGIN
    s_name := 'Kowshik';
 
    SELECT Messing_fee INTO amount_fee
    FROM Student
    WHERE Student_name like s_name;
 
    IF amount_fee < 1500  THEN
               discount_fee := amount_fee;
    ELSIF amount_fee >= 1500 and amount_fee <2500  THEN
               discount_fee :=  amount_fee - (amount_fee*0.25);
    ELSIF amount_fee >= 2500 and amount_fee <= 3500 THEN
               discount_fee :=  amount_fee - (amount_fee*0.35);
    ELSE
	           discount_fee :=  amount_fee - (amount_fee*0.45); 
    END IF;
 
DBMS_OUTPUT.PUT_LINE (s_name || ' = Original Fee: '||amount_fee||', Disounted Fee: '|| ROUND(discount_fee,2));
EXCEPTION
         WHEN others THEN
	      DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/
SHOW errors




-- lab 08..........................................................................................................

-- For loop to find first 5 students from Student table
SET SERVEROUTPUT ON
DECLARE
    CURSOR student_cur IS SELECT Messing_fee,Student_name FROM Student;
    student_record student_cur%ROWTYPE;
BEGIN
    OPEN student_cur;
         LOOP
            FETCH student_cur INTO student_record;
            EXIT WHEN student_cur%ROWCOUNT > 5;
         DBMS_OUTPUT.PUT_LINE(student_record.Student_name||' : '||student_record.Messing_fee);
         END LOOP;
         CLOSE student_cur;
END;
/             

-- For loop to find first students whose messing fee is over 1500 from Student table

SET SERVEROUTPUT ON
DECLARE
    CURSOR student_cur IS SELECT Messing_fee,Student_name FROM Student;
    student_record student_cur%ROWTYPE;
    tot_student Number(10);
BEGIN
    SELECT COUNT(*) INTO tot_student FROM Student;
    OPEN student_cur;
         LOOP
            FETCH student_cur INTO student_record;
            EXIT WHEN student_cur%ROWCOUNT >= tot_student;
            IF student_record.Messing_fee > 1500 THEN
                DBMS_OUTPUT.PUT_LINE(student_record.Student_name||' : '||student_record.Messing_fee);
            END IF;    
         END LOOP;
         CLOSE student_cur;
END;
/ 

-- PL/SQL procedure to find foodprovider name with the help of corresponding student

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE getName IS
    p_name Foodprovider.Provider_name%type;
    s_id Foodprovider.Std_id%type;
BEGIN
    s_id := 1807111;
    SELECT Provider_name INTO p_name FROM Foodprovider
    WHERE Foodprovider.Std_id = s_id;
    DBMS_OUTPUT.PUT_LINE('The foodprovider named "'||p_name||'" will provide the food to the student(ROLL:'||s_id||')');
END;
/    

BEGIN
    getName;
END;
/

-- PL/SQL FUNCTION with return type to find average ,total messing fee and the discount of messing for specific amount...

-- function for average messing fee
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION avgFee RETURN Number IS
    avg_fee Student.Messing_fee%type;
BEGIN
    SELECT Avg(Messing_fee) INTO avg_fee FROM Student;
    RETURN avg_fee;
END;
/

-- funtion for total messing fee
CREATE OR REPLACE FUNCTION totalFee RETURN NUMBER IS
    total_fee NUMBER(10);
BEGIN
    SELECT Sum(Messing_fee) INTO total_fee FROM Student;
    RETURN total_fee;
END;
/

-- funtion for messing fee after discount
CREATE OR REPLACE FUNCTION discountFee
(amount_fee IN Student.Messing_fee%type,
discount_percent IN Student.Messing_fee%type)
RETURN NUMBER IS

BEGIN
    RETURN (NVL(amount_fee,0) - (NVL(amount_fee,0)*discount_percent*0.01));
END discountFee;
/    

-- Now call all the above functions...
BEGIN
    DBMS_OUTPUT.PUT_LINE('The AVERAGE messing fee of the students :' || avgFee);
    DBMS_OUTPUT.PUT_LINE('The TOTAL messing fee of the students :' || totalFee);
    DBMS_OUTPUT.PUT_LINE('The messing fee of 2500 after DISCOUNT :'|| discountFee(2500,15));
END;
/    




-- lab 09.........................................................................................................
-- triggered for applying condition to get discount among certain fee

CREATE TABLE DiscountRate(
    student_id Number(10) PRIMARY KEY,
    student_name varchar(50),
    fee Number(10) NOT NULL,
    discount_rate Number(10)
);
CREATE OR REPLACE TRIGGER discountTrigger
BEFORE UPDATE OR INSERT ON DiscountRate
FOR EACH ROW
BEGIN
    IF :NEW.fee > 4000 THEN :NEW.discount_rate := 40;
    ELSIF :NEW.fee > 3000 THEN :NEW.discount_rate := 30;
    ELSIF :NEW.fee > 2000 THEN :NEW.discount_rate := 20;
    ELSIF :NEW.fee > 1000 THEN :NEW.discount_rate := 10;
    ELSIF :NEW.fee < 1000 THEN :NEW.discount_rate := 5;
    END IF;
END discountTrigger;
/
-- now for the specific amount of fee ,it will automatically insert the discount rate acoording to that fee.
INSERT INTO DiscountRate(student_id,student_name,fee,discount_rate)VALUES(1,'dabbrata',2500,NULL);
SELECT * FROM DiscountRate;

DROP TABLE DiscountRate;

-- Transaction management for messign fee on extra table

CREATE TABLE Trans(
    studentId Number(10) PRIMARY KEY,
    amount_fee NUmber(10) NOT NULL
);

INSERT INTO Trans(studentId,amount_fee)VALUES(1807095,1200);
INSERT INTO Trans(studentId,amount_fee)VALUES(1807096,800);
COMMIT;
INSERT INTO Trans(studentId,amount_fee)VALUES(1807097,1600);
SAVEPOINT save1;
INSERT INTO Trans(studentId,amount_fee)VALUES(1807098,1000);
INSERT INTO Trans(studentId,amount_fee)VALUES(1807099,1100);
SAVEPOINT save2;
INSERT INTO Trans(studentId,amount_fee)VALUES(1807100,1400);

SELECT * FROM Trans;

ROLLBACK to save2;
SELECT * FROM Trans;

ROLLBACK to save1;
SELECT * FROM Trans;

DROP TABLE Trans;

-- some special functions
-- rollback
DELETE FROM Cook WHERE Cook_id = 2222;
SELECT * FROM Cook;
ROLLBACK;
SELECT * FROM Cook;
--  date
SELECT sysdate FROM dual;
SELECT current_date FROM dual;
SELECT systimestamp FROM dual;

-- two months extension in forward from current date
SELECT ADD_MONTHS ('13-JUL-22',2) AS Two_months_Extension
FROM Student
WHERE Student_id = 1807109;

-- two months extension in backward from current date
SELECT ADD_MONTHS ('13-JUL-22', -6) AS Six_months_Extension
FROM Student
WHERE Student_id = 1807109;

-- last day from the date of the months in which the student paid their fee
SELECT LAST_DAY ('13-JUL-22')
FROM Student;




-- .............................................. COMPLETED....................................................








  



    
    









































