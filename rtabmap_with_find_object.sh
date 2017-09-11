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

gnome-terminal -e "roslaunch openni_launch openni.launch depth_registration:=true"
sleep 2
gnome-terminal -e 'roslaunch rtabmap_ros rtabmap.launch rtabmap_args:=" --delete_db_on_start"'
sleep 2
gnome-terminal -e 'roslaunch rtabmap_ros rtabmap.launch rtabmap_args:="--delete_db_on_start" rviz:=true rtabmapviz:=false'
sleep 2
gnome-terminal -e "roslaunch find_object_2d find_object_3d.launch static_objects:=true sim_mode:=false slam_mode:=true"

"$SHELL

