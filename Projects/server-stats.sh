#!/bin/bash



Total_CPU_Usage=$(top -bn 2 | grep "Cpu(s)"  | tail -1 | awk '{print 100 - $8 "%"}')
Free_Memory=$(free -m | grep "Mem" | awk '{print $4/$2 * 100 "%"}')
Used_Memory=$(free -m | grep "Mem" | awk '{print $3/$2 * 100 "%"}')
Free_Disk_Space=$(df -kh . | tail -n1 | awk '{print $4/$2 * 100 "%"}')
Used_Disk_Space=$(df -kh . | tail -n1 | awk '{print $3/$2 * 100 "%"}')
Top_5_Processes_By_CPU_Usage=$(ps -eo pid,command,%cpu,%mem --sort=-%cpu | head -n 5)
Top_5_Processes_By_Memory_Usage=$(ps -eo pid,command,%cpu,%mem --sort=-%mem | head -n 5)
OS_info=$(lsb_release -a)
Uptime=$(uptime -p)
Load_avg=$(cat /proc/loadavg)

#used -e flag to consider /n and /t
echo -e "Your Total CPU usage is: $Total_CPU_Usage\n"

echo -e "You have $Free_Memory free memory.\n"

echo -e "You have $Used_Memory used memory.\n"

echo -e "You have $Free_Disk_Space free disk space\n"

echo -e "You have $Used_Disk_Space used disk space\n"

echo -e "Top 5 Processes By CPU Usage:\n $Top_5_Processes_By_CPU_Usage"

echo -e "Top 5 Processes By Memory Usage:\n $Top_5_Processes_By_Memory_Usage"

echo -e "Your current OS Information:\n $OS_info"

echo -e "Your total uptime: $Uptime\n"

echo "Load Average: $Load_avg"
