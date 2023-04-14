local null_ls = require "null-ls"

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    -- diagnostics
    -- diagnostics.eslint,
    diagnostics.pylint.with {
      env = function(params)
        return {
          PYTHONPATH = params.root,
        }
      end,
    },

    -- formatting
    formatting.eslint,
    formatting.black,
    formatting.stylua,
  },
}

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup {
  ensure_installed = nil,
  automatic_installation = true,
}
