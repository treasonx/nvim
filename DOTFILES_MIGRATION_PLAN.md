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
- **Scope**: All system configurations (shell, git, tmux, etc.)

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
│   ├── tmux/
│   │   └── tmux.conf            # ~/.config/tmux/tmux.conf (theme-aware)
│   ├── zsh/
│   │   ├── zshrc                # ~/.config/zsh/.zshrc
│   │   ├── zshenv               # ~/.config/zsh/.zshenv
│   │   └── aliases              # ~/.config/zsh/aliases
│   ├── bash/
│   │   ├── bashrc               # ~/.config/bash/bashrc
│   │   └── aliases              # ~/.config/bash/aliases
│   ├── alacritty/
│   │   └── alacritty.yml        # ~/.config/alacritty/alacritty.yml (theme-aware)
│   ├── kitty/
│   │   └── kitty.conf           # ~/.config/kitty/kitty.conf (theme-aware)
│   └── fontconfig/
│       └── fonts.conf           # ~/.config/fontconfig/fonts.conf
├── 
├── home/                        # Home directory dotfiles (~/)
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
│   └── env.template             # Environment variables template
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
# Bash configuration
mkdir -p ~/.dotfiles/config/bash
cp ~/.bashrc ~/.dotfiles/config/bash/bashrc 2>/dev/null || cat > ~/.dotfiles/config/bash/bashrc << 'EOF'
# ~/.config/bash/bashrc

# History settings
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Colored prompt
if [ -n "$force_color_prompt" ] || [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

# Aliases
if [ -f ~/.config/bash/aliases ]; then
    . ~/.config/bash/aliases
fi
EOF

# Common aliases
cat > ~/.dotfiles/config/bash/aliases << 'EOF'
# ~/.config/bash/aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Listing
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Nvim
alias vim='nvim'
alias vi='nvim'
EOF
```

#### Step 6: Add Terminal Configuration (if using Alacritty)
```bash
# Alacritty configuration (if you use it)
mkdir -p ~/.dotfiles/config/alacritty
if [ -f ~/.config/alacritty/alacritty.yml ]; then
    cp ~/.config/alacritty/alacritty.yml ~/.dotfiles/config/alacritty/
else
    cat > ~/.dotfiles/config/alacritty/alacritty.yml << 'EOF'
# ~/.config/alacritty/alacritty.yml

window:
  padding:
    x: 10
    y: 10

font:
  normal:
    family: "JetBrains Mono"
    style: Regular
  size: 13.0

colors:
  primary:
    background: '#1e1e2e'
    foreground: '#cdd6f4'

  cursor:
    text: '#1e1e2e'
    cursor: '#f5e0dc'

  normal:
    black: '#45475a'
    red: '#f38ba8'
    green: '#a6e3a1'
    yellow: '#f9e2af'
    blue: '#89b4fa'
    magenta: '#f5c2e7'
    cyan: '#94e2d5'
    white: '#bac2de'

  bright:
    black: '#585b70'
    red: '#f38ba8'
    green: '#a6e3a1'
    yellow: '#f9e2af'
    blue: '#89b4fa'
    magenta: '#f5c2e7'
    cyan: '#94e2d5'
    white: '#a6adc8'

key_bindings:
  - { key: V, mods: Control|Shift, action: Paste }
  - { key: C, mods: Control|Shift, action: Copy }
  - { key: Plus, mods: Control, action: IncreaseFontSize }
  - { key: Minus, mods: Control, action: DecreaseFontSize }
  - { key: Key0, mods: Control, action: ResetFontSize }
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
        ".bashrc"
        ".profile"
        ".inputrc"
        ".gitconfig"
        ".gitignore_global"
        ".config/git/config"
        ".config/git/ignore"
        ".config/alacritty/alacritty.yml"
        ".config/bash/bashrc"
        ".config/bash/aliases"
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
    
    log_info "Installation complete!"
    log_info "Backup created for any existing files"
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
    ".bashrc"
    ".profile"
    ".inputrc"
    ".gitconfig"
    ".gitignore_global"
)

# Config files to backup
CONFIG_FILES=(
    ".config/git/config"
    ".config/git/ignore"
    ".config/alacritty/alacritty.yml"
    ".config/bash/bashrc"
    ".config/bash/aliases"
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
    alacritty = "catppuccin-mocha",
    tmux = "catppuccin_mocha",
    kitty = "Catppuccin-Mocha"
  },
  ["catppuccin-latte"] = {
    alacritty = "catppuccin-latte", 
    tmux = "catppuccin_latte",
    kitty = "Catppuccin-Latte"
  },
  ["catppuccin-frappe"] = {
    alacritty = "catppuccin-frappe",
    tmux = "catppuccin_frappe", 
    kitty = "Catppuccin-Frappe"
  },
  ["catppuccin-macchiato"] = {
    alacritty = "catppuccin-macchiato",
    tmux = "catppuccin_macchiato",
    kitty = "Catppuccin-Macchiato"
  },
  ["gruvbox"] = {
    alacritty = "gruvbox-dark",
    tmux = "gruvbox",
    kitty = "gruvbox-dark"
  },
  ["tokyonight"] = {
    alacritty = "tokyo-night",
    tmux = "tokyo-night",
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
        string.format("~/.dotfiles/scripts/sync-theme-from-nvim.sh '%s' '%s' '%s' '%s'", 
          colorscheme, 
          theme_map.alacritty, 
          theme_map.tmux, 
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
# Arguments: $1=nvim_theme $2=alacritty_theme $3=tmux_theme $4=kitty_theme

NVIM_THEME="$1"
ALACRITTY_THEME="$2"
TMUX_THEME="$3" 
KITTY_THEME="$4"

# Log the theme change
echo "$(date): Syncing themes - Neovim: $NVIM_THEME" >> ~/.dotfiles/logs/theme-sync.log

# Update Alacritty theme if config exists
if [ -f ~/.config/alacritty/alacritty.yml ]; then
  # Update the import line or color scheme setting
  if grep -q "^import:" ~/.config/alacritty/alacritty.yml; then
    sed -i "s|import:.*|import: [\"~/.config/alacritty/themes/${ALACRITTY_THEME}.yml\"]|" ~/.config/alacritty/alacritty.yml
  elif grep -q "colors:" ~/.config/alacritty/alacritty.yml; then
    # If using inline colors, replace the entire colors section
    # This is more complex and may need custom logic per theme
    echo "Inline colors detected in Alacritty config - manual update needed"
  fi
fi

# Update tmux theme if config exists and tmux is running
if [ -f ~/.config/tmux/tmux.conf ]; then
  # Update tmux catppuccin plugin setting
  if grep -q "@catppuccin_flavour" ~/.config/tmux/tmux.conf; then
    sed -i "s/set -g @catppuccin_flavour.*/set -g @catppuccin_flavour '${TMUX_THEME}'/" ~/.config/tmux/tmux.conf
  fi
  
  # Reload tmux config if tmux is running
  if command -v tmux &> /dev/null && tmux list-sessions &> /dev/null 2>&1; then
    tmux source-file ~/.config/tmux/tmux.conf
    
    # Update all other nvim instances in tmux panes
    tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep -E "n?vim" | while read pane_id cmd; do
      # Only send to other nvim instances, not the one that triggered this
      if [ "$cmd" = "nvim" ] || [ "$cmd" = "vim" ]; then
        tmux send-keys -t "$pane_id" ":silent! colorscheme $NVIM_THEME" C-m 2>/dev/null || true
      fi
    done
  fi
fi

# Update Kitty theme if config exists
if [ -f ~/.config/kitty/kitty.conf ]; then
  # Update kitty theme include
  if grep -q "include.*theme" ~/.config/kitty/kitty.conf; then
    sed -i "s|include.*theme.*|include themes/${KITTY_THEME}.conf|" ~/.config/kitty/kitty.conf
  fi
  
  # Signal kitty to reload config if running
  if command -v kitty &> /dev/null; then
    pkill -USR1 kitty 2>/dev/null || true
  fi
fi

# Update terminal title to show current theme (optional)
if [ -n "$TMUX" ]; then
  tmux rename-window "nvim ($NVIM_THEME)" 2>/dev/null || true
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

#### Step 15: Create Logs Directory and Test Setup
```bash
# Create logs directory for theme sync logging
mkdir -p ~/.dotfiles/logs

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
./scripts/sync-theme-from-nvim.sh "catppuccin-mocha" "catppuccin-mocha" "catppuccin_mocha" "Catppuccin-Mocha"
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
- [ ] Verify theme propagation to terminal, tmux, and other tools
- [ ] Test shell aliases and functions
- [ ] Check git configuration

### Short-term (Week 1)
- [ ] Add more colorscheme mappings to theme-sync.lua
- [ ] Fine-tune theme propagation scripts for your specific tools
- [ ] Add SSH configuration template
- [ ] Create host-specific branches for different machines
- [ ] Add more shell utilities and aliases

### Long-term (Month 1)
- [ ] Add configurations for other tools (tmux, zsh, etc.)
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