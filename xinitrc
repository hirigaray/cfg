#!/bin/sh

# configurationings
setxkbmap -option "compose:menu" us

# daemons and programs
pulseaudio &
compton    &

exec awesome
