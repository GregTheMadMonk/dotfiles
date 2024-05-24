source ~/scripts/lib/stretch.sh


if [ "$1" = "compact" ]
then
    MEM=$(free -th | grep Total)

    FMEM=$(echo "$MEM" | awk '{print $3}' | sed 's/[a-z]//')
    AMEM=$(echo "$MEM" | awk '{print $2}' | sed 's/[a-z]//')
    stretch "$FMEM/$AMEM $(uptime | sed 's/.*load\ average:\ //g' | sed 's/,.*//g')" 16
else
    MEM=$(free -h | grep Mem)

    FMEM=$(echo "$MEM" | awk '{print $3}' | sed 's/[a-z]//')
    AMEM=$(echo "$MEM" | awk '{print $2}' | sed 's/[a-z]//')

    SWP=$(free -h | grep Swap)

    FSWP=$(echo "$SWP" | awk '{print $3}' | sed 's/[a-z]//')
    ASWP=$(echo "$SWP" | awk '{print $2}' | sed 's/[a-z]//')
    stretch "$FMEM+$FSWP/$AMEM+$ASWP $(uptime | sed 's/.*load\ average:\ //g' | sed 's/,.*//g')" 26
fi
