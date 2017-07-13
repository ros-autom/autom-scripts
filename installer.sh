sudo apt-get purge hddtemp && sudo apt-get install hddtemp
sudo apt-get install ros-kinetic-librealsense

##apt-cache search ros-kinetic | cut -f1 -d" "> _ros_pkgs.txt
while read p; do
  sudo apt-get --assume-yes install -y $p
done <_ros_pkgs.txt
rm -rf _ros_pkgs.txt

