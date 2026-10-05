return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  -- blink
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
    },
  },
  -- mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ui = {
        border = "rounded",
      }
    end,
  },
  --incline
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#292c2e",
          }
        end,
      })
    end,
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
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Make only the middle section transparent
      local theme = require("lualine.themes.auto")

      for _, mode in pairs(theme) do
        if type(mode) == "table" and mode.c then
          mode.c.bg = "NONE"
        end
      end

      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

      opts.options.theme = theme

      -- Customize lualine_a
      opts.sections.lualine_a[1] = {
        "mode",
        separator = { left = "", right = "" },
        right_padding = 2,
      }

      -- Customize lualine_z
      opts.sections.lualine_z[1] = {
        function()
          return " " .. os.date("%R")
        end,
        separator = { right = "" },
        left_padding = 2,
      }
    end,
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function()
  --     local theme = require("lualine.themes.auto")
  --
  --     -- Remove background from all Lualine sections
  --     for _, mode in pairs(theme) do
  --       if type(mode) == "table" and mode.c then
  --         mode.c.bg = nil
  --       end
  --     end
  --
  --     vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  --     vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
  --
  --     local icons = LazyVim.config.icons
  --
  --     vim.o.laststatus = vim.g.lualine_laststatus
  --
  --     local opts = {
  --       options = {
  --         theme = theme,
  --         globalstatus = vim.o.laststatus == 3,
  --         disabled_filetypes = {
  --           statusline = {
  --             "dashboard",
  --             "alpha",
  --             "ministarter",
  --             "snacks_dashboard",
  --           },
  --         },
  --       },
  --
  --       sections = {
  --         lualine_a = {
  --           {
  --             "mode",
  --             separator = { left = "", right = "" },
  --             right_padding = 2,
  --           },
  --         },
  --
  --         lualine_b = {
  --           "branch",
  --         },
  --
  --         lualine_c = {
  --           LazyVim.lualine.root_dir(),
  --
  --           {
  --             "diagnostics",
  --             symbols = {
  --               error = icons.diagnostics.Error,
  --               warn = icons.diagnostics.Warn,
  --               info = icons.diagnostics.Info,
  --               hint = icons.diagnostics.Hint,
  --             },
  --           },
  --
  --           {
  --             "filetype",
  --             icon_only = true,
  --             separator = "",
  --             padding = { left = 1, right = 0 },
  --           },
  --
  --           {
  --             LazyVim.lualine.pretty_path(),
  --           },
  --         },
  --
  --         lualine_x = {
  --           Snacks.profiler.status(),
  --
  --           {
  --             function()
  --               return require("noice").api.status.command.get()
  --             end,
  --             cond = function()
  --               return package.loaded["noice"] and require("noice").api.status.command.has()
  --             end,
  --             color = function()
  --               return { fg = Snacks.util.color("Statement") }
  --             end,
  --           },
  --
  --           {
  --             function()
  --               return require("noice").api.status.mode.get()
  --             end,
  --             cond = function()
  --               return package.loaded["noice"] and require("noice").api.status.mode.has()
  --             end,
  --             color = function()
  --               return { fg = Snacks.util.color("Constant") }
  --             end,
  --           },
  --
  --           {
  --             function()
  --               return "  " .. require("dap").status()
  --             end,
  --             cond = function()
  --               return package.loaded["dap"] and require("dap").status() ~= ""
  --             end,
  --             color = function()
  --               return { fg = Snacks.util.color("Debug") }
  --             end,
  --           },
  --
  --           {
  --             require("lazy.status").updates,
  --             cond = require("lazy.status").has_updates,
  --             color = function()
  --               return { fg = Snacks.util.color("Special") }
  --             end,
  --           },
  --
  --           {
  --             "diff",
  --             symbols = {
  --               added = icons.git.added,
  --               modified = icons.git.modified,
  --               removed = icons.git.removed,
  --             },
  --             source = function()
  --               local gitsigns = vim.b.gitsigns_status_dict
  --
  --               if gitsigns then
  --                 return {
  --                   added = gitsigns.added,
  --                   modified = gitsigns.changed,
  --                   removed = gitsigns.removed,
  --                 }
  --               end
  --             end,
  --           },
  --         },
  --
  --         lualine_y = {
  --           {
  --             "progress",
  --             separator = " ",
  --             padding = { left = 1, right = 0 },
  --           },
  --
  --           {
  --             "location",
  --             padding = { left = 0, right = 1 },
  --           },
  --         },
  --
  --         lualine_z = {
  --           {
  --             function()
  --               return " " .. os.date("%R")
  --             end,
  --             separator = { right = "" },
  --             left_padding = 2,
  --           },
  --         },
  --       },
  --
  --       extensions = {
  --         "neo-tree",
  --         "lazy",
  --         "fzf",
  --       },
  --     }
  --
  --     -- Do not add trouble symbols if aerial is enabled
  --     -- And allow it to be overridden for some buffer types
  --     if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
  --       local trouble = require("trouble")
  --
  --       local symbols = trouble.statusline({
  --         mode = "symbols",
  --         groups = {},
  --         title = false,
  --         filter = { range = true },
  --         format = "{kind_icon}{symbol.name:Normal}",
  --         hl_group = "lualine_c_normal",
  --       })
  --
  --       table.insert(opts.sections.lualine_c, {
  --         symbols and symbols.get,
  --         cond = function()
  --           return vim.b.trouble_lualine ~= false and symbols.has()
  --         end,
  --       })
  --     end
  --
  --     return opts
  --   end,
  -- },
}
