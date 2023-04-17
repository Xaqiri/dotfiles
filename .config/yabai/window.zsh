#!/bin/zsh

# Center windows for larger display
local win_arr=$(yabai -m query --spaces --space | jq -re ".windows")
local num_win=$(echo $win_arr | jq -re 'length')
local first_win=$(yabai -m query --spaces --window | jq -re '.[].windows[0]')
if [ $num_win = 1 ]; then
  yabai -m space --layout float; yabai -m window $first_win --grid 20:20:5:0:10:20
else 
  # local floating=$(yabai -m query --windows --window | jq -re '.["is-floating"]')
  # local second_win=$(yabai -m query --spaces --window | jq -re '.[].windows[1]')
  local type=$(yabai -m query --spaces --window | jq -re '.[].type')
  # [ $floating = true ] && yabai -m window $first_win --toggle float 
  [ $type = float ] && yabai -m space --layout bsp 
    # yabai -m window $first_win --toggle float #; yabai -m window --grid 10:10:1:1:8:8
  # else
fi
