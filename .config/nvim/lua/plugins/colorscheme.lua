return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        SignColumn = { bg = "#000000" }
      },
      palette_overrides = {
        dark1 = "#000000",
        dark2 = "#000000",
        dark0_hard = "#000000"
      }
    })
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox")
  end,
}
