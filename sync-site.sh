#!/bin/bash

set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
git_root="$(git rev-parse --show-toplevel)"
os_arch=`arch`

pushd $HOME/.local/share/nvim
zip -FSr $MY_SOURCE_REPO/nvim-data-site-v0.7.2-linux-$os_arch.zip ./site 

