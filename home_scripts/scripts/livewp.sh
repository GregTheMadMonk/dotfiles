cd /media/hdd/repos/shadow

for MONITOR in $(xrandr | grep ' connected' | awk '{print $1}')
do
    poetry run shadow example/frag1_my.glsl -d $MONITOR &
done
