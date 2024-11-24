#!/bin/bash
export PULSE_SERVER="unix:/pulseaudio/socket"
read_files()
{
    reading_path=/tmp/reading/$(date +%s)
    cat /tmp/input/* > $reading_path
    rm /tmp/input/*
    cat $reading_path | piper --model /tmp/langs/fr_FR-upmc-medium.onnx --output-raw | PULSE_SERVER="unix:/pulseaudio/socket" aplay -r 22050 -f S16_LE -t raw -
    rm $reading_path
    echo "End of reading"
}
/tmp/scripts/action.sh &
echo "Ready"
while inotifywait -qe create -r /tmp/input
do
    read_files
    while [ $(find "/tmp/input" -maxdepth 1 -type f | wc -l) -gt 0 ];
    do
        sleep 1
        read_files
    done
done
