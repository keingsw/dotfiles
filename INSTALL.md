# Installation Guide

Complete installation guide for setting up iTerm2 + Starship + Mise terminal environment.

## Quick Install (Recommended)

If you already have this repository cloned:

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The script will:

- ✅ Install Homebrew (if not already installed)
- ✅ Install all dependencies from Brewfile
- ✅ Backup existing configurations
- ✅ Create symbolic links to dotfiles

---

## Fresh Machine Setup

Starting from a completely fresh macOS installation:

### 1. Install Xcode Command Line Tools

```bash
xcode-select --install
```

### 2. Clone This Repository

**Using HTTPS:**

```bash
git clone https://github.com/keingsw/dotfiles.git ~/dotfiles
```

**Using SSH (requires SSH key setup first):**

```bash
git clone git@github.com:keingsw/dotfiles.git ~/dotfiles
```

### 3. Run Installation Script

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### 4. Complete Manual Steps

Follow the post-installation instructions printed by the script.

---

## Manual Installation

If you prefer to install step-by-step instead of using the script:

### Step 1: Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew to your PATH:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Step 2: Install Dependencies

```bash
cd ~/dotfiles
brew bundle --file=Brewfile
```

### Step 3: Backup Existing Configurations

```bash
# Backup .zshrc if it exists
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)

# Backup starship config if it exists
[ -f ~/.config/starship.toml ] && cp ~/.config/starship.toml ~/.config/starship.toml.backup.$(date +%Y%m%d_%H%M%S)

# Backup mise config if it exists
[ -f ~/.config/mise/config.toml ] && cp ~/.config/mise/config.toml ~/.config/mise/config.toml.backup.$(date +%Y%m%d_%H%M%S)
```

### Step 4: Create Symbolic Links

```bash
# Create necessary directories
mkdir -p ~/.config/mise

# Link configurations
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/.config/mise/config.toml ~/.config/mise/config.toml
```

### Step 5: Reload Shell

```bash
source ~/.zshrc
```

---

## Post-Installation Setup

### 1. Configure iTerm2

#### Import Relaxed Color Theme

1. Open iTerm2
2. Go to **Preferences** (⌘,)
3. **Profiles → Colors → Color Presets → Import**
4. Navigate to `~/dotfiles/iterm2/relaxed-terminal-themes/iterm/relaxed.itermcolors`
5. Select the imported "relaxed" preset from the dropdown

#### Set as Default Terminal

1. **iTerm2 → Settings → General → Magic**
2. Click **"Make iTerm2 Default Term"**

Or via System Settings:

- **System Settings → Desktop & Dock → Default Terminal application → iTerm**

#### Enable Natural Text Editing

1. **Preferences → Profiles → Keys → Key Mappings → Presets**
2. Select **"Natural Text Editing"**

This allows Option+Arrow to jump words.

#### Set Minimal Theme

1. **Preferences → Appearance → Theme**
2. Select **"Minimal"**

#### Sync Preferences (Optional)

If you want iTerm2 to store preferences in your dotfiles:

1. **Preferences → General → Preferences**
2. Check **"Load preferences from a custom folder or URL"**
3. Set path to: `~/dotfiles/iterm2`

### 2. Install Nerd Font (Optional but Recommended)

For proper icon display in Starship:

```bash
brew install --cask font-fira-code-nerd-font
# or
brew install --cask font-jetbrains-mono-nerd-font
```

Then in iTerm2:

1. **Preferences → Profiles → Text → Font**
2. Select **"FiraCode Nerd Font"** or **"JetBrainsMono Nerd Font"**

### 3. Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 4. Set Up SSH Keys (For GitHub)

#### Generate SSH Key

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

Press Enter to accept default location, then optionally set a passphrase.

#### Add to SSH Agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

#### Add to GitHub

```bash
# Copy public key
cat ~/.ssh/id_ed25519.pub
```

1. Go to [github.com/settings/keys](https://github.com/settings/keys)
2. Click **New SSH key**
3. Paste your public key
4. Click **Add SSH key**

#### Test Connection

```bash
ssh -T git@github.com
# Should say: "Hi [username]! You've successfully authenticated..."
```

## What Gets Installed

### Core Tools

- **git** - Version control
- **starship** - Fast, customizable shell prompt
- **mise** - Unified version manager (replaces nvm, rbenv, pyenv)
- **iTerm2** - Modern terminal emulator

### Productivity Tools

- **fzf** - Fuzzy finder for files and command history
- **zoxide** - Smarter cd command
- **bat** - Better cat with syntax highlighting
- **eza** - Modern ls replacement
- **ripgrep** - Fast grep alternative
- **fd** - Fast find alternative
- **tree** - Directory tree viewer
- **lazygit** - Terminal UI for git

### Shell Enhancements

- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Syntax highlighting for commands
