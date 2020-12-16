--============================== Functions:
------1: This function returns information of available rooms of a specific hotel in a specific date:
------so input is a hotel_id and output is a table containing information of available rooms:

CREATE FUNCTION avail_rooms
	( @hotel_id varchar(20), @start datetime, @end datetime)
	RETURNS TABLE
	AS
	RETURN
	(
		with table_1 as(
		select room_id
		from room
		where hotel_id = @hotel_id
		except
		select room_id
		from reserved_rooms
		where hotel_id = @hotel_id and start_reservation_date = @start and end_reservation_date = @end
		)

		select s1.room_id, s1.type, s1.avg_price as price_per_night
		from room s1 inner join table_1 s2 on s1.room_id = s2.room_id
	);

--=============================================================
------2: This finction returns all hotel's information in a specific city
------ so input is a city_id:

CREATE FUNCTION city_hotels
	( @city_id varchar(20))
	RETURNS TABLE
	AS
	RETURN
	(
		select h.hotel_id, h.name, h.num_stars, h.num_floors
		from hotel h
		where city_id = @city_id
	);

--=============================================================
------3: This functions shows all hotels with a specific star rate in a country
------ so input is country_id and star_rate you assume
CREATE FUNCTION stars
	( @country_id varchar(20), @stars int)
	RETURNS TABLE
	AS
	RETURN
	(
		select h.hotel_id, h.name, h.num_stars, h.num_floors
		from hotel h inner join city c on h.city_id = c.city_id
		where c.country_id = @country_id and h.num_stars = @stars
	);
