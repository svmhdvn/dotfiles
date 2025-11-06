#!/bin/sh
set -eux

dotfiles="${HOME}/src/dotfiles"
ln -sf "${dotfiles}/bin" "${HOME}/bin"

common_config_prefix="${dotfiles}/common_config"
host_specific_prefix="${dotfiles}/host_specific/$(hostname)"

if test -e "${host_specific_prefix}/profile"; then
  ln -sf "${host_specific_prefix}/profile" "${HOME}/.profile"
fi

mkdir -p "${HOME}/.config"

cd "${common_config_prefix}"
for f in *; do
  ln -nsf "${common_config_prefix}/${f}" "${HOME}/.config/${f}"
done

# override with host-specific config after
cd "${host_specific_prefix}/config"
for f in *; do
  ln -nsf "${host_specific_prefix}/config/${f}" "${HOME}/.config/${f}"
done
