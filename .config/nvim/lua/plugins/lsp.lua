return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "gopls", "html", "cssls" }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
      vim.keymap.set('n', 'gca', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references)
      vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations)
      vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
      vim.keymap.set('n', 'grt', require('telescope.builtin').lsp_type_definitions)

      vim.diagnostic.config({ virtual_text = true })
      vim.lsp.enable("gopls")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")
      vim.lsp.enable("lua_ls")
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { -- autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        go = { "golangci-lint", "goimports", "gofumpt" }
      },
    },
  },
  { -- completions
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
