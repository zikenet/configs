-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require("zfalcon.discipline")
local harpoon = require("harpoon")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local ext = function(table, key, value)
  local tbl = table
  tbl[key] = value
  return tbl
end

-- Disable delete character clipboard
keymap.set("n", "x", '"_x')

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Increment/Decrement
keymap.set("n", "+", "<C-a")
keymap.set("n", "-", "<C-x")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Buffer Switch
keymap.set("n", "te", ":tabedit", opts)
-- keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)

-- Toggle previous & next buffers stored within Harpoon list
keymap.set("n", "<Tab>", function()
  harpoon:list():next()
end)
keymap.set("n", "<S-Tab>", function()
  harpoon:list():prev()
end)

-- Resize Window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
keymap.set("n", "<leader>wr", "<C-w>=", ext(opts, "desc", "Restore Window"))
keymap.set("n", "<leader>wm", "<C-w>_<C-w>|", ext(opts, "desc", "Maximize Window"))

-- Move group visual
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Centering
keymap.set("n", "n", "nzz", opts)
keymap.set("n", "N", "Nzz", opts)
keymap.set("n", "*", "*zz", opts)
keymap.set("n", "#", "#zz", opts)
keymap.set("n", "g*", "g*zz", opts)
keymap.set("n", "g#", "g#zz", opts)

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

-- Oil
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Tab
keymap.set("n", "<leader>ta", ":$tabnew<CR>", ext(opts, "desc", "New Tab"))
keymap.set("n", "<leader>tc", ":tabclose<CR>", ext(opts, "desc", "Close Tab"))
keymap.set("n", "<leader>to", ":tabonly<CR>", ext(opts, "desc", "Only Tab"))
keymap.set("n", "<leader>tn", ":tabn<CR>", ext(opts, "desc", "Next Tab"))
keymap.set("n", "<leader>tp", ":tabp<CR>", ext(opts, "desc", "Previous Tab"))
-- move current tab to previous position
keymap.set("n", "<leader>th", ":-tabmove<CR>", ext(opts, "desc", "Move Left"))
-- move current tab to next position
keymap.set("n", "<leader>tl", ":+tabmove<CR>", ext(opts, "desc", "Move Right"))
