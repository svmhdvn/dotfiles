#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

export PATH=$HOME/bin:$HOME/src/zig/build/:$PATH
export EDITOR=nvim
export BROWSER=elinks
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg
export FZF_DEFAULT_COMMAND='fd --type file'