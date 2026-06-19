SELECT
    date,
    season,
    home_goal,
    away_goal,
    CASE
        WHEN hometeam_id = 8673 THEN 'home'
        ELSE 'away'
    END AS warsaw_location,
    -- Calculate separately the average home and away goals scored, partitioned by season
    AVG(home_goal) OVER(PARTITION BY season) AS season_homeavg,
    AVG(away_goal) OVER(PARTITION BY season) AS season_awayavg
FROM match
WHERE
    hometeam_id = 8673
    OR awayteam_id = 8673
ORDER BY (home_goal + away_goal) DESC;
