if [ -z "$1" ]; then
    echo ""
    echo "No argument supplied"
    echo "Usage:"
    echo "./product_qr.sh Product name"
    echo "Example:"
    echo ""
    echo "./product_qr.sh \"Gear Box\""
    echo ""
    exit 0;
fi
if [ -z "$2" ]; then
    echo ""
else
    echo ""
    echo "Second argument is not supported."
    echo "Usage:"
    echo "./product_qr.sh \"Product name\""
    echo "Example:"
    echo ""
    echo "./product_qr.sh \"Gear Box\""
    echo ""
    exit 0;
fi

code=$1

if dpkg-query -W qrencode; then 
	 echo 'qrencode is installed'
else
	echo 'Installing qrencode'
	sudo apt-get install qrencode
fi;
echo "Produced qr code:"
echo $code
qrencode -o qr.png "$1"
gnome-open qr.png
