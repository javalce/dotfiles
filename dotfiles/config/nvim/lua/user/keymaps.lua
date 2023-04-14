local mappings = {
  n = {
    { "<leader>pv", vim.cmd.Ex },
    { "<leader>z", function() require("lazy").home() end },
    { "<leader>c", vim.cmd.bdelete },
  },
  i = {
    { "<C-h>", "<left>" },
    { "<C-j>", "<down>" },
    { "<C-k>", "<up>" },
    { "<C-l>", "<right>" },
  },
  v = {},
}

for key, maps in pairs(mappings) do
  for _, map in ipairs(maps) do
    vim.keymap.set(key, map[1], map[2])
  end
end
