#!/bin/sh
set -ex

common_config_prefix="$HOME/dotfiles/common_config"
host_specific_prefix="$HOME/dotfiles/host_specific/$(hostname)/config"

mkdir -p "$HOME/.config" "$HOME/.local/bin" "$HOME/src"

cd $common_config_prefix
for f in *; do
	if [ -e "$host_specific_prefix/$f" ]; then
		ln -sf "$host_specific_prefix/$f" "$HOME/.config/$f"
	else
		ln -sf "$common_config_prefix/$f" "$HOME/.config/$f"
	fi
done

ln -sf "$HOME/dotfiles/bin" "$HOME/bin"
ln -sf "$host_specific_prefix/profile" "$HOME/.profile"

# TODO move mbsyncrc to XDG_CONFIG_HOME once supported upstream
ln -sf "$common_config_prefix/mbsyncrc" "$HOME/.mbsyncrc"
