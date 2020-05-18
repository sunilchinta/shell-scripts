#!/bin/bash
Server_Name=$(uname -n)
IP_Address=$(ifconfig | grep inet | awk 'NR==2 {print $2}')
OS_Type=$(uname)
Up_time=$(uptime | uptime | awk '{print $3 $4 $5}')

#Creating Headers For CSV File
echo "s_No,Server_Name,IP_Address,OS_Type,Up_time" > inventory_info.csv
echo "1,$Server_Name,$IP_Address,$OS_Type,$Up_time" >> inventory_info.csv

