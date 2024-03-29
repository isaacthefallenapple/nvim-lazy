return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      opts.servers = {
        pyright = {},
        clangd = {},
        rust_analyzer = {
          ["rust-analzyer"] = {
            cargo = {
              features = "all",
            },
            check = {
              features = "all",
            },
          },
        },
        hls = {},
        lua_ls = { settings = { Lua = { workspace = { checkThirdParty = false }, format = { enable = false } } } },
        zls = { root_dir = require("lspconfig").util.root_pattern("build.zig") },
        vls = {
          root_dir = require("lspconfig").util.root_pattern("v.mod", ".git", "*.v"),
        },
        elmls = {},
        purescriptls = {},
        sourcekit = {},
      }
    end,
  },

  -- conform.nvim
  {
    "stevearc/conform.nvim",
    ---@type table<string, conform.FormatterUnit[]>
    opts = {
      formatters = {
        ["purescript-tidy"] = {
          command = "/home/timob/.local/share/nvim/mason/bin/purs-tidy",
          args = { "format" },
          stdin = true,
        },
        ["swift-format"] = {
          command = "/home/timob/.swift/swift-format/.build/release/swift-format",
        },
      },
      formatters_by_ft = {
        html = { "prettierd" },
        json = { "prettierd" },
        purescript = { "purescript-tidy" },
        swift = { "swift-format" },
      },
    },
  },

  -- null-ls
  -- {
  --   "nvimtools/none-ls.nvim",
  --   config = function(_, opts)
  --     local nls = require("null-ls")
  --     nls.setup(vim.tbl_extend("keep", {
  --       debounce = 150,
  --       sources = {
  --         nls.builtins.formatting.isort,
  --         nls.builtins.formatting.black,
  --         nls.builtins.formatting.stylua,
  --         nls.builtins.formatting.prettier.with({
  --           filetypes = { "css", "html", "json", "markdown" },
  --         }),
  --       },
  --     }, opts))
  --   end,
  -- },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
        "haskell",
        "zig",
        "v",
        "elm",
        "lua",
        "html",
        "sql",
        -- "swift",
      },
    },
  },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ select = false })
          else
            cmp.abort()
            fallback()
          end
        end,
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }
    end,
  },

  -- V
  {
    "ollykel/v-vim",
    event = "BufEnter *.v",
  },
}
