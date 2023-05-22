local Util = require "config.utils"

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local mappings = {
  n = {
    { "<leader>pv", vim.cmd.Ex, { desc = "Native Explorer" } },
    { "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" } },
    { "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" } },
    { "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" } },
  },
  i = {
    { "<C-h>", "<left>", { desc = "Move cursor left" } },
    { "<C-j>", "<down>", { desc = "Move cursor down" } },
    { "<C-k>", "<up>", { desc = "Move cursor up" } },
    { "<C-l>", "<right>", { desc = "Move cursor right" } },
    { "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" } },
    { "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" } },
  },
  v = {
    { "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line selection down" } },
    { "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line selection up" } },
  },
}

for mode, maps in pairs(mappings) do
  for _, keys in ipairs(maps) do
    map(mode, keys[1], keys[2], keys[3])
  end
end
