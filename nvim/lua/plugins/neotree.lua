return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				width = 30,
			},
			filesystem = {
				follow_current_file = {
					enable = true,
					leave_dirs_open = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", function()
			require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
		end, { desc = "Toggle NeoTree" })
		vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
	end,
}
