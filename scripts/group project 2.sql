-- app store
select review_count, name, rating from app_store_apps where rating > 4.75;
-- play
select review_count, name, rating from play_store_apps where rating > 4.75;
select review_count, name, rating from app_store_apps where review_count > 10000;

