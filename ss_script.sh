while true;
do
    ss -tinH dst 10.2/16 | sed -n -e 's/.* cwnd:\([0-9]*\).* bbr:(\([^)]*\)).*/\1;;\2/p' -e 's/.* cwnd:\([0-9]*\).* ssthresh:\([0-9]*\).*/\1;\2;/p';
    sleep $1;
done | ts -s '%H:%M:%.S;'
