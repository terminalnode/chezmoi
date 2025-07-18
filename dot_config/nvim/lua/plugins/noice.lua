return {
	{
		"folke/noice.nvim",
		events = "VeryLazy",
		dependencies = { "nui.nvim" },
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
			},
		},
	},
}
