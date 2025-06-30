#!/bin/bash
if [ $# -eq 0 ]; then
  command=$(tac "$HOME/.bash_history" | fzf)
else
  command=$(tac "$HOME/.bash_history" | fzf --query="$@")
fi

if [ "$command" = "" ]; then
  exit
fi

if [ "$command" = "cancel" ]; then
  exit
fi

cout=""
read -e -i "$command" -p "Execute command: " cout

echo "$cout" >> "$HOME/.bash_history"
eval "$cout"
