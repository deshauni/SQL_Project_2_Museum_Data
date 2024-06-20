
create database sqlproject2;
use sqlproject2;
-- show tables
select * from Museum;
select * from museum_hours;
select * from artist;
select * from work;





-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

select A.full_name, M.name , M.country
from artist as A
inner join 
work as W
on 
A.artist_id = W.artist_id
inner join 
Museum as M 
on 
M.museum_id = W.museum_id;


-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.
  select A.full_name, W.name, count(W.artist_id) as countstylework from 
  artist as A
  inner join
  work as W
  on A.artist_id=W.artist_id
  group by
  A.full_name, W.name, W.artist_id
  order by countstylework desc;

-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.
         select M.name, count(W.name)as worknumber
         from 
         Museum as M
         inner join
         Work as W
         on
         M.museum_id = W.museum_id
         group by
         M.name
         order by 
         worknumber desc
         limit 5;
         




-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.
 select M.name, W.name, W.style from 
 Museum as M
 inner join
 Work as W
 on M.museum_id=W.museum_id
 order by M.name
 limit 10;




-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.





-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.
  select A.full_name,  W.artist_id,count(W.name) as worknumber from 
  artist as A
  inner join
  work as W
  on A.artist_id=W.artist_id
  group by 
  A.full_name, W.artist_id
  having
  count(W.name)>3
  order by 
  worknumber desc;

  



-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 




-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.





-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.



-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.
select CONCAT(a.first_name, ' ', a.last_name, ', ', a.nationality) AS artist_info, count(W.name) as workcount from
artist as A
inner join
work as W
on
A.artist_id=W.artist_id
group by 
A.first_name,A.last_name,A.artist_id,A.nationality
order by 
workcount desc;




