#!/bin/bash
set -eo pipefail

_DIR_="$(dirname "$0")"
cd $_DIR_

# ssh keys
ssh-keygen -t rsa -N "" -C dploy -f ~/.ssh/id_rsa

cli() {
  ./init
}

# bootstrap all providers
for d in ../provider/*/ ; do
  cd $d
  echo "-----> Bootstrapping "${PWD##*/}"..."
  cli
  cd ..
done

