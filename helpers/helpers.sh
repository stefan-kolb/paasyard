#!/bin/bash
set -eo pipefail

# TODO maybe use cmd sub later/return
load_env() {
  if [[ -f .env ]]; then
    # -t removes newlines
    readarray -t evar < .env
  fi
}
load_env

is_up() {
  declare url="$1" timeout="${2-60}"

  until $(curl --connect-timeout 1 --output /dev/null --silent --head --fail $url) || [ $timeout -eq 0 ]; do
    printf "."
    ((timeout--))
    sleep 1
  done

  if [ $timeout -eq 0 ]; then
    printf "$url is DOWN!\n"
  else
    printf "$url is UP!\n"
  fi
}

is_down() {
  declare url="$1" timeout="${2-60}"

  until ! $(curl --output /dev/null --silent --head --fail $url) || [ $timeout -eq 0 ]; do
    printf "."
    ((timeout--))
    sleep 1
  done

  if [ $timeout -eq 0 ]; then
    printf "$url is still UP!\n"
  else
    printf "$url is DOWN!\n"
  fi
}

