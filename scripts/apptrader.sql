--  2. Assumptions
-- Based on research completed prior to launching App Trader as a company, you can assume the following:  

-- a. App Trader will purchase apps for 10,000 times the price of the app. For apps that are priced from free up to $1.00, the purchase price is $10,000.  

-- b. Apps earn $5000 per month on average from in-app advertising and in-app purchases _regardless_ of the price of the app.  

-- c. App Trader will spend an average of $1000 per month to market an app _regardless_ of the price of the app. If App Trader owns rights to the app in both stores, it can market the app for both stores for a single cost of $1000 per month.  

-- d. For every half point that an app gains in rating, its projected lifespan increases by one year, in other words, an app with a rating of 0 can be expected to be in use for 1 year, an app with a rating of 1.0 can be expected to last 3 years, and an app with a rating of 4.0 can be expected to last 9 years. Ratings should be rounded to the nearest 0.5 to evaluate an app's likely longevity.  

-- e. App Trader would prefer to work with apps that are available in both the App Store and the Play Store since they can market both for the same $1000 per month.  10 APPS at least 

-- SELECT
--     a.name as aname,
--     a.rating, 
--     a.review_count, 
--     a.price,
--     p.name as pname,
--     p.rating, 
--     p.review_count, 
--     p.price
--  FROM app_store_apps as a
--  JOIN play_store_apps as p
--  on a.name=p.name
--CODE tim helped with 
SELECT
    DISTINCT(a.name) AS a_review_count,
    MAX(p.review_count) AS p_max_review_count,
    a.rating as a,
    p.rating,
    SUM(CAST(a.review_count AS int) - p.review_count) as a_total_review_count,
    p.genres, 
    a.primary_genre,
    cast(a.price as money) 
    FROM app_store_apps as a
   INNER JOIN play_store_apps as P
   on a.name=p.name
   WHERE a.price<=1 AND a.rating >- 4.5 AND p.rating >=4.5
   GROUP BY a.review_count, a.rating, p.rating, a.name, a.primary_genre, p.genres, a.price
   order by total_review_count DESC
   LIMIT 10
--MY code doesn run yet but need to push  
  SELECT
  a.primary_genre as a_genres,
  p.genres as p_genres,
  MAX(p.review_count) AS p_max_review_count,
  SUM(CAST(a.review_count AS int) - p.review_count) as a_total_review_count
  FROM app_store_apps as a
  INNER JOIN play_store_apps as p
  ON a.primary_genre=p.genres
  GROUP BY a.primary_genre, p_genres 




-- DREWS code     
-- SELECT count(a.name) as name, p.genres
-- FROM app_store_apps AS a
-- INNER JOIN play_store_apps AS p
-- ON a.name = p.name
-- GROUP BY p.genres
-- ORDER BY name DESC
-- Limit 10;


 


  


    
   
    
    

