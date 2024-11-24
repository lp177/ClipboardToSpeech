#!/bin/bash
echo "Listen /tmp/action"
while inotifywait -qe create -r /tmp/action
do
    echo "Receive action: "`cat /tmp/action/*`
    if [[ `cat /tmp/action/*` -eq 'stop' ]];
    then
        echo "Stop"
        killall piper
        killall aplay
    fi
    rm /tmp/action/*
done