-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("zfalcon.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local ext = function(table, key, value)
  local tbl = table
  tbl[key] = value
  return tbl
end

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Split window
keymap.set("n", "\\", ":split<Return>", opts)
keymap.set("n", "|", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize Window
keymap.set("n", "<leader>wr", "<C-w>=", ext(opts, "desc", "Restore Window"))
keymap.set("n", "<leader>wm", "<C-w>_<C-w>|", ext(opts, "desc", "Maximize Window"))

-- Move group visual
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Better Escape
keymap.set("i", "jk", "<ESC>", opts)

-- Disable copy when pasting
keymap.set("v", "p", '"_dp', opts)

-- Oil
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Disable split keys
keymap.del("n", "<leader>-")
keymap.del("n", "<leader>|")

keymap.set("n", "<leader>i", function()
  require("zfalcon.lsp").toggleInlayHints()
end)

vim.api.nvim_create_user_command("ToggleAutoformat", function()
  require("zfalcon.lsp").toggleAutoformat()
end, {})
