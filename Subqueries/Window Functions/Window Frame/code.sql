SELECT 
    date,
    home_goal,
    away_goal,

    SUM(home_goal) OVER(
        ORDER BY date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
    AVG(home_goal) OVER(
        ORDER BY date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_avg
FROM match
WHERE 
    hometeam_id = 9908
    AND season = '2011/2012';
