return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = true,
    config = function()
      require("lsp-zero.settings").preset {}
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("lsp-zero.cmp").extend()

      local cmp = require "cmp"
      local luasnip = require "luasnip"

      luasnip.config.setup()

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm {
            select = false,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "buffer", keyword_length = 3 },
          { name = "luasnip", keyword_length = 2 },
        },
      }
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = {
          { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
        },
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", config = true },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",

      -- Diagnostics, formatting, code actions and more
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      -- LSP

      local lsp = require "lsp-zero"

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps { buffer = bufnr }

        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end)

      lsp.ensure_installed {
        "tsserver",
        "eslint",
        "lua_ls",
        "pyright",
        "jsonls",
      }

      lsp.format_on_save {
        format_opts = {
          timeout_ms = 1000,
        },
        servers = {
          ["null-ls"] = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "python",
            "lua",
          },
        },
      }

      require("neodev").setup()
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()

      -- null-ls

      local null_ls = require "null-ls"

      local diagnostics = null_ls.builtins.diagnostics
      local formatting = null_ls.builtins.formatting

      null_ls.setup {
        sources = {
          -- diagnostics
          diagnostics.ruff.with {
            prefer_local = ".venv/bin",
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

      require("mason-null-ls").setup {
        ensure_installed = nil,
        automatic_installation = true,
      }
    end,
  },
}
