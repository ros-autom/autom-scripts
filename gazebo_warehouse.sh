#!/bin/bash
red=`tput setaf 1`
reset=`tput sgr0`

sudo killall gzserver
sudo killall gzclient
sudo killall rviz
sudo killall roscore
sudo killall rosmaster
sudo killall rosout
sudo killall python
sudo killall roslaunch
sudo killall tf2_relay_node
sudo killall twist_mux
sudo killall robot_state_publisher
sudo killall master_sync
sudo killall message_relay_node
sudo killall move_base
sudo killall map_server
sudo killall static_transform_publisher

echo "==============="
echo "For image recognition"
echo "Run:"
echo "${red}roslaunch find-object find_object_3d_warehouse${reset}"
echo "And import the png files to rtab"
echo "==============="
echo ""

gnome-terminal -e "roslaunch husky_gazebo husky_warehouse.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true"

#sleep 3
#gnome-terminal -e "roslaunch find_object_2d find_object_3d.launch static_objects:=true sim_mode:=true slam_mode:=true"

sleep 3

gnome-terminal -e "roslaunch husky_viz view_robot.launch"

sleep 3

gnome-terminal -e "roslaunch husky_navigation amcl_warehouse.launch"

sleep 3

gnome-terminal -e "rosrun simple_navigation_goals box_picking"

#sleep 3

#gnome-terminal -e "roslaunch husky_control husky_teleop.launch"

#sleep 3

#gnome-terminal -e "roslaunch visp_auto_tracker tracklive_husky.launch"

#sleep 3

#gnome-terminal -e "rostopic echo /visp_auto_tracker/code_message"


"$SHELL"
