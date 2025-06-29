return {
  {
    "williamboman/mason.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "gopls", "ts_ls", "clangd", "pyright", "tailwindcss", "astro", "svelte" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    end,
  },
}
