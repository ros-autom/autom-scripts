#!/bin/bash
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

export GAZEBO_MODEL_PATH=/home/balkan/.gazebo
source /usr/share/gazebo-7/setup.bash


roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true
