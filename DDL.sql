create table hotel(
	hotel_id varchar(20) PRIMARY KEY,
	name varchar(30),
	num_stars int,
	num_floors int,
	city_id varchar(20)
	FOREIGN KEY (city_id) REFERENCES city (city_id)
)

create table city(
	city_id varchar(20) PRIMARY KEY,
	city_name varchar(30),
	country_id varchar(20)
	FOREIGN KEY (country_id) REFERENCES country (country_id)
)

create table country(
	country_id varchar(20) PRIMARY KEY,
	country_name varchar(30)
)

create table guest(
	guest_id varchar(20) PRIMARY KEY,
	firstname varchar(30),
	lastname varchar(30),
	email varchar(30),
	phone_num varchar(30)
)

create table reservation(
	reservation_id varchar(20),
	guest_id varchar(20),
	hotel_id varchar(20),
	start_date datetime,
	end_date datetime,
	price int,
	room_id varchar(20),
	payment_id varchar(20),
	PRIMARY KEY (reservation_id),
	FOREIGN KEY (payment_id) REFERENCES payment (payment_id),
	FOREIGN KEY (room_id) REFERENCES room (room_id),
	FOREIGN KEY (guest_id) REFERENCES guest (guest_id),
	FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id)
)

create table room(
	room_id varchar(20) PRIMARY KEY,
	hotel_id varchar(20),
	type varchar(30),
	avg_price int,
	FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id)
)

create table reserved_rooms(
	room_id varchar(20),
	hotel_id varchar(20),
	start_reservation_date datetime,
	end_reservation_date datetime,
	PRIMARY KEY(room_id, hotel_id),
	FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id),
	FOREIGN KEY (room_id) REFERENCES room (room_id)
)

create table hosted_at(
	guest_id varchar(20),
	room_id varchar(20),
	PRIMARY KEY (guest_id, room_id),
	FOREIGN KEY (guest_id) REFERENCES guest (guest_id),
	FOREIGN KEY (room_id) REFERENCES room (room_id),
)

create table employee(
	emp_id varchar(20) PRIMARY KEY,
	firstname varchar(30),
	lastname varchar(30),
	email varchar(30),
	hotel_id varchar(20),
	task varchar(20),
	FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id)
)

create table payment(
	payment_id varchar(20) PRIMARY KEY,
	amount int, 
	--guest_id varchar(20),
	pay_date datetime, 
	--FOREIGN KEY (guest_id) REFERENCES guest (guest_id)
)

--=====================Insertion:


insert into hotel values ('H_100', 'Aseman', 4, 5, '225')
insert into hotel values ('H_101', 'Kosar', 4, 3, '225')
insert into hotel values ('H_102', 'Ibis', 3, 15, '301')
insert into hotel values ('H_103', 'Marine', 5, 8, '270')
insert into hotel values ('H_104', 'Shh', 4, 4, '226')


insert into city values ('225', 'Esfahan', '2250')
insert into city values ('226', 'Tehran', '2250')
insert into city values ('301', 'Beijing', '3010')
insert into city values ('270', 'California', '2700')


insert into country values('2250', 'Iran')
insert into country values('3010', 'China')
insert into country values('2700', 'United States')


insert into room values('100a', 'H_100', 'single', 100)
insert into room values('100b', 'H_100', 'single', 110)
insert into room values('100c', 'H_100', 'double', 200)
insert into room values('100d', 'H_100', 'single', 150)
insert into room values('100e', 'H_100', 'double', 300)

insert into room values('101a', 'H_101', 'single', 94)
insert into room values('101b', 'H_101', 'single', 115)
insert into room values('101c', 'H_101', 'single', 135)
insert into room values('101d', 'H_101', 'double', 230)

insert into room values('102a', 'H_102', 'single', 500)
insert into room values('102b', 'H_102', 'double', 680)
insert into room values('102c', 'H_102', 'single', 400)

insert into room values('103a', 'H_103', 'single', 690)
insert into room values('103b', 'H_103', 'single', 680)
insert into room values('103c', 'H_103', 'double', 700)


insert into reserved_rooms values('100a', 'H_100', 18-06-20, 20-06-20)
insert into reserved_rooms values('100c', 'H_100', 15-07-20, 25-07-20)
insert into reserved_rooms values('100e', 'H_100', 18-06-20, 21-06-20)
insert into reserved_rooms values('101b', 'H_101', 18-08-20, 24-08-20)
insert into reserved_rooms values('101d', 'H_101', 09-07-20, 20-06-20)
insert into reserved_rooms values('102c', 'H_102', 18-06-20, 24-06-20)
insert into reserved_rooms values('103b', 'H_103', 12-09-20, 27-09-20)


insert into employee values('E_100a', 'aa', 'bb', 'a.b@gmail.com', 'H_100', 'A')
insert into employee values('E_100b', 'ab', 'ba', 'a.c@gmail.com', 'H_100', 'B')
insert into employee values('E_101a', 'cc', 'oo', 'a.d@gmail.com', 'H_101', 'A')
insert into employee values('E_102a', 'dd', 'ii', 'a.g@gmail.com', 'H_102', 'B')
insert into employee values('E_103a', 'ee', 'uu', 'a.y@gmail.com', 'H_103', 'A')


insert into guest values('G_100a', 'Zahra', 'Abedi', 'Z.abedi@gmail.com', '+983333333')
insert into guest values('G_100c', 'monir', 'mohdes', 'm.moha@gmail.com', '+98332223')
insert into guest values('G_100e', 'mahsa', 'akaf', 'mahsa.ak@gmail.com', '+983376533')
insert into guest values('G_101b', 'mahsa', 'karimi', 'Z.aabedi@gmail.com', '+98433933')
insert into guest values('G_101d', 'azam', 'fazel', 'F.aab@gmail.com', '+9811111')
insert into guest values('G_102c', 'bb', 'cc', 'Za.abedi@gmail.com', '+983145673')
insert into guest values('G_103b', 'Zz', 'Aa', 'Zaa.abbedi@gmail.com', '+98330093')


-- amount in payment is now 0 and in a trigger I will update them
insert into payment values('P_1', 0, 18-06-20)
insert into payment values('P_2', 0, 15-07-20)
insert into payment values('P_3', 0, 18-06-20)
insert into payment values('P_4', 0, 18-08-20)
insert into payment values('P_5', 0, 09-07-20)
insert into payment values('P_6', 0, 18-06-20)
insert into payment values('P_7', 0, 12-09-20)




-- prices of reservation are now 0 and then in a trigger I will update them
insert into reservation values('R_1', 'G_100a', 'H_100', 18-06-20, 20-06-20, 0, '100a', 'P_1')
insert into reservation values('R_2', 'G_100c', 'H_100', 15-07-20, 25-07-20, 0, '100c', 'P_2')
insert into reservation values('R_3', 'G_100e', 'H_100', 18-06-20, 21-06-20, 0, '100e', 'P_3')
insert into reservation values('R_4', 'G_101b', 'H_101', 18-08-20, 24-08-20, 0, '101b', 'P_4')
insert into reservation values('R_5', 'G_101d', 'H_101', 09-07-20, 20-06-20, 0, '101d', 'P_5')
insert into reservation values('R_6', 'G_102c', 'H_102', 18-06-20, 24-06-20, 0, '102c', 'P_6')
insert into reservation values('R_7', 'G_103b', 'H_103', 12-09-20, 27-09-20, 0, '103b', 'P_7')


