#!/bin/bash
set -e
echo "🚀 Starting automated setup..."

# ----------------------------------------------------------
# Detect current shell and setup zsh if needed
# ----------------------------------------------------------
CURRENT_SHELL=$(basename "$SHELL")
ZSH_PATH=$(command -v zsh || true)

if [[ "$CURRENT_SHELL" != "zsh" ]]; then
  echo "🧭 Current shell is: $CURRENT_SHELL"

  if [[ -z "$ZSH_PATH" ]]; then
    echo "Installing zsh..."
    if [[ $(uname) == "Linux" ]]; then
      if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y zsh
      elif command -v apk >/dev/null 2>&1; then
        apk add --no-cache zsh
      elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y zsh
      fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      if ! command -v brew >/dev/null 2>&1; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv || /usr/local/bin/brew shellenv)"
      fi
      brew install zsh
    fi
  fi

  # Refresh zsh path
  ZSH_PATH=$(command -v zsh)

  echo "✅ zsh installed at: $ZSH_PATH"
  echo "Switching default shell to zsh..."
  chsh -s "$ZSH_PATH" || echo "⚠️ Could not change default shell (maybe non-interactive or no permission)."

  echo "🔁 Restarting shell in zsh..."
  exec "$ZSH_PATH"
fi

# ----------------------------------------------------------
# Linux dependencies
# ----------------------------------------------------------
if [[ $(uname) == "Linux" ]]; then
  # Install sudo if missing (for containers)
  if ! command -v sudo >/dev/null 2>&1; then
    echo "Installing sudo for container environment..."
    if command -v apt-get >/dev/null 2>&1; then
      apt-get update && apt-get install -y sudo
    elif command -v apk >/dev/null 2>&1; then
      apk add --no-cache sudo
    fi
  fi

  # Build dependencies
  if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y build-essential libevent-dev libncurses5-dev libncursesw5-dev pkg-config bison byacc curl
  fi
fi

# ----------------------------------------------------------
# Install chezmoi if not present
# ----------------------------------------------------------
if ! command -v chezmoi >/dev/null 2>&1; then
  echo "Installing chezmoi..."
  sh -c "$(curl -fsLS chezmoi.io/get)"
  echo 'export PATH="$PWD/bin:$PATH"' >> ~/.zshrc 
  source ~/.zshrc || true
fi

# ----------------------------------------------------------
# Install mise if not present
# ----------------------------------------------------------
if ! command -v mise >/dev/null 2>&1; then
  echo "Installing mise..."
  curl https://mise.run | sh
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc 
  echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
  source ~/.zshrc || true
fi

# ----------------------------------------------------------
# Install devbox if not present
# ----------------------------------------------------------
# if ! command -v devbox >/dev/null 2>&1; then
#   echo "Installing devbox..."
#   curl -fsSL https://get.jetify.com/devbox | bash
# fi

# # ----------------------------------------------------------
# # Install Ansible if not present
# # ----------------------------------------------------------
# if ! command -v ansible >/dev/null 2>&1; then
#   echo "Installing Ansible..."

#   if [[ "$OSTYPE" == "darwin"* ]]; then
#     if ! command -v brew >/dev/null 2>&1; then
#       echo "Installing Homebrew..."
#       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#       eval "$(/opt/homebrew/bin/brew shellenv || /usr/local/bin/brew shellenv)"
#     fi
#     brew install ansible

#   elif [[ -f /etc/os-release ]]; then
#     . /etc/os-release
#     if [[ "$ID" == "ubuntu" || "$ID_LIKE" == *"debian"* ]]; then
#       sudo apt update
#       sudo apt install -y ansible
#     else
#       echo "⚠️ Unsupported Linux distro: $ID"
#       exit 1
#     fi
#   else
#     echo "⚠️ Unsupported OS: $OSTYPE"
#     exit 1
#   fi
# fi

# ----------------------------------------------------------
# Initialize chezmoi with your dotfiles
# ----------------------------------------------------------
if command -v chezmoi >/dev/null 2>&1; then
  chezmoi init --apply https://github.com/FarizKesten/dotfiles.git
fi

echo "🎉 Setup complete!"
