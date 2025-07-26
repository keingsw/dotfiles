#!/bin/zsh

# Install Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh is already installed."
else
  echo "Installing Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k
POWERLEVEL10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ -d "$POWERLEVEL10K_DIR" ]; then
  echo "Powerlevel10k is already installed."
else
  echo "Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL10K_DIR"
fi

echo "🤛 oh-my-zsh setup complete!"