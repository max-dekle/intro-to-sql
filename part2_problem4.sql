/*
Write a SQL query that returns the original_title, vote_average and review of every movie. 
The reviews depends on the vote_average as described described in the scores table. 

For example, movies with a vote average between 2 and 3.9 (inclusive) are reviewed as 'poor', 
whereas movies with a vote average between 9 and 10 (inclusive) are reviewed as 'excellent'. 
 
If a movie is reviewed as 'awful' or 'poor' then original_title should read 'do not watch'.

Results should be ordered by id (ascending). 
For example, the output should have the following format:

 'Snow White'   | 8.7 | 'great'
 'Toy Story'    | 9.3 | 'must see'
 'do not watch' | 2.3 | 'poor'

Keywords(s): Look into the BETWEEN statement and how it can be used in a JOIN.
Hint: Do not modify the current database by using UPDATE.
Take a look at the CASE operation example from the lab.
*/

SELECT  CASE
        WHEN review = 'awful' then 'do not watch'
        WHEN review = 'poor'  then 'do not watch'
        ELSE original_title 
        END AS 
            original_title,
            vote_average, 
            CASE
            WHEN vote_average BETWEEN min_score AND max_score THEN review
            ELSE NULL
            END AS 
            recommendation

FROM movies LEFT JOIN scores
ON vote_average BETWEEN min_score AND max_score
ORDER BY id ASC;

