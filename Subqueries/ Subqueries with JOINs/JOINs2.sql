SELECT
    m.date,
    (SELECT team_long_name
     FROM team AS t

     WHERE t.team_api_id = m.hometeam_id) AS hometeam
FROM match AS m;
