-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local set = vim.opt

set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.number = true
set.title = true
set.autoindent = true
set.smartindent = true
set.hlsearch = true
set.backup = false
set.showcmd = true
set.cmdheight = 1
set.laststatus = 3
set.expandtab = true
set.scrolloff = 10
set.shell = "fish"
set.backupskip = { "/tmp/*", "/private/tmp/*" }
set.inccommand = "split"
set.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
set.smarttab = true
set.breakindent = true
set.shiftwidth = 2
set.tabstop = 2
set.wrap = false -- No Wrap lines
set.backspace = { "start", "eol", "indent" }
set.path:append({ "**" }) -- Finding files - Search down into subfolders
set.wildignore:append({ "*/node_modules/*" })
set.splitbelow = true -- Put new windows below current
set.splitright = true -- Put new windows right of current
set.splitkeep = "cursor"

-- Transparency
set.termguicolors = true
set.winblend = 0
set.wildoptions = "pum"
set.pumblend = 0
set.background = "dark"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.diagnostic.config({
  float = { border = "rounded" },
})
