
use sakila;

#Write a query to display for each store its store ID, city, and country.

select s.store_id, c.city, ct.country from store s
join address ad 
on ad.address_id = s.address_id
join city c
on c.city_id = ad.city_id
join country ct
on ct.country_id = c.country_id;

#Write a query to display how much business, in dollars, each store brought in.

select s.store_id, sum(p.amount) from store s
join staff st
on st.store_id = s.store_id
join payment p
on p.staff_id = st.staff_id
group by s.store_id;

#What is the average running time of films by category?

select c.name, avg(f.length) from category c
join film_category fc
on fc.category_id = c.category_id
join film f
on f.film_id = fc.film_id
group by c.name
order by avg(f.length) desc;

#Which film categories are longest?
#sport

#Display the most frequently rented movies in descending order

select f.title, count(r.rental_id) from film f
join inventory i
using (film_id)
join rental r
using (inventory_id)
group by f.title
order by count(r.rental_id) desc;


#List the top five genres in gross revenue in descending order.

select c.name, sum(p.amount) as gross_revenue from category c
join film_category fc using (category_id)
join film f using (film_id)
join inventory i using (film_id)
join rental r using (inventory_id)
join payment p using (rental_id)
group by c.name
order by sum(p.amount) desc;

#Is "Academy Dinosaur" available for rent from Store 1?

select f.title, i.store_id from film f
join inventory i using(film_id)
join store s using (store_id)
where f.title = 'Academy Dinosaur';

#YES