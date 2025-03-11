return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				go = { "gofumpt", "golines", "goimports-reviser" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = false,
		})

    vim.keymap.set({"n", "v"}, "<leader>fm", function ()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, {desc = "formating file"})
	end,
}
