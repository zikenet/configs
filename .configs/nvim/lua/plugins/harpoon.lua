return {
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
