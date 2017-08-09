#!/bin/sh

# configurationings
# xsetroot -cursor_name left_ptr
setxkbmap -option "compose:menu" us

# daemons and programs
pulseaudio &
compton    &

exec awesome
