let g:mapleader="\<Space>"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
let g:zig_fmt_autosave = 0

" default indentation settings (useful for most text editing needs)
set background=dark
set hidden
set ignorecase
set lazyredraw
set mouse=a
set nobackup
set noswapfile
set nowrap
set nowritebackup
set relativenumber
set showmatch
set smartcase
set ttimeoutlen=0
set wildignorecase

" format=flowed config
" See `:help formatoptions` for exact reason why all these flags are used.
" They are very important in ensuring seamless use of f=f
"autocmd Filetype mail set formatoptions=acjlpqtw
"autocmd Filetype mail match ErrorMsg '\s\+$'

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
