# Write your MySQL query statement below
WITH FirstLogin AS (
    SELECT 
        player_id,
        MIN(event_date) AS firstLoginDate
    FROM 
        Activity
    GROUP BY 
        player_id
),
NextDayLogin AS (
    SELECT 
        a.player_id
    FROM 
        Activity a
    JOIN 
        FirstLogin fl ON a.player_id = fl.player_id 
                      AND a.event_date = DATE_ADD(fl.firstLoginDate, INTERVAL 1 DAY)
)
SELECT 
    ROUND(COUNT(DISTINCT NextDayLogin.player_id) / COUNT(DISTINCT FirstLogin.player_id), 2) AS fraction
FROM 
    FirstLogin
LEFT JOIN 
    NextDayLogin ON FirstLogin.player_id = NextDayLogin.player_id
ORDER BY
    fraction;
