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

SELECT name, content_rating, rating, CAST(review_count AS int)
FROM app_store_apps 
ORDER BY rating DESC, review_count DESC, content_rating DESC
LIMIT 10;

SELECT name, content_rating, rating, CAST(review_count AS int)
FROM play_store_apps
ORDER BY rating DESC, review_count DESC, content_rating DESC
LIMIT 10;

WITH apple AS (
    SELECT COUNT (content_rating), 
        CASE
            WHEN content_rating = '9+' THEN 'Pre-Teen+'
            WHEN content_rating = '17+' THEN 'Adults Only'
            WHEN content_rating = '12+' THEN 'Teen+'
            WHEN content_rating = '4+' THEN 'Everyone'
            END AS apple_content_rating
    FROM app_store_apps AS a
    GROUP BY content_rating),
        
google AS (
    SELECT COUNT(content_rating),
        CASE
            WHEN content_rating = 'Everyone 10+' THEN 'Pre-Teen+'
            WHEN content_rating = 'Teen' THEN 'Teen+'
            WHEN content_rating = 'Everyone' THEN 'Everyone'
            WHEN content_rating = 'Adults Only 18+' THEN 'Adults Only'
            WHEN content_rating = 'Mature 17+' THEN 'Adults Only'
            WHEN content_rating = 'Unrated' THEN 'NULL'
            END AS play_content_rating
    FROM play_store_apps AS p
    GROUP BY content_rating)
    
SELECT SUM(COUNT(p.content_rating)+COUNT(apple_content_rating))
FROM google
JOIN apple
ON google.play_content_rating = apple.apple_content_rating;
    


SELECT COUNT (content_rating), 
        CASE
            WHEN content_rating = '9+' THEN 'Pre-Teen+'
            WHEN content_rating = '17+' THEN 'Adults Only'
            WHEN content_rating = '12+' THEN 'Teen+'
            WHEN content_rating = '4+' THEN 'Everyone'
            WHEN content_rating = 'Everyone 10+' THEN 'Pre-Teen+'
            WHEN content_rating = 'Teen' THEN 'Teen+'
            WHEN content_rating = 'Everyone' THEN 'Everyone'
            WHEN content_rating = 'Adults Only 18+' THEN 'Adults Only'
            WHEN content_rating = 'Mature 17+' THEN 'Adults Only'
            WHEN content_rating = 'Unrated' THEN 'NULL'
            END AS grouped_content_rating
    FROM app_store_apps
    JOIN play_store_apps
    USING(name)
    GROUP BY grouped_content_rating
    ORDER BY grouped_content_rating DESC;
    
SELECT a.content_rating, p.content_rating, COUNT (DISTINCT a.content_rating), COUNT (DISTINCT p.content_rating)
FROM app_store_apps AS a
JOIN play_store_apps AS p
USING(name)
GROUP BY a.content_rating, p.content_rating; 