#!/usr/bin/env bash
# Description: A command-line interface for cheat.sh, a cheat sheet service.
# Author: Milan Pramod
# License: MIT

selected_language=$(cat ~/.config/custom/languages.txt | fzf --prompt="Select a language: ")
if [ -z "$selected_language" ]; then
    echo "No language selected. Exiting."
    exit 1
fi
commands=$(curl -s "https://cheat.sh/$selected_language/:list")
if [ -z "$commands" ]; then
    curl -s "https://cheat.sh/$selected_language"
    echo
    exit 0
fi
selected_command=$(echo "$commands" | fzf --prompt="Select a command: ")
if [ -z "$selected_command" ]; then
    curl -s "https://cheat.sh/$selected_language"
    echo
    exit 0
fi
curl -s "https://cheat.sh/$selected_language/$selected_command"
    echo
exit 0
