return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			-- ensure_installed = { 'lua_ls', 'arduino_language_server', 'bashls', 'clangd', 'cssls', 'dockerls', 'python-lsp-server', 'hyprls' },
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- lspconfig.lua_ls.setup({ capabilities = capabilities })
			-- lspconfig.python_lsp_server.setup({ capabilities = capabilities })
			-- lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.arduino_language_server.setup {
				cmd = {
					"arduino-language-server",
					"-cli-config", "/home/austin/.arduino15/arduino-cli.yaml",
					"-fqbn", "arduino:uvr:uno",
					"-cli", "/usr/bin/arduino-cli",
					"-clangd", "/usr/bin/clangd"
				}
			}

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		opts = {
			multilines = {
				enabled = true,
			},
		},
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
