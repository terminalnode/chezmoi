local function ts()
	return require("telescope")
end
local function builtin()
	return require("telescope.builtin")
end
local function actions()
	return require("telescope.actions")
end

return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "plenary.nvim" },
			{ "telescope-fzf-native.nvim", build = "make" },
			{ "ripgrep" },
		},
		keys = {
			{
				"<leader>tf",
				function()
					builtin().find_files({ hidden = true })
				end,
				desc = "Find files with Telescope",
			},
			{
				"<leader>trg",
				function()
					builtin().live_grep()
				end,
				desc = "Grep content of files with Telescope",
			},
			{
				"<leader>th",
				function()
					builtin().help_tags()
				end,
				desc = "Find help tags with Telescope",
			},
			{
				"<leader>tb",
				function()
					builtin().buffers()
				end,
				desc = "Browser buffers with Telescope",
			},
			{
				"<leader>tgs",
				function()
					builtin().git_status()
				end,
				desc = "View git status with Telescope",
			},
			{
				"<leader>tgb",
				function()
					builtin().git_branches()
				end,
				desc = "View git branches with Telescope",
			},
			{
				"<leader>tgbc",
				function()
					builtin().git_bcommits()
				end,
				desc = "View git commits for current buffer with Telescope",
			},
			{
				"<leader>tgrc",
				function()
					builtin().git_commits()
				end,
				desc = "View git commits for current repository with Telescope",
			},
			{
				"<leader>td",
				function()
					builtin().lsp_definitions()
				end,
				desc = "View LSP definitions with Telescope",
			},
			{
				"<leader>ttd",
				function()
					builtin().lsp_type_definitions()
				end,
				desc = "View LSP type definitions with Telescope",
			},
			{
				"<leader>tlr",
				function()
					builtin().lsp_references()
				end,
				desc = "View LSP references with Telescope",
			},
			{
				"<leader>ti",
				function()
					builtin().lsp_implementations()
				end,
				desc = "View LSP implementations with Telescope",
			},
			{
				"<leader>tcs",
				function()
					builtin().lsp_document_symbols()
				end,
				desc = "View LSP document symbols with Telescope",
			},
			{
				"<leader>tcc",
				function()
					builtin().resume()
				end,
				desc = "Continue your previous telescope search",
			},
		},
		config = function()
			ts().setup({
				pickers = {
					find_files = {
						theme = "ivy",
					},

					help_tags = {
						theme = "ivy",
					},

					buffers = {
						mappings = {
							n = {
								["dd"] = actions().delete_buffer,
							},
							i = {
								["<C-d>"] = actions().delete_buffer,
							},
						},
					},
				},

				extensions = {
					fzf = {},
				},
			})

			ts().load_extension("fzf")
		end,
	},
}
