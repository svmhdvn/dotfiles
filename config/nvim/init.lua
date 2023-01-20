require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'junegunn/fzf.vim', requires = 'junegunn/fzf'}
    use {'ziglang/zig.vim', ft = {'zig'}}
    use {'neovimhaskell/haskell-vim', ft = {'haskell'}}
    use {'dracula/vim'}

    use 'neovim/nvim-lspconfig'
    -- use 'mlochbaum/BQN'
end)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', ',df', vim.diagnostic.open_float, opts)
vim.keymap.set('n', ',dh', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ',di', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', ',dl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', ',gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', ',gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', ',gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', ',gk', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', ',gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', ',gs', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', ',gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', ',wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', ',wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', ',r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', ',c', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', ',f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['zls'].setup{
    on_attach = on_attach,
}

vim.g.mapleader = ' '
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.zig_fmt_autosave = 0

-- default indentation settings (useful for most text editing needs)
vim.cmd.colorscheme('dracula')
vim.opt.colorcolumn = '80'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.backup = false
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeout = false
vim.opt.wildignorecase = true
vim.opt.wrap = false
vim.opt.writebackup = false

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
vim.keymap.set('n', '<leader>q', ':bp|bd #<CR>', {silent = true})
vim.keymap.set('n', '<leader>s', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>', {silent = true})
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', 'E', '<C-w>k')
vim.keymap.set('n', 'H', '<C-w>h')
vim.keymap.set('n', 'I', '<C-w>l')
vim.keymap.set('n', 'N', '<C-w>j')
vim.keymap.set('n', 'j', ':noh<CR>')
vim.keymap.set('n', 'p', 'p=`]')

vim.keymap.set('i', '<C-e>', '<C-p>')
vim.keymap.set('o', 'r', 'i')
