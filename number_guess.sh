#! /bin/bash

# generate random number
GENERATED_NUMBER=$(( (RANDOM % 1001) + 1 ))
echo $GENERATED_NUMBER

echo -e '\nEnter your username:'
read USERNAME

echo $USERNAME