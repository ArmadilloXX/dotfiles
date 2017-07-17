"To use fzf in Vim, add the following line to your .vimrc:
set rtp+=/usr/local/opt/fzf

let mapleader = " "
imap <C-h> <esc>:w<cr>

" Colorscheme
colorscheme pablo

" Some protection for annoying typos
command! W w
command! Wq wq

set nocompatible

if has("autocmd")
  filetype indent plugin on
endif

set backspace=2
set noshowmode
set noswapfile
set nobackup
set nowb
set nowrap
set nopaste
set autoindent
set smartindent
:set pastetoggle=<F1>

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

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
hi ColorColumn ctermbg=52 

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
" Use CtrlP Mixed Mode by default
"===============================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
