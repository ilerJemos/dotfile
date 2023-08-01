return {

  {
    "rhysd/accelerated-jk",
    config = function()
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was openedu
    config = function()
      require("persistence").setup()
      -- restore the session for the current directory
      vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

      -- restore the last session
      vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

      -- stop Persistence => session won't be saved on exit
      vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup {
        enable_check_bracket_line = false,
      }
    end
  },
  {
    -- go to last palce when open a file
    "ethanholz/nvim-lastplace",
    config = true,
  },
  {
    -- quick jump
    "folke/flash.nvim",
    enabled = false,
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    -- spell check
    "kamykn/spelunker.vim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      vim.g.spelunker_check_type = 2
    end
  },

  {
    -- markdown preview
    "ellisonleao/glow.nvim",
    event = "VeryLazy",
    config = true,
    cmd = "Glow"
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require("neo-tree").setup {
        window = {
          width = 20,
          mappings = {
            ["o"] = "open",
          },
        },
        -- vim.keymap.set({"n","v"},'<leader>e','<cmd>Neotree toggle float reveal<cr>')
        vim.keymap.set({ "n", "v" }, '<leader>e', '<cmd>Neotree toggle<cr>')
      }
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    'echasnovski/mini.nvim',
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.surround").setup()
    end,
  },

  {
    "s1n7ax/nvim-window-picker",
    opts = {
      filter_rules = {
        include_current_win = true,
        bo = {
          filetype = { "fidget", "neo-tree", "neo-tree-popup" }
        }
      }
    },
    config = function()
      vim.keymap.set("n",
        "<c-w>p",
        function()
          local window_number = require('window-picker').pick_window()
          if window_number then vim.api.nvim_set_current_win(window_number) end
        end
      )
    end
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  },

}
