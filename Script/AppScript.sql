
--Show all tables

Select * 
from app_store_apps


Select *
from play_store_apps

-----------------------------------------------------------------

--- This table shows the name, review count for both apple and play store, rating for both, total review counts, genre and primary genre.


SELECT DISTINCT(a.name), --drew distrinct names
CAST(a.review_count AS int) AS a_review_count, --converts review count to int and aliased
MAX(p.review_count) AS p_max_review_count, --got the max review count and aliased
a.rating AS a_rating, -- rating from apple
p.rating AS p_rating, --rating from play store
sum(cast(a.review_count as int) + p.review_count) AS total_review_counts, -- added and cast review count as integer b/c its a text in app store, + review counts from play store as alias, 
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


-- THis one was written by Drew, genres by count

SELECT count(a.name), p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY a.name,p.genres
ORDER BY count DESC;


-- this one i edit to make distinct name groups and total count

SELECT count(a.name) as count, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY p.genres
ORDER BY count DESC
Limit 10;

-- File size for the top 10 and how it relates to download count

Select name,
REPLACE(size, 'M', '') as Size_MB
from play_store_apps as p
Left Join app_store_apps as a
on p


Select name,
 (select (cast(size_bytes as int) / 1000000)
from app_store_apps) as size_mb
from app_store_apps








