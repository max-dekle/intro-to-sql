/*
Write a SQL query that finds the original_title, release_date and revenue 
of all the movies whose revenue exceeded the average revenue of all the movies 
released on the same day (including itself). 

Results should be ordered by release_date (ascending), and then revenue (descending).
Keywords(s): You'll find the GROUP BY, AVG, and JOIN operations helpful!
*/

WITH subquery AS (
    SELECT release_date, AVG(revenue) as day_avg
    FROM movies
    GROUP BY release_date 
)

SELECT m.original_title, m.release_date, m.revenue
FROM
     movies m 
LEFT JOIN subquery
ON  
    m.release_date = subquery.release_date
WHERE 
    m.revenue > day_avg
ORDER BY m.release_date ASC, m.revenue DESC;
