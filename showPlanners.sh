red=`tput setaf 1`
reset=`tput sgr0`

 echo ""
 echo "For default usage (Untouched Eband planner):"
 echo ""
 echo "For RViz, run: ${red}roslaunch husky_viz view_robot.launch${reset}"
 echo "For AMCL, run: ${red}roslaunch husky_navigation amcl_demo.launch${reset}"
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
 

 echo ""
"$SHELL"
