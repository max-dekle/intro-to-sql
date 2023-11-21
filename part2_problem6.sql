/*
Write a SQL query that, for each original_language that has more than 2 movies, finds the number of movies 
that were reviewed as 'poor' and the number of movies that were reviewed as 'good'.

Like in the 4th question, you will need to look at the scores table to see what the review categories are 
and use the vote_average field of a movie to determine which review category it falls under. 
 
Your query should return 3 columns (original_language, num_poor which is the number of 'poor' movies for 
that language, and num_good which should be the number of 'good' movies for the language).

Your results should be ordered by number of 'good' movies (descending) and then number of 'poor' movies 
(ascending). Remember to only include languages that have more than 2 movies!

Keywords(s): The JOIN statement will come in handy!
Hint: Refer to the examples from the lab!
 */

WITH subquery AS (
    SELECT original_language, 
            CASE
                WHEN review = 'poor' THEN 1
                ELSE 0 END AS poor_count,
            CASE  
                WHEN review = 'good' THEN 1
                ELSE 0 END AS good_count
    FROM movies
    LEFT JOIN scores 
    ON vote_average BETWEEN min_score AND max_score
)

SELECT original_language, sum(poor_count), sum(good_count)
FROM subquery
GROUP BY original_language
HAVING count(original_language) > 2
ORDER BY sum(good_count) DESC, sum(poor_count) ASC;
