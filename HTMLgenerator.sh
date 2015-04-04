#!/bin/bash
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

echo "<html>"
echo "<head>"
echo "  <TITLE>"
echo "  Status Generator"
echo "  </TITLE>"
echo "</head>"
echo ""
echo "<body>"
echo "<h1>"
echo "System info"
echo "</h1>"
echo "<br>"
echo "OS Type                 : $name"
echo "<br>"
echo "Hostname                : $hname"
echo "<br>"
echo "Currently logged in as  : $who"
echo "<br>"
echo "Hardware Architecture   : $hardware"
echo "<br>"
echo "<br>"
echo
#echo "CPU Model"
#echo "$cpumodel"

echo "CPU Speed (MHz)"
echo "<br>"
echo "$cpumodel"
echo "<br>"
echo "$cpu"
echo "<br>"
echo "<br>"

#echo "Kernel Version          : $version" 
#echo "Kernel Release          : $release"
echo "System Uptime:"
echo "<br>"
echo "$uptime"
echo "<br>"

echo "Users Online"
echo "<br>"
echo "$(w)"
echo "<br>"

echo "Hard Disk(s)"
echo "<br>"
echo "$disk"
echo "<br>"
echo "HDD Temp"
echo "<br>"
echo "$hsens"
echo "<br>" 
echo "System Memory in MB"
echo "<br>"
echo "$ram"
echo "<br>"

echo "Sensors:"
echo "<br>"
echo "$sens"
echo "<br>"

echo "</body>"
echo "</html>"
