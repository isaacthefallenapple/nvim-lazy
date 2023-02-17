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
    version = "*",
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- theme = "oxocarbon",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
    },
  },

  -- disable indentscope animation
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 50,
        animation = require("mini.indentscope").gen_animation.none()
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
        ["'"] = { neigh_pattern = '[^%a<&\\][^>]' },
      },
    },
  },

  -- configure which-key
  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        presets = {
          operators = false,
          motions = false,
        }
      }
    }
  }
}
