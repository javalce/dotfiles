return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      require('lsp-zero.settings').preset {}
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require 'config.autocompletion'
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', config = true },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      -- Diagnostics, formatting, code actions and more
      'jose-elias-alvarez/null-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
    config = function()
      require 'config.lsp'
    end,
  },

  {
    'folke/trouble.nvim',
    lazy = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require 'config.trouble'
    end,
  },
}
