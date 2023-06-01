local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Indentaition per file
local indentation_with_2 = function()
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
end
local indentation_with_4 = function()
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
end

local set_indentation = function(filetype, indentation_callback)
  autocmd("BufEnter", {
    callback = indentation_callback,
    pattern = filetype,
  })
end

local files = {
  ["2"] = {
    "*.css",
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.lua",
    "*.html",
  },
  ["4"] = {
    "*.py",
    "*.java",
  },
}

for indentation, filetypes in pairs(files) do
  for _, filetype in ipairs(filetypes) do
    if indentation == "2" then
      set_indentation(filetype, indentation_with_2)
    end
    if indentation == "4" then
      set_indentation(filetype, indentation_with_4)
    end
  end
end
