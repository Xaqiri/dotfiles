 cyan=`tput setaf 14`
 beige=`tput setaf 215`
 white=`tput setaf 15`
 black=`tput setaf 0`
 reset=`tput sgr0`
 echo "${cyan}\u2554\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2557"
 echo "${cyan}\u2551    ´.-::::::-.´    \u2551"
 echo "${cyan}\u2551.:-::::::::::::::-:.\u2551"
 echo "${cyan}\u2551´_::${white}:    ::    :${cyan}::_´\u2551"
 echo "${cyan}\u2551 .:${white}( ^   :: ^   )${cyan}:. \u2551"
 echo "${cyan}\u2551 ´::${white}:   ${beige}(${black}..${beige})${white}   :${cyan}::. \u2551"
 echo "${cyan}\u2551 ´:::::::${white}UU${cyan}:::::::´ \u2551"
 echo "${cyan}\u2551 .::::::::::::::::. \u2551"
 echo "\u2551${beige} O${cyan}::::::::::::::::${beige}O ${cyan}\u2551"
 echo "${cyan}\u2551 -::::::::::::::::- \u2551"
 echo "${cyan}\u2551 ´::::::::::::::::´ \u2551"
 echo "${cyan}\u2551  .::::::::::::::.  \u2551"
 echo "\u2551 ${beige}   oO${cyan}:::::::${beige}Oo ${cyan}    \u2551"
 echo "${cyan}\u255A\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u255D"
 echo "${reset}"

# Source zsh plugins
source $HOME/.config/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

alias ls="ls -a --color"
alias rm="rm -rf"
alias lg="lazygit"
alias zshconfig="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"

eval "$(starship init zsh)"

export PATH="$HOME/neovim/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export EDITOR="$(which nvim)"
export XDG_CONFIG_HOME="$HOME/.config"
