#!/bin/sh

# configurationings
hsetroot -tile "$HOME/media/img/Patterns/mawattemasu.png"
setxkbmap -option "compose:menu" br
xsetroot -cursor_name left_ptr

# daemons and programs
redshift &
compton  &
sxhkd    &
dunst    &
panel    &

exec wew | lad
