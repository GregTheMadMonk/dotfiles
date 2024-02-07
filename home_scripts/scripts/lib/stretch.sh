function stretch() {
    LEN=$(echo "$1" | wc -c)
    if [ $LEN -ge $2 ]; then
        CUR="$(echo $1 | cut -b 1-40)..."
    fi
    OFFSET=$(( ($2 - $LEN) / 2 ))
    BEFORE=""
    I=0
    while [ $I -lt $OFFSET ]
    do
        BEFORE=$BEFORE' '
        I=$(( $I + 1 ))
    done
    I=0
    AFTER=""
    while [ $I -lt $(( $2 - $LEN - $OFFSET )) ]
    do
        AFTER=$AFTER' '
        I=$(( $I + 1 ))
    done

    echo "$BEFORE$1$AFTER"
}
