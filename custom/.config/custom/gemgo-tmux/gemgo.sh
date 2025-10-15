#!/usr/bin/env bash

# if [ ! -x "$MODEL_EXECUTABLE" ]; then
#   echo "Error: Model executable not found or not executable at '$MODEL_EXECUTABLE'"
#   echo "Please run 'chmod +x $MODEL_EXECUTABLE' first."
#   exit 1
# fi

echo "Chat session started. Type 'exit' or 'quit' to end."
echo "----------------------------------------------------"

CHAT_CONTEXT=""

while true; do
  read -p "You: " user_input

  if [[ "${user_input}" == "exit" || "${user_input}" == "quit" ]]; then
    echo "Goodbye!"
    break
  fi

  CHAT_CONTEXT+=$(printf "\n\nHuman: %s" "$user_input")

  echo -n "AI: "

  # - `echo "$user_input" | "$MODEL_EXECUTABLE"`: Pipes the user input to our model.
  # - `tee /dev/tty`: The magic part. `tee` duplicates the stream. It sends one
  #   copy to `/dev/tty` (your terminal), so you see it in real-time.
  # - `$(...)`: The command substitution captures the *other* copy of the stream
  #   and stores it in the 'ai_response' variable after it completes.
  ai_response=$(echo "$CHAT_CONTEXT" | ~/custom-bin/gemgo | tee /dev/tty)
  CHAT_CONTEXT+=$(printf "\n\nAI: %s" "$ai_response")
done
