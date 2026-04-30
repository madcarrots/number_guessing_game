#!/bin/bash

# connection information 
PSQL="psql -q --username=freecodecamp --dbname=number_guess -t -A -F '|'"

# generate random number
GENERATED_NUMBER=$(( (RANDOM % 1001) + 1 ))
echo "$GENERATED_NUMBER"

echo -e 'Enter your username:'
read USER

# convert username to all caps
USERNAME=$(echo "$USER" | tr '[:lower:]' '[:upper:]')

# Use converted username as WHERE
WHERE="username = '$USERNAME'"

# Create SELECT query 
QUERY="
  SELECT
    username,
    number_of_guesses,
    secret_number,
    games_played,
    best_game
  FROM
    records
  WHERE $WHERE;  
"

# Run the query and capture the result
GAME_INFO=$($PSQL -c "$QUERY")

# If nothing was returned, the user doesn't exist 
if [ -z "$GAME_INFO" ]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  # Create INSERT statement
  INSERT_USERNAME_STATEMENT="
    INSERT INTO records(username, number_of_guesses, secret_number, games_played, best_game) 
    VALUES ('$USERNAME', 0, $GENERATED_NUMBER, 0, 1000000 );
  "

  # Run the INSERT 
  $PSQL -c "$INSERT_USERNAME_STATEMENT"

else
  # Parse the pipe-separated result into variables
  # variables match the order of the query items
  IFS='|' read -r USERNAME NUMBER_OF_GUESSES SECRET_NUMBER GAMES_PLAYED BEST_GAME <<< "$GAME_INFO"

  # Remove any single quotes
  USERNAME="${USERNAME//\'/}"
  NUMBER_OF_GUESSES="${NUMBER_OF_GUESSES//\'/}"
  SECRET_NUMBER="${SECRET_NUMBER//\'/}"
  GAMES_PLAYED="${GAMES_PLAYED//\'/}"
  BEST_GAME="${BEST_GAME//\'/}"

  # Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# The next line printed should be Guess the secret number between 1 and 1000: and input from the user should be read
echo "Guess the secret number between 1 and 1000:"

read GUESS

# Integer guesses only
while [[ ! $GUESS =~ ^[0-9]+$ ]]; do
  echo "That is not an integer, guess again:"
  read GUESS
done


  # While loop continues as long as GUESS does NOT equal SECRET_NUMBER
  while [ "$GUESS" -ne "$GENERATED_NUMBER" ]; do
    ((NUMBER_OF_GUESSES += 1))

    if [ "$GUESS" -gt "$GENERATED_NUMBER" ]; then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"    
    fi
    read GUESS
    while [[ ! $GUESS =~ ^[0-9]+$ ]]; do
      echo "That is not an integer, guess again:"
      read GUESS
    done
  done



# Increment number of guesses once more and games played once
((NUMBER_OF_GUESSES += 1))
((GAMES_PLAYED += 1))

if [ "$NUMBER_OF_GUESSES" -lt "$BEST_GAME" ]; then
  BEST_GAME=$NUMBER_OF_GUESSES
fi 

# update best guess, games_played, 
# Create INSERT statement
  UPDATE_SCORES_STATEMENT="
    UPDATE records
    SET games_played = $GAMES_PLAYED,
        best_game = $BEST_GAME
    WHERE $WHERE;
  "

# Run the UPDATE
  $PSQL -c "$UPDATE_SCORES_STATEMENT"

# Finale output
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $GENERATED_NUMBER. Nice job!"
    


