local servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "angularls",
  "emmet_ls",
  "gopls"
  -- "powershell_es"
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        cmd = { "typescript-language-server.cmd", "--stdio" },
      })

      lspconfig.angularls.setup({
        capabilities = capabilities,
        cmd = { "ngserver.cmd", "--stdio" },
        root_dir = lspconfig.util.root_pattern("angular.json")
      })

      lspconfig.html.setup({
        capabilities = capabilities,
        -- cmd = { "html-languageserver.cmd", "--stdio" }
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
        -- cmd = { "css-languageserver.cmd", "--stdio" }
      })
      lspconfig.emmet_ls.setup({
        filetypes = { "html", "css" }
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      -- lspconfig.powershell_es.setup({
      --   cmd = { "../../../nvim-data/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1" },
      --   capabilities = capabilities,
      -- })
      --[[ for _, server in ipairs(servers) do
				lspconfig[server].setup {}
			end ]]

      -- Mapeamento de teclas para hover
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
      -- vim.keymap.set('n', 'gd', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
      -- vim.keymap.set('n', 'gi', '<cmd>tab split | lua vim.lsp.buf.implementation()<CR>',
      --   { noremap = true, silent = true })
      -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true })
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
    end
  }
}
