CREATE DATABASE IF NOT EXISTS ipl
USE ipl

SHOW tables

SELECT * FROM `clean batting data`

-- Which are the top 10 players with the highest total runs scored?--
SELECT player_name,runs,
DENSE_RANK() OVER (ORDER BY runs DESC) AS RANKING
FROM `clean batting data`
LIMIT 10

-- Which players have the best batting average (minimum 5 innings played)?--
SELECT player_name,MAX(average) AS Maximum_Average
FROM `clean batting data`
WHERE no_of_innings>=5
GROUP BY player_name
ORDER BY Maximum_Average DESC
LIMIT 1

-- Which players have the highest strike rate (minimum 100 balls faced)?--
SELECT player_name,MAX(strikerate) AS HIGHEST_STRIKERATE
FROM `clean batting data`
WHERE no_of_ballsfaced>=100
GROUP BY player_name
ORDER BY HIGHEST_STRIKERATE DESC
LIMIT 1

-- Which players scored the most centuries in the season? --
SELECT player_name,MAX(no_of_century) AS NO_OF_CENTURY
FROM `clean batting data`
WHERE NO_OF_CENTURY >=1
GROUP BY player_name
ORDER BY NO_OF_CENTURY DESC

-- Which players scored the most half-centuries?--
SELECT player_name,MAX(no_of_halfcentury) AS HIGHEST_HALFCENTURY
FROM `clean batting data`
GROUP BY player_name
ORDER BY HIGHEST_HALFCENTURY DESC
LIMIT 1

-- Which are the top 10 players with the highest boundary runs? --
SELECT player_name,boundary_runs,
DENSE_RANK() OVER (ORDER BY boundary_runs DESC) AS SCORE_BY_BOUNDARY
FROM `clean batting data`
LIMIT 10

-- Which players have the highest boundary percentage?--
SELECT player_name,(boundary_percentage) AS BOUNDARY_PERCENTAGE
FROM `clean batting data`
ORDER BY BOUNDARY_PERCENTAGE DESC
LIMIT 1


-- Which team has scored the highest total runs from all players combined?--
SELECT team,SUM(runs) AS TOTAL_RUNS_PER_TEAM
FROM `clean batting data`
GROUP BY team
ORDER BY TOTAL_RUNS_PER_TEAM DESC

-- Which team has hit the most sixes in the season? --
SELECT team,SUM(no_of_sixes) AS TOTAL_SIXES,
DENSE_RANK() OVER (ORDER BY SUM(no_of_sixes) DESC) AS TEAM_RANK
FROM `clean batting data`
GROUP BY team

-- Which players have the best runs per match ratio?--
SELECT player_name,runs_per_match
FROM `clean batting data`
ORDER BY runs_per_match DESC 
LIMIT 1

-- Which players remained not out the most number of times?--
SELECT player_name,no_of_time_notout
FROM `clean batting data`
ORDER BY no_of_time_notout DESC 
LIMIT 1

-- Which players have the highest highest_score in the dataset?--
SELECT player_name,
MAX(CAST(REPLACE(highest_score,'*','') AS UNSIGNED)) AS HIGH_SCORE
FROM `clean batting data`
GROUP BY player_name
ORDER BY HIGH_SCORE DESC
LIMIT 1;
