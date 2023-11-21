/*
 Write a SQL statement that returns the two occupations that have the 
 lowest count of popular people. Consider popular people as people who are 
 liked by at least one other person. 
 
 Return the two occupations and the counts. 
 Results should be ordered by occupation (A-Z).
*/

SELECT 
    DISTINCT occupation, COUNT(DISTINCT ID2) as liked_count
FROM 
    people_main
 JOIN  
    people_likes    
ON 
    people_main.ID = people_likes.ID2
GROUP BY occupation     
ORDER BY liked_count ASC, occupation ASC
LIMIT 0,2

