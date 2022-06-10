require("zen-mode").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})
local keymap = require("user.utils").map
keymap("n", "<leader>z", "<cmd>ZenMode<cr>")
