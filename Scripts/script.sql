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

SELECT DISTINCT(genres), a.rating,p.rating
FROM app_store_apps AS a 
INNER JOIN play_store_apps AS p
ON a.rating = p.rating
WHERE a.rating >= 4.5 AND p.rating >= 4.5
GROUP BY genres


