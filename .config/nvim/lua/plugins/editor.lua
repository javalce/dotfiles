return {
  -- Plugin: Gentleman-Programming/veil.nvim
  -- URL: https://github.com/Gentleman-Programming/veil.nvim
  -- Description: A Neovim plugin to hide sensitive values in .env files and other config files.
  {
    "Gentleman-Programming/veil.nvim",
    config = function()
      require("veil").setup()
    end,
  },
}
