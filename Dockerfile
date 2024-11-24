#!/usr/bin/env -S docker build . --tag=clipboard_to_speech_template --file
FROM python:3.11.10-slim-bookworm

RUN apt-get update -qqq \
&& apt install -yqqq --no-install-recommends alsa-utils pulseaudio inotify-tools psmisc \
&& pip3 install uv \
&& uv pip install --system piper-tts \
&& mkdir /tmp/reading

ENTRYPOINT ["/tmp/scripts/init.sh"]