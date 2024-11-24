#!/bin/sh
docker container stop -t0 clipboard_to_speech > /dev/null 2>&1
docker container rm clipboard_to_speech > /dev/null 2>&1
pkill -f ClipboardToSpeech.py
here=`cd $(dirname "$0") && pwd`
rm -f $here/action/*
rm -f $here/input/*