#!/usr/bin/env bats

load test_helper

setup() {
  mk_app_dir
  cd "$APP_DIR"
}

teardown() {
  paasyard delete dotcloud -a "$APP_NAME"
  cleanup
}

@test "default ruby" {
  git clone https://github.com/sharpstone/default_ruby.git .
  run paasyard create dotcloud
  echo "$output"
  [ "$status" -eq 0 ]
}

