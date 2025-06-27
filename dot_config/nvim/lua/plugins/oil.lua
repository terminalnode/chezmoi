return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<Cmd>Oil<CR>", desc = "Run oil" },
    },
    ---@module "oil"
    ---@type oil.SetupOpts
    opts = {
      win_options = {
        signcolumn = "yes:2",
      },
    },
    dependencies = { "mini.icons" }, -- Can also use nvim-web-devicons
  },

  {
    "refractalize/oil-git-status.nvim",
    dependencies = { "stevearc/oil.nvim" },
    config = true,
  },
}
