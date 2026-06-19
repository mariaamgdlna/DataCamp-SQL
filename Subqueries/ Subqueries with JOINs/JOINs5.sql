-- Declare the home CTE
WITH home AS (
    SELECT m.id, t.team_long_name AS hometeam
    FROM match AS m
    LEFT JOIN team AS t
    ON m.hometeam_id = t.team_api_id
)

SELECT *
FROM home;
