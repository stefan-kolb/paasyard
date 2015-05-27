mk_app_dir() {
  export TMP="$BATS_TEST_DIRNAME/tmp"
  mkdir -p "$BATS_TEST_DIRNAME/tmp"
  export APP_NAME=$(echo "${BATS_TEST_NAME}$RANDOM" | tr -d _)
  export APP_DIR="$TMP/$APP_NAME"
  mkdir -p "$APP_DIR"
}

cleanup() {
  [ -d "$TMP" ] && rm -rf "$TMP"/*
}
