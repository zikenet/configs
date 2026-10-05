-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vscode_setup")
else
  require("config.lazy")
  -- require("custom.dbui")
end
