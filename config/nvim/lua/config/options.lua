vim.opt.clipboard = ""
vim.opt.timeoutlen = 1000

vim.opt.spell = true
vim.opt.spelllang = { "en", "uk" }

vim.opt.number = true

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.keymap.del("n", "i")
    vim.keymap.set("n", "i", "i", { noremap = true })
  end,
})

require("config.cursor")
require("config.langmap")
require("config.neovide")
