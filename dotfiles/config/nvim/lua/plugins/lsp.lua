return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        "williamboman/mason.nvim", -- Optional
        build = function() vim.cmd "MasonUpdate" end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "L3MON4D3/LuaSnip" }, -- Required
      { "saadparwaiz1/cmp_luasnip" },

      -- Diagnostics, code_actions and more
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
    },
    config = function()
      require "config.lsp"
      require "config.autocompletion"
      require "config.null-ls"
    end,
  },
}
