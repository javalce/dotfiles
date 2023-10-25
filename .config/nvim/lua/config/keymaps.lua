-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

if Util.has("bufferline.nvim") then
  map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
  map("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>")
else
  map("n", "<tab>", "<cmd>bnext<cr>")
  map("n", "<s-tab>", "<cmd>bprevious<cr>")
end
