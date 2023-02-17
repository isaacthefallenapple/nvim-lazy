return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        commit = "649137c",
        ---@class PluginLspOpts
        opts = {
            servers = {
                pyright = {},
                clangd = {},
                rust_analyzer = {},
                hls = {},
                lua_ls = {},
                zls = {},
            },
        },
    },
    },
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        debounce = 150,
        sources = {
          nls.builtins.formatting.isort,
          nls.builtins.formatting.black,
        },
      })
    end,
  },
}
