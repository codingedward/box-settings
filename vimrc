"{{{ Vi-nocompatible

set nocompatible

"}}}

"{{{ Leader key

let mapleader = " " 

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


"{{ Completion to use Tab only
  
Plug 'ervandew/supertab'

"}}

"{{ Intellisense and autocomplete

Plug 'valloric/youcompleteme', { 'do': './install.py --all' }

  " YCM configuration file 
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

  " YCM compatibility with UltiSnips
  let g:SuperTabDefaultCompletionType = '<C-n>'
  let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>' ] 
  let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]

  " Disable preview window
  set completeopt-=preview

"}}

"{{ Collection of snippets

Plug 'SirVer/ultisnips'

"}}

"{{ Integration with snippets

Plug 'honza/vim-snippets'
  " Use tabs on snippets
  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"}}

"{{ Colorschemes

" Load colorscheme
Plug 'morhetz/gruvbox'

  " Use the default gruvbox contrast level
  let g:gruvbox_contrast_dark='default'

"}}

"{{ Version control - Git
  
" Git integration on normal mode
Plug 'tpope/vim-fugitive'

" Gutter showing git changes
Plug 'airblade/vim-gitgutter'

" Nerd tree showing git changes
Plug 'Xuyuanp/nerdtree-git-plugin'
"}}

"{{ Language syntax helpers

" Dart
Plug 'dart-lang/dart-vim-plugin'

" JavaScript
Plug 'pangloss/vim-javascript'

" JSX
Plug 'mxw/vim-jsx'

" GraphQL
Plug 'jparise/vim-graphql'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_experimental_template_highlight = 1
  let g:cpp_concepts_highlight = 1

" GLSL
Plug 'tikhomirov/vim-glsl'

" Autoformater
Plug 'Chiel92/vim-autoformat'

" Close braces and brackets
Plug 'jiangmiao/auto-pairs'

" Close XML tags
Plug 'alvan/vim-closetag'
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'

"}}


"{{ Navigation

" Project file tree
Plug  'scrooloose/nerdtree'
  
  " Show hidden files
  let NERDTreeShowHidden=1

  " Hide these files
  let NERDTreeIgnore = [ '__pycache__',  '\.pyc$', '\.o$', '\.swp', '*\.swp', 'node_modules/' ]
  
  " Autostart NERDTree on starting Vim
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif

  " Toggle NERDTree
  map <silent> <C-n> :NERDTreeToggle<CR>

  map <silent> <Leader>r :NERDTreeFind<cr>

  " Folder name color same as folder icon
  highlight! link NERDTreeFlags NERDTreeDir

" TMUX-Vim integration
Plug 'christoomey/vim-tmux-navigator'

" Maximize active pane
Plug 'zhaocai/GoldenView.Vim'
  
  " Disable default mapping
  let g:goldenview__enable_default_mapping = 0

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }

" Fuzy finder Vim integration
Plug 'junegunn/fzf.vim'
  
  " Prepend all fzf commands to avoid pollution
  let g:fzf_command_prefix = 'Fzf'

  " Git commits
  nnoremap <silent> <Leader>c :FzfCommits<CR>
  
  " Search within project
  nnoremap <silent> <Leader>f :FzfAg<CR>
  
  " Search filenames
  nnoremap <silent> <Leader>F :FzfFiles<CR>

  " Show file preview in fzf
  command! -bang -nargs=? -complete=dir FzfFiles
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  command! -bang -nargs=* FzfAg
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)

" Global search allowing navigation from file to file
Plug 'dyng/ctrlsf.vim'
  nnoremap <Leader>s :CtrlSF<space>
  "nnoremap <Leader>s <Plug>CtrlSFVwordExec


Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

"}}


"{{ Extras

" Cool status bar
Plug 'bling/vim-airline'

  " ...with cool fonts
  let g:airline_powerline_fonts=1

" Cool file icons (important: load as last!)
Plug 'ryanoasis/vim-devicons'

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

set background=dark
colorscheme gruvbox
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

"{{ Sane splits

set splitbelow

"}}


"{{ Persistent Undo

if has("persistent_undo")
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

"}}

