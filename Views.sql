
--=============================Views:
-------1: This view shows information about all reserved rooms
	create view view_reservation as
	(select *
	from reserved_rooms)

-------2:This view shows the total amount of payment in each country:
create view country_pay as(
select co.country_name, sum(amount) as sum_payments
from payment p inner join reservation r on p.payment_id = r.payment_id
	inner join Hotel h on r.hotel_id = h.hotel_id 
	inner join city c on h.city_id = c.city_id 
	inner join country co on c.country_id = co.country_id
group by co.country_name)

-------3:This view shows the number of hotels in each city and country using rollup
create view num_hotels as(
select 
case GROUPING(co.country_name)
	when 0 then co.country_name
	when 1 then 'All Countries'
end as country_name,

case GROUPING(c.city_name)
	when 0 then c.city_name
	when 1 then 'All Cities'
end as city_name,
count(h.hotel_id) as num_of_hotels
from Hotel h inner join city c on h.city_id = c.city_id
	inner join country co on co.country_id = c.country_id

group by rollup(co.country_name, c.city_name))