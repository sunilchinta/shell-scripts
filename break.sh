#!/bin/bash

i=1
while true
do
 echo "$i"
 if [ $i -eq 30 ]
  then
    break
  fi
 i=$((i+1))
done

