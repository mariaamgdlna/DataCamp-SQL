SELECT
    date,
    away_goal,

    SUM(away_goal) OVER(
        ORDER BY date DESC
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS running_total,
    AVG(away_goal) OVER(
        ORDER BY date DESC
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS running_avg
FROM match
WHERE
    awayteam_id = 9908
    AND season = '2011/2012';
