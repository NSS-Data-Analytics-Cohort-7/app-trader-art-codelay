SELECT *
FROM app_store_apps
ORDER BY content_rating;

SELECT *
FROM play_store_apps;

--Top 10 Average ratings above 4.5 with highest combined review counts between both app stores

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

--From Tim / Drew Top 10 genres

SELECT COUNT(a.name) AS count, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY p.genres
ORDER BY count DESC
LIMIT 10; 

--Top 10 apps based off rating, then review count for Apple store
SELECT name, content_rating, rating, CAST(review_count AS int)
FROM app_store_apps 
ORDER BY rating DESC, review_count DESC, content_rating DESC
LIMIT 10;

--Top 10 apps based off rating, then review count for Google store
SELECT name, content_rating, rating, CAST(review_count AS int)
FROM play_store_apps
ORDER BY rating DESC, review_count DESC, content_rating DESC
LIMIT 10;

--Two CTEs to combine content ratings from both tables into combined buckets of content ratings
WITH apple AS (
    SELECT COUNT (content_rating) AS apple_count, 
        CASE
            WHEN content_rating = '9+' THEN 'Pre-Teen+'
            WHEN content_rating = '17+' THEN 'Adults Only'
            WHEN content_rating = '12+' THEN 'Teen+'
            WHEN content_rating = '4+' THEN 'Everyone'
            ELSE 'NULL'
            END AS apple_content_rating
    FROM app_store_apps AS a
    GROUP BY content_rating),
        
google AS (
    SELECT COUNT(content_rating) AS play_count,
        CASE
            WHEN content_rating = 'Everyone 10+' THEN 'Pre-Teen+'
            WHEN content_rating = 'Teen' THEN 'Teen+'
            WHEN content_rating = 'Everyone' THEN 'Everyone'
            WHEN content_rating = 'Adults Only 18+' THEN 'Adults Only'
            WHEN content_rating = 'Mature 17+' THEN 'Adults Only'
            ELSE 'NULL'
            END AS play_content_rating
    FROM play_store_apps AS p
    GROUP BY content_rating)
    
SELECT play_content_rating, play_count + apple_count AS combined_count
FROM google
JOIN apple
ON google.play_content_rating = apple.apple_content_rating
ORDER BY combined_count DESC;
    