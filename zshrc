# If you come from bash you might have to change your $PATH.
export ZSH="/Users/edward/.oh-my-zsh"

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
export EDITOR=vim

export PATH="/usr/local/bin:$PATH:/usr/local/opt/flutter/bin:/usr/local/opt/flutter/bin/cache/dart-sdk/bin" 
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

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
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openssl@1.1/include"
# compilers to find zlib
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
# pkg-config to find zlib
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

# elastic beanstalk
export PATH="/Users/edward/Library/Python/2.7/bin:$PATH"
export PATH="/Users/edward/.ebcli-virtual-env/executables:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

it2prof() { echo -e "\033]50;SetProfile=$1\a" }
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"


if [[ "$(uname -s)" == "Darwin" ]]; then
  check_if_needs_to_switch_profile() {
    val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    if [[ $val == "Dark" ]]; then
      echo -ne "\033]50;SetProfile=Dark\a"
      export ITERM_PROFILE="Dark"
    else
      echo -ne "\033]50;SetProfile=Light\a"
      export ITERM_PROFILE="Light"
    fi
  }

  check_if_needs_to_switch_profile
fi

