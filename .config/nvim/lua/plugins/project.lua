return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          projects = {
            max_depth = 3,
            dev = {
              "~/projects",
              "~/help",
              "~/school",
            },
            patterns = {
              ".nvproj",
              ".git",
              "package.json",
              "Cargo.toml",
              "Makefile",
              ".env",
            },
          },
        },
      },
    },
  },
}
