return {
  {
    "apyra/nvim-unity-sync",
    config = function()
      require("unity.plugin").setup({
        unity_cs_template = false,
      })
    end,
    ft = "cs",
  },
  {
    "mason-org/mason.nvim",
    lazy = true,
    config = function()
      require("mason").setup({
        registries = {
          "github:Crashdummyy/mason-registry",
          "github:mason-org/mason-registry",
        },
      })
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      filewatching = "roslyn",
    },
  },
}
