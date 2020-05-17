-- q1
-- Find the names of all students who are friends with someone named Gabriel. 
select name
from highschooler, friend
where id1 = id and id2 in
(select id from
highschooler
where name = "Gabriel");

-- q2
-- For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like. 
select h1.name, h1.grade, h2.name, h2.grade
from highschooler h1, highschooler h2, likes
where h1.id = id1 and h2.id = id2 and h1.grade>= (h2.grade + 2);

-- q3
For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order. 
select h1.name, h1.grade, h2.name, h2.grade
from highschooler h1, highschooler h2, likes l1, likes l2
where h1.id = l1.id1 and h2.id = l1.id2 and l1.id1 = l2.id2 and l1.id2 = l2.id1
and h1.name < h2.name;

-- q4
Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade. 
select name, grade
from highschooler
where id not in (select id1 from likes union select id2 from likes)
order by grade, name;

-- q5
-- For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. 
select distinct h1.name, h1.grade, h2.name, h2.grade
from highschooler h1, highschooler h2, likes
where h1.id = id1 and h2.id = id2 and h2.id not in (select id1 from likes);
