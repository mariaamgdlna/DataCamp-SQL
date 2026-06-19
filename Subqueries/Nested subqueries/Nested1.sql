SELECT
    country_id,
    season,
    id
FROM match
WHERE home_goal >= 5
   OR away_goal >= 5;
