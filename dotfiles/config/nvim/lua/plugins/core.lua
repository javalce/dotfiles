return {
  -- Show pending keys
  {
    'folke/which-key.nvim',
    lazy = false,
    config = true,
  },

  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },

  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = true,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    config = function()
      require('noice').setup {
        notify = {
          view = 'mini',
        },
        messages = {
          view = 'mini',
        },
        errors = {
          view = 'mini',
        },
        lsp = {
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      require('notify').setup {
        background_colour = '#000000',
      }
    end,
  },

  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
      { '<F7>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' } },
    },
    opts = {
      size = 10,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = 'float',
      float_opts = {
        border = 'curved',
        highlights = { border = 'Normal', background = 'Normal' },
      },
    },
  },
}
