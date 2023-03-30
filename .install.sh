#!/bin/zsh

# Install xCode cli
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
brew tap homebrew/cask-fonts

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
brew install curl
brew install gcc
brew install micro
brew install node
brew install nnn 
brew install starship
brew install fzh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-completions-git

# Brew Casks
brew install --cask alacritty
brew install --cask kitty
brew install --cask monitorcontrol

# Install Mac Store apps
mas install 497799835 #xCode

# Copying config files
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:Xaqiri/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Start services
brew services start skhd
brew services start yabai
brew services start sketchybar
