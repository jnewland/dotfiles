#!/bin/bash
set -ex

echo "[$0] vs. [${BASH_SOURCE[0]}]"

if ! grep -q /workspaces/.codespaces/.persistedshare/dotfiles/.bashrc ~/.bashrc; then
  echo ". /workspaces/.codespaces/.persistedshare/dotfiles/.bashrc" >> ~/.bashrc
fi