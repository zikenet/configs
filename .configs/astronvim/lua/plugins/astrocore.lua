-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- Move group Visual-Bloc
      x = {
        ["J"] = { ":move '>+1<CR>gv-gv" },
        ["K"] = { ":move '<-2<CR>gv-gv" },
      },
      v = {
        -- Indentation hold for visual mode
        ["<"] = { "<gv" },
        [">"] = { ">gv" },
        ["<A-j>"] = { ":m .+1<CR>==" },
        ["<A-k>"] = { ":m .-2<CR>==" },

        -- Disable copy when pasting
        ["p"] = { '"_dP' },
      },
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- Increment/Decrement
        ["+"] = { "<C-a>" },
        ["-"] = { "<C-x>" },

        -- Neotree float
        ["<Leader>e"] = { "<Cmd>Neotree float toggle<CR>", desc = "Toggle Explorer" },

        -- Doc and Implementation
        ["<Leader>gd"] = { "<Cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
        ["<Leader>lp"] = { "<Cmd>Lspsaga finder<CR>", desc = "Lspsaga Finder" },
        ["<Leader>lH"] = { "<Cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
        --[] = ("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts),
        -- [] = ("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts),

        -- Buffers
        ["<Leader>bb"] = { "<Cmd>Telescope buffers<CR>", desc = "Select Buffer" },
        ["<Leader>T"] = { "<Cmd>TodoTelescope<CR>", desc = "Open TODOs in Telescope" },

        -- Telescope
        ["<Leader>fs"] = {
          function()
            local builtin = require "telescope.builtin"
            builtin.treesitter()
          end,
          desc = "Lists Function names, variables, from Treesitter",
        },
        ["<Leader>fd"] = {
          function()
            local builtin = require "telescope.builtin"
            builtin.diagnostics()
          end,
          desc = "Find Diagnostics",
        },

        --  Bufferline  mappings
        ["<Tab>"] = {
          function() require("astrocore.buffer").nav(vim.v.count1) end,
          desc = "Next buffer",
        },
        ["<S-Tab>"] = {
          function() require("astrocore.buffer").nav(-vim.v.count1) end,
          desc = "Previous buffer",
        },
        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },

        -- Select all
        ["<C-a>"] = { "gg<S-V>G" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
