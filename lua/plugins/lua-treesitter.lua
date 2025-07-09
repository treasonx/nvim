return {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  lazy = false,
  dependencies = {
  },
  config = function()
    require("nvim-treesitter").setup {
      ensure_installed = { "python", "javascript", "typescript", "lua", "markdown", "markdown_inline" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
      highlight = {
        enable = true,
      },
    }
  end,
}
