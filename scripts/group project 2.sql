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
select a.name, p.name
(AVG(a.rating + p.rating)/2) as overall_avg_ratings, sum(casta.review_count as int) + p.review_count