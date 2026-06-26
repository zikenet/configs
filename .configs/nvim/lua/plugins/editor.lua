return {
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "jvgrootveld/telescope-zoxide",
    },
    keys = {
      {
        "<leader>fz",
        "<cmd>Telescope zoxide list<CR>",
        desc = "Find directories",
      },
      {
        ";c",
        function()
          local builtin = require("telescope.builtin")
          builtin.lsp_incoming_calls()
        end,
        desc = "Lists LSP incoming calls for word under the cursor",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "<leader>xb",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";f",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts = {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
          preview = false,
        },
        pickers = {
          diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
            layout_config = {
              preview_cutoff = 9999,
            },
          },
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              -- your custom insert mode mappings
              ["n"] = {
                -- your custom normal mode mappings
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["l"] = fb_actions.open_dir,
                ["/"] = function()
                  vim.cmd("startinsert")
                end,
                ["<C-u>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_previous(prompt_bufnr)
                  end
                end,
                ["<C-d>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_next(prompt_bufnr)
                  end
                end,
                ["<PageUp>"] = actions.preview_scrolling_up,
                ["<PageDown>"] = actions.preview_scrolling_down,
              },
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "kazhala/close-buffers.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>bh",
        function()
          require("close_buffers").delete({ type = "hidden" })
        end,
        desc = "Close Hidden Buffers",
      },
      {
        "<leader>bu",
        function()
          require("close_buffers").delete({ type = "nameless" })
        end,
        desc = "Close Nameless Buffers",
      },
    },
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      float = {
        max_height = 21,
        max_width = 61,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
        {
          "<leader>fh",
          function()
            local harpoon = require("harpoon")
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
              local file_paths = {}
              for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
              end

              require("telescope.pickers")
                .new({}, {
                  sorting_strategy = "ascending",
                  layout_config = { prompt_position = "top" },
                  prompt_title = "Harpoon",
                  finder = require("telescope.finders").new_table({
                    results = file_paths,
                  }),
                  previewer = conf.file_previewer({}),
                  sorter = conf.generic_sorter({}),
                })
                :find()
            end
            toggle_telescope(harpoon:list())
          end,
          desc = "Open harpoon window",
        },
      }
      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
}
