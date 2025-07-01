return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				highlight = {
					enable = true,
				},
				sync_install = false,
				ignore_install = {},
				ensure_installed = {
					"gitignore", -- Git
					"git_config",
					"gitcommit",
					"c", -- Programming
					"cpp",
					"python",
					"rust",
					"lua",
					"go", -- Programming, but it's Golang
					"gomod",
					"gosum",
					"gotmpl",
					"javascript", -- Javascript/Web
					"typescript",
					"css",
					"html",
					"markdown", -- Markdown
					"markdown_inline",
					"dockerfile", -- Other
					"terraform",
					"bash",
					"regex",
				},
				auto_install = true,
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Leader>si",
						node_incremental = "<Leader>si", -- Selection Init/Increment
						node_decremental = "<Leader>sd", -- Selection Decrement
						scope_incremental = "<Leader>sc", -- Selection SCope
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj
						keymaps = {
							["af"] = { query = "@function.outer" },
							["if"] = { query = "@function.inner" },
							["ac"] = { query = "@class.outer" },
							["ic"] = { query = "@class.inner" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
					},
				},
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
