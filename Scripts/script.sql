SELECT a.name, p.name as p
from app_store_apps as a
inner join play_store_apps as p
on a.name = p.name;

---This shows the number of apps per genre, sorted from greatest to smallest.
SELECT count(a.name) as count, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY p.genres
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


SELECT a.name AS app_name,
p.name AS play_name,
a.rating AS app_rating,
p.rating AS play_rating,
a.review_count AS app_store,
p.review_count AS play_store
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p 
ON a.name = p.name
WHERE a.rating = p.rating
GROUP BY a.name,p.name,a.rating,p.rating,a.review_count,p.review_count
ORDER BY a.rating DESC;

