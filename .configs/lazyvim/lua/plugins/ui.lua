return {
  --nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.background_colour = "#89b4fa"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ui = {
        border = "rounded",
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = "File" },
          { source = "buffers", display_name = "Bufs" },
          { source = "git_status", display_name = "Git" },
          { source = "diagnostics", display_name = "Diagnostics" },
        },
      }
    end,
  },
  --incline
  -- {
  --   "b0o/incline.nvim",
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     local helpers = require("incline.helpers")
  --     local devicons = require("nvim-web-devicons")
  --     require("incline").setup({
  --       window = {
  --         padding = 0,
  --         margin = { horizontal = 0 },
  --       },
  --       hide = {
  --         cursorline = true,
  --       },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --         if filename == "" then
  --           filename = "[No Name]"
  --         end
  --         local ft_icon, ft_color = devicons.get_icon_color(filename)
  --         local modified = vim.bo[props.buf].modified
  --         return {
  --           ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
  --           " ",
  --           { filename, gui = modified and "bold,italic" or "bold" },
  --           " ",
  --           guibg = "#292c2e",
  --         }
  --       end,
  --     })
  --   end,
  -- }, --nvim-noice
  -- c8c5c5
  -- 292c2e
  --which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      preset = "modern",
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
        snippet_forward = { "<Up>", "<Tab>" },
        snippet_backward = { "<Down>", "<S-Tab>" },
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
      ███████╗███████╗░█████╗░██╗░░░░░░█████╗░░█████╗░███╗░░██╗
      ╚════██║██╔════╝██╔══██╗██║░░░░░██╔══██╗██╔══██╗████╗░██║
      ░░███╔═╝█████╗░░███████║██║░░░░░██║░░╚═╝██║░░██║██╔██╗██║
      ██╔══╝░░██╔══╝░░██╔══██║██║░░░░░██║░░██╗██║░░██║██║╚████║
      ███████╗██║░░░░░██║░░██║███████╗╚█████╔╝╚█████╔╝██║░╚███║
      ╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝
      ]],

        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          component_separators = "",
          section_separators = { left = "", right = "" },
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
          lualine_b = {
            { "branch", separator = "|", padding = { left = 1, right = 1 } },
            "filetype",
          },
          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { LazyVim.lualine.pretty_path() },
            -- { "filetype", separator = "|", padding = { left = 1, right = 1 } },
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
          },
          lualine_y = { "progress" },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
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

      return opts
    end,
  },
}
