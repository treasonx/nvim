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

-- relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true


vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", noremap = true, silent = true })
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", { desc = 'Telescope help tags' })
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

-- spell check for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function spell_suggestions()
  local word = vim.fn.expand('<cword>') -- Get word under cursor
  local suggestions = vim.fn.spellsuggest(word, 20) -- Get up to 20 suggestions
  if #suggestions == 0 then
    vim.notify("No spelling suggestions for '" .. word .. "'", vim.log.levels.INFO)
    return
  end

  pickers.new({}, {
    prompt_title = "Spelling Suggestions for '" .. word .. "'",
    finder = finders.new_table({
      results = suggestions,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd('normal! ciw' .. selection[1]) -- Replace word with suggestion
      end)
      return true
    end,
    layout_strategy = 'cursor', -- Position near cursor
    layout_config = {
      width = 0.4, -- 40% of window width
      height = 0.5, -- 50% of window height
    },
  }):find()
end

-- Replace your existing <leader>s keybinding
vim.keymap.set("n", "<leader>s", spell_suggestions, { desc = "Spell suggestions dropdown" })
