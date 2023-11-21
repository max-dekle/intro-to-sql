/*
Write a SQL statement to find pairs (A, B) such that 
person A likes person B, but A is not friends with B.

The query should return 4 columns: ID of person 1,
name of person 1, ID of person 2 and name of person 2. 
Results should be ordered by ID1 (ascending), 
then ID2 (ascending).
*/

SELECT
    A.ID, A.name, B.ID,B.name
FROM 
    people_likes 
LEFT JOIN
    people_main A  
ON 
    A.ID =  people_likes.ID1   
LEFT JOIN 
    people_main B
ON  B.ID =  people_likes.ID2     
WHERE (A.ID,B.ID) NOT IN people_friends
ORDER BY A.ID ASC, B.ID ASC

