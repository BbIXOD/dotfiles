return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.auto_install = false
    opts.ensure_installed = {}
    opts.highlight = opts.highlight or {}
    opts.highlight.enable = true
  end,
}
