#!/bin/bash

sudo killall gzserver
sudo killall gzclient
sudo killall rviz
sudo killall roscore
sudo killall rosmaster
sudo killall rosout

roslaunch husky_gazebo husky_farm.launch laser_enabled:=true kinect_enabled:=true slam_laser_enabled:=false
