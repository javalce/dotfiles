local lsp = require("lsp-zero").preset {}

lsp.on_attach(function(client, bufnr) lsp.default_keymaps { buffer = bufnr } end)

lsp.ensure_installed {
  "tsserver",
  "eslint",
  "lua_ls",
  "pyright",
}

lsp.format_on_save {
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ["null-ls"] = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.jsx",
      "lua",
      "python",
    },
  },
}
-- (Optional) Configure lua language server for neovim
local lspconfig = require "lspconfig"
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
