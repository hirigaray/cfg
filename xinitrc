#!/bin/sh

# configurationings
xsetroot -cursor_name left_ptr
setxkbmap -option "compose:menu" us
nitrogen --restore

# daemons and programs
pulseaudio &
compton    &
sxhkd      &
panel      &
dunst      &

exec wew | lad
