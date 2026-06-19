WITH match_list AS (
    SELECT 
        l.name AS league, 
        m.date, 
        m.home_goal, 
        m.away_goal,
        (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN league AS l
    ON m.country_id = l.id
)

SELECT
    league,
    date,
    home_goal,
    away_goal
FROM match_list

-- Filter by total goals
WHERE total_goals >= 10;
