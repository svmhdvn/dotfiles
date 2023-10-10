#!/bin/sh
set -ex

host_specific_prefix="$HOME/dotfiles/host_specific/$(hostname)"

mkdir -p "$HOME"/{.config,.local/bin,src}

for f in $(ls -1 "$HOME/dotfiles/config"); do
	if [ -e "$host_specific_prefix/config/$f" ]; then
		ln -s "$host_specific_prefix/config/$f" "$HOME/.config/$f"
	else
		ln -s "$HOME/dotfiles/config/$f" "$HOME/.config/$f"
	fi
done

ln -s "$HOME/dotfiles/bin" "$HOME/bin"
ln -s "$host_specific_prefix/profile" "$HOME/.profile"

# TODO move mbsyncrc to XDG_CONFIG_HOME once supported upstream
ln -s "$HOME/dotfiles/mbsyncrc" "$HOME/.mbsyncrc"
