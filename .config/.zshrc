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
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/share/zsh-syntax-highlighting/highlighters

# System commands
alias ls="ls -a --color"
alias rm="rm -rf"
alias guni="goUnicode"

# Config
alias config="nvim ~/.config"
alias envim="nvim ~/.config/nvim"
alias ewezterm="nvim ~/.config/wezterm/wezterm.lua"
alias zshrc="nvim ~/.zshrc"

alias notes="nvim ~/notes"
alias projects="cd ~/programming/projects"
alias szsh="source ~/.zshrc"

# Git
alias lg="lazygit"
alias status="git status"
alias push="git push"
alias pull="git pull"
alias clone="git clone"
alias add="git add ."
alias commit="git commit -m"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/miniforge3/bin:/usr/local/anaconda3/bin:$PATH"
export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"
export XDG_CONFIG_HOME="$HOME/.config"

source $HOME/gitstatus/gitstatus.prompt.zsh
local topPrompt=$'%F{cyan}\U256d\U2500\U2524%f%~%F{cyan}\U251c\U2500\U2500\U2500%f $GITSTATUS_PROMPT' 
local botPrompt=$'\n%F{cyan}\U2570\U2500\U2500%f'
PROMPT=$topPrompt$botPrompt
RPROMPT='%T'

