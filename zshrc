source "${HOME}/.zsh_aliases"
source "${HOME}/.zsh_envs"
source "${HOME}/.zplug/init.zsh"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "tarruda/zsh-autosuggestions"
zplug "plugins/git-extras", from:oh-my-zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

zplug "modules/command-not-found", from:oh-my-zsh
zplug "modules/syntax-highlighting", from:oh-my-zsh
zplug "modules/environment", from:prezto
zplug "modules/docker", from:prezto
zplug "modules/history", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/git", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/history-substring-search", from:prezto
zplug "modules/autosuggestions", from:prezto
zplug "modules/completion", from:prezto

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi


zplug load
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
export PATH="/usr/local/opt/php@7.0/bin:$PATH"
export PATH="/usr/local/opt/php@7.0/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="$HOME/pear/bin:$PATH"
export PATH="$(npm bin):$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
_comp_options=(${_comp_options/NO_warnnestedvar/})
fpath+=${ZDOTDIR:-~}/.zsh_functions

bindkey -s '^o' 'ranger\n'
bindkey '^e' edit-command-line
