return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-latte]])
			require("catppuccin").setup({
				flavour = "latte",
				dim_inactive = { enabled = true },
				integrations = {
					blink_cmp = { style = "bordered" },
					mason = true,
					mini = { enabled = true },
					noice = true,
					nvim_surround = true,
					snacks = true,
					telescope = { enabled = true },
					treesitter = true,
				},
			})
		end,
	},
}
