#!/bin/bash

for each in 2 4 6 8 10 12 14 16 18 20
do
 if [ $each -eq 8 ]
 then
   continue
 fi
 echo $each
done
