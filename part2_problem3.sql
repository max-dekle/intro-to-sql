/*
Write a SQL query to select the original_title of all movies and a column 
where there is a 1 if there exists another movie that has the same vote average 
and the same runtime as that movie, and a 0 otherwise. Results should be 
ordered by original_title (A-Z).

Keyword(s): You may want to look into the EXISTS operator.
Hint: Think about possible edge cases.
*/

SELECT original_title,

EXISTS ( 
SELECT * FROM movies a
WHERE 
    a.runtime = b.runtime 
    AND 
    a.vote_average = b.vote_average
    AND
    a.id != b.id 
)
FROM movies b

ORDER BY original_title ASC;


