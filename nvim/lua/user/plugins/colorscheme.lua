return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    dependencies = {
      "nvim-lualine/lualine.nvim",
      "nvim-tree/nvim-web-devicons",
      "utilyre/barbecue.nvim",
      "SmiteshP/nvim-navic",
    },
    config = function()
      vim.cmd [[colorscheme tokyonight-storm]]
      require('lualine').setup({
        options = {
          theme = 'tokyonight'
        },
      })
      require('barbecue').setup {
        theme = 'tokyonight',
      }
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    dependencies = {
      "nvim-lualine/lualine.nvim",
      "nvim-tree/nvim-web-devicons",
      "utilyre/barbecue.nvim",
      "SmiteshP/nvim-navic",
    },
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.o.background = "dark"
      -- vim.cmd([[colorscheme gruvbox]])
      vim.cmd.colorscheme 'gruvbox'
      require('lualine').setup({
        options = {
          theme = 'gruvbox'
        },
      })
      require('barbecue').setup {
        theme = 'gruvbox',
      }
    end
  },
  {
    'navarasu/onedark.nvim',
    enabled = false,
  }
}
