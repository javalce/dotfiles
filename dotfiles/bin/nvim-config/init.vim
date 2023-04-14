" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set relativenumber
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set termguicolors
set sw=4
set background=dark
set title
set shell=bash

highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode


" Searching
set hlsearch " highlight matches
set incsearch " incremental search
set ignorecase " searches are case insensitive
set smartcase " ... unless they contain at least one capital letter

" enable filetypes plugin
filetype plugin on
"}}}

" Imports "{{{
" ---------------------------------------------------------------------
if has("unix")
  let s:uname = system("uname -s")
endif

runtime ./plug.vim
runtime ./maps.vim

lua require'colorizer'.setup()
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  colorscheme onedark
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:
