#!/usr/bin/bash

echo "Enter path to directory relative to home: "
echo "(/bak will create $HOME/bak)"
read bakPath
mkdir $bakPath

[ -f "$HOME/.zshrc" ] && echo ".zshrc exists" && cp "$HOME/.zshrc" "$bakPath" || echo ".zshrc not found"
[ -d "$HOME/.config/kitty" ] && echo "Backing up kitty..." && mkdir "$bakPath/kitty" && cp -r "$HOME/.config/kitty" "$bakPath" || echo "kitty config not found" 
[ -d "$HOME/.config/.zsh-vi-mode" ] && echo "Backing up zsh-vi-mode..." && mkdir "$bakPath/.zsh-vi-mode" && cp -r "$HOME/.config/.zsh-vi-mode" "$bakPath" || echo "zsh-vi-mode config not found" 
[ -d "$HOME/.config/lvim" ] && echo "Backing up lvim..." && mkdir "$bakPath/lvim" && cp -r "$HOME/.config/lvim" "$bakPath" || echo "lvim config not found" 

