set -gx EDITOR nvim
source ~/code/dotfiles/.fish_aliases
source ~/.fish_envs

# Path Config
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="$HOME/pear/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="(npm bin):$PATH"
export PATH="/usr/local/Cellar:$PATH"
export PATH="(go env GOPATH)/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# END Path Config

set -U __done_min_cmd_duration 20000
bind \ce edit_command_buffer
starship init fish | source
