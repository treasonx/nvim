-- Tab and indentation settings
vim.o.expandtab = true      -- Convert tabs to spaces
vim.o.tabstop = 2          -- Number of spaces a tab counts for
vim.o.softtabstop = 2      -- Number of spaces inserted when pressing tab
vim.o.shiftwidth = 2       -- Number of spaces for indentation
vim.o.smartindent = true   -- Enable smart indentation
vim.opt.termguicolors = true  -- Enable true color support
vim.cmd('syntax on')          -- Enable syntax highlighting

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", noremap = true, silent = true })
-- Auto-open NvimTree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("NvimTreeOpen")
  end,
  desc = "Open NvimTree on startup",
})

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")
