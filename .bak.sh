#!/bin/bash

bakPath=".config"
[ ! -d "$bakPath" ] && mkdir "$bakPath"

[ -f "$HOME/.zshrc" ] && \
  echo "Backing up .zshrc..." && \
  cp "$HOME/.zshrc" "$bakPath" || \
  echo ".zshrc not found"

[ -f "$HOME/.skhdrc" ] && \
  echo "Backing up .skhdrc..." && \
  cp "$HOME/.skhdrc" "$bakPath" || \
  echo ".skhdrc not found"


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

if [ -d "$HOME/.config/nvim" ] 
then
  echo "Backing up neovim..." 
  if [ ! -d "$bakPath/nvim" ] 
  then
    mkdir "$bakPath/nvim" 
  fi
  cp -r "$HOME/.config/nvim" "$bakPath" 
else
  echo "nvim config not found" 
fi

if [ -d "$HOME/.config/helix" ] 
then
  echo "Backing up helix..." 
  if [ ! -d "$bakPath/helix" ] 
  then
    mkdir "$bakPath/helix" 
  fi
  cp -r "$HOME/.config/helix" "$bakPath" 
else
  echo "helix config not found" 
fi

if [ -d "$HOME/.config/zellij" ] 
then
  echo "Backing up zellij..." 
  if [ ! -d "$bakPath/zellij" ] 
  then
    mkdir "$bakPath/zellij" 
  fi
  cp -r "$HOME/.config/zellij" "$bakPath" 
else
  echo "zellij config not found" 
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
