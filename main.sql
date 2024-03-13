create table customer(
c_id int,
dri_lic_no int primary key,
phone_no int,
Fname varchar (20),
Mname varchar (20),
Lname varchar (20),
street varchar (20),
city varchar (20)
);

create table car (
reg_no int primary key,
availability varchar (20),
modelyear int,
model varchar (30),
make varchar (20),
dri_lic_no int,
c_name varchar (20),
car_name varchar (30),
foreign key (dri_lic_no) references customer (dri_lic_no) on delete set null
);

create table car_category(
name varchar (20) primary key,
no_of_person int,
cost_per_day int,
late_fee_per_hour int
);

alter table car
add foreign key (c_name) references car_category (name) on delete cascade ;

create table booking(
dri_lic_no int,
c_reg_no int,
booking_id int primary key,
starting_date date,
returning_date date,
actuall_returning_date date,
status varchar (20) ,
foreign key (dri_lic_no) references customer (dri_lic_no) on delete set null,
foreign key (c_reg_no) references car (reg_no) on delete set null
);

create table billing (
b_id int,
bill_id int primary key,
bill_date date,
bill_status varchar (20),
total_late_fee int,
total int,
foreign key (b_id) references booking (booking_id) on delete cascade
);

create table car_insurance (
ins_code int primary key,
name varchar (100),
covarage_type varchar (100),
cost int,
bill_id int,
foreign key (bill_id) references billing (bill_id) on delete set null
);
Records Inserted:
INSERT INTO Customer (Dri_Lic_No, C_id, Phone_No , Fname, Mname, Lname, Street, City)
VALUES (100,1,0595535907,'emad','ahmad','taha','yafa','nablus');
INSERT INTO Customer (Dri_Lic_No, C_id, Phone_No , Fname, Mname, Lname, Street, City)
VALUES (101,2,0595590735,'ahmad','adel','emad','sufian','nablus');
INSERT INTO Customer (Dri_Lic_No, C_id, Phone_No , Fname, Mname, Lname, Street, City)
VALUES (102,3,0597842309,'hussam','ahmad','ramadn','haifa','ramallah');
INSERT INTO Customer (Dri_Lic_No, C_id, Phone_No , Fname, Mname, Lname, Street, City)
VALUES (103,4,0595879356,'yassmen','khalil','hamed','tunes','nablus');
INSERT INTO Customer (Dri_Lic_No, C_id, Phone_No , Fname, Mname, Lname, Street, City)
VALUES (104,5,0567891235,'wael','ahmad','khalid','alhorea','salfeet');
INSERT INTO Customer (Dri_Lic_No, C_id, Phone_No , Fname, Mname, Lname, Street, City)
VALUES (105,6,056789654,'ali','ayham','rasim','alskakene','ramallah');
INSERT INTO car (reg_no, availability, modelyear , model, make, dri_lic_no , c_name,car_name)
VALUES (1000,'rented',2020,'m4','germany',100,’sport’,'bmw');
INSERT INTO car (reg_no, availability, modelyear , model, make, dri_lic_no , c_name, car_name)
VALUES (1001,'available',2018,'serento','korea',101,’SUV’,'kia');
INSERT INTO car (reg_no, availability, modelyear , model, make, dri_lic_no , c_name, car_name)
VALUES (1002,'available',2022,'morning','korea',100,’economy’,'kia');
INSERT INTO car (reg_no, availability, modelyear , model, make, dri_lic_no , c_name, car_name)
VALUES (1003,'available',2022,'accent','korea',102,’economy’,'hunda');
INSERT INTO car (reg_no, availability, modelyear , model, make, dri_lic_no , c_name, car_name)
VALUES (1004,'rented',2021,'tesla-z','usa',103,’smart’,'tesla');
INSERT INTO car (reg_no, availability, modelyear , model, make, dri_lic_no , c_name, car_name)
VALUES (1005,'available',2019,'m8','germany',104,’sport’,'bmw');
INSERT INTO car (reg_no, availability, modelyear , model, make, dri_lic_no , c_name, car_name)
VALUES (1006,'rented',2019,'sckoda-scala','Czech',105,’MID SIZE’,'sckoda');

INSERT INTO car_category (name,no_of_person,cost_per_day,late_fee_per_hour)
VALUES ('sport',5,300,40);
INSERT INTO car_category (name,no_of_person,cost_per_day,late_fee_per_hour)
VALUES ('SUV',7,150,10);
INSERT INTO car_category (name,no_of_person,cost_per_day,late_fee_per_hour)
VALUES ('smart',5,250,20);
INSERT INTO car_category (name,no_of_person,cost_per_day,late_fee_per_hour)
VALUES ('MID SIZE',5,180,10);
INSERT INTO car_category (name,no_of_person,cost_per_day,late_fee_per_hour)
VALUES ('luxury',7,170,10);
INSERT INTO car_category (name,no_of_person,cost_per_day,late_fee_per_hour)
VALUES ('economy',5,150,10);

INSERT INTO booking (dri_lic_no, c_reg_no, booking_id, starting_date, returning_date, actuall_returning_date,status)
VALUES ( 100,1006 ,10 ,'17-DEC-2022' , '19-DEC-2022' , '19-DEC-2022'  ,'Booked Up' );
INSERT INTO booking (dri_lic_no, c_reg_no, booking_id, starting_date, returning_date, actuall_returning_date,status)
VALUES ( 103,1000 ,11 ,'10-Jun-2022' ,'12-Jun-2022' ,'12-Jun-2022' , 'Not Booked' );
INSERT INTO booking (dri_lic_no, c_reg_no, booking_id, starting_date, returning_date, actuall_returning_date,status)
VALUES (100 ,1001 ,12 ,'5-Dec-2022' ,'12-Dec-2022' , '12-Dec-2022'  , 'Booked Up' );

INSERT INTO booking (dri_lic_no, c_reg_no, booking_id, starting_date, returning_date, actuall_returning_date,status)
VALUES (101 , 1002,13 ,'5-Sep-2022' ,'8-Sep-2022' ,'8-Sep-2022' , 'Booked Up' );
INSERT INTO booking (dri_lic_no, c_reg_no, booking_id, starting_date, returning_date, actuall_returning_date,status)
VALUES (102 ,1003 ,14 ,'8-Nov-2022' ,'12-Nov-2022' ,'12-Nov-2022' ,'Not Booked' );


INSERT INTO billing (b_id, bill_id, bill_date, bill_status, total_late_fee, total)
VALUES ( 13,1 , '8-Sep-2022'  ,'Paid' ,0 ,150 );
INSERT INTO billing (b_id, bill_id, bill_date, bill_status, total_late_fee, total)
VALUES ( 12, 21, '14-Dec-2022' , 'Paid' , 0,150 );
INSERT INTO billing (b_id, bill_id, bill_date, bill_status, total_late_fee, total)
VALUES ( 11, 3, '12-Jun-2022', 'Paid' ,0 ,300 );
INSERT INTO billing (b_id, bill_id, bill_date, bill_status, total_late_fee, total)
VALUES ( 10, 4, '19-nov-2022'  , 'Paid' ,0 ,180 );
INSERT INTO billing (b_id, bill_id, bill_date, bill_status, total_late_fee, total)
VALUES ( 14, 5,'12-Nov-2022', 'Paid' ,0 ,150 );

INSERT INTO car_insurance (ins_code, name, covarage_type, cost, bill_id)
VALUES (1200 ,'COLLISION DAMAGE WAIVER',' Mandatory' ,8000 ,3 );

INSERT INTO car_insurance (ins_code, name, covarage_type, cost, bill_id)
VALUES (1201 ,' SUPPLEMENTAL LIABILITY PROTECTION' , 'Third team', 8000,1 );
INSERT INTO car_insurance (ins_code, name, covarage_type, cost, bill_id)
VALUES (1202 , 'PERSONAL ACCIDENT INSURANCE', 'Mandatory' ,8000 ,4 );

Reports:

1. Display all the customers’ records who located in Nablus or  Ramallah city:
SELECT * FROM customer
WHERE city = 'nablus' OR city = 'ramallah';

2. Display the number of BMW cars manufactured in 2020:
SELECT COUNT (c_name)
FROM car
WHERE modelyear = 2020 AND c_name = 'bmw';

3. Display all the cars’ records where the cost per a day is between 100 – 200 :
SELECT * FROM car_category
WHERE cost_per_day  BETWEEN 100 AND 200;

4. Check the bill status that holds the date of 8th Sep. 2022 :
SELECT bill_status
FROM billing
WHERE bill_date = '8-Sep-2022';

5. Display all cars’ records related to a personal accident insurance:
SELECT * FROM car_insurance
WHERE name = 'PERSONAL ACCIDENT INSURANCE';

6. Check if the Kia Serento is available or rented:
SELECT availability 
FROM car 
WHERE model = 'serento';
