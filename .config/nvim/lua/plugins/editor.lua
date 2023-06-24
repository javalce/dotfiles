return {
  -- Add keys to neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-n>", "<leader>e", desc = "Explorer NeoTree (root dir)", remap = true },
      {
        "<leader>o",
        function()
          require("neo-tree.command").execute({ toggle = false })
        end,
        desc = "Focus NeoTree (cwd dir)",
      },
    },
  },

  -- change some telescope options, keymaps to browse plugin files and mappings
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fP",
        function () require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
          },
        },
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- add color highlighter
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
