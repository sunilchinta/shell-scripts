#!/bin/bash

service_docker=docker
read -p "Enter the service name that you want to check status for: " service_name

if [ $service_name -eq $service_docker ]
then
 status=$(systemctl status $service_name | awk 'NR==5 { print $2}')
 echo -e "The current status of $service_name service is: \033[92m$status\033[0m"
else
 status=$(systemctl status $service_name | awk 'NR==3 { print $2}')
 echo -e "The current status of $service_name service is: \033[92m$status\033[0m"
fi
