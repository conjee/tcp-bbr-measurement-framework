#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Call it with ./profile.sh <pid> <interval>"
    exit
fi

while ps -p $1 > /dev/null
do
    mpstat -P ALL $2 1 | grep "Average: .* all";
done