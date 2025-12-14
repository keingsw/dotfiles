#!/bin/bash
# ~/dotfiles/install.sh - Dotfiles installation script

set -e  # Exit on error

echo "================================"
echo "Dotfiles Installation Script"
echo "================================"
echo ""

# ============================================
# Check Homebrew Installation
# ============================================
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for this session
    if [[ $(uname -m) == 'arm64' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    echo "✓ Homebrew installed"
else
    echo "✓ Homebrew already installed"
fi

# ============================================
# Install Dependencies
# ============================================
echo ""
echo "Installing dependencies from Brewfile..."

# Check if Brewfile exists
if [ ! -f ~/dotfiles/Brewfile ]; then
    echo "❌ Error: Brewfile not found at ~/dotfiles/Brewfile"
    exit 1
fi

brew bundle --file=~/dotfiles/Brewfile
echo "✓ Dependencies installed"

# ============================================
# Backup Existing Configurations
# ============================================
echo ""
echo "Backing up existing configurations..."

backup_timestamp=$(date +%Y%m%d_%H%M%S)

if [ -f ~/.zshrc ]; then
    backup_file=~/.zshrc.backup.$backup_timestamp
    cp ~/.zshrc "$backup_file"
    echo "✓ Backed up .zshrc to $backup_file"
fi

if [ -f ~/.config/starship.toml ]; then
    backup_file=~/.config/starship.toml.backup.$backup_timestamp
    cp ~/.config/starship.toml "$backup_file"
    echo "✓ Backed up starship.toml to $backup_file"
fi

if [ -f ~/.config/mise/config.toml ]; then
    backup_file=~/.config/mise/config.toml.backup.$backup_timestamp
    cp ~/.config/mise/config.toml "$backup_file"
    echo "✓ Backed up mise config to $backup_file"
fi

# ============================================
# Link Configuration Files
# ============================================
echo ""
echo "Linking configuration files..."

# Create necessary directories
mkdir -p ~/.config/mise

# Link zsh config
ln -sf ~/dotfiles/.zshrc ~/.zshrc
echo "✓ Linked .zshrc"

# Link starship config
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
echo "✓ Linked starship.toml"

# Link mise config
ln -sf ~/dotfiles/.config/mise/config.toml ~/.config/mise/config.toml
echo "✓ Linked mise config"

# ============================================
# Post-Installation
# ============================================
echo ""
echo "================================"
echo "Installation Complete!"
echo "================================"
echo ""
echo "⚠️  Manual steps required:"
echo ""
echo "1. Import iTerm2 Relaxed theme:"
echo "   • Open iTerm2"
echo "   • Preferences → Profiles → Colors → Color Presets → Import"
echo "   • Select: ~/dotfiles/iterm2/relaxed-terminal-themes/iterm/relaxed.itermcolors"
echo "   • Choose 'relaxed' from Color Presets dropdown"
echo ""
echo "2. Configure iTerm2 preferences sync (optional):"
echo "   • Preferences → General → Preferences"
echo "   • Check 'Load preferences from a custom folder or URL'"
echo "   • Set to: ~/dotfiles/iterm2"
echo ""
echo "3. Set iTerm2 as default terminal:"
echo "   • iTerm2 → Settings → General → Magic"
echo "   • Click 'Make iTerm2 Default Term'"
echo ""
echo "4. Reload your shell:"
echo "   source ~/.zshrc"
echo ""
echo "5. Install Node.js (or other runtimes):"
echo "   mise use --global node@lts"
echo ""
echo "6. (Optional) Configure Git:"
echo "   git config --global user.name 'Your Name'"
echo "   git config --global user.email 'your.email@example.com'"
echo ""