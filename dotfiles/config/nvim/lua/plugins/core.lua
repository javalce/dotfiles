return {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    config = function() require("nvim-web-devicons").setup() end,
  },

  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() require("tokyonight").load() end,
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        notify = {
          view = "mini",
        },
        messages = {
          view = "mini",
        },
        errors = {
          view = "mini",
        },
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_color = "#000000",
      }
    end,
  },
}
