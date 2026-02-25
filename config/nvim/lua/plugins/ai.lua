return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  opts = {
    filetypes = {
      TelescopePrompt = false,
      ["dap-repl"] = false,
      snacks_picker_input = false,
      text = false,
      markdown = false,
    },
  },
  keys = {
    { "i", "<A-f>", function() require("neocodeium").accept() end, { desc = "Accept completion" } },
    { "i", "<A-w>", function() require("neocodeium").accept_word() end, { desc = "Accept word" } },
    { "i", "<A-a>", function() require("neocodeium").accept_line() end, { desc = "Accept line" } },
    { "i", "<A-e>", function() require("neocodeium").cycle_or_complete() end, { desc = "Cycle next" } },
    { "i", "<A-r>", function() require("neocodeium").cycle_or_complete(-1) end, { desc = "Cycle prev" } },
    { "i", "<A-c>", function() require("neocodeium").clear() end, { desc = "Clear completion" } },
  },
}
