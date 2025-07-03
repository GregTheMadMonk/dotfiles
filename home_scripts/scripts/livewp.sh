cd /media/hdd/repos/shadow

for MONITOR in $(xrandr | grep ' connected' | awk '{print $1}')
do
    echo "python3 -m shadow.main example/frag1_my.glsl -d $MONITOR"
    python3 -m shadow.main example/frag1_my.glsl -d $MONITOR &
done
