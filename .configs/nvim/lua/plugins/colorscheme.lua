return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  {
    "cpea2506/one_monokai.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("one_monokai").setup({
        transparent = true,
        highlights = function(colors)
          return {
            StatusLine = { bg = colors.none },
            StatusLineNC = { bg = colors.none },
            CursorLineNr = {
              fg = "#FF966C",
              bold = true,
            },
          }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "one_monokai",
    },
  },
}
