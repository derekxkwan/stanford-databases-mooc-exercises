-- q1
select distinct name
from reviewer join rating using (rID) join movie using (mID)
where title="Gone with the Wind";

-- q2
select distinct name, title, stars
from reviewer join rating using (rID) join movie using (mID)
where name like director

-- q3
select name as n
from reviewer
union all
select title as n
from movie
order by n;

-- q4
select distinct title
from movie
where mID not in 
(select distinct mID
 from rating join reviewer using (rID)
 where name = "Chris Jackson")
 
 
 -- q5
select distinct r1.name, r2.name
from (rating join reviewer using (rID)) r1, (rating join reviewer using (rID)) r2
where r1.mID = r2.mID and r1.rID <> r2.rID and r1.name < r2.name
order by r1.name;	

-- q6
select distinct name, title, stars
from reviewer join rating using (rID) join movie using (mID)
where stars in (select min(stars) from rating);

-- q7
select title, avg(stars)
from rating join movie using (mID)
group by mID
order by avg(stars) desc, title;


-- q8
select name
from reviewer
where rID in
(select distinct r1.rID
from rating r1, rating r2, rating r3
 where (
	 (r1.ratingDate <> r2.ratingDate and r2.ratingDate <> r3.ratingDate and r1.ratingDate <> r3.ratingDate)
 or (r1.ratingDate is null and r2.ratingDate <> r3.ratingDate)
	 )
	 and 
 (r1.rID = r2.rID and r2.rID = r3.rID and r1.rID = r3.rID)
 )
 
 -- q9 not using count
select title, director
from movie
where title in
(select distinct m1.title
 from movie m1, movie m2
 where (m1.title <> m2.title) and (m1.director = m2.director)
 )
 order by director, title
 
-- q9 using count 
select title, director
from movie
where director in
(select director
from movie
group by director
having count(title) > 1)
order by director, title

-- q10
select title, max(a)
from
(
select mID, avg(stars) as a 
from rating
group by mID
) join movie using (mID);

-- q11
select title, avg(stars)
from movie join rating using (mID)
group by mID
having avg(stars) =
(select min(a) from
(
select avg(stars) as a
from rating
group by mID
));



