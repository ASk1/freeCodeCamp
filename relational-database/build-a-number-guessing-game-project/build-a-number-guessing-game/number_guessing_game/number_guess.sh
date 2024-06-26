#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only  -c"
RANDOM_NUMBER=$((1 + RANDOM % 1000))
echo -e "\nEnter your username:"
read USER_NAME
USER_NAME_VERIFY=$(echo -n $USER_NAME|wc -c)
if [[ $USER_NAME_VERIFY -gt 22 ]]
then
  echo -e "too many characters"
  exit;
fi
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE name='$USER_NAME'")
if [[ -z $USER_DATA ]]
then
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
  USER_ADD_RESULT=$($PSQL "INSERT INTO users(name) VALUES ('$USER_NAME')")
else
  echo "$USER_DATA" | while read GAMES_PLAYED BAR BEST_GAME
  do
    echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
echo -e "\nGuess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0
while [[ 1 ]]
do
  read GUESS
  ((NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1))  
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    continue;
  fi
  if [[ $GUESS -lt $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  elif [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
  else
    UPDATE_RESUT=$($PSQL "
      UPDATE users 
      SET 
        games_played=games_played+1,
        best_game=
          CASE
            WHEN best_game=0 THEN $NUMBER_OF_GUESSES
            WHEN $NUMBER_OF_GUESSES<best_game THEN $NUMBER_OF_GUESSES 
            ELSE best_game 
          END 
      WHERE name='$USER_NAME'
    ")
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $GUESS. Nice job!"
    break;
  fi
done

