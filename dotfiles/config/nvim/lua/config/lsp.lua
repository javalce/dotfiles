-- LSP

local lsp = require 'lsp-zero'

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps { buffer = bufnr }
end)

lsp.ensure_installed {
  'tsserver',
  'eslint',
  'lua_ls',
  'pyright',
  'jsonls',
}

lsp.format_on_save {
  format_opts = {
    timeout_ms = 1000,
  },
  servers = {
    ['null-ls'] = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'python',
      'lua',
    },
  },
}

require('neodev').setup()
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- null-ls

local null_ls = require 'null-ls'

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    -- diagnostics
    diagnostics.pylint.with {
      prefer_local = '.venv/bin',
      env = function(params)
        return { PYTHONPATH = params.root }
      end,
    },

    -- formatting
    formatting.black,
    formatting.eslint_d,
    formatting.prettier,
    formatting.stylua,
  },
}

require('mason-null-ls').setup {
  ensure_installed = nil,
  automatic_installation = true,
}
