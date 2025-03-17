return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = "|",
      section_separators = {
        left = "",
        right = "",
      },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = {
        {
          "branch",
          icon = "",
        },
      },
      lualine_z = {
        {
          function()
            return " " .. os.date("%R")
          end,
          separator = { right = "" },
          left_padding = 2,
        },
      },
    },
  },
}
