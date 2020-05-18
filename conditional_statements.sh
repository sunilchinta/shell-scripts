#!/bin/bash
#Script to start/stop a service

read -p "Enter start/status to perform action on a service: " action

if [ "${action}" == "start" ]
then
   echo "Starting the service...."
   sudo systemctl start nfs
   echo "Started the service...."
fi


if [ "${action}" == "status" ]
then
   echo "Status of the service...."
   sudo systemctl status nfs
   echo "Status of the service is displayed...."
fi
