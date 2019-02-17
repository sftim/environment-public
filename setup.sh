#!/bin/sh
scriptdir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd "$scriptdir"
tmpdir="$( mktemp -d)"
if [ "$tmpdir" = "" ]; then exit 1; fi
set -e
sudo -v
cd "$tmpdir"
# Update APT data unless recently touched
find /var/cache/apt -maxdepth 1 -name '*.bin' -mmin -60 | grep -q ^/ || sudo -n apt update
# Ensure packages
if ! bat /dev/null; then
    curl -L -O https://github.com/sharkdp/bat/releases/download/v0.10.0/bat-musl_0.10.0_amd64.deb
    sudo -n dpkg -i bat-musl_0.10.0_amd64.deb
fi
sudo -n apt-get --assume-yes purge nano
sudo -n apt-get --assume-yes install rsync

cd "$scriptdir"
find dotfiles -mindepth 1 -maxdepth 1 -type f | while read thing; do bash -c "rsync -rlptgoX '$thing' $( echo $thing | sed -e 's,^dotfiles,~,')"; done
find dotfiles -mindepth 1 -maxdepth 1 -type d | while read thing; do bash -c "rsync -rlptgoX '${thing}/' $( echo $thing | sed -e 's,^dotfiles,~,')/"; done
