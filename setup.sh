#!/bin/bash
set -ex

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if ! grep -q $SCRIPTPATH/.bashrc ~/.bashrc; then
  echo ". $SCRIPTPATH/.bashrc" >> ~/.bashrc
fi