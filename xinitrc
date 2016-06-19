#!/bin/sh

# configurationings
xsetroot -cursor_name left_ptr
setxkbmap -option "compose:menu" br
nitrogen --restore

# daemons and programs
pulseaudio &
compton    &
sxhkd      &
panel      &

exec wew | lad
