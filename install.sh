#!/bin/bash
set -e
echo "🚀 Starting automated setup..."

# Install chezmoi if not present
if ! command -v chezmoi >/dev/null 2>&1; then
    sh -c "$(curl -fsLS chezmoi.io/get)"
fi

# Initialize chezmoi with your dotfiles
chezmoi init --apply https://github.com/YOUR_USERNAME/dotfiles.git

echo "🎉 Setup complete!"

