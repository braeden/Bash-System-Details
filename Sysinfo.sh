#!/bin/sh
name=$(uname -s)
version=$(uname -v)
hardware=$(uname -m)
release=$(uname -r)
mem=$(free -omt)
disk=$(df -lh | grep '/dev/')
hname=$(uname -n)
cpu=$(cat /proc/cpuinfo | grep 'cpu MHz' | sed 's/cpu MHz//')
cpumodel=$(cat /proc/cpuinfo | grep 'model name' | sed 's/model name//')
who=$(whoami)
sens=$(sensors | grep -B1 'Core')
hsens=$(sensors | grep 'temp')
lwho=$(logname)
ram=$(free -t -m | grep -B1 'Mem' )
w=$(w)
uptime=$(uptime |sed 's/,.*$//')

echo "$(tput setab 7)"
echo "$(tput setaf 1)System info"
echo "$(tput setaf 0)"
echo
echo "OS Type                 : $name"
echo "Hostname                : $hname"
echo "Currently logged in as  : $who"
echo "Hardware Architecture   : $hardware"
echo
#echo "CPU Model"
#echo "$cpumodel"

echo "$(tput setaf 1)"
echo "CPU Speed (MHz)"

echo "$(tput setaf 0)"
echo "$cpumodel"
echo "$cpu"

#echo "Kernel Version          : $version" 
#echo "Kernel Release          : $release"
echo "$(tput setaf 1)"
echo "System Uptime:"
echo "$(tput setaf 0)"
echo "$uptime"

echo "$(tput setaf 1)"
echo "Users Online"
echo "$(tput setaf 0)"
echo "$(w)"

echo "$(tput setaf 1)"
echo "Hard Disk(s)"
echo "$(tput setaf 0)"
echo "$disk"

echo "$(tput setaf 1)"
echo "HDD Temp"
echo "$(tput setaf 0)"
echo "$hsens" 
echo "$(tput setaf 1)"
echo "System Memory in MB"
echo "$(tput setaf 0)"
echo "$ram"


echo "$(tput setaf 1)"
echo "Sensors:"
echo "$(tput setaf 0)"
echo "$sens"
echo "$(tput sgr 0)"
#echo
