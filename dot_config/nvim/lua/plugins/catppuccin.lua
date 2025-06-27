return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-latte]])
      require("catppuccin").setup({
        flavour = "latte",
        dim_inactive = { enabled = false },
        integrations = {
          blink_cmp = true,
          mason = true,
          nvim_surround = true,
          snacks = true,
          telescope = { enabled = true },
        },
      })
    end,
  },
}
