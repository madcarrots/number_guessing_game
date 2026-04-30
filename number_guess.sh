#! /bin/bash

#connection information
PSQL="psql --username=freecodecamp --dbname=number_guess -t -A -F '|'"

# generate random number
GENERATED_NUMBER=$(( (RANDOM % 1001) + 1 ))
echo $GENERATED_NUMBER

echo -e '\nEnter your username:'
read USER

# convert username to all caps
USERNAME=$(echo $USER | tr [:lower:] [:upper:])

# Use converted username as WHERE
WHERE="username = '$USERNAME'"

# Create query 
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

# If nothing was returned, then the user doesn't exist
if [ -z "$GAME_INFO" ]; then
  echo "I could not find you in the database."
fi

# Add WHERE to database

echo $USERNAME