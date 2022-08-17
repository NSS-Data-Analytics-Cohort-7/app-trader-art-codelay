Select * 
from app_store_apps
where name = 'Instagram'

Select *
from play_store_apps
where name = 'Instagram'
-----------------------------------------------------------------





--- This table shows the name, review count for both apple and play store, rating for both, total review counts, genre and primary genre.


SELECT DISTINCT(a.name), --drew distrinct names
CAST(a.review_count AS int) AS a_review_count, --converts review count to int and aliased
MAX(p.review_count) AS p_max_review_count, --got the max review count and aliased
a.rating AS a_rating, -- rating from apple
p.rating AS p_rating, --rating from play store
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts, -- added and cast review. count as integer, + review counts from play store as alias
p.genres, --genres from play
a.primary_genre, -- genres from apple
cast(a.price as money) -- cast price from apple as money to show dollar amount
FROM app_store_apps AS a --aliased apple table
INNER JOIN play_store_apps AS p -- used inner joined play to collect only same collums 
ON a.name = p.name -- matched on name from both
WHERE a.price <= 1 AND a.rating >= 4.5 AND p.rating >= 4.5 -- filterd by price equal and less than 1 and where rating greated and equal to 4.5
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres,a.price
ORDER BY total_review_counts DESC --orded by total review in desc order
Limit 10; --top 10

























