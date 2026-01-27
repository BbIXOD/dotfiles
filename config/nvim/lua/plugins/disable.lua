return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hint = opts.inlay_hint or {}
      opts.inlay_hint.enable = false
    end,
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false,
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
}
