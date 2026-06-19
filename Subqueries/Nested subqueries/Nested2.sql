SELECT
    country_id,
    season,
    COUNT(id) AS matches

FROM (
    SELECT
        country_id,
        season,
        id
    FROM match
    WHERE home_goal >= 5 OR away_goal >= 5
) AS subquery
GROUP BY country_id, season;
