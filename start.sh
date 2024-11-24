#!/bin/sh
./stop.sh
echo "Build image"
./Dockerfile \
&& echo "Run Container" \
&& docker run \
-v `pwd`/action:/tmp/action \
-v `pwd`/input:/tmp/input \
-v `pwd`/langs:/tmp/langs \
-v `pwd`/scripts:/tmp/scripts \
-v /run/user/$(id -u)/pulse/native:/pulseaudio/socket \
--privileged \
-d \
--name clipboard_to_speech clipboard_to_speech_template \
&& echo "Add tray icon"
nohup python3 ClipboardToSpeech.py > /dev/null 2>&1 &