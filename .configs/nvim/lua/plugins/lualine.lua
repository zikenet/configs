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
}
