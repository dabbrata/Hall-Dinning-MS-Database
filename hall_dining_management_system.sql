DROP TABLE Providestudent;
DROP TABLE Hallprovost;
DROP TABLE Staff;
DROP TABLE Student;
DROP TABLE Diningmanager;
DROP TABLE Foodprovider;
DROP TABLE Cook;


CREATE TABLE Student(
    Student_id Number(10) NOT NULL,
    Attached_hall varchar(255),
    Border_number Number(10) NOT NULL,
    Student_name varchar(255),
    Messing_fee Number(10),
    PRIMARY KEY (Student_id)
);

CREATE TABLE Hallprovost(
    Provost_id Number(10),
    Provost_name varchar(255),
    Designation varchar(255),
    Hall_name varchar(255),
    Total_amount Number(10),
    Stud_id Number(10) NOT NULL, 
    FOREIGN KEY (Stud_id) REFERENCES Student(Student_id) ON DELETE CASCADE
);


CREATE TABLE Cook(
    Cook_id Number(10) NOT NULL,
    Cook_name varchar(255),
    PRIMARY KEY(Cook_id)
);

CREATE TABLE Foodprovider(
    Provider_id Number(10) NOT NULL,
    Provider_name varchar(255),
    Std_id Number(10) NOT NULL,
    PRIMARY KEY(Provider_id)
);

CREATE TABLE Staff(
    Staff_id Number(10),
    Staff_Name varchar(255),
    Stud_border Number(10) NOT NULL,
    Prov_id Number(10) NOT NULL,
    FOREIGN KEY(Stud_border) REFERENCES Student(Student_id) ON DELETE CASCADE,
    FOREIGN KEY(Prov_id) REFERENCES Foodprovider(Provider_id) ON DELETE CASCADE
);

CREATE TABLE Diningmanager(
    Manager_id Number(10),
    Hall_name varchar(255),
    Manager_name varchar(255),
    Facilities varchar(255),
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

INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807109,'BSMRH',1807109,'Dabbrata',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807107,'BSMRH',1807107,'Emdadul',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807106,'BSMRH',1807106,'Udoy',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807105,'BSMRH',1807105,'Kowshik',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807110,'BSMRH',1807110,'Jubayer',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807111,'BSMRH',1807111,'Amit',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807112,'BSMRH',1807112,'Mobarak',2000);
INSERT INTO Student(Student_id,Attached_hall,Border_number,Student_name,Messing_fee)VALUES(1807114,'BSMRH',1807114,'Mishu',2000);

INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807105);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807107);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807109);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807110);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807111);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807106);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807112);
INSERT INTO Hallprovost(Provost_id,Provost_name,Designation,Hall_name,Total_amount,Stud_id)VALUES(1801,'Arif','Assist.Prof','BSMRH',12000,1807114);

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

INSERT INTO Cook(Cook_id,Cook_name)VALUES(2221,'josim');
INSERT INTO Cook(Cook_id,Cook_name)VALUES(2222,'Amena');

INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','Extra income',6,2221,1111);
INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','More money',4,2222,1112);
INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','Food facility',6,2221,1112);
INSERT INTO Diningmanager(Manager_id,Hall_name,Manager_name,Facilities,Duration_months,Ck_id,Pv_id)VALUES(5050,'BSMRH','Tayef','Room facility',12,2222,1113);


-- set console display for proper view....

set pagesize 500;
set linesize 1000;

-- show all tables.............
DESC Student;
DESC Hallprovost;
DESC Diningmanager;
DESC Staff;
DESC Foodprovider;
DESC Cook;

-- show all table informations......

SELECT * FROM Student;
SELECT * FROM Hallprovost;
SELECT * FROM Diningmanager;
SELECT * FROM Staff;
SELECT * FROM Foodprovider;
SELECT * FROM Cook;









