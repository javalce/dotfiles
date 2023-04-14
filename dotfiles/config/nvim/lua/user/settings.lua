local options = {
  -- General
  mouse = "a", -- enable mouse support
  clipboard = "unnamedplus", -- copy/paste to system clipboard
  swapfile = false, -- don't use swapfile

  -- UI
  number = true, -- show line number
  relativenumber = true, -- show line number
  showmatch = true, -- highlight matching parenthesis
  foldmethod = "marker", -- enable folding (default 'foldmarker')
  colorcolumn = "120", -- line length marker at 120 columns
  cursorline = true,
  splitright = true, -- vertical split to the right
  splitbelow = true, -- horizontal split to the bottom
  ignorecase = true, -- ignore case letters when search
  smartcase = true, -- ignore lowercase for the whole pattern
  linebreak = true, -- wrap on boundary
  conceallevel = 0,
  termguicolors = true,
  guifont = "DroidSansMono Nerd Font",

  -- Memory
  hidden = true, -- enable background buffers
  history = 100, -- remember n lines in history
  -- lazyredraw = true, -- faster scrolling
  -- synmaxcol = 100, -- max column for syntax highlight

  -- Tabs, indent
  expandtab = true, -- use spaces instead of tabs
  shiftwidth = 4, -- shift 4 spaces when tab
  tabstop = 4, -- 1 tab = 4 spaces
  smartindent = true, -- autoindent new lines
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.g.mapleader = " "
