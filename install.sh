#!/bin/bash
set -e
echo "🚀 Starting automated setup..."

if [[ $(uname) == "Linux" ]]; then
  # Install sudo if missing (for Docker containers)
  if ! command -v sudo >/dev/null 2>&1; then
    echo "Installing sudo for container environment..."
    if command -v apt-get >/dev/null 2>&1; then
      apt-get update && apt-get install -y sudo
    elif command -v apk >/dev/null 2>&1; then
      apk add --no-cache sudo
    fi
  fi
  sudo apt update
  sudo apt install -y build-essential libevent-dev libncurses5-dev libncursesw5-dev pkg-config bison byacc
fi

# Install chezmoi if not present
if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS chezmoi.io/get)"
fi

#Install mise if not present
if ! command -v mise >/dev/null 2>&1; then
  curl https://mise.run | sh
  echo 'eval "$(mise activate zsh)"' >>~/.zshrc
  source ~/.zshrc
fi

#Install devbox if not present
if false then
if ! command -v devbox >/dev/null 2>&1; then
  curl -fsSL https://get.jetify.com/devbox | bash
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
fi
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc 
echo 'export PATH="$PWD/bin:$PATH"' >> ~/.zshrc 
source ~/.zshrc
# Initialize chezmoi with your dotfiles
chezmoi init --apply https://github.com/FarizKesten/dotfiles.git
echo "🎉 Setup complete!"
