return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = vim.tbl_deep_extend("force", {}, {
          handlers = {
            ["language/status"] = function(_, result)
              vim.notify("JDTLS Status: " .. result, vim.log.levels.INFO)
            end,
            ["$/progress"] = function(_, _, _) end,
          },
          init_options = {
            bundles = {},
          },
          settings = {
            java = {
              project = {
                referencedLibraries = {
                  "/home/maksym/help/mpj/lib/mpj.jar",
                },
              },
            },
          },
        }),
      },
    },
  },
}
