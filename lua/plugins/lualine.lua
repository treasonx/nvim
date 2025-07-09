return {
  'nvim-lualine/lualine.nvim',
  version = "*",
  lazy = false,
  dependencies = { 
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    local solarized_dark = require'lualine.themes.solarized_dark'
    require('lualine').setup {
      options = {
        theme = solarized_dark
      },
    }
  end,
}
