#!/bin/bash

echo "Enter path to directory relative to home: "
echo "(/bak will create $HOME/bak)"
read bakPath
mkdir $bakPath

[ -f "$HOME/.zshrc" ] && echo ".zshrc exists" && cp "$HOME/.zshrc" "$bakPath" || echo ".zshrc not found"
[ -f "$HOME/.skhdrc" ] && echo ".skhdrc exists" && cp "$HOME/.skhdrc" "$bakPath" || echo ".skhdrc not found"
[ -d "$HOME/.config/kitty" ] && echo "Backing up kitty..." && mkdir "$bakPath/kitty" && cp -r "$HOME/.config/kitty" "$bakPath" || echo "kitty config not found" 
[ -d "$HOME/.config/.zsh-vi-mode" ] && echo "Backing up zsh-vi-mode..." && mkdir "$bakPath/.zsh-vi-mode" && cp -r "$HOME/.config/.zsh-vi-mode" "$bakPath" || echo "zsh-vi-mode config not found" 
[ -d "$HOME/.config/lvim" ] && echo "Backing up lvim..." && mkdir "$bakPath/lvim" && cp -r "$HOME/.config/lvim" "$bakPath" || echo "lvim config not found" 
[ -d "$HOME/.config/yabai" ] && echo "Backing up yabai..." && mkdir "$bakPath/yabai" && cp -r "$HOME/.config/yabai" "$bakPath" || echo "yaba config not found" 
[ -d "$HOME/.config/sketchybar" ] && echo "Backing up sketchybar..." && mkdir "$bakPath/sketchybar" && cp -r "$HOME/.config/sketchybar" "$bakPath" || echo "sketchybar config not found" 

