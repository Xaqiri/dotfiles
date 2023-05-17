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

[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
                                                  || source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -d "/opt/homebrew/share/zsh-syntax-highlighting/highlighters" ] && export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters \
                                                                  || export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
                                                  || source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="ls -a --color"
alias rm="rm -rf"
alias lg="lazygit"
alias zshrc="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
# alias relyabai="launchctl kickstart -k 'gui/${UID}/homebrew.mxcl.yabai'"
alias relyabai="yabai --stop-service; yabai --start-service"
alias eyabai='nvim ~/.config/yabai/yabairc'
alias eskhd='nvim ~/.skhdrc'
alias fonts="kitty +list-fonts"
alias themes="kitty +kitten themes"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias weztermconfig="nvim ~/.config/wezterm/wezterm.lua"
alias lvimconfig="nvim ~/.config/lvim/config.lua"
alias guni="goUnicode"
alias notes="ff ~/notes"
alias snotes="ff ~/notes"
alias config="nvim ~/.config"
alias nvimconfig="nvim ~/.config/nvim"
alias brewup="brew upgrade && brew update"
alias projects="cd ~/programming/projects"
alias status="git status"
alias push="git push"
alias pull="git pull"
alias clone="git clone"
alias add="git add ."
alias commit="git commit -m"

function ff() {
  dir="$@"
  [ -z "${dir}" ] && curdir=$(pwd) || curdir="$@" 
  selection=$(fd -L -t d --hidden --full-path "${curdir}" | fzf --height=50% \
    --border=double \
    --margin=1%,5%,10%,1% \
    --layout=reverse \
    --border-label="| ${curdir} |" \
    --info=inline \
    --preview="tree -C {}" \
    --color="fg+:cyan,bg+:-1,border:blue,label:magenta,fg:white,marker:blue,prompt:gray,pointer:blue,info:green" \
    --bind="D:+reload(fd -L -t d --hidden --full-path ${curdir})" \
    --bind="D:+change-preview(tree -C {})" \
    --bind="D:+refresh-preview" \
    --bind="F:+reload(fd -L -t f --hidden --full-path ${curdir})" \
    --bind="F:+change-preview(bat --color=always {})" \
    --bind="F:+refresh-preview" \
    --bind="X:delete-char" \
    --bind="J:down" \
    --bind="K:up" \
    --bind="H:backward-char" \
    --bind="L:forward-char" \
    --bind="B:backward-word" \
    --bind="W:forward-word" \
  )
      if [ -d "${selection}" ] && [ -n "${selection}" ]; then 
        cd $selection 
      elif [ -f "${selection}" ]; then
        eval "$EDITOR $selection"
      fi 
  }

function enotes() {
  curdir=$(pwd)
selection=$(fzf --height=100% \
  --border=double \
  --border-label="| $curdir |" \
  --info=inline \
  --preview='bat {} --color=always' \
  --preview-window='75%,border-sharp,top' \
  --color="fg+:cyan,\
bg+:-1,\
border:blue,\
label:magenta,\
fg:white,\
marker:blue,\
prompt:gray,\
pointer:blue,\
info:green") 
  nvim $selection
}

function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

alias n="nnn"
function nnn () {
    command nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
    fi
}

function zen () {
  ~/.config/sketchybar/plugins/zen.sh $1
}

function suyabai () {
  SHA256=$(shasum -a 256 /opt/homebrew/bin/yabai | awk "{print \$1;}")
  if [ -f "/private/etc/sudoers.d/yabai" ]; then
    sudo sed -i '' -e 's/sha256:[[:alnum:]]*/sha256:'${SHA256}'/' /private/etc/sudoers.d/yabai
  else
    echo "sudoers file does not exist yet"
  fi
}
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/miniforge3/bin:/usr/local/anaconda3/bin:$PATH"
export NNN_TMPFILE="$HOME/.config/nnn/.lastd"
export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"
export XDG_CONFIG_HOME="$HOME/.config"
# export FZF_DEFAULT_COMMAND="fd . --hidden --exclude '.git'"

source /opt/homebrew/opt/gitstatus/gitstatus.prompt.zsh
local topPrompt=$'%F{cyan}\U256d\U2500\U2524%f%~%F{cyan}\U251c\U2500\U2500\U2500%f $GITSTATUS_PROMPT' 
local botPrompt=$'\n%F{cyan}\U2570\U2500\U2500%f'
PROMPT=$topPrompt$botPrompt
RPROMPT='%T'



# Load Angular CLI autocompletion.
source <(ng completion script)
