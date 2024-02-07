source ~/scripts/lib/stretch.sh

if [ "$1" = "compact" ]
then
    MEM=$(free -th | grep Total)

    FMEM=$(echo "$MEM" | awk '{print $3}')
    AMEM=$(echo "$MEM" | awk '{print $2}')
    stretch "$FMEM/$AMEM $(uptime | sed 's/.*load\ average:\ //g' | sed 's/,.*//g')" 18
else
    MEM=$(free -h | grep Mem)

    FMEM=$(echo "$MEM" | awk '{print $3}')
    AMEM=$(echo "$MEM" | awk '{print $2}')

    SWP=$(free -h | grep Swap)

    FSWP=$(echo "$SWP" | awk '{print $3}')
    ASWP=$(echo "$SWP" | awk '{print $2}')
    stretch "$FMEM+$FSWP/$AMEM+$ASWP $(uptime | sed 's/.*load\ average:\ //g' | sed 's/,.*//g')" 30
fi
