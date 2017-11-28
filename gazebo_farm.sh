#!/bin/bash
sudo killall gzserver > /dev/null 2> /dev/null
sudo killall gzclient > /dev/null 2> /dev/null
sudo killall rviz > /dev/null 2> /dev/null
sudo killall roscore > /dev/null 2> /dev/null
sudo killall rosmaster > /dev/null 2> /dev/null
sudo killall rosout > /dev/null 2> /dev/null
sudo killall python > /dev/null 2> /dev/null
sudo killall roslaunch > /dev/null 2> /dev/null
sudo killall tf2_relay_node > /dev/null 2> /dev/null
sudo killall twist_mux > /dev/null 2> /dev/null
sudo killall robot_state_publisher > /dev/null 2> /dev/null
sudo killall master_sync > /dev/null 2> /dev/null
sudo killall message_relay_node > /dev/null 2> /dev/null
sudo killall move_base > /dev/null 2> /dev/null
sudo killall map_server > /dev/null 2> /dev/null
sudo killall static_transform_publisher > /dev/null 2> /dev/null

export GAZEBO_MODEL_PATH=~/.gazebo
source /usr/share/gazebo-7/setup.sh
thisdir=$PWD

#cd autom-scripts
#gnome-terminal -e "./showPlanners_farm.sh"

runDefault() {
	gnome-terminal -e "roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true"
	sleep 3
	gnome-terminal -e "roslaunch husky_viz view_robot.launch"
	sleep 3
	gnome-terminal -e "roslaunch husky_navigation amcl_farm.launch"
	sleep 3
	gnome-terminal -e "./run_teleop.sh"
}

runGmappingManual() {
	gnome-terminal -e "roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true"
	sleep 3
	gnome-terminal -e "roslaunch husky_viz view_robot.launch"
	sleep 3
	gnome-terminal -e "./run_teleop.sh"
	sleep 3
	gnome-terminal -e "roslaunch husky_navigation gmapping_demo.launch"
}

runGmappingAuto() {
	gnome-terminal -e "roslaunch husky_gazebo husky_farm.launch laser_enabled:=false kinect_enabled:=true slam_laser_enabled:=true"
	sleep 3
	gnome-terminal -e "roslaunch husky_viz view_robot.launch"
	sleep 3
	gnome-terminal -e "rosrun simple_navigation_goals free_nav_drive"
	sleep 3
	gnome-terminal -e "roslaunch husky_navigation gmapping_demo.launch"
}

exitRoutine() {
	fuser -n tcp -k 11911
	pkill -9 python
	ps aux | grep -ie gzserver | awk '{print $2}' | xargs kill -9  || true
	ps aux | grep -ie gzclient | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie rviz | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie roscore | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie rosmaster | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie rosout | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie roslaunch | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie tf2_relay_node | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie twist_mux | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie robot_state_publisher | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie master_sync | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie message_relay_node | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie move_base | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie map_server | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie static_transform_publisher | awk '{print $2}' | xargs kill -9   || true
	ps aux | grep -ie amcl | awk '{print $2}' | xargs kill -9   || true
	exit 1;
}


ask() {
	echo ""
	select option in "Refresh script and apps" "Exit" ; do
		case $option in
			"Refresh script and apps" ) refreshScript; break;;
			"Exit" ) exit; break;;
		esac
	done

}
refreshScript() {
	cd $thisdir
	bash gazebo_farm.sh
}


echo ""
echo "Please select operation"
echo ""
select option in "Default" "GMapping manual teleop" "GMapping auto teleop" "Kill all windows and exit" ; do
	case $option in
		"Default" ) runDefault; ask; break;;
		"GMapping manual teleop" ) runGmappingManual; ask; break;;
		"GMapping auto teleop" ) runGmappingAuto; ask; break;;
		"Kill all windows and exit" ) ask; break;;
	esac
done

