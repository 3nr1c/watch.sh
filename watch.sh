if [ $3 ]
then
	TIME=$3
else
	TIME=60
fi

while [ 1 ]
do
	seconds=$(date +%s)
	echo "👀"
	echo "wgetting…"
	wget -nv $1 -O .temp$seconds.html 2> /dev/null
	echo "grepping…"
	search=$(egrep --color=always $2 .temp$seconds.html)
	if [ "$search" ]
	then
		printf '\7'
		echo "$search"
	fi
	rm .temp$seconds.html
	echo "done, sleeping $TIME"
	sleep $TIME
done	
