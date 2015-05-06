#!/usr/bin/env bats

load test_helper

setup() {
  mk_app_dir
  cd "$APP_DIR"
}

teardown() {
  paasyard delete bluemix -a "$APP_NAME"
  cleanup
}

@test "default ruby version" {
  git clone https://github.com/sharpstone/default_ruby.git .
  run paasyard create bluemix
  echo "$output"
  [ "$status" -eq 0 ]
}

