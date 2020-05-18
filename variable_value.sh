#!/bin/bash
x=45
y=25
a=23
b=67
<<comment
echo "The value of x is: $x"
echo "The value of y is: $y"
echo "The value of a is: $a"
echo "The value of b is: $b"
comment
echo -e "The value of x is: $x \nThe value of y is: $y \nThe value of a is: $a \nThe value of b is: $b"
