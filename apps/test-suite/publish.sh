#!/usr/bin/env nix-shell
#!nix-shell -I ../.. -p expo-cli git yarn -i bash

branch="$(git rev-parse --abbrev-ref HEAD)"

yarn install

export EXPO_DEBUG=true

# Both of these variables are necessary to publish with sdkVersion "UNVERSIONED"
export EXPO_SKIP_MANIFEST_VALIDATION_TOKEN=true
export EXPO_NO_DOCTOR=true

expo login --username exponent_ci_bot --password "$EXPO_CLI_PASSWORD"
expo publish --release-channel "$branch"
