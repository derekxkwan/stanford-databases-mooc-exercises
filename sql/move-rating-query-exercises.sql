-- q1
select title from movie where lower(director) like "steven spielberg";

-- q2
select distinct movie.year
from movie, rating
where movie.mID = rating.mID
and rating.stars >= 4
order by movie.year asc;

-- q3
select title
from movie
where mID not in (select mID from rating);

-- q4
select r1.name
from reviewer r1, rating r2
where (r1.rID = r2.rID) and (r2.ratingDate is null);

-- q5
select name, title, stars, ratingDate
from reviewer join rating using (rID) join movie using (mID)
order by name, title, stars;

-- q6
select name, title
from (rating r1 join rating r2 using (rID)) join reviewer using (rID) join movie using (mID)
where r1.mID = r2.mID and r1.ratingDate < r2.ratingDate and r1.stars < r2.stars;
                                      
-- q7
select title, max(stars)
from movie join rating using (mID)
group by title
having count(*) > 1
order by title;
                                     
-- q8
select title, (max(stars) - min(stars))
from movie join rating using (mID)
group by title
order by (max(stars) - min(stars)) desc, title;
