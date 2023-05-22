let mapleader=" "

" select all
nnoremap <C-a> gg<S-v>G

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev find NERDTreeFind

" plugs
map <F2> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <leader>ag :Ag<CR>

" Remap surround to lowercase s so it does not add an empty space
xmap s <Plug>VSurround

" diagnostics
noremap <leader>kp :let @*=expand("%")<CR>

" tabs navigation
nmap te :tabedit<CR>
map <S-Tab> :tabprevious<CR>
map <Tab> :tabnext<CR>

" buffers
map <leader>ob :Buffers<CR>

" faster scrolling
nmap <leader>s <Plug>(easymotion-s2)

" Split window
nmap <leader>ss :split<Return><C-w>w
nmap <leader>sv :vsplit<Return><C-w>w

" Terminal
set splitright
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://bash"

    " turn off number
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\> <C-\\><C-\\><C-n>"

    startinsert!
  endif
endfunction
noremap <C-t> :call OpenTerminal()<CR>

