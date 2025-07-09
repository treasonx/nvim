# Neovim Configuration

This is a modular Neovim configuration using Lua and the lazy.nvim plugin manager.

## Directory Structure

```
nvim/
├── init.lua                    # Entry point - loads config modules
├── lua/
│   ├── config/                 # Core configuration modules
│   │   ├── settings.lua        # Neovim options and settings
│   │   ├── keymaps.lua         # Global keymaps
│   │   ├── autocmds.lua        # Autocommands for various events
│   │   └── lazy.lua            # Plugin manager setup
│   └── plugins/                # Plugin configurations (one file per plugin)
│       ├── gitsigns.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── nvim-tree.lua
│       ├── peek.lua
│       ├── telescope.lua
│       ├── theme.lua
│       ├── treesitter.lua
│       └── whichkey.lua
└── lazy-lock.json              # Plugin version lock file
```

## Core Configuration

### Settings (`lua/config/settings.lua`)
- Tab/indentation settings (2 spaces)
- UI enhancements (line numbers, colors, etc.)
- Search behavior and file management
- Performance optimizations

### Keymaps (`lua/config/keymaps.lua`)
- Leader key: **Space**
- Window navigation: `<C-h/j/k/l>`
- Buffer navigation: `<S-h/l>`
- Split management: `<leader>s{v,h,e,x}`

### Autocmds (`lua/config/autocmds.lua`)
- Highlight yanked text
- Auto-remove trailing whitespace
- Restore cursor position
- Filetype-specific settings (Markdown, Python, Git commits)

## Plugins

### File Management

**nvim-tree** (`lua/plugins/nvim-tree.lua`)
- **Purpose**: File explorer sidebar
- **Problem solved**: Navigate and manage files without leaving Neovim
- **Configuration**: Auto-opens on startup when no files specified, filters dotfiles
- **Keymaps**: `<leader>t` (toggle), `<leader>e` (focus)

### Search & Navigation

**Telescope** (`lua/plugins/telescope.lua`)
- **Purpose**: Fuzzy finder for files, text, and more
- **Problem solved**: Quickly find and open files, search content, navigate symbols
- **Configuration**: Custom layout, hidden files support, integrated spell suggestions
- **Keymaps**: 
  - `<leader>ff` (find files)
  - `<leader>fg` (live grep)
  - `<leader>fb` (buffers)
  - `<leader>z` (spell suggestions)

### Git Integration

**Gitsigns** (`lua/plugins/gitsigns.lua`)
- **Purpose**: Git decorations and actions in buffers
- **Problem solved**: See git changes inline, stage hunks, preview diffs
- **Configuration**: Shows git status in sign column

### Language Support

**LSP** (`lua/plugins/lsp.lua`)
- **Purpose**: Language Server Protocol support
- **Problem solved**: IDE features like auto-completion, go-to-definition, diagnostics
- **Configuration**: Mason for LSP management, auto-format on save, diagnostic keymaps

**Treesitter** (`lua/plugins/treesitter.lua`)
- **Purpose**: Advanced syntax highlighting and code understanding
- **Problem solved**: Better highlighting, folding, and text objects
- **Configuration**: Auto-install parsers, enable highlighting and indentation

### UI Enhancements

**Lualine** (`lua/plugins/lualine.lua`)
- **Purpose**: Statusline
- **Problem solved**: Display file info, git status, diagnostics at a glance
- **Configuration**: Shows mode, file, git, diagnostics, location

**Catppuccin Theme** (`lua/plugins/theme.lua`)
- **Purpose**: Color scheme
- **Problem solved**: Consistent, pleasant color theme with good contrast
- **Configuration**: Mocha flavor (darkest variant), custom gutter colors for better visibility

**Which Key** (`lua/plugins/whichkey.lua`)
- **Purpose**: Displays available keybindings
- **Problem solved**: Discover and remember keybindings
- **Configuration**: Shows popup with available keys after pressing leader

### Writing Tools

**Peek** (`lua/plugins/peek.lua`)
- **Purpose**: Markdown preview
- **Problem solved**: Live preview of Markdown files
- **Configuration**: Opens preview in browser

**Spell Check** (integrated in `telescope.lua`)
- **Purpose**: Spell checking with Telescope integration
- **Problem solved**: Easy spell checking and correction
- **Configuration**: `<leader>z` for suggestions, `<leader>zs` to toggle

## Key Features

1. **Modular Design**: Each plugin has its own configuration file
2. **Lazy Loading**: Plugins load on-demand for faster startup
3. **Consistent Keymaps**: Space as leader, logical groupings
4. **Auto-setup**: Sensible defaults with minimal configuration needed
5. **Git-friendly**: Version locked dependencies

## Quick Start

1. Ensure Neovim 0.8+ is installed
2. Clone this config to `~/.config/nvim/`
3. Start Neovim - plugins will auto-install
4. Run `:checkhealth` to verify setup

## Common Tasks

- **Find files**: `Space ff`
- **Search text**: `Space fg`
- **File tree**: `Space t`
- **Spell check**: `Space z` (on misspelled word)
- **LSP actions**: `Space l` prefix
- **Git actions**: `Space g` prefix