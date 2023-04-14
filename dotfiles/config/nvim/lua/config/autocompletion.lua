local cmp = require "cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup {
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 3 },
    { name = "luasnip", keyword_length = 2 },
  },
  mapping = {
    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
  },
}
