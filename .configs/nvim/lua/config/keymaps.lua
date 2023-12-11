-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local ext = function(table, key, value)
  local tbl = table
  tbl[key] = value
  return tbl
end

-- Increment/Decrement
keymap.set("n", "+", "<C-a")
keymap.set("n", "-", "<C-x")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Buffer Switch
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)

-- Move group visual
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Better Escape
keymap.set("i", "jk", "<ESC>", opts)

-- Disable copy when pasting
keymap.set("v", "p", '"_dp', opts)

-- Neotree float
keymap.set("n", "<leader>e", "<Cmd>Neotree float toggle<CR>", ext(opts, "desc", "Toggle Explorer"))

-- Split window
keymap.set("n", "\\", ":split<Return>", opts)
keymap.set("n", "|", ":vsplit<Return>", opts)

-- Disable split keys
keymap.del("n", "<leader>-")
keymap.del("n", "<leader>|")
