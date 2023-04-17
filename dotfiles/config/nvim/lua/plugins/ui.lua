return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = true,
  },

  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'config.telescope'
    end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    config = function()
      require('telescope').load_extension 'fzf'
    end,
  },

  -- color highlight
  {
    'norcalli/nvim-colorizer.lua',
    lazy = false,
    config = function()
      require('colorizer').setup()
    end,
  },

  -- File explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<C-n>', '<cmd>Neotree toggle<cr>', { desc = 'Toggle file explorer' } },
      { '<leader>e', '<cmd>Neotree focus<cr>', { desc = 'Focus file explorer' } },
    },
    config = function()
      require 'config.neotree'
    end,
  },
}
