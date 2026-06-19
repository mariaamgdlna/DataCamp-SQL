WITH match_list AS (
    SELECT 
        country_id,
        (home_goal + away_goal) AS goals
    FROM match
  
    WHERE id IN (
        SELECT id
        FROM match
        WHERE season = '2013/2014'
          AND EXTRACT(MONTH FROM date) = 8
    )
)

SELECT 
    l.name,
    AVG(goals)
FROM league AS l

LEFT JOIN match_list
ON l.id = match_list.country_id

GROUP BY l.name;
