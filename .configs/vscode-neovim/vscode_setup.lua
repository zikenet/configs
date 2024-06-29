vim.opt.clipboard = "unnamedplus"

local keymap = vim.keymap
local vscode = require("vscode")
local opts = { noremap = true, silent = true }

local split = function(...)
  local direction = select(1, ...)
  local file = select(2, ...)
  if direction == "h" then
    vscode.call("workbench.action.splitEditorDown")
  else
    vscode.call("workbench.action.splitEditorRight")
  end
  if file ~= nil then
    vscode.notify("open-file", expand("__vscode_new__"), "all")
  end
end

-- Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
--keymap.set({"n","x"}, "<C-/>", "<CMD>call Comment()<CR>", opts)

-- Which Key
keymap.set({ "n", "x" }, "<Space>", "<CMD>call VSCodeNotify('whichkey.show')<CR>")

-- Better Navigation
keymap.set({ "n", "x" }, "<C-j>", "<CMD>call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
keymap.set({ "n", "x" }, "<C-k>", "<CMD>call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)
keymap.set({ "n", "x" }, "<C-h>", "<CMD>call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
keymap.set({ "n", "x" }, "<C-l>", "<CMD>call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)

-- Split window
keymap.set("n", "\\", function()
  split("h")
end, opts)
keymap.set("n", "|", function()
  split("v")
end, opts)

-- Buffer Switch
keymap.set("n", "<Tab>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", opts)
keymap.set("n", "<S-Tab>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>", opts)
