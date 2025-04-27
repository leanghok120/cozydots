return {
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "hrsh7th/cmp-path",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "L3MON4D3/LuaSnip",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "saadparwaiz1/cmp_luasnip",     event = { "BufReadPost", "BufNewFile" } },
      { "rafamadriz/friendly-snippets", event = { "BufReadPost", "BufNewFile" } },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local cmp = require "cmp"
      require("luasnip.loaders.from_vscode").lazy_load()
      local options = {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-s>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      }

      require("cmp").setup(options)
    end,
  },
}
