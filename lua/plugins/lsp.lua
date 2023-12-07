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
      },
    },
  },
}
