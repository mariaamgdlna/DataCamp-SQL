SELECT 
    -- Select the stage and average goals from the subquery
    s.stage,
    ROUND(s.avg_goals, 2) AS avg_goals
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
