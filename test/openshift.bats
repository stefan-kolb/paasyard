#!/usr/bin/env bats

load test_helper

setup() {
  mk_app_dir
  cd "$APP_DIR"
}

teardown() {
  yard delete openshift -a "$APP_NAME"
  cleanup
}

@test "default ruby version" {
  git clone https://github.com/sharpstone/default_ruby.git .
  run yard create openshift
  echo "$output"
  [ "$status" -eq 0 ]
}

