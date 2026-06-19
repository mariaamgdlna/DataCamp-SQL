SELECT 
    main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE 
    (home_goal + away_goal) = 
        (
            SELECT MAX(sub.home_goal + sub.away_goal)
            FROM match AS sub
            WHERE main.country_id = sub.country_id
              AND main.season = sub.season
        );
