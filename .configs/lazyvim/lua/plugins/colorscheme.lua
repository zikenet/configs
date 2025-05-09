return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
      integrations = {
        barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
        cmp = true,
        gitsigns = true,
        hop = true,
        illuminate = { enabled = true },
        native_lsp = { enabled = true, inlay_hints = { background = true } },
        neogit = true,
        neotree = true,
        semantic_tokens = true,
        treesitter = true,
        treesitter_context = true,
        vimwiki = true,
        which_key = true,
        aerial = true,
        fidget = true,
        mason = true,
        neotest = true,
        dap_ui = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
      },
      highlight_overrides = {
        -- all = function(colors)
        --   return {
        --     NeotestPassed = { fg = colors.green },
        --     NeotestFailed = { fg = colors.red },
        --     NeotestRunning = { fg = colors.yellow },
        --     NeotestSkipped = { fg = colors.blue },
        --     NeotestFile = { fg = colors.peach },
        --     NeotestNamespace = { fg = colors.peach },
        --     NeotestDir = { fg = colors.peach },
        --     NeotestFocused = { fg = colors.mauve, bold = true, underline = true },
        --     NeotestAdapterName = { fg = colors.red },
        --     NeotestIndent = { fg = colors.yellow },
        --     NeotestExpandMarker = { fg = colors.yellow },
        --     NeotestWinSelect = { fg = colors.yellow, bold = true },
        --     NeotestTest = { fg = colors.subtext2 },
        --     FzfLuaNormal = { bg = colors.base },
        --     FzfLuaBorder = { fg = colors.base, bg = colors.base },
        --     FzfluaTitle = { fg = colors.text, bg = colors.overlay0, style = { "bold" } },
        --     FzfLuaBackdrop = { bg = colors.surface0 },
        --     FzfLuaPreviewNormal = { bg = colors.surface0 },
        --     FzfLuaPreviewBorder = { fg = colors.surface0, bg = colors.surface0 },
        --     FzfLuaScrollBorderEmpty = { fg = colors.surface0, bg = colors.surface0 },
        --     FzfLuaScrollBorderFull = { fg = colors.subtext1, bg = colors.surface0 },
        --     FzfLuaScrollFloatEmpty = { fg = colors.surface0, bg = colors.surface0 },
        --     FzfLuaScrollFloatFull = { fg = colors.subtext1, bg = colors.surface0 },
        --     FzfLuaCursorLine = { bg = colors.surface2 },
        --     TelescopeBorder = { fg = colors.base, bg = colors.base },
        --     TelescopeNormal = { bg = colors.base },
        --     TelescopePreviewBorder = { fg = colors.surface0, bg = colors.surface0 },
        --     TelescopePreviewNormal = { bg = colors.surface0 },
        --     TelescopePreviewTitle = { fg = colors.text, bg = colors.overlay0, style = { "bold" } },
        --     TelescopePromptBorder = { fg = colors.base, bg = colors.base },
        --     TelescopePromptNormal = { fg = colors.text, bg = colors.base },
        --     TelescopePromptTitle = { fg = colors.text, bg = colors.overlay0, style = { "bold" } },
        --   }
        -- end,
      },
      color_overrides = {
        latte = {
          rosewater = "#c14a4a",
          flamingo = "#c14a4a",
          red = "#c14a4a",
          maroon = "#c14a4a",
          pink = "#945e80",
          mauve = "#945e80",
          peach = "#c35e0a",
          yellow = "#b47109",
          green = "#6c782e",
          teal = "#4c7a5d",
          sky = "#4c7a5d",
          sapphire = "#4c7a5d",
          blue = "#45707a",
          lavender = "#45707a",
          text = "#654735",
          subtext1 = "#73503c",
          subtext0 = "#805942",
          overlay2 = "#8c6249",
          overlay1 = "#8c856d",
          overlay0 = "#a69d81",
          surface2 = "#bfb695",
          surface1 = "#d1c7a3",
          surface0 = "#e3dec3",
          base = "#f9f5d7",
          mantle = "#f0ebce",
          crust = "#e8e3c8",
        },
        mocha = {
          rosewater = "#ea6962",
          flamingo = "#ea6962",
          red = "#ea6962",
          maroon = "#ea6962",
          pink = "#d3869b",
          mauve = "#d3869b",
          peach = "#e78a4e",
          yellow = "#d8a657",
          green = "#a9b665",
          teal = "#89b482",
          sky = "#89b482",
          sapphire = "#89b482",
          blue = "#7daea3",
          lavender = "#7daea3",
          text = "#ebdbb2",
          subtext1 = "#d5c4a1",
          subtext0 = "#bdae93",
          overlay2 = "#a89984",
          overlay1 = "#928374",
          overlay0 = "#595959",
          surface2 = "#4d4d4d",
          surface1 = "#404040",
          surface0 = "#292929",
          base = "#1d2021",
          mantle = "#191b1c",
          crust = "#141617",
        },
      },
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "moon",
  --     transparent = true,
  --     styles = {
  --       comments = { italic = true },
  --       keywords = { italic = true },
  --       functions = {},
  --       variables = {},
  --       -- Background styles. Can be "dark", "transparent" or "normal"
  --       sidebars = "transparent", -- style for sidebars, see below
  --       floats = "transparent", -- style for floating windows
  --     },
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
