return {
  -- comments
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  { "lukas-reineke/indent-blankline.nvim" },
  {
    "m4xshen/autoclose.nvim",
    config = true,
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require "config.trouble" end,
  },
}
