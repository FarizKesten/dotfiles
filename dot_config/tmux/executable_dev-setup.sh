#!/bin/bash
# ~/.config/tmux/dev-setup.sh

SESSION_NAME="dev"

# Check if session exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
  echo "Session $SESSION_NAME already exists. Attaching..."
  tmux attach-session -t $SESSION_NAME
  exit
fi

# Create new session
tmux new-session -d -s $SESSION_NAME

# Split window - top 70% vim, bottom 30% terminal
tmux split-window -v -p 30

# Select top pane and start vim
tmux select-pane -t 0
tmux send-keys 'nvim' C-m

# Select bottom pane for terminal
tmux select-pane -t 1

# Attach to session
tmux attach-session -t $SESSION_NAME
