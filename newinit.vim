set tabstop=2
set shiftwidth=2
set expandtab
set number
set noswapfile
set nobackup
set nowritebackup
set ignorecase
set hlsearch
set smartindent
set undodir=~/.vim/.cache/undo_dir/
set wrap
set nolist
set incsearch
set undofile
set copyindent
set smartcase
set mouse=a
set colorcolumn=120
set nocursorline
set updatetime=300
set hidden
set signcolumn=auto
set wildmenu
set lazyredraw
set list
set relativenumber
set cmdheight=2
set nofixendofline
set shortmess+=c
set tags=tags
filetype plugin on

" ================ MAPPINGS =====================
command! Bd :up | %bd | e#
nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey  ','<CR>
vnoremap <silent> <leader>      :WhichKeyVisual '<Space>'<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>
nnoremap <leader>ht :HardTimeToggle<CR>
nnoremap <leader>dl :r ~/diary/diary/template.md<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wj :wincmd j<CR>

" nnoremap <leader>tp :call CocAction('runCommand', 'jest.projectTest')<CR>
" nnoremap <leader>tc :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>
" nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <leader>qf  <Plug>(coc-fix-current)
nnoremap <leader>ac  <Plug>(coc-codeaction)
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>w- :split<CR>
nnoremap <leader>w\ :vsplit<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>ml :set list!<CR>
nnoremap <leader>mc :CalendarH<CR>
" H moves to first nonblank character
nnoremap H ^
vnoremap H ^
" L moves to last nonblank character
nnoremap L g_
vnoremap L g_
" J moves down 5 lines 
nnoremap J 5j
vnoremap J 5j
" K moves up 5 lines 
nnoremap K 5k
vnoremap K 5k
" Get back J mapping
nnoremap <leader>j J
nnoremap <leader>K K
vnoremap <leader>j J
vnoremap <leader>K K
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" git 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Git pushd<CR>
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>gc :Gcommit<CR>
" git gutter
nnoremap <leader>ggs :GitGutterStageHunk<CR>
nnoremap <leader>ggt :GitGutterToggle<CR>

" vim source files
nnoremap <leader>vs :so $MYVIMRC<CR>
nnoremap <leader>vf :tabe $MYVIMRC<CR>
nnoremap <leader>vo :tabe ~/code/dotfiles/newvimrc<CR>

nnoremap <leader>cc :Commands<CR>
nnoremap <leader>cf :CocCommand eslint.executeAutofix<CR>
nnoremap <leader>cn :CocNext<CR>
nnoremap <leader>cd :CocList diagnostics<CR>

" Misc commands
nnoremap <leader>f :Ag<CR>
nnoremap <leader>s :GFiles<CR>
nnoremap <leader>r :Ranger<CR>
nnoremap <leader>l :Buffer<CR>
nnoremap <leader>/ :BLines<CR>

let g:ranger_map_keys = 0
" nnoremap <expr> <Leader>s (FugitiveHead() != '' ? ':GFiles<cr>' : ':Files<cr>')
" nnoremap <Leader>gs :Gstatus<CR>

" Git Gutter
" nnoremap <Leader>gt :GitGutterToggle<CR>
" nnoremap <Leader>gn <Plug>(GitGutterNextHunk)
" nnoremap <Leader>gp <Plug>(GitGutterPreviousHunk)

" Fzf
" nnoremap <Leader>fp :Ag<CR>
" nnoremap <Leader>l :Buffers<CR>
" nnoremap <Leader>/ :Lines<CR>

" Misc
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc><c-s>a
nnoremap <Leader>tt :VimwikiToggleListItem<CR>
" nnoremap <Leader>vs :source ~/.config/nvim/init.vim<CR>

" coc.nvim
nnoremap <Leader>md :MarkdownPreview
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Ale Configs
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
nnoremap <leader>ca :ALECodeAction<CR>
nnoremap K :ALEHover<CR>
nnoremap an :ALENext<CR>
nnoremap ap :ALEPrevious<CR>
nnoremap ad :ALEGoToDefinition<CR>
nnoremap af :ALEFix<CR>
let g:ale_sign_error = "🐛"
let g:ale_sign_warning =  " ⚠️"
let g:ale_sign_info = "ℹ"
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥 "
nmap <silent> gd :ALEGoToDefinition<CR>
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = "omnifunc"


" ================ END ==========================
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox'
Plug 'francoiscabrol/ranger.vim'
Plug 'wakatime/vim-wakatime'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'dense-analysis/ale'
Plug 'takac/vim-hardtime'
call plug#end()


colorscheme gruvbox
