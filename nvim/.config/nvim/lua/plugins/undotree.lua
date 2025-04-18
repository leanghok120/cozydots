return {
  "mbbill/undotree",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
  end
}
