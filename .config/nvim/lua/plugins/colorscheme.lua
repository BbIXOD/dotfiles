return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({})

    vim.schedule(function()
      local undo_hl = vim.api.nvim_get_hl(0, { name = "HighlightUndo" })
      vim.cmd("colorscheme nightfox")
      vim.api.nvim_set_hl(0, "HighlightUndo", { bg = undo_hl.bg })
    end)
  end,
}
