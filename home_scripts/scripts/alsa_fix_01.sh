PERCENTAGE=50

while [ true ]
do
	clear
	amixer sset -c 0 'Mic Boost' 0%,$PERCENTAGE%
	amixer sset -c 0 'Internal Mic Boost' 0%,$PERCENTAGE%
	sleep 0.25
done
