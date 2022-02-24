set exrc
set guicursor=
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartcase
set smartindent
set hidden
set noerrorbells
set nu
set signcolumn=yes
set scrolloff=8
set signcolumn=yes

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sbdchd/neoformat'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

autocmd BufWritePre,InsertLeave *.js Neoformat

