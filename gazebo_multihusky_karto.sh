#!/bin/bash

sudo killall gzserver
sudo killall gzclient
sudo killall rviz
sudo killall roscore
sudo killall rosmaster

roslaunch nre_simmultihusky autom_multihusky_karto.launch 
