return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.inlay_hint = opts.inlay_hint or {}
    opts.inlay_hint.enable = false
  end,
}
