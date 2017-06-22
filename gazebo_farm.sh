#!/bin/bash

sudo killall gzserver
sudo killall gzclient
sudo killall rviz
sudo killall roscore
sudo killall rosmaster

roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true 
