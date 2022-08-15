#!/bin/bash
set -e

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "running setup.sh from https://github.com/jnewland/dotfiles"

if ! grep -q "$SCRIPTPATH/.bashrc" ~/.bashrc; then
  echo ". $SCRIPTPATH/.bashrc" >> ~/.bashrc
fi

cp "$SCRIPTPATH/.gitconfig" ~/.gitconfig

mkdir -p ~/bin

function extract_file_from_image() {
  container_id=$(docker create "$1")
  docker cp "$container_id:$2" "$3"
  docker rm "$container_id" > /dev/null
}

echo "installing tailscale..."
extract_file_from_image ghcr.io/tailscale/tailscale:stable /usr/local/bin/tailscaled ~/bin/tailscaled
extract_file_from_image ghcr.io/tailscale/tailscale:stable /usr/local/bin/tailscale ~/bin/tailscale
sudo mv ~/bin/tailscale ~/bin/tailscaled /usr/sbin/

sudo mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale
sudo cp $SCRIPTPATH/tailscaled /etc/init.d/
sudo chmod a+x /etc/init.d/tailscaled

sudo cp $SCRIPTPATH/start-tailscale ~/bin

~/bin/start-tailscale
