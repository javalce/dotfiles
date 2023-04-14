require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
  pickers = {},
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}

local builtin = require "telescope.builtin"

local maps = {
  ["<C-p>"] = builtin.find_files,
  ["<leader>fb"] = builtin.buffers,
  ["<leader>fc"] = builtin.commands,
  ["<leader>fd"] = builtin.diagnostics,
  ["<leader>fg"] = builtin.live_grep,
  ["<leader>fgb"] = builtin.git_branches,
  ["<leader>fgc"] = builtin.git_commits,
  ["<leader>fgs"] = builtin.git_status,
  ["<leader>fh"] = builtin.help_tags,
}

for key, action in pairs(maps) do
  vim.keymap.set("n", key, action, {})
end
