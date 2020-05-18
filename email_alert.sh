#!/bin/bash
TO="sunilbabu.chinta@broadcom.com"
free_ram_memory=$(free -mt | grep Total: | awk '{print $4}')

if [ $free_ram_memory -le 3000 ]
then
   echo "The RAM free memory is less than 3000 MB"
   echo "Subject:warning, RAM is running out of memory"|sendmail $TO
fi
