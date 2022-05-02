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
  Plug 'gruvbox-community/gruvbox'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'hashivim/vim-terraform'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let NERDTreeShowHidden=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

nnoremap <F1> :FZF<CR>
nnoremap <F2> :NERDTreeToggle<CR> 
nnoremap <F3> :Rg<CR>

nnoremap <A-Left> :bprevious<CR>
nnoremap <A-Down> :bd<CR>
nnoremap <A-Right> :bnext<CR>
