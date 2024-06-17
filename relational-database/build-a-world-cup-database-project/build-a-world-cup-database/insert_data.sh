#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != year ]]
  then
    # get winner team_id
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")

    # if not found
    if [[ -z $winner_id ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$winner')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $winner
      fi
      
      # get new team_id
      winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")

    fi

    # get opponent team_id
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")

    # if not found
    if [[ -z $opponent_id ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$opponent')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $opponent
      fi
      
      # get new team_id
      opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")

    fi

    # get game_id
    game_id=$($PSQL "SELECT game_id FROM games WHERE year=$year AND round='$round' AND winner_id=$winner_id AND opponent_id=$opponent_id")

    # if not found
    if [[ -z $game_id ]]
    then    
    
      # insert game
      INSERT_GAME_RESULT=$($PSQL "
        INSERT INTO games(
          year,
          round,
          winner_id,
          opponent_id,
          winner_goals,
          opponent_goals
        ) VALUES (
          $year,
          '$round',
          $winner_id,
          $opponent_id,
          $winner_goals,
          $opponent_goals          
        )
      ")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into games, $year, $round, $winner, $opponent
      fi      

    fi

  fi
done