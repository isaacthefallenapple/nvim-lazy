return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        commit = "origin/master",
        pin = true,
        ---@class PluginLspOpts
        opts = {
            servers = {
                pyright = {},
                clangd = {},
                rust_analyzer = {},
                hls = {},
                lua_ls = {},
                zls = {},
                vls = {
                    root_dir = require("lspconfig").util.root_pattern("v.mod", ".git", "*.v"),
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

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "rust",
                "haskell",
                "zig",
                "v",
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
                ["<C-b>"] = cmp.mapping.scroll_docs( -4),
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
    }
}
