" Personal configs
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber
set nobackup
set noswapfile
set nowritebackup
set ignorecase
set hlsearch
set smartindent
set undodir=~/.vim/.cache/undo_dir/
set wrap linebreak nolist
set undofile
set smartcase
set mouse=a
set clipboard=unnamedplus
set colorcolumn=120
set nocursorline
set hidden
set signcolumn=yes
set wildmenu
set lazyredraw
let &listchars = "tab:\u2192 ,extends:>,precedes:<,eol:\u00ac,trail:\u00b7"
let mapleader = " "
nnoremap <silent><expr> <CR> &buftype is# '' ? ":update\<CR>" : "\<CR>"
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>vcf :tabe ~/.vimrc<CR>
nnoremap <Leader>vs :source ~/.vimrc<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>f/ :Lines<CR>
nnoremap <Leader>fp :Ag<CR>
nnoremap <Leader>ne :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFocus<CR>
nnoremap <Leader>nt :tabe<CR>
nnoremap <Leader>tt :tabe term:///bin/zsh<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>q :q<CR>
" Tab completion coc.nvim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" End Tab Completion coc.nvim
nnoremap <Leader>ah :ALEHover<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <Leader>af :ALEDetail<CR>
nnoremap <Leader>al :ALEFix<CR>
nnoremap <Leader>ee <Plug>(coc-diagnostic-info)<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap \ :nohlsearch<CR>

" Remap escape to work in terminal mode
tnoremap <Esc> <C-\><C-n>
" End Personal configs

" more terminal stuff
augroup vimrc-terminal
  autocmd!
  autocmd TermOpen * setl nocursorline norelativenumber nonumber | IndentLinesDisable
augroup END
" end more terminal stuff

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'whatyouhide/vim-gotham'
Plug 'dikiaap/minimalist'
Plug 'Yggdroot/indentLine' 
Plug 'tpope/vim-fugitive'
Plug 'blueshirts/darcula'
Plug 'yaroot/vissort'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'HerringtonDarkholme/yats'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
call plug#end()

" ALE Configuration
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['tslint']
\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_cache_executable_check_failures = 1
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 500
let g:airline#extensions#ale#enabled = 1
" END ALE Configuration

syntax on
colorscheme darcula
" End Syntastic settings
