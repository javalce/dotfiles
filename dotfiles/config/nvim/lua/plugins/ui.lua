return {
  -- File browser
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function() require "config.neotree" end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                              , branch = '0.1.1',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function() require "config.telescope-nvim" end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() require("telescope").load_extension "ui-select" end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require "config.statusline" end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require "config.bufferline" end,
  },

  -- syntax highlight
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require "config.treesitter" end,
  },
}
