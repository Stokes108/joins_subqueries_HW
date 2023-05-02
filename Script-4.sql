--question 1

select first_name, last_name, district  
from customer
full join address
on address.address_id = customer.address_id 
where district = 'Texas';

--question 2

select first_name, last_name, amount
from customer 
full join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99;


-- question 3

select first_name, last_name
from customer where customer_id in(
	select customer_id 
	from payment
	where amount > 175
);

--question 4

select first_name, last_name, country
from customer 
full join address
on address.address_id = customer.address_id
full join city 
on city.city_id = address.city_id 
full join country 
on country.country_id = city.country_id
where country = 'Nepal';


-- question 5

select s.first_name, s.last_name, count(p.staff_id)
from payment as p
full join staff as s
on s.staff_id = p.staff_id
group by s.first_name, s.last_name, p.staff_id
order by count(p.staff_id) desc;


-- question 6

select rating, count(rating)
from film 
group by rating
order by count(rating) desc;


-- question 7

select first_name, last_name
from customer where customer_id in(
	select distinct(customer_id )
	from payment 
	where amount > 6.99
);


--questinon 8 - didn't quite understand the question. This is the amount of rentals under 0 dollars divied by the two stores


select c.store_id, count(c.store_id)
from payment as p
full join customer as c
on c.customer_id = p.customer_id
where p.amount < 0.00
group by c.store_id 
order by c.store_id asc;

group by p.rental_id, c.store_id 
order by count(p.rental_id) desc;

