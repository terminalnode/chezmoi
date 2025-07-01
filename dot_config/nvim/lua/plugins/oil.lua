return {
	{
		"stevearc/oil.nvim",
		dependencies = { "mini.icons" }, -- Can also use nvim-web-devicons
		keys = {
			{ "-", "<Cmd>Oil<CR>", desc = "Run oil" },
		},

		---@module "oil"
		---@type oil.SetupOpts
		opts = {
			watch_for_changes = true,
			columns = {
				-- "mtime", "size",
				"icon",
				"permissions",
			},
			win_options = {
				signcolumn = "yes:2",
			},
		},
	},

	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = true,
	},
}
