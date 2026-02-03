-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0 })

vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>Y", '"+Y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>Y", '"+Y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>p", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>p", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>P", '"+P', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>P", '"+P', { noremap = true, silent = true })

vim.keymap.set("i", "<c-e>", function()
  local nldocs = require("noice.lsp.docs")
  local message = nldocs.get("signature")
  nldocs.hide(message)
end)

vim.keymap.set("n", "<leader>,", function()
  require("snacks").picker.buffers({
    sort_lastused = true,
  })
end, { desc = "Open buffers" })

if vim.g.neovide then
  vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
  vim.api.nvim_set_keymap("n", "<sc-v>", 'l"+P', { noremap = true })
  vim.api.nvim_set_keymap("v", "<sc-v>", '"+P', { noremap = true })
  vim.api.nvim_set_keymap("c", "<sc-v>", '<C-o>l<C-o>"+<C-o>P<C-o>l', { noremap = true })
  vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>l"+Pli', { noremap = true })
  vim.api.nvim_set_keymap("t", "<sc-v>", '<C-\\><C-n>"+Pi', { noremap = true })
end
