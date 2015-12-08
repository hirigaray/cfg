#!/bin/sh

# configurationings
setxkbmap -option "compose:menu" br
xsetroot -cursor_name left_ptr

# daemons and programs
redshift &
compton  &
sxhkd    &

exec wew | lad
