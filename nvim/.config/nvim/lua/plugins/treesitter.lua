return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "c", "lua", "go", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

      sync_install = false,

      auto_install = true,

      highlight = {
        enable = true,
      },
    }
  end,
}
