local opt = { noremap = true, nowait = true }
return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,                             -- false will only do exact matching
          override_generic_sorter = true,           -- override the generic sorter
          override_file_sorter = true,              -- override the file sorter
          case_mode = "smart_case",                 -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    require('telescope').load_extension('fzf')
    local tbuiltin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', tbuiltin.find_files, opt)
    vim.keymap.set('n', '<leader>fg', tbuiltin.live_grep, opt)
    vim.keymap.set('n', '<leader>fb', tbuiltin.buffers, opt)
    vim.keymap.set('n', '<leader>fh', tbuiltin.help_tags, opt)
    vim.keymap.set('n', '<leader>fo', tbuiltin.oldfiles, opt)

    vim.keymap.set('n', '<leader>fi', tbuiltin.builtin, opt)
    vim.keymap.set('n', '<leader>fm', tbuiltin.marks, opt)
    vim.keymap.set('n', '<leader>qf', tbuiltin.quickfix, opt)
    vim.keymap.set('n', '<leader>qc', tbuiltin.commands, opt)
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
  end,
}
