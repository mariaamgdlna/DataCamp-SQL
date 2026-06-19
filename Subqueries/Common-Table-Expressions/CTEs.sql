WITH match_list AS (
    SELECT 
        country_id, 
        id
    FROM match
    WHERE (home_goal + away_goal) >= 10
)
  
SELECT
    l.name AS league,
    COUNT(match_list.id) AS matches
FROM league AS l

-- Join the CTE to the league table using country_id
LEFT JOIN match_list
ON l.country_id = match_list.country_id

GROUP BY l.name;
