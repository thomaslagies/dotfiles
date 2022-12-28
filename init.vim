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

set number
augroup numbertoggle
  autocmd!
  autocm BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:preview-top,shift-down:preview-bottom,
\alt-up:half-page-up,alt-down:half-page-down"

command! -nargs=* Wrap set wrap linebreak nolist 

call plug#begin('~/.vim/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0'}
  Plug 'ThePrimeagen/harpoon'
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'hashivim/vim-terraform'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal guibg=none

" Run prettier on InsertLeave or with :Prettier
" autocmd InsertLeave * silent call CocAction('runCommand', 'prettier.formatFile')
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <Leader>f :Files<CR>
nnoremap <Leader>r :Rg<CR>

nnoremap <Leader><Left> :bprevious<CR>
nnoremap <Leader><Down> :bd<CR>
nnoremap <Leader><Right> :bnext<CR>

noremap <leader>sv :source $MYVIMRC<CR>

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
