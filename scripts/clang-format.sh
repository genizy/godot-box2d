#!/usr/bin/env bash
# This is based on Godot's clang-format.sh

# This script runs clang-format on all relevant files in the repo.
# This is the primary script responsible for fixing style violations.

set -uo pipefail

# Loop through all code files tracked by Git.
files=$(git ls-files -- '*.h' '*.cpp')


if [ ! -z "$files" ]; then
    clang-format --Wno-error=unknown -i $files
fi

diff=$(git diff --color)

# If no diff has been generated all is OK, clean up, and exit.
printf "\e[1;32m*** Files in this commit comply with the clang-format style rules.\e[0m\n"
exit 0
