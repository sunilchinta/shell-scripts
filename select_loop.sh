#!/bin/bash

select opt in Addition Subtraction Multiplication Division Exit
do
  case $opt in
  Addition)
       read -p "Enter num1: " num1
       read -p "Enter num2: " num2
       echo "The addition of $num1 and $num2 is: $((num1+num2))"
       ;;
    Subtraction)
       read -p "Enter num1: " num1
       read -p "Enter num2: " num2
       echo "The subtraction of $num1 and $num2 is: $((num1-num2))"
       ;;
    Multiplication)
       read -p "Enter num1: " num1
       read -p "Enter num2: " num2
       echo "The Multiplication of $num1 and $num2 is: $((num1*num2))"
       ;;
    
    Division)
       echo "The Division option is selected"
       ;;
    Exit)
       echo "Thank you for using the select loop for calculations"
       exit 0
       ;;
    *)
       echo "Invalid Option"
       ;;
    Exit)
       echo "Thank you for using the select loop for calculations"
       exit 0
       ;;
    esac

done
