#!/bin/sh
if [[ "$1" != *"."* ]]; then
    if [[ "$1" == *"watch?v"* ]]; then
        notify-send "Opening YouTube comments" && youtube-viewer --comments-order=relevance --comments=https://www.youtube.com/$1 --page=1 --no-interactive | ansi2html > /tmp/comments.html && sed -i 's/bold; \}/bold; \} * { font-family: "DejaVu Sans"; \}/g' /tmp/comments.html && sed -i 's/<title>/<title>Comments/g' /tmp/comments.html && sed -i 's/AAAAAA/FFFFFF/g' /tmp/comments.html && google-chrome-stable --app=file:///tmp/comments.html
        echo $1 > /home/mridul/filename
    else
        notify-send "Opening Twitch chat" && google-chrome-stable --app=https://twitch.tv/$1/chat
        echo $1 > /home/mridul/filename
    fi
else
    notify-send "Not a YouTube or Twitch video"
fi