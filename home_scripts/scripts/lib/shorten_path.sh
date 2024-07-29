function shorten_path() {
    local RET="$1"
    local LEN=${#RET}
    while [ $LEN -gt $2 ]
    do
        RET="$(echo "$RET" | sed -r 's|/(.)[^/]+|/\1|')"
        NEW_LEN=${#RET}
        [ $LEN = $NEW_LEN ] && break
        LEN=$NEW_LEN
    done
    echo "$RET"
}
