vim.opt.clipboard = ""
vim.opt.timeoutlen = 200

vim.opt.spell = true
vim.opt.spelllang = { "en", "uk" }

vim.opt.number = true

vim.g.python3_host_prog = "/usr/bin/python"
vim.g.python_host_prog = "/usr/bin/python"

require("config.cursor")
require("config.langmap")
require("config.neovide")
require("config.vscode")
require("config.term")
