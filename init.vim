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
set shell="/home/thomas/.oh-my-zsh"

command! -nargs=* Wrap set wrap linebreak nolist 

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let NERDTreeShowHidden=1

nmap <F1> :Files<CR>
nmap <F2> :NERDTreeToggle<CR> 
nmap <F3> :Rg<CR>
