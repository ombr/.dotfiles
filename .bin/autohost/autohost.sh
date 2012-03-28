#!/bin/bash
cd $(dirname "$0");
scanfile="/tmp/$$.arp"
#scanfile="input"
sudo arp-scan -l > "$scanfile"
cat devices | while read LINE ; do
    search=$(echo $LINE | sed -e "s/\([a-zA-Z0-9\.]*\) \(.*\)/\2/")
    host=$(echo $LINE | sed -e "s/\([a-zA-Z0-9\.]*\) \(.*\)/\1/")
    ip=$(grep "$search" "$scanfile"|sed -e "s/.*\(^[1-9]*\.[1-9]*\.[0-9]*\.[0-9]*\).*/\1/");
    if [ "$ip" = "" ]; then
        ip="127.0.0.1"
    fi;
    echo "$host -> $ip"
    sed -e "s/^.*$host$/$ip\t$host/g" > "/tmp/$$.tmp" < /etc/hosts > "/tmp/$$.hosts"
    sudo mv "/tmp/$$.hosts" "/etc/hosts";
    cat /etc/hosts;
done;
