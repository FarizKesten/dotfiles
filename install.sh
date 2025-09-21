#!/bin/bash
set -e
echo "🚀 Starting automated setup..."

# Install chezmoi if not present
if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS chezmoi.io/get)"
fi

# Install Ansible if missing
if ! command -v ansible &>/dev/null; then
  echo "Installing Ansible..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &>/dev/null; then
      echo "Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv || /usr/local/bin/brew shellenv)"
    fi
    brew install ansible
  elif [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
      sudo apt update
      sudo apt install -y ansible
    else
      echo "Unsupported Linux distro: $ID"
      exit 1
    fi
  else
    echo "Unsupported OS: $OSTYPE"
    exit 1
  fi
fi

# Initialize chezmoi with your dotfiles
chezmoi init --apply https://github.com/FarizKesten/dotfiles.git
echo "🎉 Setup complete!"
