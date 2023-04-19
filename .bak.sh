#!/bin/bash

[ -f "$HOME/.zshrc" ] && \
  echo "Backing up .zshrc..." && \
  cp "$HOME/.zshrc" "$HOME/programming/projects/dotfiles/.config" || \
  echo ".zshrc not found"

[ -f "$HOME/.xinputrc" ] && \
  echo "Backing up .xinputrc..." && \
  cp "$HOME/.xinputrc" "$HOME/programming/projects/dotfiles/.config" || \
  echo ".xinputrc not found"

if [ -d "$HOME/.config/wezterm" ] 
then
  echo "Backing up wezterm..." 
  if [ ! -d "$HOME/programming/projects/dotfiles/.config/wezterm" ] 
  then
    mkdir "$HOME/programming/projects/dotfiles/.config/wezterm"
  fi
  cp -r "$HOME/.config/wezterm" "$HOME/programming/projects/dotfiles/.config"
else
  echo "wezterm config not found" 
fi

if [ -d "$HOME/.config/.zsh-vi-mode" ]
then
  echo "Backing up zsh-vi-mode..."
  if [ ! -d "$HOME/programming/projects/dotfiles/.config/.zsh-vi-mode" ] 
  then
    mkdir "$HOME/programming/projects/dotfiles/.config/.zsh-vi-mode"
  fi
  cp -r "$HOME/.config/.zsh-vi-mode" "$HOME/programming/projects/dotfiles/.config"
else
  echo "zsh-vi-mode config not found" 
fi

if [ -d "$HOME/.config/lvim" ] 
then
  echo "Backing up lvim..." 
  if [ ! -d "$HOME/programming/projects/dotfiles/.config/lvim" ] 
  then
    mkdir "$HOME/programming/projects/dotfiles/.config/lvim" 
  fi
  cp -r "$HOME/.config/lvim" "$HOME/programming/projects/dotfiles/.config" 
else
  echo "lvim config not found" 
fi

if [ -d "$HOME/.config/nvim" ] 
then
  echo "Backing up neovim..." 
  if [ ! -d "$HOME/programming/projects/dotfiles/.config/nvim" ] 
  then
    mkdir "$HOME/programming/projects/dotfiles/.config/nvim" 
  fi
  cp -r "$HOME/.config/nvim" "$HOME/programming/projects/dotfiles/.config" 
else
  echo "nvim config not found" 
fi

if [ -d "$HOME/.config/awesome" ] 
then
  echo "Backing up awesome..." 
  if [ ! -d "$HOME/programming/projects/dotfiles/.config/awesome" ] 
  then
    mkdir "$HOME/programming/projects/dotfiles/.config/awesome" 
  fi
  cp -r "$HOME/.config/awesome" "$HOME/programming/projects/dotfiles/.config" 
else
  echo "awesome config not found" 
fi

