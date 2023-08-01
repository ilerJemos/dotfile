return {
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = true,
  },
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  -- event = "VeryLazy",
  --   opts = true,
  -- },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    opts = {
      chunk = {
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "─",
        },
        style = "#00ffff",
      },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end

  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require('illuminate').configure()
    end
  },
}
