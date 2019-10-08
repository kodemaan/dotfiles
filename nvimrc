" File              : .vimrc
" Author            : Steven Smith <stsmith@nabancard.com>
" Date              : 16.08.2019
" Last Modified Date: 16.08.2019
" Last Modified By  : Steven Smith <stsmith@nabancard.com>
" File              : .vimrc
" Date              : 16.08.2019
" Last Modified Date: 16.08.2019
" Personal configs {{{
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nobackup
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
" }}}
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
set signcolumn=auto
set wildmenu
set lazyredraw
set list
set relativenumber
set timeoutlen=500
set cmdheight=2
set updatetime=300
set shortmess+=c
set tags=tags
let &listchars = "tab:~>,space:•,extends:>,precedes:<,eol:\u00ac,trail:\u00b7"
let mapleader = " "
" If you hit enter on a modified buffer it saves it else it just hits enter
nnoremap <silent><expr> <CR> &buftype is# '' ? ":update\<CR>" : "\<CR>"
" nnoremap <Leader>s :GFiles<CR>
nnoremap <expr> <Leader>s (FugitiveHead() != '' ? ':GFiles<cr>' : ':Files<cr>')
nnoremap <Leader>vf :tabe ~/.vimrc<CR>
nnoremap <Leader>vs :source ~/.vimrc<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>/  :BLines<CR>
nnoremap <Leader>l :Buffers<CR>
nnoremap <Leader>bk :bdelete<CR>
nnoremap <Leader>f/ :Lines<CR>
nnoremap <Leader>fp :Ag<CR>
nnoremap <Leader>ne :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFocus<CR>
nnoremap <Leader>nt :tabe<CR>
nnoremap <Leader>tt :tabe term:///bin/zsh<CR>i
nnoremap <Leader><Enter> :HTTPClientDoRequest<CR>
" Git mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gw<CR>
" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
" end git mappings

nmap <Leader>gk :call <SID>show_documentation()<CR>
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gy <Plug>(coc-type-definition)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>gf :CocFix<cr>
nmap <Leader>gl :CocList diagnostics<cr>
nmap <Leader>yf :CocCommand eslint.executeAutofix<CR>
nmap <Leader>yl :!npx eslint --ext=js,jsx,ts,tsx %<cr>
nnoremap <Leader>q :q<CR>
set autoread

" vimwiki configs
let g:vimwiki_list = [{'path': '~/mynotes/',
  \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" markdown stuff
let vim_markdown_preview_toggle=1
" Tab completion coc.nvim

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
nnoremap <Leader>ee <Plug>(coc-diagnostic-info)<CR>
" Window commands
nnoremap <Leader>wk <C-w>k<CR>
nnoremap <Leader>wj <C-w>j<CR>
nnoremap <Leader>wl <C-w>l<CR>
nnoremap <Leader>wh <C-w>h<CR>
nnoremap <Leader>j :resize +N<CR>
nnoremap <Leader>k :resize -N<CR>
nnoremap <Leader>w- :sp<CR>
nnoremap <Leader>w/ :vs<CR>
" End window commands
nnoremap <Leader>c :Commands<CR>
nnoremap \ :nohlsearch<CR>
nnoremap <Leader>f :Ranger<CR>i

" Buffer commands
nnoremap <Leader>bl :bnext<CR>
nnoremap <Leader>bh :bprevious<CR>

" Remap escape to work in terminal mode
tnoremap <C-k> <Up>
tnoremap <C-j> <Down>
tnoremap <C-h> <Left>
tnoremap <C-l> <Right>
" End Personal configs
" more terminal stuff
if has("nvim")
  autocmd TermOpen * setl nocursorline norelativenumber nonumber
  autocmd TermOpen * tnoremap <Esc> <c-\><c-n>
  autocmd BufEnter * if &buftype == 'terminal' | tnoremap <Esc> <c-\><c-n> | endif
  autocmd FileType fzf tunmap <Esc>
endif
" end more terminal stuff

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'whatyouhide/vim-gotham'
Plug 'dikiaap/minimalist'
Plug 'tpope/vim-fugitive'
Plug 'blueshirts/darcula'
Plug 'yaroot/vissort'
Plug 'easymotion/vim-easymotion'
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gruvbox-community/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'dikiaap/minimalist'
Plug 'itchyny/lightline.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'diepm/vim-rest-console'
Plug 'HerringtonDarkholme/yats'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
call plug#end()

command -bar -bang -nargs=* Gci :Gcommit<bang> -v <args>
" COC.nvim config start
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" COC.nvim end

let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\     'left': [ ['mode', 'paste'],
\               [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\     'cocstatus': 'coc#status',
\   }
\ }

let g:vrc_curl_opts = {
  \ '-s': '',
  \ '-i': '',
\ }

let g:header_field_author = 'Steven Smith'
let g:header_field_author_email = 'stsmith@nabancard.com'
syntax on
colorscheme monokai
if has("gui_running")
  set macligatures
  set guifont="Fira Code:h12"
endif
hi SpecialKey ctermfg=237 guifg=#3a3a3a
hi NonText ctermfg=237 guifg=#3a3a3a
set termguicolors

