return {
  {
    "nmac427/guess-indent.nvim",
    opts = {},
  },
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      noautocmd = true,
      write_all_buffers = true,
    },
  },
  {
    "Wansmer/langmapper.nvim",
    priority = 1,
    lazy = false,
    vscode = true,
    opts = {
      hack_keymap = true,
    },
  },
}
