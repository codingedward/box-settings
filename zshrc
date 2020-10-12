export ZSH="/Users/box/.oh-my-zsh"

ZSH_THEME="cloud"

plugins=(
  git
  fzf
)

bindkey -v
source $ZSH/oh-my-zsh.sh
bindkey '^F' clear-screen

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Aliases
alias t="tmux"
alias v="vim"
alias m="mycli"
alias f='fzf --reverse --ansi --preview-window "right:60%" --preview="echo user={3} when={-4..-2}; bat --color=always --style=header,grid --line-range :300 {}"'
alias vf='v $(f)'
alias art="/usr/local/bin/php artisan"
alias weather="curl https://v2.wttr.in/Nairobi"

# download media
alias p3="youtube-dl --extract-audio --audio-format mp3 $1"
alias p4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $1"

# mysql
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/bin:$PATH:/usr/local/opt/flutter/bin:/usr/local/opt/flutter/bin/cache/dart-sdk/bin" 


export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --ignore "node_modules" -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export EDITOR="/usr/local/bin/vim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f "/Users/box/.ghcup/env" ] && source "/Users/box/.ghcup/env" # ghcup-env
