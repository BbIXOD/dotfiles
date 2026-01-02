vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false -- no spell checking
    vim.opt_local.syntax = "OFF" -- no syntax parsing
  end,
})
