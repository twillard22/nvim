return {
   {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      lazy = false,
      opts = {},
      config = function()
         require("catppuccin").setup({
            integrations = {
               neotree = true,
            },
         })
      end,
   },
   {
      "lunarvim/horizon.nvim",
      priority = 1000,
      lazy = false,
      opts = {},
   },
   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
         require("tokyonight").setup({
            styles = {
               sidebars = "transparent",
            },
            on_colors = function(colors)
               -- colors.bg = colors.none
            end,
         })
      end,
   },
}
