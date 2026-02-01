return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	auto_install = true,
	-- ensure_install = { "lua", "c", "c++", "python" },
	highlight = { enable = true },
	indent = { enable = true },
}
