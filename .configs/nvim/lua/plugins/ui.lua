return {
  --nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.background_colour = "#89b4fa"
    end,
  },
  --incline
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local modified = vim.bo[props.buf].modified
          if modified then
            filename = "[+]" .. filename
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          return {
            { " " },
            { ft_icon, guifg = ft_color },
            { " " },
            { filename, guifg = "#c8c5c5" },
            { " " },
            guibg = "#292c2e",
          }
        end,
      })
    end,
  }, --nvim-noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      }
      opts.presets.lsp_doc_border = true
    end,
  },
  --which-key
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.window = {
        border = "single",
      }
      return opts
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      ███████╗███████╗░█████╗░██╗░░░░░░█████╗░░█████╗░███╗░░██╗
      ╚════██║██╔════╝██╔══██╗██║░░░░░██╔══██╗██╔══██╗████╗░██║
      ░░███╔═╝█████╗░░███████║██║░░░░░██║░░╚═╝██║░░██║██╔██╗██║
      ██╔══╝░░██╔══╝░░██╔══██║██║░░░░░██║░░██╗██║░░██║██║╚████║
      ███████╗██║░░░░░██║░░██║███████╗╚█████╔╝╚█████╔╝██║░╚███║
      ╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
