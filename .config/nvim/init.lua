-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.hlsearch = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 10
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.updatetime = 300
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

vim.cmd("colorscheme retrobox")

-- keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<C-space>", "<C-x><C-o>")
vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("n", "<C-n>", ":Ex<CR>")
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("n", "<C-s>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- netrw
vim.g.netrw_banner = 0

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = '*',
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>w', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ':TSUpdate'
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "BufEnter",
		config = function()
			vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
			vim.keymap.set('n', 'gca', vim.lsp.buf.code_action)
			vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references)
			vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations)
			vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
			vim.keymap.set('n', 'grt', require('telescope.builtin').lsp_type_definitions)

			vim.lsp.enable({"gopls", "html", "cssls", "lua_ls", "clangd"})
		end
	},
})
