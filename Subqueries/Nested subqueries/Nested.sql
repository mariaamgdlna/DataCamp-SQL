SELECT 
    season,
    MAX(home_goal + away_goal) AS max_goals,
    (
        SELECT MAX(home_goal + away_goal)
        FROM match
        WHERE season = main.season
          AND country_id IN (
              SELECT country_id
              FROM league
              WHERE name = 'England Premier League'
          )
    ) AS pl_max_goals
FROM match AS main
GROUP BY season;
