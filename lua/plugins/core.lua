return {
  -- colorscheme
  {
    "jacoborus/tender.vim",
  },
  {
    "RRethy/nvim-base16",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
    version = false,
  },
  { "folke/lazy.nvim", version = false },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- theme = "oxocarbon",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- disable tab behavior
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  -- disable indentscope animation
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 50,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },

  -- fixes weird ciw behavior on startup
  {
    "echasnovski/mini.ai",
    lazy = false,
  },

  -- disable TreeSitter indent for Python (https://github.com/nvim-treesitter/nvim-treesitter/issues/1136)
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type TSConfig
    opts = {
      indent = {
        enable = true,
        disable = { "python" },
      },
    },
  },

  -- disable autoclose of ' for Rust lifetimes
  {
    "echasnovski/mini.pairs",
    opts = {
      mappings = {
        ["'"] = { neigh_pattern = "[^%a<&\\][^>]" },
      },
    },
  },

  -- configure which-key
  {
    "folke/which-key.nvim",
    enabled = false,
    opts = {
      plugins = {
        presets = {
          operators = false,
          motions = false,
        },
      },
    },
  },

  -- zig.vim
  {
    "ziglang/zig.vim",
    ft = "zig",
  },
}
