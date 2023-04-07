#!/bin/bash

echo "Enter path to directory relative to home: "
echo "(/bak will create $HOME/bak)"
read bakPath
[ ! -d "$bakPath" ] && mkdir "$bakPath"

[ -f "$HOME/.zshrc" ] && \
  echo "Backing up .zshrc..." && \
  cp "$HOME/.zshrc" "$bakPath" || \
  echo ".zshrc not found"

[ -f "$HOME/.skhdrc" ] && \
  echo "Backing up .skhdrc..." && \
  cp "$HOME/.skhdrc" "$bakPath" || \
  echo ".skhdrc not found"


if [ -d "$HOME/.config/kitty" ] 
then
  echo "Backing up kitty..." 
  if [ ! -d "$bakPath/kitty" ] 
  then
    mkdir "$bakPath/kitty"
  fi
  cp -r "$HOME/.config/kitty" "$bakPath"
else
  echo "kitty config not found" 
fi

if [ -d "$HOME/.config/wezterm" ] 
then
  echo "Backing up wezterm..." 
  if [ ! -d "$bakPath/wezterm" ] 
  then
    mkdir "$bakPath/wezterm"
  fi
  cp -r "$HOME/.config/wezterm" "$bakPath"
else
  echo "wezterm config not found" 
fi

if [ -d "$HOME/.config/.zsh-vi-mode" ]
then
  echo "Backing up zsh-vi-mode..."
  if [ ! -d "$bakPath/.zsh-vi-mode" ] 
  then
    mkdir "$bakPath/.zsh-vi-mode"
  fi
  cp -r "$HOME/.config/.zsh-vi-mode" "$bakPath"
else
  echo "zsh-vi-mode config not found" 
fi

if [ -d "$HOME/.config/lvim" ] 
then
  echo "Backing up lvim..." 
  if [ ! -d "$bakPath/lvim" ] 
  then
    mkdir "$bakPath/lvim" 
  fi
  cp -r "$HOME/.config/lvim" "$bakPath" 
else
  echo "lvim config not found" 
fi

if [ -d "$HOME/.config/yabai" ] 
then
  echo "Backing up yabai..." 
  if [ ! -d "$bakPath/yabai" ] 
  then
    mkdir "$bakPath/yabai" 
  fi
  cp -r "$HOME/.config/yabai" "$bakPath" 
else
  echo "yaba config not found" 
fi

if [ -d "$HOME/.config/sketchybar" ] 
then
  echo "Backing up sketchybar..." 
  if [ ! -d "$bakPath/sketchybar" ] 
  then
    mkdir "$bakPath/sketchybar" 
  fi
  cp -r "$HOME/.config/sketchybar" "$bakPath" 
else
  echo "sketchybar config not found" 
fi
