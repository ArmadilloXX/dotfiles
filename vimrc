set backspace=2

"===============================================
" Cursor position highlightings
"===============================================

set cursorline
hi CursorLine cterm=none ctermbg=52 ctermfg=none 
" set cursorcolumn
" hi CursorColumn ctermbg=52


"===============================================
" Line length ruler
"===============================================

set textwidth=80
set colorcolumn=+1

"===============================================
"Line numbers
"===============================================

set number
set numberwidth=5

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber

"===============================================
" Tabs and spaces
"===============================================

set number
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

"===============================================
" Visual lines for indentation
"===============================================
let g:indentLine_color_term = 239

"===============================================
" Plugins
"===============================================

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
call plug#end()
