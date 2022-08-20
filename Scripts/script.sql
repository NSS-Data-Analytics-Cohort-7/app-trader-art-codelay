SELECT a.name, p.name as p
from app_store_apps as a
inner join play_store_apps as p
on a.name = p.name;

---This shows the number of apps per genre, sorted from greatest to smallest, for ratings 4.5 and greater.
SELECT COUNT(a.name) as count, a.name, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE p.rating >= 4.5
GROUP BY p.genres, a.name
ORDER BY count DESC
Limit 10;

---Shows the top rated genres that are above 4.5 stars.
SELECT DISTINCT(genres), a.rating,p.rating
FROM app_store_apps AS a 
INNER JOIN play_store_apps AS p
ON a.rating = p.rating
WHERE a.rating >= 4.5 AND p.rating >= 4.5
GROUP BY genres, a.rating,p.rating
ORDER BY a.rating,p.rating DESC;


SELECT DISTINCT(a.name) AS app_name,
p.name AS play_name,
a.rating AS app_rating,
p.rating AS play_rating,
a.review_count AS app_store,
p.review_count AS play_store
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p 
ON a.name = p.name
GROUP BY a.name,p.name,a.rating,p.rating,a.review_count,p.review_count
ORDER BY a.rating DESC;

---Top 10 script from Tim
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


SELECT DISTINCT(app_store.primary_genre)
FROM app_store_apps as app_store
INNER JOIN play_store_apps as play_store
ON app_store.primary_genre = play_store.genres
ORDER BY app_store.primary_genre;

SELECT DISTINCT(genres),rating, review_count
FROM play_store_apps as play_store
WHERE rating > 4.4 AND rating IS NOT NULL
GROUP BY DISTINCT(genres),rating, review_count
ORDER BY review_count DESC;


SELECT COUNT(a.name) as count, a.name, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE p.rating >= 4.5
GROUP BY p.genres, a.name
ORDER BY count DESC
Limit 10;
