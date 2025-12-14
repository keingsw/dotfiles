#!/bin/bash

# Dotfiles installation script

echo "Installing dotfiles..."

# Link zsh config
ln -sf ~/dotfiles/.zshrc ~/.zshrc
echo "✓ Linked .zshrc"

# Link starship config
mkdir -p ~/.config
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
echo "✓ Linked starship.toml"

# Link mise config
mkdir -p ~/.config/mise
ln -sf ~/dotfiles/.config/mise/config.toml ~/.config/mise/config.toml
echo "✓ Linked mise config"

echo ""
echo "Manual steps needed:"
echo "1. Import iTerm2 Relaxed theme:"
echo "   Preferences → Profiles → Colors → Color Presets → Import"
echo "   Select: ~/dotfiles/iterm2/colors/relaxed.itermcolors"
echo ""
echo "2. Load iTerm2 preferences (if backed up):"
echo "   Preferences → General → Preferences"
echo "   Check 'Load preferences from a custom folder or URL'"
echo "   Set to: ~/dotfiles/iterm2"
echo ""
echo "Done! Run 'source ~/.zshrc' to reload your shell."