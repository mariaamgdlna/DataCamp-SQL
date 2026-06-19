SELECT 
    s.stage,
    ROUND(s.avg_goals, 2) AS avg_goal,

    (
        SELECT AVG(home_goal + away_goal)
        FROM match
        WHERE season = '2012/2013'
    ) AS overall_avg

FROM 
    (
        SELECT
            stage,
            AVG(home_goal + away_goal) AS avg_goals
        FROM match
        WHERE season = '2012/2013'
        GROUP BY stage
    ) AS s

WHERE
    s.avg_goals >
    (
        SELECT AVG(home_goal + away_goal)
        FROM match
        WHERE season = '2012/2013'
    );
