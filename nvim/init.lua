local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tpope/vim-sensible')
Plug('scrooloose/nerdtree', { on = 'NERDTreeToggle' })
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

