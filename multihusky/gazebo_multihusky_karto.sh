#!/bin/bash

sudo killall gzserver
sudo killall gzclient
sudo killall rviz
sudo killall roscore
sudo killall rosmaster

echo "==============="
echo "Run:"
echo ${red}./run_teleop_husky1.sh{reset} to teleop the 1st husky
echo ${red}./run_teleop_husky2.sh{reset} to teleop the 2nd husky
echo "==============="
echo ""
gnome-terminal -e "roslaunch nre_simmultihusky autom_multihusky_karto.launch"

