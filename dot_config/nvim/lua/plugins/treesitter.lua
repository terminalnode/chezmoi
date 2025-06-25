return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "gitignore", "git_config", "gitcommit",     -- Git
          "c", "cpp", "python", "rust", "lua",        -- Programming
          "go", "gomod", "gosum", "gotmpl",           -- Golang
          "javascript", "typescript", "css", "html",  -- Javascript
          "markdown", "markdown_inline",              -- Markdown
          "dockerfile", "terraform", "bash", "regex", -- Other
        },
        auto_install = true,
        highlight = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<Leader>si",
            node_incremental  = "<Leader>si", -- Selection Init/Increment
            node_decremental  = "<Leader>sd", -- Selection Decrement
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
              ["@parameter.outer"] = "v",     -- charwise
              ["@function.outer"]  = "V",     -- linewise
              ["@class.outer"]     = "<c-v>", -- blockwise
            }
          }
        },
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" }
}
