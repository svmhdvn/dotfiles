call plug#begin(stdpath('data') . '/plugged')
Plug 'ziglang/zig.vim'
call plug#end()

set mouse=a " Enable the mouse

let g:mapleader="\<Space>"
let g:zig_fmt_autosave = 0

" Cause regexes backslashes to actually escape things rather than be used for
" regular regex usage (see ':help magic')
set magic

" 4 space tabs by default
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smartindent
autocmd Filetype ruby set softtabstop=2 shiftwidth=2 tabstop=2

" Vim Display.
"set shortmess+=I                     " Hide splash screen.
set tw=80                            " Always prefer an 80-character textwidth
set colorcolumn=+0                   " Show a vertical line at the textwidth
set number
set relativenumber

" Text Display.
set nowrap                           " No word wrapping (use 0 and $ instead)

" Searching and matching.
set ignorecase|set smartcase         " Ignore case for lowercase only
set wildignorecase
set showmatch                        " Flash matching bracket when inserted

" Miscellaneous settings
set hidden
set lazyredraw
set noswapfile
set nobackup
set nowritebackup
set ttimeoutlen=0

" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'

" vim colemak bindings

noremap n j
noremap e k
noremap i l

noremap t e
noremap T E
noremap k n
noremap K N
noremap s i
noremap S I

onoremap r i

noremap l ^
noremap L $

noremap <C-n> <C-d>
noremap <C-e> <C-u>
inoremap <C-e> <C-p>

" Switch buffers.
nnoremap <C-h> :bprev<CR>
nnoremap <C-i> :bnext<CR>

nnoremap H <C-w>h
nnoremap N <C-w>j
nnoremap E <C-w>k
nnoremap I <C-w>l

"""Misc Mappings"""
nnoremap j :noh<CR>
noremap U <C-r>
nnoremap <CR> o<Esc>
nnoremap p p=`]

"save file"
nnoremap <leader>w :w<CR>

"Open the Netrw file browser in the directory of the current buffer's file
nnoremap <leader>d :E<CR>

"delete buffer but don't close window (go to previous buffer first)"
nnoremap <silent> <leader>q :bp\|bd #<CR>

" Remove all trailing whitespace in a file at once, without being intrusive
nnoremap <silent> <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Find and buffer commands
nnoremap <leader>f :e<Space>
nnoremap <leader>b :ls<CR>:b<Space>
