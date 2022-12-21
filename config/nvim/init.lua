require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'junegunn/fzf.vim', requires = 'junegunn/fzf'}
    use {'ziglang/zig.vim', ft = {'zig'}}
    use {'neovimhaskell/haskell-vim', ft = {'haskell'}}
    -- use 'mlochbaum/BQN'
end)

vim.g.mapleader = ' '
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.zig_fmt_autosave = 0

-- default indentation settings (useful for most text editing needs)
vim.opt.colorcolumn = '80'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.mouse = 'a'
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.timeout = false
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.wildignorecase = true

--augroup filetypedetect
--    autocmd BufNew,BufNewFile,BufRead APKBUILD :setfiletype sh
--augroup END
--
--autocmd Filetype haskell,ruby set shiftwidth=2
--autocmd Filetype c,cpp,sh set noexpandtab shiftwidth=0

-- vim colemak bindings
vim.keymap.set('', '<C-e>', '<C-u>')
vim.keymap.set('', '<C-n>', '<C-d>')
vim.keymap.set('', 'K', 'N')
vim.keymap.set('', 'L', '$')
vim.keymap.set('', 'S', 'I')
vim.keymap.set('', 'T', 'E')
vim.keymap.set('', 'U', '<C-r>')
vim.keymap.set('', 'e', 'k')
vim.keymap.set('', 'i', 'l')
vim.keymap.set('', 'k', 'n')
vim.keymap.set('', 'l', '^')
vim.keymap.set('', 'n', 'j')
vim.keymap.set('', 's', 'i')
vim.keymap.set('', 't', 'e')

vim.keymap.set('n', '<C-h>', ':bprev<CR>')
vim.keymap.set('n', '<C-i>', ':bnext<CR>')
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<leader>b', ':Buffers<CR>')
vim.keymap.set('n', '<leader>d', ':E<CR>')
vim.keymap.set('n', '<leader>f', ':Files<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':bp|bd #<CR>', {silent = true})
vim.keymap.set('n', '<leader>s', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>', {silent = true})
vim.keymap.set('n', 'E', '<C-w>k')
vim.keymap.set('n', 'H', '<C-w>h')
vim.keymap.set('n', 'I', '<C-w>l')
vim.keymap.set('n', 'N', '<C-w>j')
vim.keymap.set('n', 'j', ':noh<CR>')
vim.keymap.set('n', 'p', 'p=`]')

vim.keymap.set('o', 'r', 'i')
vim.keymap.set('i', '<C-e>', '<C-p>')
