-- Write a solution to find all the authors that viewed at least one of their own articles.

select DISTINCT author_id  as id
from Views
where author_id = viewer_id