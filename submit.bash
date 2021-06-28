read -p "Gruduate student? (y or n)" opt
fileindex=1
mac="$(ip a | grep -Po 'link/ether \K.::::*:.. ')"
kernel="`uname -r`"


if [ $opt = 'y' ]; then
	read -p "Is this VM running on your computer? (y or n)" local
	if [ $local = 'y' ]; then
		fileindex=1
	else
		fileindex=2
	fi
elif [ $opt = 'n' ]; then
	fileindex=2
else
	echo "You must enter 'y' or 'n'."
	exit
fi

echo "Writing to phase${fileindex}.txt..."
echo -e $mac >> "phase${fileindex}.txt"
echo -e $USER >> "phase${fileindex}.txt"
echo -e $HOSTNAME >> "phase${fileindex}.txt"
echo -e $kernel >> "phase${fileindex}.txt"