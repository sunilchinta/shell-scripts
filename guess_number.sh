#!/bin/bash

system_generated=$RANDOM
chance_count=1
for (( ; ; ))
do
  read -p "Enter the number of your $chance_count choice: " user_choice
  if [ $user_choice -eq $system_generated ]
  then
    echo "Your guess is correct"
    echo "Number of attempts to guess the correct answer is: $chance_count"
    break
  else
    echo "Your Guess is Wrong"
    if [ $user_choice -ge $system_generated ]
    then
       echo "Please enter a number lesser than $user_choice"
    else
       echo "Please enter a numner grater than $user_choice"
    fi
  fi
  chance_count=$((chance_count+1))
done
