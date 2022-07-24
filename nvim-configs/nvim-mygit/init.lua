-- require("user.impatient")
-- basic
-- require("user.utils")
require("user.options")
require("user.keymaps")
require("user.plugins")

-- core
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")

-- beauty
require("user.alpha")
require("user.colorscheme")
require("user.lualine")
require("user.bufferline")
require("user.nvim-tree")
-- require("user.nnn")

-- unnecessary
require("user.null-ls")

-- tools
require("user.comment")
require("user.autopairs")
require("user.which-key")
require("user.indent-blankline")
require("user.toggleterm")

-- require("user.gitsigns")
require("user.project")

-- new installed waiting for test
require("user.dap")
require("user.zen-mode")

require("user.luasnip")
require("user.diffview")

-- local modules = {
--   "user.options",
--   "user.keymaps",
--   "user.plugins",
--   "user.nvim-tree",
-- }
--
--
-- -- Refresh module cache
-- for k, v in pairs(modules) do
--    -- require("plenary.reload").reload_module(v)
--    package.loaded[v] = nil
--    require(v)
-- end
--
-- require("user.reload")
--
-- rel = function()
--     for k, v in pairs(modules) do
--        require("plenary.reload").reload_module(v)
--     end
--    vim.notify("reload config")
-- end
--
require('nvim_comment').setup()
