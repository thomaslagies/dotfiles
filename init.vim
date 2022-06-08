set exrc
set autoread
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
set noswapfile
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set scrolloff=8
set signcolumn=yes
let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:preview-top,shift-down:preview-bottom,
\alt-up:half-page-up,alt-down:half-page-down"

command! -nargs=* Wrap set wrap linebreak nolist 

call plug#begin('~/.vim/plugged')
  Plug 'gruvbox-community/gruvbox'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'hashivim/vim-terraform'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal guibg=none

" Run prettier on InsertLeave or with :Prettier
autocmd InsertLeave * silent call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <F1> :Files<CR>
nnoremap <F2> :Rg<CR>

nnoremap <A-Left> :bprevious<CR>
nnoremap <A-Down> :bd<CR>
nnoremap <A-Right> :bnext<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

