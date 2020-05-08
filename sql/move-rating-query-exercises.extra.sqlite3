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
