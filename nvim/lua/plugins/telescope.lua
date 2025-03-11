return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<C-p>', builtin.find_files, {})
			vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
      vim.keymap.set('n', 'gd', function()
        builtin.lsp_definitions()
      end, {})
      vim.keymap.set('n', 'gD', function()
        builtin.lsp_declarations()
      end, {})
      vim.keymap.set('n', 'gi', function()
        builtin.lsp_implementations()
      end, {})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim"
	}
}
