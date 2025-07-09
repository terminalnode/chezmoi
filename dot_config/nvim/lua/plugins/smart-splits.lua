local function ssplits()
	return require("smart-splits")
end

return {
	{
		"mrjones2014/smart-splits.nvim",
		keys = {
			{
				"<A-h>",
				function()
					ssplits().move_cursor_left()
				end,
				desc = "Move cursor left a pane",
			},
			{
				"<A-j>",
				function()
					ssplits().move_cursor_down()
				end,
				desc = "Move cursor down a pane",
			},
			{
				"<A-k>",
				function()
					ssplits().move_cursor_up()
				end,
				desc = "Move cursor up a pane",
			},
			{
				"<A-l>",
				function()
					ssplits().move_cursor_right()
				end,
				desc = "Move cursor right a pane",
			},
		},
	},
}
