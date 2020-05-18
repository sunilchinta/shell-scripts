#!/bin/bash
#read -p "Enter num1: " a
#read -p "Enter num2: " b
cli_args=$#
if [ $cli_args -eq 2 ]
then
 a=$1
 b=$2
 result=`expr "$a + $b" | bc `
 echo "The sum of $a and $b is: $result"
fi
