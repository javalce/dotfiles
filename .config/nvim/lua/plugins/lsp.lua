return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        angularls = {},
        ansiblels = {},
        astro = {},
        bashls = {},
        cssls = {},
        -- dockerls = {},
        -- docker_compose_language_service = {},
        -- eslint = {},
        html = {},
        intelephense = {},
        yamlls = {},
        -- pyright = {
        --   before_init = function(_, config)
        --     local util = require("util")
        --     print(util.get_python_path(config.root_dir))
        --     config.settings.python.pythonPath = util.get_python_path(config.root_dir)
        --   end,
        -- },
        taplo = {},
      },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormatingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormatingProvider = false
            end
          end)
        end,
      },
    },
  },

  -- Tools and LSP servers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- linters
        "shellcheck",
        "mypy",

        -- formatters
        "ruff",
        "stylua",
        "shfmt",
        "black",
        "php-cs-fixer",
      },
    },
  },

  -- Diagnostics, code actions and more
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      local diagnostics = nls.builtins.diagnostics
      local formatters = nls.builtins.formatting

      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- diagnostics
          -- diagnostics.mypy.with({
          --   prefer_local = ".venv/bin",
          -- }),
          diagnostics.mypy,

          -- formatters
          formatters.stylua,
          formatters.shfmt,
          formatters.black.with({
            prefer_local = ".venv/bin",
          }),
          formatters.ruff,
          formatters.phpcsfixer,

          -- code actions
        },
      }
    end,
  },
}
