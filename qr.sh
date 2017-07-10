if [ -z "$1" ]; then
    echo ""
    echo "No argument supplied"
    echo "Usage:"
    echo ""
    echo "./qr.sh 192.168.x.yyy"
    echo "Example:"
    echo ""
    echo "./qr.sh 192.168.0.2"
    echo ""
    exit 0;
fi

http="http://"
ip=$1
port=":11311"
finalIP=$http$ip$port
if dpkg-query -W qrencode; then 
	 echo 'qrencode is installed'
else
	echo 'Installing qrencode'
	sudo apt-get install qrencode
fi;
echo "Produced IP:"
echo $finalIP
qrencode -o qr.png $finalIP
gnome-open qr.png