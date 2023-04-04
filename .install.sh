#!/bin/zsh

# Install xCode cli
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"')
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

# Brew Taps
brew tap homebrew/cask-fonts
brew tap koekeishiya/formulae
brew tap FelixKratz/formulae

brew install mas
brew install neovim
brew install neofetch
brew install jq
brew install git
brew install gh
brew install lazygit
brew install fzf
brew install btop
brew install switchaudio-osx
brew install skhd
brew install yabai
brew install tree
brew install sketchybar
brew install go
brew install rust
brew install curl
brew install gcc
brew install micro
brew install node
brew install nnn 
brew install starship
brew install sf-symbols
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-completions
brew install zsh-vi-mode

# Brew Casks
brew install --cask font-hack-nerd-font
brew install --cask font-victor-mono-nerd-font
brew install --cask kitty
brew install --cask monitorcontrol

# Install Mac Store apps
mas install 497799835 #xCode

#Install lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# Downloading config files
echo "Cloning config files..."
[ ! -d "$HOME/dotfiles" ] && git clone -b main https://github.com/Xaqiri/dotfiles $HOME/dotfiles

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
git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

# Installing sketchybar
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Start services
brew services start skhd
brew services start yabai
brew services start sketchybar
