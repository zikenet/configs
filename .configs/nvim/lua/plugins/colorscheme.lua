return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- {
  --   "cpea2506/one_monokai.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   config = function()
  --     require("one_monokai").setup({
  --       transparent = true,
  --       highlights = function(colors)
  --         return {
  --           -- Normal = { bg = colors.none },
  --           -- NormalNC = { bg = colors.none },
  --           StatusLine = { bg = colors.none },
  --           StatusLineNC = { bg = colors.none },
  --         }
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "moon", -- auto, main, moon, or dawn
  --       dark_variant = "moon", -- main, moon, or dawn
  --       styles = {
  --         transparency = true,
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin",
  --   },
  -- },
}
