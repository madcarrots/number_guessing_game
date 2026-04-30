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
  echo "I could not find you in the database."

  # Create INSERT statement
  INSERT_USERNAME_STATEMENT="
    INSERT INTO records(username, number_of_guesses, secret_number, games_played, best_game) 
    VALUES ('$USERNAME', 0, $GENERATED_NUMBER, 0, 1000000 );
  "

  # Run the INSERT 
  $PSQL -c "$INSERT_USERNAME_STATEMENT"

  echo "Welcome, $USERNAME! It looks like this is your first time here." 
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

echo "$USERNAME"