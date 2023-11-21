/*
Write a SQL query to find the original_title, budget and release_date of 
the movie "John Carter" and append to that the movie original_title, 
budget and release_date of the movie that was released 9 days after "John Carter".
You can add days to a particular day by using the date function. 

For example, in order to add 3 days to to '2012-07-16', you can use date('2012-07-16', '+3 days')
Keyword(s): The UNION statement should come in handy.
*/

WITH subquery AS (
SELECT
  original_title, budget, release_date
FROM
  movies
WHERE 
  original_title = 'John Carter' )

SELECT *
FROM
    subquery
UNION
SELECT
M.original_title, M.budget, M.release_date
FROM 
movies M , subquery 
WHERE
M.release_date = date(subquery.release_date, '+9 days');

