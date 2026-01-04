-- This file contains the configuration for the nvim-tmux-navigation plugin in Neovim.

return {
  -- Plugin: nvim-tmux-navigation
  -- URL: https://github.com/alexghergh/nvim-tmux-navigation
  -- Description: A Neovim plugin that allows seamless navigation between Neovim and tmux panes.
  {
    "alexghergh/nvim-tmux-navigation",
    enabled = function()
      return vim.env.TMUX ~= nil
    end,
    keys = function()
      local nvim_tmux_navigation = require("nvim-tmux-navigation")

      return {
        { "<C-h>", nvim_tmux_navigation.NvimTmuxNavigateLeft, desc = "Navigate Left" },
        { "<C-j>", nvim_tmux_navigation.NvimTmuxNavigateDown, desc = "Navigate Down" },
        { "<C-k>", nvim_tmux_navigation.NvimTmuxNavigateUp, desc = "Navigate Up" },
        { "<C-l>", nvim_tmux_navigation.NvimTmuxNavigateRight, desc = "Navigate Right" },
        { "<C-\\>", nvim_tmux_navigation.NvimTmuxNavigateLastActive, desc = "Navigate Last Active" },
        { "<C-Space>", nvim_tmux_navigation.NvimTmuxNavigateNext, desc = "Navigate Next" },
      }
    end,
  },
}
