/*
Write a SQL statement that returns the distinct name and age 
of all people who are liked by anyone younger than them.

Results should be ordered by name (A-Z)
*/

SELECT
DISTINCT A.name, A.age
FROM 
    people_main A
LEFT JOIN  
    people_likes 
ON 
    A.ID = people_likes.ID2
LEFT JOIN 
    people_main B
ON
    B.ID = people_likes.ID1
WHERE
    A.age >= B.age            
ORDER BY A.name ASC    
