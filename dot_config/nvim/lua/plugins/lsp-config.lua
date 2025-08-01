local function lsp_keymap(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)

	-- [d and ]d are default in Neovim nowadays, keeping them commented out as a kind of documentation.
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>K", vim.lsp.buf.document_highlight, bufopts)
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"blink.cmp",
			"telescope.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		opts = {
			servers = {
				lua_ls = { silent = true },
				rust_analyzer = { silent = false },
				clangd = { silent = false },
				gopls = { silent = false },
				golangci_lint_ls = { silent = false },
				terraformls = { silent = false },
				pyright = { silent = false },

				hls = {
					silent = false,
					filetypes = { "haskell", "lhaskell", "cabal" },
				},

				css_variables = { silent = true },
				tailwindcss = { silent = true },
				prismals = { silent = false },

				eslint = {
					silent = false,
					settings = {
						workingDirectories = {
							{ mode = "auto" },
						},
					},
				},

				ts_ls = {
					silent = false,
					capabilities = {
						documentFormattingProvider = false,
						documentRangeFormattingProvider = false,
					},
				},
			},
		},
		config = function(_, opts)
			local blink = require("blink.cmp")
			local c = require("lspconfig")

			-- Show errors inline, everything else is visible with
			-- the diagnostics open float window keybinding up top
			vim.diagnostic.config({
				virtual_text = {
					severity = { min = vim.diagnostic.severity.ERROR },
					prefix = "■",
					spacing = 4,
				},
				signs = true,
				severity_sort = true,
				float = {
					header = "",
					source = true,
					border = "rounded",
				},
			})

			-- Configure LSPs
			for server, config in pairs(opts.servers) do
				config.capabilities = blink.get_lsp_capabilities(config.capabilities)
				config.on_attach = function(_, bufnr)
					lsp_keymap(bufnr)

					local clients = vim.lsp.get_clients({ bufnr = bufnr })
					for _, client in pairs(clients) do
						if client.server_capabilities.documentHighlightProvider then
							-- This will highlight all instances of something whenever the cursor moves
							-- over it. For example all references to a specific variable.
							vim.api.nvim_create_autocmd({ "CursorMoved" }, {
								pattern = { "*" },
								callback = function()
									vim.lsp.buf.clear_references()
									vim.lsp.buf.document_highlight()
								end,
							})
						end
					end
				end
				c[server].setup(config)
			end
		end,
	},
}
