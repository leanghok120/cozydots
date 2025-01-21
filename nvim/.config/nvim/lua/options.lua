vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.showmode = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.fillchars = 'eob: '

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10

vim.opt.updatetime = 50

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
