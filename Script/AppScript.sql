
--Show all tables

Select * 
from app_store_apps

Select *
from play_store_apps






-----------------------------------------------------------------

--- This table shows the name, review count for both apple and play store, rating for both, total review counts, genre and primary genre.


SELECT DISTINCT(a.name), --drew distrinct names
CAST(a.review_count AS int) AS a_review_count, --converts review count to int and aliased
p.review_count as p_review_count, --got the max review count and aliased
cast(a.review_count as int) + p.review_count AS total_review_counts, -- added and cast review count as integer b/c its a text in app store, + review counts from play store as alias, 
a.rating AS a_rating, -- rating from apple
p.rating AS p_rating, --rating from play store
p.genres, --genres from play
a.primary_genre, -- genres from apple
cast(a.price as money) -- cast price from apple as money to show dollar amount
FROM app_store_apps AS a --aliased apple table
INNER JOIN play_store_apps AS p -- used inner joined play to collect only same collums 
ON a.name = p.name -- matched on name from both
WHERE a.price <= 1 AND a.rating >= 4.5 AND p.rating >= 4.5 -- filterd by price equal and less than 1 and where rating greated and equal to 4.5
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres,a.price, p.review_count
ORDER BY total_review_counts DESC --orded by total review in desc order
Limit 10; --top 10

-- above is giving me duplicates, i need to group the names and get the totals



--So far this is the closet i have gotten to the right top 10


SELECT DISTINCT(a.name), --drew distrinct names
CAST(a.review_count AS int) AS a_review_count, --converts review count to int and aliased
sum(p.review_count) AS p_review_count, --got the max review count and aliased
sum(cast(a.review_count as int) + p.review_count) AS total_review_counts, -- added and cast review count as integer b/c its a text in app store, + review counts from play store as alias,
a.rating AS a_rating, -- rating from apple
p.rating AS p_rating, --rating from play store
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

-- im on the right track but the apple review count plus the play store review count dont equal the total.


--below i was able to group and get the total review count for play store

Select Distinct(name),
Sum(review_count) AS p_max_review_count
from play_store_apps
group by name
order by p_max_review_count DESC

--Below i was able to get the total review count for app store

select Distinct(name),
CAST(review_count AS int) AS a_review_count
from app_store_apps
group by name, a_review_count
order by a_review_count DESC

-- im going to work on subqury these two
-- I wasnt able to add the two subquries, may be better to CTS them

-- THis one was written by Drew, genres by count

SELECT count(a.name), p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY a.name,p.genres
ORDER BY count DESC;


-- this one i edit to make distinct name groups and total count

SELECT count(a.name) as count, p.genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
GROUP BY p.genres
ORDER BY count DESC
Limit 10;

-- File size for the top 10 and how it relates to download count

-- here i was able to remove the M from the number, working on then convert
Select name,
REPLACE(size, 'M', '') as Size_MB
from play_store_apps


Select name,
 (select (cast(size_bytes as int) / 1000000)
from app_store_apps) as size_mb
from app_store_apps




-- This is my final Top 10


SELECT DISTINCT(a.name), --drew distrinct names
CAST(a.review_count AS int) AS a_review_count, --converts review count to int and aliased
sum(p.review_count) AS p_review_count, --got the max review count and aliased
sum(cast(a.review_count as int) + p.review_count) AS total_review_counts, -- added and cast review count as integer b/c its a text in app store, + review counts from play store as alias,
a.rating AS a_rating, -- rating from apple
p.rating AS p_rating, --rating from play store
p.genres, --genres from play
a.primary_genre, -- genres from apple
cast(a.price as money) -- cast price from apple as money to show dollar amount
FROM app_store_apps AS a --aliased apple table
INNER JOIN play_store_apps AS p -- used inner joined play to collect only same collums
ON a.name = p.name -- matched on name from both
WHERE a.price <= 1 AND a.rating >= 4.5 AND p.rating >= 4.5 -- filterd by price equal and less than 1 and where rating greated and equal to 4.5
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres,a.price
ORDER BY total_review_counts DESC --orded by total review in desc order
Limit 10--top 10





























