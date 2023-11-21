/*
Write a SQL statement that returns the name and occupation of all people who
have more than 3 friends. Results should be ordered by name (A-Z). 
*/

SELECT
    name, occupation
FROM
    people_main
LEFT JOIN 
    people_friends
ON
    people_main.ID = people_friends.ID2
GROUP BY  name
HAVING 
     count(DISTINCT ID1)  > 3  
ORDER BY name ASC        
 
