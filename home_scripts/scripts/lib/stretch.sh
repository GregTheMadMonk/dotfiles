function stretch() {
    CUR="$(echo "$1" | xargs -0)"
    LEN=$(($(echo "$CUR" | wc -c) - 1))
#   echo "'$CUR'.length = $LEN"
    if [ $LEN -ge $2 ]
    then
        CUR="$(echo "$CUR" | cut -b 1-$(($2 - 3)))..."
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

    echo "$BEFORE$CUR$AFTER"
}
