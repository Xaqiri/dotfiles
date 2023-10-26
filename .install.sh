#!/bin/zsh

# Install xCode cli
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"')
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

# Downloading config files
echo "Cloning config files..."
[ ! -d "$HOME/dotfiles" ] && git clone -b main https://github.com/Xaqiri/dotfiles $HOME/dotfiles

# Install everything from the Brewfile
echo "Installing applications from Brewfile..."
(cd &HOME/dotfiles && brew bundle install)

if [ ! -f "$HOME/.zshrc" ]
then cp "$HOME/dotfiles/.zshrc" $HOME
else
	echo "Found .zshrc, backing up..."
	cp "$HOME/.zshrc" "$HOME/.zshrc_bak"
	cp "$HOME/dotfiles/.config/.zshrc" "$HOME/.zshrc"
fi

if [ ! -f "$HOME/.skhdrc" ]
then cp "$HOME/dotfiles/.skhdrc" $HOME
else
	echo "Found .skhdrc, backing up..."
	cp "$HOME/.skhdrc" "$HOME/.skhdrc_bak"
	cp "$HOME/dotfiles/.config/.skhdrc" "$HOME/.skhdrc"
fi

if [ ! -d "$HOME/.config" ] 
then cp -r "$HOME/dotfiles/.config" "$HOME"
else
	echo "Found .config, backing up..."
	cp -r "$HOME/.config" "$HOME/.config_bak"
	cp -r "$HOME/dotfiles/.config" "$HOME"
fi

[ -d "$HOME/dotfiles" ] && rm -rf "$HOME/dotfiles"

# Installing Fonts
echo "Installing fonts..."
git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

# Installing sketchybar
echo "Installing sketchybar..."
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Start services
echo "Starting services..."
skhd --start-service
yabai --start-service
brew services start sketchybar
