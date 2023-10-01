return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        angularls = {},
        ansiblels = {},
        astro = {},
        bashls = {},
        cssls = {},
        dockerls = {},
        docker_compose_language_service = {},
        html = {},
        intelephense = {},
        yamlls = {},
        pyright = {
          before_init = function(_, config)
            local util = require("util")
            config.settings.python.pythonPath = util.get_python_path(config.root_dir)
          end,
        },
        taplo = {},
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
        "ruff",

        -- formatters
        "stylua",
        "shfmt",
        "black",
        "prettier",
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
          diagnostics.mypy.with({
            prefer_local = ".venv/bin",
          }),
          diagnostics.ruff,

          -- formatters
          formatters.stylua,
          formatters.shfmt,
          formatters.black.with({
            prefer_local = ".venv/bin",
          }),
          formatters.ruff,
          formatters.prettier,
          formatters.phpcsfixer,

          -- code actions
          -- require("typescript.extensions.null-ls.code-actions"),
        },
      }
    end,
  },
}
