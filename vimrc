"To use fzf in Vim, add the following line to your .vimrc:
set rtp+=/usr/local/opt/fzf
set regexpengine=1

let mapleader = " "
" imap <C-h> <esc>:w<cr>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

colorscheme material-monokai
" let g:quantum_black=1
" colorscheme quantum
" colorscheme jellybeans
" colorscheme space-vim-dark
" let g:space_vim_dark_background = 233

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

set textwidth=100
set colorcolumn=+1
hi ColorColumn ctermbg=52 

"===============================================
"Line numbers
"===============================================

set number
set numberwidth=5
highlight LineNr ctermfg=darkgrey ctermbg=233
highlight CursorLineNr ctermfg=grey ctermbg=52

" function! NumberToggle()
"   if(&relativenumber == 1)
"     set norelativenumber
"   else
"     set relativenumber
"   endif
" endfunc

" nnoremap <C-n> :call NumberToggle()<cr>

" :au FocusLost * :set norelativenumber
" :au FocusGained * :set relativenumber

"===============================================
" Tabs and spaces
"===============================================

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

"===============================================
" Visual lines for indentation
"===============================================
let g:indentLine_color_term = 239

"===============================================
" ALE
"===============================================
hi SignColumn ctermbg=233

" let g:ale_sign_error = '•'
" let g:ale_sign_warning = '•'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '‼'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:ale_sign_column_always = 1
" let g:ale_change_sign_column_color = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_linters = {
\ 'ruby': ['rubocop'],
\}

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" hi link ALEErrorSign   error
" hi link ALEWarningSign warning

"===============================================
" FZF
"===============================================
nnoremap <C-p> :Files<CR>
nnoremap <Leader><Leader> :Ag<CR>
nnoremap <Tab> :Buffers<CR>
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" Make trailing spaces very visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

"===============================================
" UltiSnips
"===============================================

let g:UltiSnipsExpandTrigger="<C-h>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

let g:rainbow_active = 1
