/* 
Write a SQL statement that returns the name and number of 
people that like each person.

Results should be ordered by count (descending), 
and then by name (A-Z)
*/

SELECT 
    name, COUNT(DISTINCT ID1) as number_of_likes
FROM 
    people_main
LEFT JOIN  
    people_likes       
ON 
    people_main.ID = people_likes.ID2
GROUP BY name 
ORDER BY number_of_likes DESC, name ASC
