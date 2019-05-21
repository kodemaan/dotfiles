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
set copyindent
set smartcase
set mouse=a
set clipboard=unnamedplus
set colorcolumn=120
set nocursorline
set hidden
set signcolumn=yes
set wildmenu
set lazyredraw
set list
set timeoutlen=500
set cmdheight=2
set updatetime=300
set shortmess+=c
let &listchars = "tab:~>,space:•,extends:>,precedes:<,eol:\u00ac,trail:\u00b7"
let mapleader = " "
" If you hit enter on a modified buffer it saves it else it just hits enter
nnoremap <silent><expr> <CR> &buftype is# '' ? ":update\<CR>" : "\<CR>"
nnoremap <silent>K :call <SID>show_documentation()<CR>
" nnoremap <Leader>s :GFiles<CR>
nnoremap <expr> <Leader>s (FugitiveHead() != '' ? ':GFiles<cr>' : ':Files<cr>')
nnoremap <Leader>vf :tabe ~/.vimrc<CR>
nnoremap <Leader>vs :source ~/.vimrc<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bk :bdelete<CR>
nnoremap <Leader>f/ :Lines<CR>
nnoremap <Leader>fp :Ag<CR>
nnoremap <Leader>ww  :Windows<CR>
nnoremap <Leader>ne :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFocus<CR>
nnoremap <Leader>nt :tabe<CR>
nnoremap <Leader>tt :tabe term:///bin/zsh<CR>i
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>q :q<CR>

" markdown stuff
let vim_markdown_preview_toggle=1
" Tab completion coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! ViewHtmlText(url)
  if !empty(a:url)
    new
    setlocal buftype=nofile bufhidden=hide noswapfile
    execute 'r !elinks ' . a:url . ' -dump -dump-width ' . winwidth(0)
    1d
  endif
endfunction

vnoremap <Leader>h y:call ViewHtmlText(@@)<CR>
let g:coc_snippet_next = '<tab>'
" End Tab Completion coc.nvim
nnoremap <Leader>ah :ALEHover<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <Leader>af :ALEDetail<CR>
nnoremap =j :%!python -m json.tool<CR>
nnoremap <Leader>al :ALEFix<CR>
nnoremap <Leader>ee <Plug>(coc-diagnostic-info)<CR>
" Window commands
nnoremap <Leader>wk <C-w>k<CR>
nnoremap <Leader>wj <C-w>j<CR>
nnoremap <Leader>wl <C-w>l<CR>
nnoremap <Leader>wh <C-w>h<CR>
nnoremap <Leader>w- :sp<CR>
nnoremap <Leader>w/ :vs<CR>
" End window commands
nnoremap <Leader>c :Commands<CR>
nnoremap \ :nohlsearch<CR>

" Remap escape to work in terminal mode
tnoremap <C-k> <Up>
tnoremap <C-j> <Down>
tnoremap <C-h> <Left>
tnoremap <C-l> <Right>
" End Personal configs
command! -nargs=0 Format :call CocAction('format')


" more terminal stuff
autocmd TermOpen * setl nocursorline norelativenumber nonumber
autocmd TermOpen * tnoremap <Esc> <C-\><C-n>
" end more terminal stuff

au FileType fzf tunmap <Esc>
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'whatyouhide/vim-gotham'
Plug 'dikiaap/minimalist'
Plug 'tpope/vim-fugitive'
Plug 'blueshirts/darcula'
Plug 'yaroot/vissort'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'diepm/vim-rest-console'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'HerringtonDarkholme/yats'
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
" END ALE Configuration

syntax on
colorscheme darcula
if has("gui_running")
  set macligatures
  set guifont="Fira Code:h12"
endif
hi SpecialKey ctermfg=237 guifg=#3a3a3a
hi NonText ctermfg=237 guifg=#3a3a3a
set termguicolors
