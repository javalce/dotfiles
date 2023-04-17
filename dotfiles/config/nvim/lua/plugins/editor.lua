return {
  'tpope/vim-sleuth',

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'tokyonight',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    config = true,
  },

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require 'config.treesitter'
    end,
  },
}
