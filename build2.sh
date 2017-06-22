source devel/setup.bash
#export PATH=/usr/lib/ccache:$PATH
#export DISTCC_HOSTS='@pre1/1 @pre2/1 @pre3/1 @pre4/1'
#export CCACHE_PREFIX=distcc
cores=$(expr `grep processor /proc/cpuinfo | wc -l`)
export ROS_PARALLEL_JOBS="-j$cores -l$cores"
cmake_flags="-march=corei7-avx -Ofast --param ggc-min-expand=1 --param ggc-min-heapsize=40960 --param integer-share-limit=2"
#cmake_flags="-Ofast --param ggc-min-expand=1 --param ggc-min-heapsize=40960 --param integer-share-limit=2"

catkin_make $ROS_PARALLEL_JOBS --cmake-args -DCMAKE_C_FLAGS:="$cmake_flags" -DCMAKE_CXX_FLAGS:="$cmake_flags" 
#-DCMAKE_CXX_FLAGS:="$cmake_flags"
