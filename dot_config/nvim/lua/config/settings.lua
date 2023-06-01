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
  colorcolumn = "80", -- line length marker at 80 columns
  cursorline = true,
  splitright = true, -- vertical split to the right
  splitbelow = true, -- horizontal split to the bottom
  ignorecase = true, -- ignore case letters when search
  smartcase = true, -- ignore lowercase for the whole pattern
  hlsearch = false, -- no highlight search words
  incsearch = true, -- highlight incremental search pattern
  linebreak = true, -- wrap on boundary
  conceallevel = 0,
  termguicolors = true,
  guifont = "JetBrainsMono Nerd Font Mono",
  scrolloff = 8,
  signcolumn = "yes",

  -- Memory
  hidden = true, -- enable background buffers
  history = 100, -- remember n lines in history
  -- lazyredraw = true, -- faster scrolling
  -- synmaxcol = 100, -- max column for syntax highlight
  updatetime = 50,

  -- Tabs, indent
  expandtab = true, -- use spaces instead of tabs
  shiftwidth = 4, -- shift 4 spaces when tab
  tabstop = 4, -- 1 tab = 4 spaces
  smartindent = true, -- autoindent new lines
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.isfname:append "@-@"

vim.g.mapleader = " "
-- vim.g.python3_host_prog = "/usr/bin/python3"
-- vim.g.loaded_python3_provider = 0
