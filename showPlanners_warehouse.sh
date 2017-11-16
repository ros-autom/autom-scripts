red=`tput setaf 1`
reset=`tput sgr0`

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

 echo ""
 echo "For Slam Gmapping"
 echo	""
 echo "For RViz, run: ${red}roslaunch husky_viz view_robot.launch${reset}"
 echo "For manual teleoperation and gmapping, run: ${red}./run_teleop.sh${reset}"
 echo "For auto teleoperation and gmapping, run: ${red}rosrun simple_navigation_goals free_nav_drive${reset}"
 echo ""
 echo "For default usage (Untouched Eband planner):"
 echo ""
 echo "For RViz, run: ${red}roslaunch husky_viz view_robot.launch${reset}"
 echo "For AMCL, run: ${red}roslaunch husky_navigation amcl_warehouse.launch${reset}"
 echo ""
 echo "For TebLocalPlanner:"
 echo ""
 echo "For RViz, run: ${red}roslaunch husky_viz view_robot_teb.launch${reset}"
 echo "For AMCL, run: ${red}roslaunch husky_navigation amcl_demo_teb.launch${reset}"
 echo ""
 echo "For EbandLocalPlanner:"
 echo ""
 echo "For RViz, run: ${red}roslaunch husky_viz view_robot_eband.launch${reset}"
 echo "For AMCL, run: ${red}roslaunch husky_navigation amcl_demo_eband.launch${reset}"
 echo ""

 cd ..
 read -p "Exit? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exitRoutine;
"$SHELL"
