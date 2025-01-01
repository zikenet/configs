return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = LazyVim.config.icons

      local C = require("catppuccin.palettes").get_palette("mocha")
      local O = require("catppuccin").options
      local catppuccin = {}

      local transparent_bg = O.transparent_background and "NONE" or C.mantle

      catppuccin.normal = {
        a = { bg = transparent_bg, fg = C.blue, gui = "bold" },
        b = { bg = transparent_bg, fg = C.sky },
        c = { bg = transparent_bg },
      }

      catppuccin.insert = {
        a = { bg = transparent_bg, fg = C.sky, gui = "bold" },
        b = { bg = transparent_bg, fg = C.sky },
      }

      catppuccin.terminal = {
        a = { bg = transparent_bg, fg = C.green, gui = "bold" },
        b = { bg = transparent_bg, fg = C.sky },
      }

      catppuccin.command = {
        a = { bg = transparent_bg, fg = C.peach, gui = "bold" },
        b = { bg = transparent_bg, fg = C.peach },
      }

      catppuccin.visual = {
        a = { bg = transparent_bg, fg = C.mauve, gui = "bold" },
        b = { bg = transparent_bg, fg = C.mauve },
      }

      catppuccin.replace = {
        a = { bg = transparent_bg, fg = C.base, gui = "bold" },
        b = { bg = transparent_bg, fg = C.red },
      }

      catppuccin.inactive = {
        a = { bg = transparent_bg, fg = C.blue },
        b = { bg = transparent_bg, fg = C.sky, gui = "bold" },
        c = { bg = transparent_bg, fg = C.sky },
      }

      return {
        --[[add your custom lualine config here]]
        options = {
          theme = catppuccin,
          component_separators = "",
          section_separators = {},
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          -- lualine_a = {},
          lualine_a = {
            {
              "mode",
              separator = { right = "|" },
            },
          },
          lualine_b = {},
          lualine_c = {
            {
              "branch",
              icon = "",
              separator = "|",
              padding = { left = 1, right = 1 },
              color = { fg = C.red },
            },
            {
              "filetype",
              color = { fg = C.sky },
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {
             -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              -- color = function() return LazyVim.ui.fg("Constant") end,
              color = function() return { fg = Snacks.util.color("Statement")} end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              -- color = function() return LazyVim.ui.fg("Constant") end,
              color = function() return { fg = Snacks.util.color("Constant")} end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug")} end,
              --color = function() return LazyVim.ui.fg("Debug") end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special")} end,
              --color = function() return LazyVim.ui.fg("Special") end,
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
            {
              "progress",
              color = { fg = C.sky },
            },
            {
              "location",
              color = { fg = C.sky },
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
