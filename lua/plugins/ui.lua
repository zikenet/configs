return {
  --nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.background_colour = "#89b4fa"
    end,
  },
  --nvim-noice
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
