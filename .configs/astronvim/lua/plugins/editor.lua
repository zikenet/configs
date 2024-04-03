-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<Leader>fB",
        ":Telescop file_browser path=%:p:h=%:p:h<cr>",
        desc = "Browse Files",
      },
    },
    config = function() require("telescope").load_extension "file_browser" end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function() require("lspsaga").setup {} end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "BufRead",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function() require("mason-tool-installer").setup {} end,
    event = "BufReadPre",
  },
}
