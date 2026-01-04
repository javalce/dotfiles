-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Quick switch between buffers
-- vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
-- vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>")

-- Map Ctrl-c to escape from other modes
vim.keymap.set({ "i", "n", "v" }, "<C-c>", [[<C-\><C-n>]])
