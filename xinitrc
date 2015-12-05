#!/bin/sh

# configurationings
hsetroot -fill "$HOME/media/img/wallpapers/summa.png"
setxkbmap -option "compose:menu" br
xsetroot -cursor_name left_ptr

# daemons and programs
redshift &
compton  &
sxhkd    &
panel    &

exec wew | lad
