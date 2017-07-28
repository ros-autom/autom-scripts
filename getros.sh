sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ros-kinetic-desktop-full
sudo apt-get install ros-kinetic-agvs-robot-control
sudo rosdep init
rosdep update


echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-rosinstall
printenv | grep ROS
printenv | grep ROS > myEnv.log

read -t 25 -p "Workspace name?, 25 sec timeout?";
if [ -z "$REPLY" ]; then
	echo "Timeout!Using catkin_ws"
	mkdir -p ~/catkin_ws/src
	cd ~/catkin_ws/src
else
	echo "Using ($REPLY) as workspace"
	mkdir -p ~/$REPLY/src
	cd ~/$REPLY/src
fi;

catkin_init_workspace
cd ..
THISDIR=$(pwd)
catkin_make
source devel/setup.bash

read -t 10 -p "Source devel/setup.bash on every terminal?, 10 sec timeout? (y/n)";
if [ "$REPLY" == "y" ]; then
	echo "source $THISDIR/devel/setup.bash" >> ~/.bashrc
fi;

sudo apt-get install ros-kinetic-ros-tutorials
sudo apt-get install ros-kinetic-rqt
sudo apt-get install ros-kinetic-rqt-common-plugins
sudo apt-get install ros-kinetic-gazebo-msgs
sudo apt-get install ros-kinetic-gazebo-plugins
sudo apt-get install ros-kinetic-gazebo-ros
sudo apt-get install ros-kinetic-gazebo-ros-control
sudo apt-get install ros-kinetic-gazebo-ros-pkgs
sudo apt-get install ros-kinetic-object-recognition-ros-visualization
sudo apt-get install ros-kinetic-rviz
sudo apt-get install ros-kinetic-rviz-imu-plugin
sudo apt-get install ros-kinetic-rviz-plugin-tutorials
sudo apt-get install ros-kinetic-rviz-python-tutorial
sudo apt-get install ros-kinetic-rviz-visual-tools

sudo apt-get install ros-kinetic-turtlebot-teleop

sudo apt-get install ros-kinetic-navigation
sudo apt-get install ros-kinetic-navigation-layers
sudo apt-get install ros-kinetic-navigation-stage
sudo apt-get install ros-kinetic-navigation-tutorials

echo "End of installation"

