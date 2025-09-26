local servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "angularls",
  "emmet_ls",
  "gopls"
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Configurações específicas dos servidores como tabelas:
      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }

      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
        cmd = { "typescript-language-server.cmd", "--stdio" },
      }

      vim.lsp.config.angularls = {
        capabilities = capabilities,
        cmd = { "ngserver.cmd", "--stdio" },
        root_dir = require("lspconfig.util").root_pattern("angular.json"),
      }

      vim.lsp.config.html = {
        capabilities = capabilities,
      }

      vim.lsp.config.cssls = {
        capabilities = capabilities,
      }

      vim.lsp.config.emmet_ls = {
        capabilities = capabilities,
        filetypes = { "html", "css" },
      }

      vim.lsp.config.gopls = {
        capabilities = capabilities,
      }

      -- Ativa os servidores configurados
      vim.lsp.enable(servers)

      -- Mapeamento para hover
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })

      -- Para outras keymaps, considerar usar evento LspAttach para configurar por servidor
      -- vim.api.nvim_create_autocmd("LspAttach", {
      --   callback = function(args)
      --     local buf = args.buf
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     -- Map keys por buffer aqui
      --   end,
      -- })
    end,
  },
}
