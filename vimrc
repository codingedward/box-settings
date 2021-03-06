"{{{ Vi-nocompatible

set nocompatible

"}}}

"{{{ Leader key

let mapleader = " " 

"}}}

"{{{ Terminal profile (Light|Dark)
let iterm_profile = $ITERM_PROFILE
"}}}

"{{{ Plugins

"{{ Load plugin manager

if !filereadable(expand('~/.vim/autoload/plug.vim'))
  let s:first_init=1
endif

if exists("s:first_init")
  echom 'Plugin manager: vim-plug not been installed. Attempting installation...'
  exec 'silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs '.
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echom 'Installed successfully!'
endif

call plug#begin('~/.vim/plugged')

"}}

"{{ Intellisense and autocomplete

Plug 'rescript-lang/vim-rescript'
autocmd BufWritePost .res :RescriptFormat<CR>
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-rls', 'coc-flutter']
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs <Plug>(coc-rename)

"}}

"{{ Colorschemes and views

" Load colorscheme
Plug 'morhetz/gruvbox'

" Use the default gruvbox contrast level
let g:gruvbox_contrast_dark='default'

Plug 'junegunn/goyo.vim'
let g:goyo_linenr = 1
nnoremap <silent> <leader>g :Goyo<CR>

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=12
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" tsconfig set correct format
Plug 'neoclide/jsonc.vim'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
"}}

"{{ Version control - Git

" Git integration on normal mode
Plug 'tpope/vim-fugitive'
nmap <silent> gf :diffget //3<CR>
nmap <silent> gj :diffget //2<CR>

" Open GitHub repo using :Gbrowse
Plug 'tpope/vim-rhubarb'

" Gutter showing git changes
Plug 'airblade/vim-gitgutter'

"Cheat sheet
"Plug 'https://gitlab.com/dbeniamine/cheat.sh-vim'
"let g:CheatSheetDoNotMap=1
" Add mappings from cheat.sh-vim/plugin/cheat.vim with the '!' parameter replaced by ''
"nnoremap <script> <silent> <leader>KB
"            \ :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '')<CR>
"vnoremap <script> <silent> <leader>KB
"            \ :call cheat#cheat("", -1, -1, 2, 0, '')<CR>


" Nerd tree showing git changes
Plug 'Xuyuanp/nerdtree-git-plugin'
"let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeWinSize = 40
"}}

"{{ Language syntax helpers

" GraphQL
Plug 'jparise/vim-graphql'

" Comments
Plug 'tpope/vim-commentary'

" JavaScript
Plug 'pangloss/vim-javascript'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" JSX with some overrides
Plug 'maxmellon/vim-jsx-pretty'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

Plug 'rhysd/vim-clang-format'
"let g:clang_format#auto_format = 1
autocmd FileType c,cpp,objc ClangFormatAutoEnable

" GLSL
Plug 'tikhomirov/vim-glsl'

" Close braces and brackets
Plug 'jiangmiao/auto-pairs'
au FileType rust let b:AutoPairs = AutoPairsDefine({ "'" : '' })

" Close XML tags
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.js,*.jsx,*.tsx,*.ts'
"}}


"{{ Navigation

" Project file tree
Plug  'preservim/nerdtree'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = [ '__pycache__',  '\.pyc$', '\.o$', '\.swp', '*\.swp', 'node_modules', '.dart_tool', '.idea' ]

" Autostart NERDTree on starting Vim
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif

" Toggle NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <leader>r :NERDTreeFind<cr>

" Folder name color same as folder icon
highlight! link NERDTreeFlags NERDTreeDir

" TMUX-Vim integration
Plug 'christoomey/vim-tmux-navigator'

" Maximize active pane
Plug 'zhaocai/GoldenView.Vim'
let g:goldenview__enable_default_mapping = 0

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
let g:fzf_history_dir = '~/.fzf/history'
nnoremap <silent> <leader>c :FzfCommits<CR>
nnoremap <silent> <leader>f :FzfAg<CR>
nnoremap <silent> <leader>F :FzfFiles<CR>
command! -bang -nargs=? -complete=dir FzfFiles
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* FzfAg
      \ call fzf#vim#ag(<q-args>,
      \                 '--ignore "node_modules" --ignore "yarn.lock" --ignore "package-lock.json"',
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)
function! s:set_fzf_maps()
  tnoremap <buffer> <C-t> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzfFiles<CR>
  tnoremap <buffer> <C-g> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzfAg<CR>
  tnoremap <buffer> <C-o> <C-\><C-n>:close<CR>:sleep 100m<CR>:FzfHistory<CR>
endfunction

augroup fzfMappingsAu
  autocmd!
  autocmd FileType fzf call <SID>set_fzf_maps()
augroup END

" Global search allowing navigation from file to file
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_focus = { 'at': 'start' }
let g:ctrlsf_mapping = { 'next': 'n',  'prev': 'N'  }
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_preview = 1
nnoremap <leader>s viw :<C-u>call <SID>GrepFromSelected(visualmode())<CR>

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CtrlSF '.word
endfunction
" }}

Plug 'easymotion/vim-easymotion'
nmap e <Plug>(easymotion-bd-w)


Plug 'tpope/vim-surround'
Plug 'AndrewRadev/tagalong.vim'
let g:tagalong_additional_filetypes = ['javascript']
let g:tagalong_mappings = ['s', 'c', 'C', 'v', 'i', 'a']
"}}


"{{ Extras
Plug 'itchyny/lightline.vim'
if iterm_profile == 'Dark'
  let g:lightline = {
        \ 'colorscheme': 'seoul256',
        \ }
else
  let g:lightline = {
        \ 'colorscheme': 'PaperColor_light',
        \ }
endif


"}}

" Install all plugins if this is the firs load
if exists('s:first_init')
  PlugInstall
end

call plug#end()

"}}}

"{{{ Settings

"{{ General

set magic
set lazyredraw
set encoding=utf-8
set showmatch
set autoread
set updatetime=300
set mouse=a

"}}

"{{ Indentation

set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set nowrap
set bs=2

"}}

"{{ Search

set incsearch
set hlsearch
set smartcase

"}}

"{{ Syntax

filetype plugin indent on
syntax on
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

" 4 spaces == 1 tab in php
autocmd BufNewFile,BufRead *.php call SetTabsSpacing()
function SetTabsSpacing()
  setlocal tabstop=4
  setlocal shiftwidth=4
endfunction

"}}

"{{ View

let g:gruvbox_contrast_light="hard"
let g:gruvbox_contrast_dark="soft"
colorscheme gruvbox

if iterm_profile == "Dark"
  set background=dark
else 
  set background=light
endif

set conceallevel=3
set cmdheight=2
set scrolloff=12
let &colorcolumn=80
if has('gui')
  :set guioptions-=m " remove menu bar
  :set guioptions-=T " remove toolbar
  :set guioptions-=r " remove right-hand scroll bar
  :set guioptions-=L " remove left-hand scroll bar
end
set shortmess+=A
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"}}

set hidden
set nobackup
set nowritebackup
set completeopt-=preview

"{{ Sane splits

set splitbelow

"}}


"{{ Persistent Undo

"" Keep undo history across sessions by storing it in a file

if has('persistent_undo')
  let vim_dir = '$HOME/.vim'
  "let &runtimepath.=','.vim_dir
  let undo_dir = expand(vim_dir.'/undo')
  call system('mkdir ' . vim_dir)
  call system('mkdir ' . undo_dir)
  let &undodir = undo_dir
  set undofile
  set undodir=~/.vim/undo
  set undolevels=1000
  set undoreload=10000
endif

"}}


"{{ Clipboard

set clipboard=unnamed,unnamedplus

"}}

" clear highlighting on return in normal mode
nnoremap <silent> <CR> :noh<CR><CR>

" Edit vim configuration
nnoremap <silent> <leader>ev :vs $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" nice move
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-x> <C-w>x

"{{ No annoying bells

set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

"}}

"{{ Files

set nobackup
set nowb
set noswapfile

"}}
"}}}

"{{ Aliases

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev X x
cnoreabbrev QA qa

"}}


"{{{ Autoreload vim on changes made to vim configuration

augroup vimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
augroup END

"}}}


"{{{ Override syntax highlighting

highlight def link jsxTag Identifier
highlight def link jsxTagName Identifier
highlight def link jsxComponentName Identifier

highlight def link jsxAttrib Include
highlight def link jsxAttribKeyword jsxAttrib
highlight def link jsxString String
highlight def link jsxComment Comment

highlight def link jsxDot Operator
highlight def link jsxNamespace Operator
highlight def link jsxEqual Operator
highlight def link jsxSpreadOperator Operator
highlight def link jsxBraces Operator

"}}}
