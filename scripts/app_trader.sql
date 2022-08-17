SELECT *
FROM app_store_apps;

SELECT *
FROM play_store_apps;

--Top 10 Average ratings between both app stores with highest combined review counts

SELECT a.name, p.name, 
    (AVG(a.rating + p.rating)/2) AS overall_avg_ratings, SUM(CAST(a.review_count AS int) + p.review_count) AS overall_review_counts
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING (name)
WHERE a.rating >= '4.5' AND p.rating >= '4.5'
GROUP BY a.name, p.name
ORDER BY overall_review_counts DESC
LIMIT 10;

--Top 10 apps with highest combined review counts

SELECT a.name, p.name, 
    (AVG(a.rating + p.rating)/2) AS overall_avg_ratings, SUM(CAST(a.review_count AS int) + p.review_count) AS overall_review_counts
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING (name)
GROUP BY a.name, p.name
ORDER BY overall_review_counts DESC
LIMIT 10;

--From Tim / Drew

SELECT COUNT(a.name) AS count, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY p.genres
ORDER BY count DESC
LIMIT 10; 

