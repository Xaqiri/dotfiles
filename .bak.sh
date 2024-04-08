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

wezterm() {
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
}

zsh-vi-mode() {
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
}

nvim() {
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
}

emacs() {
    if [ -d "$HOME/.config/emacs" ] 
    then
	echo "Backing up emacs..." 
	if [ ! -d "$bakPath/emacs" ] 
	then
	    mkdir "$bakPath/emacs" 
	fi
	cp "$HOME/.config/emacs/bookmarks" "$bakPath/emacs" 
	cp "$HOME/.config/emacs/init.el" "$bakPath/emacs" 
	cp "$HOME/.config/emacs/xaqiri-theme.el" "$bakPath/emacs" 
	cp "$HOME/.config/emacs/rorth-mode.el" "$bakPath/emacs" 
    else
	echo "emacs config not found" 
    fi
}

helix() {
    if [ -d "$HOME/.config/helix" ] 
    then
	echo "Backing up helix..." 
	if [ ! -d "$bakPath/helix" ] 
	then
	    mkdir "$bakPath/helix" 
	fi
	cp -r "$HOME/.config/helix/config.toml" "$bakPath/helix" 
	cp -r "$HOME/.config/helix/languages.toml" "$bakPath/helix" 
    else
	echo "helix config not found" 
    fi
}

zellij() {
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
}

yabai() {
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
}

sketchybar() {
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
}

wezterm
zsh-vi-mode
nvim
emacs
helix
zellij
yabai
sketchybar
