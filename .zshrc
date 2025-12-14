# ============================================
# Homebrew PATH (must be first)
# ============================================
export PATH="/opt/homebrew/bin:$PATH"

# ============================================
# PATH Configuration
# ============================================
# Homebrew-installed tools
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# ============================================
# History Configuration
# ============================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ============================================
# Completion
# ============================================
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ============================================
# Version Management
# ============================================
# Initialize mise (must come before starship for proper path setup)
eval "$(mise activate zsh)"

# ============================================
# Prompt
# ============================================
# Initialize Starship prompt
eval "$(starship init zsh)"

# ============================================
# Productivity Tools
# ============================================
# Initialize fzf (fuzzy finder)
eval "$(fzf --zsh)"

# Initialize zoxide (smart cd)
eval "$(zoxide init zsh)"

# ============================================
# Aliases
# ============================================
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias cat='bat'
alias grep='rg'
alias find='fd'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias glog='git log --oneline --graph --decorate'

# Mise aliases
alias mi='mise install'
alias mu='mise use'
alias ml='mise list'
alias mx='mise exec'

# ============================================
# Custom Configuration
# ============================================

# Syntax highlighting and autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
