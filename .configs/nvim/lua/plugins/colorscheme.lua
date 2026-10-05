return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- storm moon night day
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.WinSeparator = {
          -- fg = "#3B4261",
          fg = "#2c3249",
          -- fg = c.yellow, -- change this to whatever color you want
        }
      end,
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
  --           StatusLine = { bg = colors.none },
  --           StatusLineNC = { bg = colors.none },
  --           WinSeparator = {
  --             fg = "#292C2E",
  --           },
  --           CursorLineNr = {
  --             fg = "#FF966C",
  --             bold = true,
  --           },
  --         }
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "one_monokai",
  --   },
  -- },
}
