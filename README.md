![Clipboard To Speech logo](ClipboardToSpeech.png)

# Clipboard To Speech for KDE

Add a tray icon who pronounces the content of clipoard on left click using [Piper](https://github.com/rhasspy/piper/) as TTS.
Piper run in docker container for portability [currently needing python <= 3.11 for work](https://github.com/rhasspy/piper/issues/509).
Use also inotify to interact with the container.

So for use this project you need to have installed:
PyQt5
docker
inotify

Run ./start.sh for launch the application.
./stop.sh of right click on the tray icon for exit.

If you want to change voice or lang edit scripts/init.sh and provide [voice files](https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0) in langs folder
