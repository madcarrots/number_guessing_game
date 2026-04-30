#! /bin/bash

# generate random number
GENERATED_NUMBER=$(( (RANDOM % 1001) + 1 ))
echo $GENERATED_NUMBER

echo -e '\nEnter your username:'
read USER

# convert username to all caps
USERNAME=$(echo $USER | tr [:lower:] [:upper:])


# Use converted username as WHERE

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
# If WHERE not found

# Add WHERE to database

echo $USERNAME