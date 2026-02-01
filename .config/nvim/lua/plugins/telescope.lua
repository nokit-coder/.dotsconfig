return {
	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		opts = {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown {
					}
				}
			}
		},
		config = function()
			local buildin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>fg', buildin.find_files, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	}
}
