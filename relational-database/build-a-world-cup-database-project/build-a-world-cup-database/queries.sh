#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals)+SUM(opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(AVG(winner_goals),2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT round(AVG(winner_goals)+AVG(opponent_goals),16) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT count(*) FROM games WHERE winner_goals>2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from games g inner join teams t on t.team_id= g.winner_id  where year= 2018 and round='Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select t.name from games g join teams t on t.team_id=g.winner_id where round='Eighth-Final' and year=2014 union select t.name from games g join teams t on t.team_id=g.opponent_id  where round='Eighth-Final' and year=2014 order by name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct t.name from games g join teams t on t.team_id=g.winner_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select g.year,  t.name from games g join teams t on t.team_id=g.winner_id group by g.year, t.name having count(*) =4 order by g.year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name like 'Co%' order by  name")"
