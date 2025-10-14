#!/usr/bin/env bash

convo=""
resp=""

while true; do
    read -p "You: " line
    [[ -z "$line" || "$line" == "exit" ]] && break

    convo+="You: $line\n"

    resp=$(printf "%s\n" "$convo" | )

done
