return {
  'lewis6991/gitsigns.nvim',
  version = "*",
  lazy = false,
  config = function ()
    require('gitsigns').setup {
      signs = {
        add = { text = "+" }, -- Indicator for added lines
        change = { text = "~" }, -- Indicator for changed lines
        delete = { text = "_" }, -- Indicator for deleted lines
        topdelete = { text = "‾" }, -- Indicator for deleted lines at the top
        changedelete = { text = "~" }, -- Indicator for changed and deleted lines
      },
      signcolumn = true, -- Always show the sign column when there are changes
      numhl = false, -- Disable number line highlighting (optional, for cleaner look)
      linehl = false, -- Disable full-line highlighting
      word_diff = false, -- Disable inline word diff
      attach_to_untracked = false, -- Only show signs for git-tracked files
      current_line_blame = false, -- Disable inline blame by default
      -- Optional: Watch git dir for changes to refresh signs
      watch_gitdir = {
        enable = true,
        interval = 1000, -- Check every 1000ms
      },
    }
  end,
}
