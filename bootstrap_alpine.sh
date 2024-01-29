#!/bin/sh

# must be run as non-root user after doas is installed and configured

set -ex

host_config="$PWD/host_specific/$(hostname)"
doas ln -sf "$host_config"/etc/apk/repositories /etc/apk/repositories
doas ln -sf "$host_config"/etc/apk/world /etc/apk/world

mkdir -p \
	"$HOME/secrets" \
	"$HOME/Mail" \
	"$HOME/Syncthing" \
	"$HOME/src" \
	"$HOME/.local/bin"

doas apk update
doas apk upgrade
doas apk add

doas rm -rf /etc/iwd /etc/acpi/LID
doas ln -sf "$host_config"/etc/acpi/LID /etc/acpi/LID
doas ln -sf "$host_config"/etc/iwd /etc/iwd

ssh-keygen -t ed25519
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"

# sway setup
doas setup-devd udev
doas adduser "$(whoami)" audio
doas adduser "$(whoami)" video
doas adduser "$(whoami)" input
doas adduser "$(whoami)" seat

# alpine ports setup
doas adduser "$(whoami)" abuild
doas mkdir -p /var/cache/distfiles
doas chgrp abuild /var/cache/distfiles
doas chmod g+w /var/cache/distfiles
doas abuild-keygen -a -i

echo "SYNCTHING_USER=$(whoami)" | doas tee /etc/conf.d/syncthing

# TODO change hardcoded kernel config name
KERNEL_CONFIG="$PWD/kernel_configs/thinkpad-e495_current.config"
LATEST_LINUX_KERNEL=$(sed -n -e '4q' -e 's/.* \([0-9]*\.[0-9]*\.[0-9]*\) .*/\1/p' "$KERNEL_CONFIG")
git clone --depth 1 --branch "v$LATEST_LINUX_KERNEL" "$HOME/src/linux-stable"
cp "$KERNEL_CONFIG" "$HOME/src/linux-stable"

git clone https://github.com/swaywm/sway "$HOME/src/sway"
./bin/mybuild-sway

git clone https://github.com/mawwww/kakoune "$HOME/src/kakoune"
./bin/mybuild-kakoune

mbsync -a

cat <<EOF
==================
SIVA POST BOOTSTRAP MANUAL SETUP
==================

MANDATORY:

  * Add ssh key to all VCS mirrors:

  $(cat "$HOME/.ssh/id_ed25519.pub")

  * Change dotfiles git remote to use ssh:

  * Setup Syncthing

  http://localhost:8384

  * Import PGP keys

  <paperback import>

  * Build and install custom linux kernel

  cd $HOME/src/linux-stable

OPTIONAL:

  * Build foot inside a sway session

  mybuild-foot

EOF
