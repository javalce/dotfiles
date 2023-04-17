local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      '.venv',
    },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
      },
    },
  },
  pickers = {},
  extensions = {},
}

vim.keymap.set('n', '<C-p>', function()
  builtin.find_files { hidden = true }
end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search by word' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find commands' })
