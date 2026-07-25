create database EUROPEAN_TRAVEL_ORGANISATION;

show databases;

USE EUROPEAN_TRAVEL_ORGANISATION;

create table COUNTRIES (

country_id int primary key,
country_name varchar(100) ,
currency varchar(50),
language_spoken varchar(50)
);

create table TOUR_PACKAGES (

package_id int primary key,
package_name varchar(100),
country_id int ,
duration_days int,
package_price decimal(10,2),
package_type varchar(50),

foreign key (country_id)
references COUNTRIES(country_id)

);

create table tour_guides(

guide_id int primary key ,
guide_name varchar(100),
experience_years int ,
language_known varchar(100),
phone_number varchar(15)

);

create table package_guides(

package_id int,
guide_id int,

primary key (package_id , guide_id),

foreign key(package_id)
references tour_packages(package_id),

foreign key (guide_id)
references tour_guides(guide_id)
);

create table customers (

customer_id int primary key,
customer_name varchar(100),
gender varchar(10),
phone_number varchar(15),
email varchar(100),
city varchar(100),
passport_number varchar(20) unique

);

create table bookings (

booking_id int primary key,
customer_id int ,
package_id int,
booking_date date,
number_of_people int ,
booking_status varchar(30),

foreign key(customer_id)
references customers(customer_id),

foreign key(package_id)
references tour_packages(package_id)

);
create table hotels(

hotel_id int primary key,
hotel_name varchar(100),
country_id int ,
city varchar(100),
hotel_rating decimal(2,1),

foreign key (country_id)
references countries(country_id)
);

create table package_hotels(

package_id int ,
hotel_id int ,

primary key(package_id ,hotel_id),

foreign key(package_id)
references tour_packages(package_id),

foreign key (hotel_id)
references hotels(hotel_id)
);



create table payments (

payment_id int primary key ,
booking_id int ,
payment_date date ,
payment_amount decimal(10,2),
payment_method varchar(50),
payment_status varchar(30),

foreign key (booking_id)
references bookings(booking_id)

);


create table flights (

flight_id int primary key ,
airline_name varchar(100),
departure_city varchar(100),
arrival_city varchar(100),
flight_date date ,
ticket_price decimal(10,2)

);

INSERT INTO COUNTRIES VALUES
(1,'France','Euro','French'),
(2,'Italy','Euro','Italian'),
(3,'Switzerland','Swiss Franc','German');

INSERT INTO TOUR_PACKAGES VALUES
(101,'Paris Explorer',1,5,45000.00,'Family'),
(102,'Rome Heritage',2,6,52000.00,'Cultural'),
(103,'Swiss Alps Adventure',3,7,68000.00,'Adventure');

INSERT INTO TOUR_GUIDES VALUES
(201,'John Martin',8,'English, French','9876543210'),
(202,'Marco Rossi',10,'Italian, English','9876543211'),
(203,'Anna Keller',6,'German, English','9876543212');

INSERT INTO PACKAGE_GUIDES VALUES
(101,201),
(102,202),
(103,203);

INSERT INTO CUSTOMERS VALUES
(301,'Rahul Sharma','Male','9876500011','rahul@gmail.com','Delhi','P123456'),
(302,'Priya Nair','Female','9876500012','priya@gmail.com','Chennai','P123457'),
(303,'Arjun Kumar','Male','9876500013','arjun@gmail.com','Bangalore','P123458');

INSERT INTO BOOKINGS VALUES
(401,301,101,'2026-07-01',2,'Confirmed'),
(402,302,102,'2026-07-03',1,'Pending'),
(403,303,103,'2026-07-05',4,'Confirmed');

INSERT INTO HOTELS VALUES
(501,'Paris Grand Hotel',1,'Paris',4.8),
(502,'Rome Palace',2,'Rome',4.6),
(503,'Swiss Mountain Resort',3,'Zurich',4.9);


INSERT INTO PACKAGE_HOTELS VALUES
(101,501),
(102,502),
(103,503);


INSERT INTO PAYMENTS VALUES
(601,401,'2026-07-02',90000.00,'Credit Card','Completed'),
(602,402,'2026-07-04',52000.00,'UPI','Pending'),
(603,403,'2026-07-06',272000.00,'Net Banking','Completed');


INSERT INTO FLIGHTS VALUES
(701,'Air France','Delhi','Paris','2026-07-10',38000.00),
(702,'ITA Airways','Chennai','Rome','2026-07-12',35000.00),
(703,'Swiss International','Bangalore','Zurich','2026-07-15',42000.00);


SELECT * FROM COUNTRIES;

SELECT * FROM TOUR_PACKAGES;

SELECT * FROM TOUR_GUIDES;

SELECT * FROM PACKAGE_GUIDES;

SELECT * FROM CUSTOMERS;

SELECT * FROM BOOKINGS;

SELECT * FROM HOTELS;

SELECT * FROM PACKAGE_HOTELS;

SELECT * FROM PAYMENTS;
SHOW DATABASES;
SHOW TABLES;

SELECT * FROM FLIGHTS;
