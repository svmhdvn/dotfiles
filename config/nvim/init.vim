call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ziglang/zig.vim'
call plug#end()

let g:mapleader="\<Space>"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
let g:zig_fmt_autosave = 0

set colorcolumn=80
set expandtab
set hidden
set ignorecase
set lazyredraw
set magic
set mouse=a
set nobackup
set noswapfile
set nowrap
set nowritebackup
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set ttimeoutlen=0
set wildignorecase

autocmd Filetype ruby set softtabstop=2 shiftwidth=2 tabstop=2

" vim colemak bindings
inoremap <C-e> <C-p>
nnoremap <C-h> :bprev<CR>
nnoremap <C-i> :bnext<CR>
nnoremap <CR> o<Esc>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>d :E<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>q :bp\|bd #<CR>
nnoremap <silent> <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap E <C-w>k
nnoremap H <C-w>h
nnoremap I <C-w>l
nnoremap N <C-w>j
nnoremap j :noh<CR>
nnoremap p p=`]
noremap <C-e> <C-u>
noremap <C-n> <C-d>
noremap K N
noremap L $
noremap S I
noremap T E
noremap U <C-r>
noremap e k
noremap i l
noremap k n
noremap l ^
noremap n j
noremap s i
noremap t e
onoremap r i
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
