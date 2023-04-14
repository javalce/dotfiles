vim.opt.termguicolors = true
require("bufferline").setup {
  options = {
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    groups = {
      items = {
        require("bufferline.groups").builtin.pinned:with { icon = "" },
      },
    },
  },
}

vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>BufferLineTogglePin<cr>")
-- vim.keymap.set('n', '<leader>c', vim.cmd.
