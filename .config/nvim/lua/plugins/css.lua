return {
  -- Plugin: nvim-highlight-colors
  -- URL: https://github.com/brenoprata10/nvim-highlight-colors
  -- Description: A Neovim plugin for highlighting colors in hex, rgb, hsl, CSS variables and TailwindCSS
  {
    "brenoprata10/nvim-highlight-colors",
    event = "LazyFile",
    enabled = false,
    opts = {
      ---Render style
      ---@usage 'background' | 'foreground'|'virtual'
      render = "background",
      ---Set virtual symbol (requires render to be set to 'virtual')
      virtual_symbol = "",

      ---Set virtual symbol suffix (defaults to '')
      virtual_symbol_prefix = "",

      ---Set virtual symbol suffix (defaults to ' ')
      virtual_symbol_suffix = " ",

      ---Set virtual symbol position()
      ---@usage 'inline'|'eol'|'eow'
      ---inline mimics VS Code style
      ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
      ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
      virtual_symbol_position = "inline",

      ---Highlight hex colors, e.g. #ffffff
      enable_hex = true,

      ---Highlight short hex colors, e.g. #fff
      enable_short_hex = true,

      ---Highlight rgb colors, e.g. rgb(255, 255, 255)
      enable_rgb = true,

      -- Highlight hsl colors, e.g. hsl(360, 100%, 100%)
      enable_hsl = true,

      -- Highlight CSS variables, e.g. 'var(--my-color)'
      enable_var_usage = true,

      -- Highlight named colors, e.g. 'green'
      enable_names_colors = true,

      -- Highlight tailwind colors, e.g. 'bg-blue-500'
      enable_tailwind = true,

      -- Set custom colors
      -- Label must be properly escaped with '%' top adhere to `string.gmatch`
      -- :help string.gmatch
      custom_color = {
        { label = "%-%theme%-primary%-color", color = "#0f1219" },
        { label = "%-%theme%-secondary%-color", color = "#5a5d64" },
      },

      -- Exclude filetypes or buffertypes from highlighting, e.g. 'exlude_buftypes = {'text'}'
      exclude_filetypes = {},
      exclude_buftypes = {},
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "css-variables-language-server",
        "cssmodules-language-server",
      },
    },
  },
  -- {
  --   "sahen/blink.cmp",
  --   ---@module 'blink.cmp'
  --   ---@type blink.cmp.Config
  --   opts = {
  --     completion = {
  --       menu = {
  --         draw = {
  --           components = {
  --             -- customize the drawing of kind icons
  --             kind_icon = {
  --               text = function(ctx)
  --                 -- default kind icon
  --                 local icon = ctx.kind_icon
  --                 -- if LSP source, check for color derived from documentation
  --                 if ctx.item.source_name == "LSP" then
  --                   local color_item =
  --                     require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
  --                   if color_item and color_item.abbr then
  --                     icon = color_item.abbr
  --                   end
  --                 end
  --                 return icon .. ctx.icon_gap
  --               end,
  --               highlight = function(ctx)
  --                 -- default highlight group
  --                 local highlight = "BlinkCmpKind" .. ctx.kind
  --                 -- if LSP source, check for color derived from documentation
  --                 if ctx.item.source_name == "LSP" then
  --                   local color_item =
  --                     require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
  --                   if color_item and color_item.abbr_hl_group then
  --                     highlight = color_item.abbr_hl_group
  --                   end
  --                 end
  --                 return highlight
  --               end,
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
}
