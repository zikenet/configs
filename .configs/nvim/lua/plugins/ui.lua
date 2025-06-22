return {
  -- noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets = {
        lsp_doc_border = true,
      }
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
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
    "williamboman/mason.nvim",
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
  -- disable bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
}
