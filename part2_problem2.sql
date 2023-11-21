/*
Write a SQL query to count the number of movies that start with "The", end with a "2" 
or contain the word "shark". Your query should be case insensitive and return one column 
with one entry. You should return a single value.

Keyword(s): You may want to look into CASE statements and the LIKE operator. (Lab!)
*/

WITH subquery AS (
SELECT 
    CASE 
        WHEN original_title LIKE 'The%' THEN 1
        WHEN original_title LIKE LOWER('The%') THEN 1
        WHEN original_title LIKE '%2' THEN 1
        WHEN original_title LIKE '%shark%' THEN 1
        WHEN original_title LIKE LOWER('%shark%') THEN 1
    ELSE 0  

    END AS  includes_parameters
    FROM 
        MOVIES
)

SELECT sum(includes_parameters) 
FROM 
    subquery;


