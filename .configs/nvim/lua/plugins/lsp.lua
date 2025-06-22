return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "selene",
        "luacheck",
        "shfmt",
        "shellcheck",
        "flake8",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "prettierd",
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
    end,
  },
}
