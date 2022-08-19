-- app store
select review_count, name, rating from app_store_apps where rating > 4.75;
-- play
select review_count, name, rating from play_store_apps where rating > 4.75;
select price,review_count, name, rating from play_store_apps where rating > 4.75;
SELECT count(a.name) as name, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY p.genres
ORDER BY name DESC
Limit 10;

SELECT count(a.name) as name, p.price
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY p.price
ORDER BY name DESC
Limit 10;

SELECT name, price, install_count, rating, review_count
from play_store_apps
where price Between '.99' and '1.99' and rating >='4.75' and install_count>='10000000'
order by install_count  DESC
limit 10;

--New Query


--CHristian alsider
 SELECT
 name,
 rating,
 CAST(review_count as int)
 FROM app_store_apps
 WHERE CAST (review_count as int) > 750000
 ORDER BY review_count DESC
 limit 10;
 
 SELECT
 name,
 rating,
 CAST(review_count as int)
 FROM app_store_apps
 WHERE CAST (review_count as int) > 750000
 ORDER BY review_count DESC
 limit 10;
 


 
