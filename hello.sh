#!/bin/bash
echo "Welcome, my boy"
echo "Well done"

echo "Execute ls command using echo"
echo "========With Double Quotes====================="
echo "$(ls)"
echo "========With Single Quotes====================="
echo '$(ls)'
echo "========Without Any Quotes====================="
echo $(ls)
echo "==============================================="
