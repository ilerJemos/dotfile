return
-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
{
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Mason", "NeoConf" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',

      event = "LspAttach",
      opts = {}
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
    'folke/neoconf.nvim',
    'nvimdev/lspsaga.nvim',
  },
  config = function()
    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
      pyright = {},
      jsonls = {},
      gopls = {},
      dockerls = {},
      docker_compose_language_service = {},
      bashls = {},
      tsserver = {},
    }

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.keymap.set('n', '<space>f', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', require "telescope.builtin".lsp_definitions, opts)
        vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<cr>", opts)
        vim.keymap.set('n', 'gi', require "telescope.builtin".lsp_implementations, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename ++project<cr>", opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', "<cmd>Lspsaga code_action<CR>", opts)
        vim.keymap.set({ 'n', 'v' }, '<space>da', require "telescope.builtin".diagnostics, opts)
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
        vim.keymap.set('n', '<C-M-l>', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })

    require("neoconf").setup()
    require("neodev").setup()
    require("fidget").setup()
    require('lspsaga').setup()
    require("mason").setup()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            settings = servers[server_name],
            -- on_attach = on_attach,
            capabilities = capabilities,
          }
        end,
      }
    })

    -- Setup language servers.
    -- local lspconfig = require('lspconfig')
    -- lspconfig.gopls.setup {}
     
  end,

}
