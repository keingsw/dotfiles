#!/bin/zsh

# Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install packages
echo "Installing packages..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install jq
brew install mise

# 完了メッセージ
echo "Brew packages installation complete!"