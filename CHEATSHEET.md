# Neovim Keybindings Cheatsheet

> **Leader key**: `Space`

## Key Mnemonics Guide

### Leader Key Prefixes
- `a` = **A**utoswap parameters (treesitter)
- `C` = **C**laude AI operations
- `b` = **B**uffer operations
- `d` = **D**iagnostics
- `f` = **F**ind (files, text, help)
- `g` = **G**it operations
- `r` = **R**ename (LSP)
- `s` = **S**plit (windows) / **S**earch
- `S` = **S**ession (uppercase = workspace)
- `t` = **T**oggles (settings on/off)
- `w` = **W**orkspace / **W**rite
- `z` = **Z**pell (spell checking)

### Standard Vim/Neovim Conventions
- `g` prefix = **G**o to (gd, gr, gi, gy)
- `[` / `]` = Navigate backward/forward
- `K` = Documentation (hover)

## File Management

| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>t` | Toggle file tree | Open/close NvimTree sidebar | **T**ree |
| `<leader>e` | Focus file tree | Move cursor to NvimTree | **E**xplorer |

## Finding & Searching

### Telescope (f = Find)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>ff` | Find files | Search for files by name | **F**ind **F**iles |
| `<leader>fg` | Live grep | Search file contents | **F**ind by **G**rep |
| `<leader>fh` | Help tags | Search help documentation | **F**ind **H**elp |
| `<leader>fr` | Recent files | Show recently opened files | **F**ind **R**ecent |
| `<leader>fc` | Commands | List available commands | **F**ind **C**ommands |
| `<leader>fk` | Keymaps | Browse all keymaps | **F**ind **K**eymaps |
| `<leader>fm` | Marks | List all marks | **F**ind **M**arks |

### Search Operations
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>/` | Search in buffer | Fuzzy find in current buffer | Quick search |
| `<leader>ss` | Search string | Search word under cursor | **S**earch **S**tring |

## Buffer Management

### Buffer Operations (b = Buffer)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>bb` | Browse buffers | Telescope fuzzy search buffers | **B**uffer **B**rowse |
| `<leader>bd` | Delete buffer | Close current buffer | **B**uffer **D**elete |
| `<leader>bD` | Force delete | Close without saving | **B**uffer **D**elete! |
| `<leader>bn` | Next buffer | Go to next buffer | **B**uffer **N**ext |
| `<leader>bp` | Previous buffer | Go to previous buffer | **B**uffer **P**revious |
| `<leader>bl` | List buffers | Show numbered list to switch | **B**uffer **L**ist |
| `<leader>bo` | Close others | Close all other buffers | **B**uffer **O**thers |
| `<leader>br` | Close right | Close buffers to the right | **B**uffer **R**ight |
| `<S-h>` | Previous buffer | Quick previous | Shift + h |
| `<S-l>` | Next buffer | Quick next | Shift + l |
| `[b` | Previous buffer | Bracket navigation | Previous |
| `]b` | Next buffer | Bracket navigation | Next |
| `<leader><leader>` | Alternate buffer | Toggle current/previous buffer | Quick toggle |
| `<BS>` | Alternate buffer | Toggle current/previous buffer | Backspace |

### BufferLine Visual Picker
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>bp` | Pick buffer | Show letters on buffers, press to jump | **B**uffer **P**ick |
| `<leader>bc` | Pick to close | Show letters on buffers, press to close | **B**uffer **C**lose |
| `<leader>bh` | Close left | Close all buffers to the left | **B**uffer **H** (left) |
| `<leader>bl` | Close right | Close all buffers to the right | **B**uffer **L** (right) |
| `<leader>bD` | Sort by directory | Sort buffers by directory | **B**uffer **D**irectory |
| `<leader>bL` | Sort by language | Sort buffers by file extension | **B**uffer **L**anguage |

### Quick Buffer Access
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>1` | Go to buffer 1 | Jump to buffer in position 1 | Direct access |
| `<leader>2` | Go to buffer 2 | Jump to buffer in position 2 | Direct access |
| `<leader>3` | Go to buffer 3 | Jump to buffer in position 3 | Direct access |
| `<leader>4` | Go to buffer 4 | Jump to buffer in position 4 | Direct access |
| `<leader>5` | Go to buffer 5 | Jump to buffer in position 5 | Direct access |
| `<leader>6` | Go to buffer 6 | Jump to buffer in position 6 | Direct access |
| `<leader>7` | Go to buffer 7 | Jump to buffer in position 7 | Direct access |
| `<leader>8` | Go to buffer 8 | Jump to buffer in position 8 | Direct access |
| `<leader>9` | Go to buffer 9 | Jump to buffer in position 9 | Direct access |

## Session Management

### Sessions (S = Session - uppercase for workspace)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>Ss` | Search sessions | Browse saved sessions | **S**ession **s**earch |
| `<leader>Sd` | Delete session | Delete current session | **S**ession **d**elete |
| `<leader>Sr` | Restore session | Restore last session | **S**ession **r**estore |
| `<leader>Sw` | Save session | Save current session | **S**ession **w**rite |

## Window Management

### Splits (s = split - lowercase for windows)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>sv` | Split vertically | Create vertical split | **s**plit **v**ertical |
| `<leader>sh` | Split horizontally | Create horizontal split | **s**plit **h**orizontal |
| `<leader>se` | Equal splits | Make all splits equal size | **s**plit **e**qual |
| `<leader>sx` | Close split | Close current split | **s**plit e**x**it |

### Navigation
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<C-h>` | Go left | Move to left window | Ctrl + h (left) |
| `<C-j>` | Go down | Move to lower window | Ctrl + j (down) |
| `<C-k>` | Go up | Move to upper window | Ctrl + k (up) |
| `<C-l>` | Go right | Move to right window | Ctrl + l (right) |

### Resizing
| Key | Action | Description |
|-----|--------|-------------|
| `<C-Up>` | Height + | Increase window height |
| `<C-Down>` | Height - | Decrease window height |
| `<C-Left>` | Width - | Decrease window width |
| `<C-Right>` | Width + | Increase window width |

## Git Integration

### Git (g = Git)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>gc` | Git commits | Browse git commits | **G**it **C**ommits |
| `<leader>gb` | Git branches | List git branches | **G**it **B**ranches |
| `<leader>gs` | Git status | Show git status | **G**it **S**tatus |

## LSP (Language Server)

### Standard LSP Navigation (g = go)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `gd` | Go to definition | Jump to definition (Telescope) | **g**o **d**efinition |
| `gD` | Go to declaration | Jump to declaration | **g**o **D**eclaration |
| `gr` | Go to references | Find all references (Telescope) | **g**o **r**eferences |
| `gi` | Go to implementation | Jump to implementation (Telescope) | **g**o **i**mplementation |
| `gy` | Go to type definition | Jump to type definition (Telescope) | **g**o t**y**pe |
| `K` | Hover | Show hover information | **K**nowledge |

### LSP Actions
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>rn` | Rename | Rename symbol | **R**e**n**ame |
| `<leader>ca` | Code action | Show available code actions | **C**ode **A**ction |
| `<leader>f` | Format | Format current buffer | **F**ormat |
| `<C-h>` | Signature help | Show signature (insert mode) | **h**elp |

### Diagnostics (d = Diagnostics)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>d` | Show diagnostic | Display line diagnostics | **D**iagnostic |
| `<leader>dd` | All diagnostics | Show all diagnostics | **D**iagnostic **D**isplay |
| `<leader>dl` | Location list | Send to location list | **D**iagnostic **L**ist |
| `[d` | Previous diagnostic | Jump to previous issue | Previous |
| `]d` | Next diagnostic | Jump to next issue | Next |

### Workspace
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>wa` | Add folder | Add workspace folder | **W**orkspace **A**dd |
| `<leader>wr` | Remove folder | Remove workspace folder | **W**orkspace **R**emove |
| `<leader>wl` | List folders | List workspace folders | **W**orkspace **L**ist |

## AI/Claude Code Integration

### Claude Operations (C = Claude)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>Cc` | Toggle Claude | Open/close Claude terminal | **C**laude **c**lose/open |
| `<leader>Cf` | Focus Claude | Smart focus/toggle Claude | **C**laude **f**ocus |
| `<leader>Cr` | Resume Claude | Resume previous conversation | **C**laude **r**esume |
| `<leader>CC` | Continue Claude | Continue with --continue flag | **C**laude **C**ontinue |
| `<leader>Cb` | Add buffer | Add current buffer to context | **C**laude **b**uffer |
| `<leader>Cs` | Send to Claude | Send selection (visual) or add file (tree) | **C**laude **s**end |
| `<leader>Ca` | Accept diff | Accept proposed changes | **C**laude **a**ccept |
| `<leader>Cd` | Deny diff | Reject proposed changes | **C**laude **d**eny |

### Claude Commands
| Command | Action | Description |
|---------|--------|-------------|
| `:ClaudeCode` | Toggle window | Toggle Claude Code terminal |
| `:ClaudeCodeFocus` | Smart focus | Focus or toggle Claude |
| `:ClaudeCodeSend` | Send selection | Send visual selection |
| `:ClaudeCodeAdd` | Add file | Add file to context |
| `:ClaudeCodeDiffAccept` | Accept changes | Accept diff changes |
| `:ClaudeCodeDiffDeny` | Reject changes | Reject diff changes |

## Toggles

### Toggle Settings (t = Toggle)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>tn` | Toggle numbers | Toggle relative line numbers | **T**oggle **N**umbers |
| `<leader>tw` | Toggle wrap | Toggle word wrap | **T**oggle **W**rap |
| `<leader>th` | Toggle highlights | Toggle search highlights | **T**oggle **H**ighlights |

## Spell Checking

### Spell (z = Zap spelling errors)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>z` | Spell suggestions | Show spelling suggestions for word | **Z**ap misspelling |
| `<leader>zs` | Toggle spell | Enable/disable spell checking | **Z**pell **s**witch |
| `[s` | Previous misspelling | Jump to previous error | Previous |
| `]s` | Next misspelling | Jump to next error | Next |
| `zg` | Add to dictionary | Mark word as correct | Good word |
| `zw` | Mark as wrong | Mark word as misspelled | Wrong word |

## Commenting

### Comment Operations (g = go, c = comment)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `gcc` | Toggle line comment | Comment/uncomment current line | **g**o **c**omment **c**urrent |
| `gbc` | Toggle block comment | Block comment current line | **g**o **b**lock **c**omment |
| `gc` + motion | Comment motion | Comment text object (e.g., `gcip` for paragraph) | **g**o **c**omment (motion) |
| `gb` + motion | Block comment motion | Block comment text object | **g**o **b**lock (motion) |
| `gcO` | Comment above | Add comment line above | **g**o **c**omment **O**ver |
| `gco` | Comment below | Add comment line below | **g**o **c**omment **o**ther |
| `gcA` | Comment end of line | Add comment at line end | **g**o **c**omment **A**ppend |

## Surround

### Normal Mode
| Key | Action | Description | Example |
|-----|--------|-------------|---------|
| `ys` + motion + char | Add surround | Surround motion with character | `ysiw"` - surround word with quotes |
| `yss` + char | Surround line | Surround entire line | `yss)` - surround line with parens |
| `yS` + motion + char | Add surround (new line) | Surround on new lines | `ySiw{` - surround word with braces on new lines |
| `ySS` + char | Surround line (new line) | Surround line on new lines | `ySS{` - surround line on new lines |
| `ds` + char | Delete surround | Remove surrounding character | `ds"` - delete surrounding quotes |
| `cs` + old + new | Change surround | Change surrounding character | `cs"'` - change double to single quotes |

### Visual Mode
| Key | Action | Description |
|-----|--------|-------------|
| `S` + char | Surround selection | Wrap selection with character |
| `gS` + char | Surround selection (new line) | Wrap selection on new lines |

## Motion & Navigation

### Leap (Quick Jump)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `s` + 2 chars | Jump forward | Jump to any forward occurrence | **s**eek forward |
| `S` + 2 chars | Jump backward | Jump to any backward occurrence | **S**eek backward |
| `gs` + 2 chars | Jump other windows | Jump across windows | **g**o **s**eek |

### Search Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `n` | Next match | Next search result (centered) |
| `N` | Previous match | Previous search result (centered) |

### Quickfix Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `]q` | Next item | Next quickfix entry |
| `[q` | Previous item | Previous quickfix entry |

## Editing

### Text Manipulation
| Key | Action | Description |
|-----|--------|-------------|
| `J` | Join lines | Join line below (cursor stays) |
| `<C-d>` | Scroll down | Half-page down (centered) |
| `<C-u>` | Scroll up | Half-page up (centered) |
| `<M-e>` | Fast wrap | Quick surround with auto-pairs |

### Parameter Swapping (Treesitter)
| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<leader>a` | Swap next | Swap with next parameter | **a**utoswap next |
| `<leader>A` | Swap previous | Swap with previous parameter | **A**utoswap previous |

### Visual Mode
| Key | Action | Description |
|-----|--------|-------------|
| `<` | Indent left | Decrease indentation |
| `>` | Indent right | Increase indentation |
| `J` | Move down | Move selected text down |
| `K` | Move up | Move selected text up |
| `p` | Paste | Replace without yanking |

## Quick Actions

| Key | Action | Description | Mnemonic |
|-----|--------|-------------|----------|
| `<C-s>` | Save | Save current file | Ctrl + **S**ave |
| `<leader>w` | Quick save | Save current file | **W**rite |
| `<leader>W` | Save all | Save all buffers | **W**rite all |
| `<leader>q` | Quit | Close current window | **Q**uit |
| `<leader>Q` | Quit all | Exit Neovim (force) | **Q**uit all |
| `<Esc>` | Clear highlights | Remove search highlighting | Escape |

## Which Key Help

Press `<leader>` and wait to see available keybindings for that prefix.

---

## Memory Tips & Patterns

### Common Patterns
1. **Standard LSP**: Use `g` prefix without leader (gd, gr, gi, gy)
2. **Double letters often mean "current"**: `gcc` (comment current), `yss` (surround current)
3. **Capital letters mean "bigger scope"**: `S` for Session, `D` for force delete
4. **Brackets navigate**: `[` goes backward, `]` goes forward
5. **Leader groups actions**: `<leader>b` for buffers, `<leader>d` for diagnostics

### Remember by Groups
- **Claude AI**: All start with `<leader>C` (capital)
- **Finding**: All start with `<leader>f`
- **Buffers**: All start with `<leader>b`
- **Diagnostics**: All start with `<leader>d`
- **Git**: All start with `<leader>g`
- **Toggles**: All start with `<leader>t`
- **Sessions**: All start with `<leader>S` (capital)
- **Splits**: All start with `<leader>s` (lowercase)

### Vim Conventions
- `g` = go to (navigation prefix)
- `d` = delete, `c` = change, `y` = yank (copy)
- `i` = inner, `a` = around (text objects)
- `K` = hover/help (uppercase for "Knowledge")
- `z` = folding and spelling

**Pro Tips:**
- Most keybindings follow logical patterns (gd = go definition)
- Use `<leader>fk` to search all keymaps if you forget one
- WhichKey will show you options after pressing `<leader>`
- Bracket pairs (`[`/`]`) consistently navigate backward/forward