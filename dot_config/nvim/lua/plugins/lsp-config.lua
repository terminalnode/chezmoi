local function lsp_keymap(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local telescope = require("telescope.builtin")

  vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

  vim.keymap.set("n", "gd", telescope.lsp_definitions, bufopts)
  vim.keymap.set("n", "gtd", telescope.lsp_type_definitions, bufopts)
  vim.keymap.set("n", "gi", telescope.lsp_implementations, bufopts)
  vim.keymap.set("n", "gr", telescope.lsp_references, bufopts)
  vim.keymap.set("n", "<leader>ts", telescope.lsp_dynamic_workspace_symbols, bufopts)
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

        hls = {
          silent = false,
          filetypes = { "haskell", "lhaskell", "cabal" },
        },

        css_variables = { silent = true },
        tailwindcss = { silent = true },
        eslint = { silent = true },
        prismals = { silent = false },
        ts_ls = {
          silent = false,
          capabilities = {
            documentFormattingProvider = false,
            documentRangeFormattingProvider = false
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
          prefix = '■',
          spacing = 4
        },
        signs = true,
        severity_sort = true,
        float = {
          header = '',
          source = true,
          border = 'rounded'
        }
      })

      -- Configure LSPs
      for server, config in pairs(opts.servers) do
        config.capabilities = blink.get_lsp_capabilities(config.capabilities)
        config.on_attach = function(_, bufnr)
          lsp_keymap(bufnr)
        end
        c[server].setup(config)
      end
    end,
  },
}
