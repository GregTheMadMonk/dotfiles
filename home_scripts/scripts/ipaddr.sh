source ~/scripts/lib/stretch.sh

if [ "$1" = "full" ]
then
    IDX=$(cat /tmp/ipline)
    ALL="$($0 | wc -l)"
    COUNT="[$(cat /tmp/ipline)/$($0 | wc -l)] "
    if [ $IDX -gt $ALL ]
    then
        IDX=$ALL
        echo $ALL > /tmp/ipline
    fi
    stretch "$COUNT$($0 | sed $IDX"q;d")" 21
else
    ip a | grep inet | grep -v ' lo' | grep -v '::' | sed -e 's/.* \([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)\/.*/\1/'
fi
