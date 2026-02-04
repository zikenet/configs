return {
  {
    "cpea2506/one_monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("one_monokai").setup({
        transparent = true,
        -- highlights = function(colors)
        --   return {
        --     Normal = { bg = colors.none },
        --     NormalNC = { bg = colors.none },
        --     StatusLine = { bg = colors.none },
        --     StatusLineNC = { bg = colors.none },
        --   }
        -- end,
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
