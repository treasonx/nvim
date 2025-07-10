# Dotfiles Migration Plan: From Nvim Config to Complete System Management

## Overview

This plan outlines the migration from your current well-organized Neovim configuration to a comprehensive dotfiles management system that can handle all your configuration files across multiple machines.

## Current State

- **Repository**: `~/.config/nvim/` (Git repository)
- **Structure**: Modular Lua-based Neovim configuration
- **Status**: Working, well-documented, organized

## Target State

- **Repository**: `~/.dotfiles/` (Comprehensive dotfiles repository)
- **Structure**: XDG-compliant, modular, multi-tool configuration
- **Management**: Automated with GNU Stow and Make
- **Theming**: Neovim-driven theme propagation to all system tools
- **Scope**: All system configurations (zsh, git, kitty, etc.)

---

## Tools and Resources

### Primary Tools

#### 1. GNU Stow
- **Purpose**: Symlink management for dotfiles
- **URL**: https://www.gnu.org/software/stow/
- **Status**: ✅ Already installed (Fedora)

#### 2. Git
- **Purpose**: Version control and synchronization
- **URL**: https://git-scm.com/
- **Already installed**: ✓

#### 3. Make
- **Purpose**: Task automation and workflow management
- **URL**: https://www.gnu.org/software/make/
- **Status**: ✅ Pre-installed on Fedora

#### 4. Theme Propagation System
- **Purpose**: Neovim-driven automatic theme synchronization across all tools
- **Components**: Neovim autocmds + shell scripts for theme mapping
- **Benefits**: Keep your existing themes, Neovim stays primary

#### 5. Standardized Key Mappings
- **Philosophy**: Neovim keybindings as the source of truth across all tools
- **Consistency**: `<C-hjkl>` navigation, `<S-hl>` for next/prev, `<leader>` patterns
- **Benefits**: Muscle memory works everywhere, reduced cognitive load

### Alternative Tools (for reference)

#### Theme Management Alternatives

**Wallust** (Pywal successor)
- **Purpose**: Generate color schemes from images
- **URL**: https://codeberg.org/explosion-mental/wallust
- **Installation**: `sudo dnf install wallust` (available in Fedora repos)
- **When to use**: Dynamic themes from wallpapers, replaces deprecated pywal

**Base16 Manager**
- **Purpose**: Alternative Base16 scheme manager
- **URL**: https://github.com/base16-manager/base16-manager
- **When to use**: Alternative to Flavours for Base16 management

#### Dotfiles Management Alternatives

**chezmoi**
- **Purpose**: Advanced dotfiles management with templating
- **URL**: https://chezmoi.io/
- **GitHub**: https://github.com/twpayne/chezmoi
- **When to use**: Cross-platform differences, templating needs

**yadm**
- **Purpose**: Git-wrapper for dotfiles management
- **URL**: https://yadm.io/
- **GitHub**: https://github.com/TheLocehiliosan/yadm
- **When to use**: Prefer git-centric workflow

**Bare Git Repository**
- **Purpose**: Minimal overhead dotfiles tracking
- **Guide**: https://www.atlassian.com/git/tutorials/dotfiles
- **When to use**: Minimal tooling, advanced git users

---

## Proposed Directory Structure

```
~/.dotfiles/
├── README.md                    # Main documentation
├── MIGRATION_PLAN.md            # This file
├── install.sh                   # Setup script
├── Makefile                     # Common tasks automation
├── .gitignore                   # Ignore sensitive files
├── .stow-global-ignore          # Files to ignore during stow
├── 
├── config/                      # XDG config files (~/.config/)
│   ├── nvim/                    # Your existing nvim config (enhanced)
│   │   ├── init.lua
│   │   ├── lua/
│   │   │   ├── config/
│   │   │   │   ├── theme-sync.lua    # Theme propagation autocmd
│   │   │   │   ├── keymaps.lua
│   │   │   │   ├── lazy.lua
│   │   │   │   └── settings.lua
│   │   │   └── plugins/
│   │   │       └── theme.lua         # Enhanced theme config
│   │   ├── lazy-lock.json
│   │   ├── CHEATSHEET.md
│   │   └── nvim-to-ideavimrc.py
│   ├── git/
│   │   ├── config               # ~/.config/git/config
│   │   └── ignore               # ~/.config/git/ignore
│   ├── zsh/
│   │   ├── zshrc                # ~/.config/zsh/.zshrc
│   │   ├── zshenv               # ~/.config/zsh/.zshenv
│   │   └── aliases              # ~/.config/zsh/aliases
│   ├── kitty/
│   │   └── kitty.conf           # ~/.config/kitty/kitty.conf (theme-aware)
│   └── fontconfig/
│       └── fonts.conf           # ~/.config/fontconfig/fonts.conf
├── 
├── home/                        # Home directory dotfiles (~/)
│   ├── .zshenv                  # ~/.zshenv (points to XDG config)
│   ├── .profile                 # ~/.profile
│   ├── .inputrc                 # ~/.inputrc
│   ├── .gemrc                   # ~/.gemrc
│   └── .npmrc                   # ~/.npmrc
├── 
├── scripts/                     # Utility scripts
│   ├── backup-configs.sh        # Backup existing configs
│   ├── install-packages.sh      # Install required packages
│   ├── setup-dev-env.sh         # Development environment setup
│   ├── update-system.sh         # System update automation
│   └── sync-theme-from-nvim.sh  # Neovim-triggered theme propagation script
├── 
├── templates/                   # Template files for customization
│   ├── gitconfig.template       # Git config template
│   ├── ssh_config.template      # SSH config template
│   ├── env.template             # Environment variables template
│   └── zshrc.local.template     # Local zsh config template (sensitive data)
├── 
└── host-specific/               # Machine-specific configurations
    ├── work/                    # Work machine overrides
    │   ├── config/
    │   └── home/
    ├── personal/                # Personal machine overrides
    │   ├── config/
    │   └── home/
    └── server/                  # Server-specific configs
        ├── config/
        └── home/
```

---

## Standardized Key Mapping Philosophy

This dotfiles setup implements **Neovim-centric key mappings** across all tools for maximum consistency and muscle memory efficiency.

### Core Principles

1. **Neovim as Source of Truth**: All key mappings derive from your Neovim configuration
2. **Consistent Navigation**: `<C-hjkl>` for directional movement everywhere
3. **Universal Patterns**: `<S-hl>` for next/previous, `<leader>` for complex operations
4. **No Conflicts**: Terminal and Neovim bindings complement each other

### Key Mapping Standards

#### Navigation (Universal)
- **`<C-h>`** → Move left (windows, panes, etc.)
- **`<C-j>`** → Move down
- **`<C-k>`** → Move up  
- **`<C-l>`** → Move right

#### Next/Previous (Universal)
- **`<S-h>`** → Previous (buffers, tabs, etc.)
- **`<S-l>`** → Next (buffers, tabs, etc.)

#### System Operations
- **`<C-s>`** → Save (disabled in terminal to avoid conflicts)
- **`q`** → Quick quit (shell alias matches `<leader>q`)
- **`e`** → Quick edit (shell alias matches editor preference)

#### Split/Window Management
- **`<C-S-v>`** → Vertical split
- **`<C-S-s>`** → Horizontal split  
- **`<C-S-x>`** → Close window/split

#### Copy/Paste (System)
- **`<C-S-c>`** → Copy to system clipboard
- **`<C-S-v>`** → Paste from system clipboard

### Tool-Specific Implementation

#### Kitty Terminal
- Inherits all navigation patterns from Neovim
- Tab management mirrors buffer navigation
- Window splits use same keybinds as Neovim

#### Zsh Aliases  
- `q` = `exit` (matches `<leader>q` quit pattern)
- `e` = `nvim` (matches editor preference)
- `reload` = source config (matches config reload patterns)

#### Git Aliases
- Consistent with Oh My Zsh git plugin
- Short, memorable patterns (`gs`, `ga`, `gc`, `gp`)
- Match common Neovim git integration bindings

### Benefits

✅ **Unified Experience**: Same muscle memory across all tools  
✅ **Reduced Cognitive Load**: No need to remember different keybinds per tool  
✅ **Neovim-First**: Your primary editor drives the entire system  
✅ **Conflict-Free**: Careful design prevents terminal/editor conflicts  
✅ **Extensible**: Easy to add new tools following the same patterns  

---

## Migration Steps

### Phase 1: Repository Setup (30 minutes)

#### Step 1: Create New Repository Structure
```bash
# Create the new dotfiles directory
mkdir -p ~/.dotfiles/{config,home,scripts,templates,host-specific}
cd ~/.dotfiles

# Initialize git repository
git init
git branch -m main
```

#### Step 2: Move Existing Nvim Config
```bash
# Move your existing nvim config to the new structure
mv ~/.config/nvim ~/.dotfiles/config/nvim

# Create symlink to maintain current functionality
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
```

#### Step 3: Create Essential Files
```bash
# Create .gitignore
cat > .gitignore << 'EOF'
# Sensitive files
*.key
*.pem
*_rsa
*_dsa
*_ecdsa
*_ed25519
.env
.env.local
.env.*.local

# Local configuration files with sensitive data
config/zsh/zshrc.local
**/zshrc.local
*.local

# SSH keys and config
config/ssh/config
home/.ssh/

# GPG keys
home/.gnupg/

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor files
.vscode/
*.swp
*.swo
*~

# Backup files
*.bak
*.backup
*.orig

# Log files
*.log

# Zsh history and cache
config/zsh/.zsh_history
config/zsh/.zcompdump*

# Oh My Zsh installation (managed separately)
oh-my-zsh/
EOF

# Create .stow-global-ignore
cat > .stow-global-ignore << 'EOF'
README.md
MIGRATION_PLAN.md
install.sh
Makefile
.gitignore
.stow-global-ignore
scripts
templates
host-specific
EOF
```

### Phase 2: Essential Configurations (1-2 hours)

#### Step 4: Add Git Configuration
```bash
# Copy existing git config
mkdir -p ~/.dotfiles/config/git
cp ~/.gitconfig ~/.dotfiles/config/git/config 2>/dev/null || echo "No existing .gitconfig found"
cp ~/.gitignore_global ~/.dotfiles/config/git/ignore 2>/dev/null || echo "No existing .gitignore_global found"

# If no existing config, create basic one
if [ ! -f ~/.dotfiles/config/git/config ]; then
    cat > ~/.dotfiles/config/git/config << 'EOF'
[user]
    name = Your Name
    email = your.email@example.com

[init]
    defaultBranch = main

[core]
    editor = nvim
    autocrlf = input
    excludesfile = ~/.config/git/ignore

[push]
    default = simple

[pull]
    rebase = false

[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --graph --decorate --all
EOF
fi
```

#### Step 5: Add Shell Configuration
```bash
# Zsh configuration with Oh My Zsh support
mkdir -p ~/.dotfiles/config/zsh

# Create base zshrc (without sensitive data)
cat > ~/.dotfiles/config/zsh/zshrc << 'EOF'
# ~/.config/zsh/.zshrc

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Theme (can be overridden in local config)
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    history-substring-search
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load aliases
if [[ -f ~/.config/zsh/aliases ]]; then
    source ~/.config/zsh/aliases
fi

# Load local configuration (for sensitive data, machine-specific settings)
if [[ -f ~/.config/zsh/zshrc.local ]]; then
    source ~/.config/zsh/zshrc.local
fi
EOF

# Create zshenv for environment setup
cat > ~/.dotfiles/config/zsh/zshenv << 'EOF'
# ~/.config/zsh/.zshenv

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Set ZDOTDIR to use XDG config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Path modifications
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
EOF

# Common aliases
cat > ~/.dotfiles/config/zsh/aliases << 'EOF'
# ~/.config/zsh/aliases

# Navigation (consistent with Neovim movement)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Listing (consistent patterns)
alias ll='ls -alF'
alias la='ls -A' 
alias l='ls -CF'
alias ls='ls --color=auto'

# Git shortcuts (matches Neovim git plugin patterns)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'

# Safety (interactive confirmations)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Editor (consistent with Neovim as primary)
alias vim='nvim'
alias vi='nvim'
alias e='nvim'  # Quick edit (matches leader+e pattern)

# Configuration editing (matches Neovim config patterns)
alias zshconfig="nvim ~/.config/zsh/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"

# System operations (consistent with Neovim save/quit patterns)
alias q='exit'  # Quick quit (matches leader+q)
alias reload='source ~/.config/zsh/.zshrc'  # Reload config

# Directory operations (matches Neovim buffer operations)  
alias md='mkdir -p'  # Make directory
alias rd='rmdir'     # Remove directory

# Process management (consistent with Neovim patterns)
alias ps='ps aux'
alias k='kill'
alias ka='killall'

# Oh My Zsh specific
alias ohmyzsh="nvim ~/.oh-my-zsh"
EOF

# Create template for local configuration (not tracked in git)
cat > ~/.dotfiles/templates/zshrc.local.template << 'EOF'
# ~/.config/zsh/zshrc.local
# This file is for machine-specific and sensitive configuration
# Copy this template to ~/.config/zsh/zshrc.local and customize

# API Keys and sensitive environment variables
# export OPENAI_API_KEY="your-key-here"
# export GITHUB_TOKEN="your-token-here"
# export AWS_ACCESS_KEY_ID="your-key-here"
# export AWS_SECRET_ACCESS_KEY="your-secret-here"

# Machine-specific paths
# export PATH="$HOME/custom-tools/bin:$PATH"

# Work-specific configuration
# alias work-vpn="sudo openvpn /path/to/work.ovpn"

# Personal aliases and functions
# alias myserver="ssh user@my-server.com"

# Override Oh My Zsh theme if desired
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Additional plugins for this machine
# plugins+=(docker kubectl)
EOF

echo "Created zshrc.local template at ~/.dotfiles/templates/zshrc.local.template"
echo "Copy this to ~/.config/zsh/zshrc.local and add your sensitive configuration"

# Create home directory .zshenv that points to XDG config
cat > ~/.dotfiles/home/.zshenv << 'EOF'
# ~/.zshenv - Set ZDOTDIR to use XDG config
export ZDOTDIR="$HOME/.config/zsh"
EOF
```

#### Step 6: Add Terminal Configuration (if using Kitty)
```bash
# Kitty configuration (if you use it)
mkdir -p ~/.dotfiles/config/kitty
if [ -f ~/.config/kitty/kitty.conf ]; then
    cp ~/.config/kitty/kitty.conf ~/.dotfiles/config/kitty/
else
    cat > ~/.dotfiles/config/kitty/kitty.conf << 'EOF'
# ~/.config/kitty/kitty.conf

# Font configuration
font_family JetBrains Mono
font_size 13.0

# Theme (Catppuccin Mocha)
include themes/Catppuccin-Mocha.conf

# Window settings
window_padding_width 10
remember_window_size yes

# Key bindings (consistent with Neovim)
# Copy/Paste (matches system clipboard bindings)
map ctrl+shift+c copy_to_clipboard
map ctrl+shift+v paste_from_clipboard

# Font size (matches Neovim font controls)  
map ctrl+plus change_font_size all +2.0
map ctrl+minus change_font_size all -2.0
map ctrl+0 change_font_size all 0

# Save (matches Neovim <C-s>)
map ctrl+s no_op

# Tab management (consistent with Neovim buffer navigation)
map ctrl+shift+t new_tab
map shift+l next_tab
map shift+h previous_tab
map ctrl+shift+q close_tab

# Window navigation (matches Neovim <C-hjkl>)
map ctrl+h neighboring_window left
map ctrl+j neighboring_window down  
map ctrl+k neighboring_window up
map ctrl+l neighboring_window right

# Split management (matches Neovim leader+s bindings)
map ctrl+shift+v launch --location=vsplit
map ctrl+shift+s launch --location=hsplit
map ctrl+shift+x close_window
EOF
fi
```

### Phase 3: Automation Setup (30 minutes)

#### Step 7: Create Makefile
```bash
cat > ~/.dotfiles/Makefile << 'EOF'
# Dotfiles Makefile

.PHONY: help install backup stow unstow update clean check

help:
	@echo "Available targets:"
	@echo "  install  - Full installation (backup + stow)"
	@echo "  backup   - Backup existing dotfiles"
	@echo "  stow     - Create symlinks using stow"
	@echo "  unstow   - Remove symlinks"
	@echo "  update   - Pull latest changes and re-stow"
	@echo "  clean    - Remove backup files"
	@echo "  check    - Check for conflicts"

install: backup stow
	@echo "Installation complete!"

backup:
	@echo "Backing up existing dotfiles..."
	@./scripts/backup-configs.sh

stow:
	@echo "Creating symlinks..."
	@stow -t ~ home
	@stow -t ~/.config config
	@echo "Symlinks created!"

unstow:
	@echo "Removing symlinks..."
	@stow -D -t ~ home
	@stow -D -t ~/.config config
	@echo "Symlinks removed!"

update:
	@echo "Updating dotfiles..."
	@git pull
	@make stow
	@echo "Update complete!"

clean:
	@echo "Cleaning backup files..."
	@rm -rf ~/.dotfiles-backup-*
	@echo "Cleanup complete!"

check:
	@echo "Checking for conflicts..."
	@stow -n -t ~ home
	@stow -n -t ~/.config config
	@echo "Check complete!"
EOF
```

#### Step 8: Create Installation Script
```bash
cat > ~/.dotfiles/install.sh << 'EOF'
#!/bin/bash

# Dotfiles Installation Script

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check if running on supported OS
check_os() {
    case "$(uname -s)" in
        Linux*) OS=Linux;;
        Darwin*) OS=Mac;;
        *) log_error "Unsupported OS: $(uname -s)"; exit 1;;
    esac
    log_info "Detected OS: $OS"
}

# Install required packages
install_packages() {
    log_info "Checking required packages..."
    
    # Check if stow is installed (should be already installed on Fedora)
    if ! command -v stow &> /dev/null; then
        log_warn "Stow not found. Installing via dnf..."
        sudo dnf install -y stow
    else
        log_info "Stow already installed ✓"
    fi
    
    # Check other dependencies
    for cmd in git make; do
        if ! command -v "$cmd" &> /dev/null; then
            log_warn "$cmd not found. Please install it manually."
        else
            log_info "$cmd already installed ✓"
        fi
    done
}

# Create backup of existing dotfiles
backup_existing() {
    log_info "Creating backup of existing dotfiles..."
    
    BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    # List of files to backup
    FILES_TO_BACKUP=(
        ".zshrc"
        ".zshenv"
        ".profile"
        ".inputrc"
        ".gitconfig"
        ".gitignore_global"
        ".config/git/config"
        ".config/git/ignore"
        ".config/kitty/kitty.conf"
        ".config/zsh/zshrc"
        ".config/zsh/zshenv"
        ".config/zsh/aliases"
    )
    
    for file in "${FILES_TO_BACKUP[@]}"; do
        if [ -f "$HOME/$file" ] || [ -d "$HOME/$file" ]; then
            log_info "Backing up $file"
            mkdir -p "$BACKUP_DIR/$(dirname "$file")"
            cp -r "$HOME/$file" "$BACKUP_DIR/$file"
        fi
    done
    
    log_info "Backup created at: $BACKUP_DIR"
}

# Main installation function
main() {
    log_info "Starting dotfiles installation..."
    
    check_os
    install_packages
    backup_existing
    
    log_info "Running stow..."
    make stow
    
    log_info "Setting up local configuration..."
    # Create local zsh config for sensitive data
    mkdir -p "$HOME/.config/zsh"
    if [ ! -f "$HOME/.config/zsh/zshrc.local" ]; then
        cp "$HOME/.dotfiles/templates/zshrc.local.template" "$HOME/.config/zsh/zshrc.local"
        log_info "Created local zsh config template at ~/.config/zsh/zshrc.local"
    fi
    
    log_info "Installation complete!"
    log_info "Backup created for any existing files"
    log_info "IMPORTANT: Edit ~/.config/zsh/zshrc.local to add your API keys and sensitive settings"
    log_info "You may need to restart your shell or source your new configurations"
}

# Run main function
main "$@"
EOF

chmod +x ~/.dotfiles/install.sh
```

#### Step 9: Create Backup Script
```bash
mkdir -p ~/.dotfiles/scripts

cat > ~/.dotfiles/scripts/backup-configs.sh << 'EOF'
#!/bin/bash

# Backup existing dotfiles before stow

BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Creating backup at: $BACKUP_DIR"

# Files to backup
FILES=(
    ".zshrc"
    ".zshenv"
    ".profile"
    ".inputrc"
    ".gitconfig"
    ".gitignore_global"
)

# Config files to backup
CONFIG_FILES=(
    ".config/git/config"
    ".config/git/ignore"
    ".config/kitty/kitty.conf"
    ".config/zsh/zshrc"
    ".config/zsh/zshenv"
    ".config/zsh/aliases"
)

# Backup home directory files
for file in "${FILES[@]}"; do
    if [ -f "$HOME/$file" ]; then
        echo "Backing up $file"
        cp "$HOME/$file" "$BACKUP_DIR/"
    fi
done

# Backup config files
for file in "${CONFIG_FILES[@]}"; do
    if [ -f "$HOME/$file" ]; then
        echo "Backing up $file"
        mkdir -p "$BACKUP_DIR/$(dirname "$file")"
        cp "$HOME/$file" "$BACKUP_DIR/$file"
    fi
done

echo "Backup complete!"
EOF

chmod +x ~/.dotfiles/scripts/backup-configs.sh
```

### Phase 4: Testing and Verification (15 minutes)

#### Step 10: Test the Setup
```bash
# Test stow dry run (no actual changes)
cd ~/.dotfiles
make check

# If no conflicts, proceed with installation
make install

# Verify symlinks were created
ls -la ~/.config/nvim  # Should show symlink to ~/.dotfiles/config/nvim
ls -la ~/.config/git   # Should show symlink to ~/.dotfiles/config/git (if you added it)
```

#### Step 11: Create README
```bash
cat > ~/.dotfiles/README.md << 'EOF'
# Personal Dotfiles

A comprehensive dotfiles management system using GNU Stow for symlink management.

## Quick Start

```bash
# Clone the repository
git clone <your-repo-url> ~/.dotfiles
cd ~/.dotfiles

# Install (will backup existing files and create symlinks)
make install
```

## Structure

- `config/` - XDG config files (symlinked to `~/.config/`)
- `home/` - Home directory dotfiles (symlinked to `~/`)
- `scripts/` - Utility scripts
- `templates/` - Template files for customization
- `host-specific/` - Machine-specific configurations

## Commands

```bash
make install    # Full installation (backup + stow)
make backup     # Backup existing dotfiles
make stow       # Create symlinks
make unstow     # Remove symlinks
make update     # Pull latest changes and re-stow
make check      # Check for conflicts
make clean      # Remove backup files
```

## Adding New Configurations

1. Add config files to appropriate directory (`config/` or `home/`)
2. Run `make stow` to create symlinks
3. Commit and push changes

## Tools Used

- [GNU Stow](https://www.gnu.org/software/stow/) - Symlink management
- [Git](https://git-scm.com/) - Version control
- [Make](https://www.gnu.org/software/make/) - Task automation
- Neovim autocmds - Theme change detection and propagation

## Neovim Configuration

The Neovim configuration is a modular setup using Lua and lazy.nvim plugin manager.
See `config/nvim/README.md` for detailed documentation.
EOF
```

### Phase 5: Neovim-Driven Theme Management (30 minutes)

#### Step 12: Create Theme Sync Autocmd Configuration
```bash
# Create theme synchronization module for Neovim
cat > ~/.dotfiles/config/nvim/lua/config/theme-sync.lua << 'EOF'
-- Theme synchronization configuration
-- Automatically propagate Neovim theme changes to other tools

local M = {}

-- Create autocmd group for theme synchronization
local theme_sync_group = vim.api.nvim_create_augroup("ThemeSync", {clear = true})

-- Map Neovim colorschemes to external tool themes
local theme_mappings = {
  ["catppuccin-mocha"] = {
    kitty = "Catppuccin-Mocha"
  },
  ["catppuccin-latte"] = {
    kitty = "Catppuccin-Latte"
  },
  ["catppuccin-frappe"] = {
    kitty = "Catppuccin-Frappe"
  },
  ["catppuccin-macchiato"] = {
    kitty = "Catppuccin-Macchiato"
  },
  ["gruvbox"] = {
    kitty = "gruvbox-dark"
  },
  ["tokyonight"] = {
    kitty = "tokyo-night"
  }
}

-- Setup theme synchronization
function M.setup()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function(args)
      local colorscheme = args.match
      
      -- Skip if it's the default colorscheme to avoid infinite loops
      if colorscheme == "default" then
        return
      end
      
      -- Get theme mapping or use defaults
      local theme_map = theme_mappings[colorscheme] or theme_mappings["catppuccin-mocha"]
      
      -- Execute theme sync script with mappings as arguments
      vim.fn.jobstart({
        "bash", "-c", 
        string.format("~/.dotfiles/scripts/sync-theme-from-nvim.sh '%s' '%s'", 
          colorscheme, 
          theme_map.kitty)
      }, {
        detach = true,
        on_exit = function(job_id, exit_code)
          if exit_code == 0 then
            vim.notify("Theme sync completed: " .. colorscheme, vim.log.levels.INFO)
          else
            vim.notify("Theme sync failed for: " .. colorscheme, vim.log.levels.WARN)
          end
        end
      })
    end,
    group = theme_sync_group,
  })
  
  vim.notify("Theme synchronization enabled", vim.log.levels.INFO)
end

return M
EOF
```

#### Step 13: Create Theme Propagation Script
```bash
cat > ~/.dotfiles/scripts/sync-theme-from-nvim.sh << 'EOF'
#!/bin/bash

# Neovim-driven theme synchronization script
# Arguments: $1=nvim_theme $2=kitty_theme

NVIM_THEME="$1"
KITTY_THEME="$2"

# Log the theme change
echo "$(date): Syncing themes - Neovim: $NVIM_THEME -> Kitty: $KITTY_THEME" >> ~/.dotfiles/logs/theme-sync.log

# Update Kitty theme if config exists
if [ -f ~/.config/kitty/kitty.conf ]; then
  # Update kitty theme include
  if grep -q "include.*theme" ~/.config/kitty/kitty.conf; then
    sed -i "s|include.*theme.*|include themes/${KITTY_THEME}.conf|" ~/.config/kitty/kitty.conf
    echo "Updated Kitty theme to: $KITTY_THEME"
  else
    echo "No theme include found in Kitty config - add 'include themes/${KITTY_THEME}.conf' manually"
  fi
  
  # Signal kitty to reload config if running
  if command -v kitty &> /dev/null; then
    pkill -USR1 kitty 2>/dev/null || true
    echo "Signaled Kitty to reload configuration"
  fi
else
  echo "Kitty config not found at ~/.config/kitty/kitty.conf"
fi

exit 0
EOF

chmod +x ~/.dotfiles/scripts/sync-theme-from-nvim.sh
```

#### Step 14: Update Neovim Init to Load Theme Sync
```bash
# Add theme sync to your Neovim init.lua
cat >> ~/.dotfiles/config/nvim/init.lua << 'EOF'

-- Load theme synchronization
require('config.theme-sync').setup()
EOF
```

#### Step 15: Create Local Configuration for Sensitive Data
```bash
# Create logs directory for theme sync logging
mkdir -p ~/.dotfiles/logs

# Create local zsh configuration for sensitive data
mkdir -p ~/.config/zsh
if [ ! -f ~/.config/zsh/zshrc.local ]; then
    cp ~/.dotfiles/templates/zshrc.local.template ~/.config/zsh/zshrc.local
    echo "Created ~/.config/zsh/zshrc.local from template"
    echo "Please edit this file to add your API keys and sensitive configuration"
fi

# Test the theme sync system
cd ~/.dotfiles

# Start Neovim and test theme switching
echo "Test theme synchronization by running:"
echo "  nvim"
echo "  :colorscheme catppuccin-latte"
echo "  :colorscheme catppuccin-mocha"
echo ""
echo "Check that other applications update automatically."

# Test the sync script directly
./scripts/sync-theme-from-nvim.sh "catppuccin-mocha" "Catppuccin-Mocha"

echo ""
echo "IMPORTANT: Edit ~/.config/zsh/zshrc.local to add your sensitive configuration"
echo "This file is gitignored and safe for API keys and personal settings"
```

### Phase 6: Git Setup and Remote (15 minutes)

#### Step 16: Initialize Git Repository
```bash
cd ~/.dotfiles
git add .
git commit -m "Initial dotfiles setup with Neovim-driven theme management

- Migrated from nvim-only config to comprehensive dotfiles
- Added stow-based symlink management
- Included automation with Makefile
- Created installation and backup scripts
- Organized structure following XDG standards
- Implemented Neovim-driven theme propagation system
- Added automatic theme synchronization across terminal tools"
```

#### Step 17: Push to Remote Repository
```bash
# Create a new repository on GitHub/GitLab
# Then add the remote and push
git remote add origin <your-repo-url>
git push -u origin main
```

---

## Post-Migration Tasks

### Immediate (Day 1)
- [ ] Test all symlinks work correctly
- [ ] Verify Neovim still functions properly
- [ ] Test theme synchronization system (`:colorscheme catppuccin-latte`)
- [ ] Verify theme propagation to Kitty terminal
- [ ] **Test standardized key mappings**:
  - [ ] `<C-hjkl>` navigation in Kitty windows
  - [ ] `<S-hl>` tab navigation in Kitty
  - [ ] `<C-S-v/s/x>` split management in Kitty
  - [ ] Shell aliases: `q`, `e`, `reload`
- [ ] Test shell aliases and functions
- [ ] Check git configuration
- [ ] **Edit ~/.config/zsh/zshrc.local to add your API keys and sensitive settings**
- [ ] Test Oh My Zsh functionality and plugins

### Short-term (Week 1)
- [ ] Add more colorscheme mappings to theme-sync.lua
- [ ] Fine-tune theme propagation for Kitty themes
- [ ] Add SSH configuration template
- [ ] Create host-specific branches for different machines
- [ ] Add more shell utilities and aliases

### Long-term (Month 1)
- [ ] Add configurations for other tools (tmux, alacritty, etc.) as needed
- [ ] Create automated setup scripts for new machines
- [ ] Document all configurations and keybindings
- [ ] Set up automated backups

---

## Troubleshooting

### Common Issues

#### Symlink Conflicts
```bash
# Check what's conflicting
make check

# Remove conflicting files (after backing up)
rm ~/.config/git/config  # Example
make stow
```

#### Stow Not Working
```bash
# Ensure you're in the dotfiles directory
cd ~/.dotfiles

# Check stow installation
which stow

# Verify directory structure
tree -a -I '.git'
```

#### Git Configuration Issues
```bash
# Check current git config
git config --list

# Verify symlink is working
ls -la ~/.config/git/config
```

### Recovery

If something goes wrong:
1. Restore from backup: `cp -r ~/.dotfiles-backup-[timestamp]/* ~/`
2. Remove symlinks: `make unstow`
3. Start over or fix issues

---

## Benefits of This Setup

1. **Version Control**: All configs tracked in git
2. **Portability**: Easy setup on new machines
3. **Modularity**: Easy to add/remove configurations
4. **Backup**: Automatic backup before changes
5. **Automation**: One-command installation
6. **Organization**: Clear structure following standards
7. **Flexibility**: Host-specific overrides possible

---

## Next Steps

1. **Execute the migration** following the steps above
2. **Test thoroughly** on your current machine
3. **Add more configurations** gradually
4. **Set up on other machines** to test portability
5. **Create host-specific configurations** as needed

This migration preserves your excellent Neovim setup while expanding it into a comprehensive, manageable dotfiles system.
EOF