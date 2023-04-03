#!/bin/bash
#Update and upgrade 
sudo apt upgrade && sudo apt update

#Install some dependencies
sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl python3-pip
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

#Install neovim from source
if [ ! -d "$HOME/neovim"]
then cd $HOME
git clone https://github.com/neovim/neovim neovimsrc
cd neovimsrc
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"
cd ..
rm -rvf neovimsrc
fi

#Install lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#Install Go
cd $HOME
wget "https://go.dev/dl/$(curl 'https://go.dev/VERSION?m=text').linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go*.linux-amd64.tar.gz
rm -rvf go*.linux-amd64.tar.gz

#Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit
rm lazygit.tar.gz

#Install zsh 
sudo apt install zsh
sudo apt install zsh-autosuggestions
sudo apt install zsh-syntax-highlighting

#Install starship
curl -sS https://starship.rs/install.sh | sh

# Downloading config files
echo "Cloning config files..."
[ ! -d "$HOME/dotfiles" ] && git clone -b linux https://github.com/Xaqiri/dotfiles $HOME/dotfiles
if [ ! -f "$HOME/.zshrc" ]
then cp "$HOME/dotfiles/.zshrc" $HOME
else
	echo "Found .zshrc, backing up..."
	cp "$HOME/.zshrc" "$HOME/.zshrc_bak"
	cp "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
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
[ ! -d "$HOME/.local/share/fonts" ] && mkdir -p ~/.local/share/fonts
git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/*.otf $HOME/.local/share/fonts
rm -rf /tmp/SFMono_Nerd_Font/
curl -Lo jetbrainsmono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip"
unzip jetbrainsmono.zip -d $HOME/.local/share/fonts
rm -rf jetbrainsmono.zip

zsh
source $HOME/.zshrc
