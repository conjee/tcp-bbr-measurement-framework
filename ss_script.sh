while true;
do
    ss -tinH dst 10.2/16 | sed -n -e 's/bbr.* cwnd:\([0-9]*\).* bbr:(\([^)]*\)).*/\1;;\2/p' -e 's/cubic.* cwnd:\([0-9]*\).* ssthresh:\([0-9]*\).*/\1;\2;/p' -e 's/cubic.* cwnd:\([0-9]*\).*/\1;0;/p';
    sleep $1;
done | ts -s '%H:%M:%.S;'
