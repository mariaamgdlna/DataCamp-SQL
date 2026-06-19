SELECT
    m.date,
    -- Get the home team name and away team name from the subqueries
    home.hometeam_name,
    away.awayteam_name,
    m.home_goal,
    m.away_goal
FROM match AS m

LEFT JOIN (
    SELECT match.id, team.team_long_name AS hometeam_name
    FROM match
    LEFT JOIN team
    ON match.hometeam_id = team.team_api_id
) AS home
ON home.id = m.id

LEFT JOIN (
    SELECT match.id, team.team_long_name AS awayteam_name
    FROM match
    LEFT JOIN team
    -- Get the away team ID in the subquery
    ON match.awayteam_id = team.team_api_id
) AS away
ON away.id = m.id;
