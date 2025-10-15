#!/usr/bin/env bash

echo "Chat session started. Type 'exit' or 'quit' to end."
echo "----------------------------------------------------"

CHAT_CONTEXT=""

while true; do
  read -p "You: " user_input
  if [[ "$user_input" == "q" ]] then
    user_input="exit"
  fi
  if [[ "${user_input}" == "exit" || "${user_input}" == "quit" ]]; then
    echo "Goodbye!"
    break
  fi

  CHAT_CONTEXT+=$(printf "\n\nHuman: %s" "$user_input")

  echo -n "AI: "
  ai_response=$(echo "$CHAT_CONTEXT" | ~/custom-bin/gemgo | tee /dev/tty)
  CHAT_CONTEXT+=$(printf "\n\nAI: %s" "$ai_response")
done
