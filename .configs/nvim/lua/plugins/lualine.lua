return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local theme = require("lualine.themes.one_monokai")

      -- Remove background for the center section
      for _, mode in pairs(theme) do
        if mode.c then
          mode.c.bg = nil
        end
      end

      opts.options = {
        theme = theme,
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        -- section_separators = { left = "", right = "" },
      }
    end,
  },
  --     opts.sections.lualine_c[4] = {
  --       LazyVim.lualine.pretty_path({
  --         length = 0,
  --         relative = "cwd",
  --         modified_hl = "MatchParen",
  --         directory_hl = "",
  --         filename_hl = "Bold",
  --         modified_sign = "",
  --         readonly_icon = " 󰌾 ",
  --       }),
  --     }
  --     opts.sections = {
  --       lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
  --       lualine_b = {
  --         {
  --           "branch",
  --           icon = "",
  --         },
  --       },
  --       lualine_z = {
  --         {
  --           function()
  --             return " " .. os.date("%R")
  --           end,
  --           separator = { right = "" },
  --         },
  --       },
  --     }
  --   end,
  -- },
}
