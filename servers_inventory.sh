#!/bin/bash

print_header()
{
 printf "#%0.s" $(seq 1 $(tput cols))
 printf "\n"
}

Align_center_msg()
{
 msg=$1
 Total_col=$(tput cols)
 msg_len=$(echo ${#1})
 spaces_b4_after_msg=$(($((Total_col-msg_len))/2))
 
 print_header
 printf " %0.s" $(seq 1 $spaces_b4_after_msg)
 printf "%s" "$1"
 printf "\n"
 print_header
}
check_secretkey()
 {
  if [ ! -e "secret_key" ]
  then
    Align_center_msg "Please save your password in >>secret_key<< file and retry"
    exit 1
  fi
 }

check_username()
 {
  if [ ! -e "username" ]
  then
    Align_center_msg "Please save your username in >>username<< file and retry"
    exit 2
  fi
 }

check_ServersList()
 {
  if [ ! -e "servers_list" ]
  then
    Align_center_msg "Please save list of servers in >>servers_list<< file and retry"
    exit 3
  fi
 }
Align_center_msg "Executing Inventory script"
check_secretkey
check_username
check_ServersList
#Align_center_msg "Thank you Executing this script"
ssh_cmd="sshpass -f secret_key ssh -n -o StrictHostKeyChecking=No -o PubkeyAuthentication=No root"

echo "FQDN,Server_IP,OS_TYPE,OS_VERSION,CPU_INFO,ARCH_TYPE" > Servers_inventory.csv
while read server
do
 echo "Currently working on server with IP: $server"
 OS_TYPE=$($ssh_cmd@$server "cat /etc/os-release" | grep -w "NAME" | awk -F "NAME=" '{print $2}' | tr '"' " "
)
 echo "$OS_TYPE" | grep -i "ubuntu" 1>/dev/null 2>&1
 if [ $? -eq 0 ]
 then
  OS_VERSION=$($ssh_cmd@$server "cat /etc/os-release"| grep "VERSION_ID" | awk -F "VERSION_ID=" '{print $2}')
 else
  OS_VERSION=$($ssh_cmd@$server "cat /etc/redhat-release"| awk -F "release" '{print $2}' | awk '{print $1}')
 fi
 FQDN=$(hostname -f)
 CPU_INFO=$(cat /proc/cpuinfo | awk 'NR==5 {print $4" "$5" "$6" "$7" "$8" "$9" "$10}')
 ARCH_TYPE=$(uname -p)
 echo "FQDN=$FQDN"
 echo "OS_TYPE=$OS_TYPE"
 echo "OS_VERSION=${OS_VERSION}"
 echo "CPU_INFO= ${CPU_INFO}"
 echo "ARCH_TYPE= ${ARCH_TYPE}"
 printf "\n"
 echo "$FQDN,$server,$OS_TYPE,$OS_VERSION,$CPU_INFO,$ARCH_TYPE" >> Servers_inventory.csv
done<servers_list

Align_center_msg "Thank you for Executing this script"
