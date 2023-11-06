NONE=1
for pid in $(ps -aux | grep shadow | grep -v grep | awk '{ print $2 }')
do
    NONE=0
    kill $pid
done

exit $NONE
