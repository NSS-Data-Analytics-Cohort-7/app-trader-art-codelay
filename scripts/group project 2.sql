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

SELECT name, price, install_count, rating
from play_store_apps
where price Between and rating >='4.75' and install_count > '1000000';
