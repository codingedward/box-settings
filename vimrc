set nocompatible
set encoding=utf-8
let mapleader = " " 

call plug#begin('~/.vim/plugged')

" ========== autocomplete
Plug 'ervandew/supertab'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
  " YCM compatibility with UltiSnips
  let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>' ] 
  let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]
  let g:SuperTabDefaultCompletionType = '<C-n>'
  set completeopt-=preview " disable preview window
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ========= snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ========== colorschemes 
Plug 'morhetz/gruvbox'

" =========== git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" ========= syntax helpers
Plug 'dart-lang/dart-vim-plugin'
Plug 'djoshea/vim-autoread'
" Plug 'tpope/vim-rails'
" Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'
"Plug 'vim-syntastic/syntastic' " <--- will eat your ram
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"  set statusline+=%*

"  let g:syntastic_always_populate_loc_list = 1
"  let g:syntastic_auto_loc_list = 1
"  let g:syntastic_check_on_open = 1
"  let g:syntastic_check_on_wq = 0
"  let g:syntastic_javascript_checkers = ['jslint']
"  let g:syntastic_javascript_standard_generic = 1

" Plug 'tpope/vim-commentary'
Plug 'Chiel92/vim-autoformat'
Plug 'octol/vim-cpp-enhanced-highlight'
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_experimental_template_highlight = 1
  let g:cpp_concepts_highlight = 1

Plug 'jiangmiao/auto-pairs'
"Plug 'lambdalisue/vim-django-support' " <--- will eat your startup
Plug 'alvan/vim-closetag'
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'
Plug 'tikhomirov/vim-glsl'

" ========= file tree
Plug  'scrooloose/nerdtree'
  let NERDTreeIgnore = [ '__pycache__',  '\.pyc$', '\.o$', '\.swp', '*\.swp', 'node_modules/' ]
  let NERDTreeShowHidden=1
  " autostart nerd-tree
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif
  " nerdtree toggle
  map <C-n> :NERDTreeToggle<CR>
  " foler name color same as folder icon
  highlight! link NERDTreeFlags NERDTreeDir

" ========= navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'zhaocai/GoldenView.Vim'
  let g:goldenview__enable_default_mapping = 0


" ======= fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
  nnoremap <silent> <Leader>c :Commits<CR>
  nnoremap <silent> <Leader>bc :BCommits<CR>
  nnoremap <silent> <Leader>l :Lines<CR>
  nnoremap <silent> <Leader>f :Ag<CR>
  nnoremap <silent> <Leader>g :GFiles?<CR>
  nnoremap <silent> <Leader>F :Files<CR>
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)
Plug 'pbogut/fzf-mru.vim'
Plug 'dyng/ctrlsf.vim'
  nnoremap <Leader>s :CtrlSF
  

" ======= extras
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'bling/vim-airline'
  " airline powerline fonts
  let g:airline_powerline_fonts=1
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

" load as last
Plug 'ryanoasis/vim-devicons'
call plug#end()            " required
filetype plugin indent on    " required

" ============= extra settings
" set autochdir
syntax on
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

" tabs control
autocmd BufNewFile,BufRead *.php call SetTabsSpacing()
function SetTabsSpacing()
    setlocal tabstop=4
    setlocal shiftwidth=4
endfunction

set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set hidden
let &colorcolumn="80"
:set guioptions-=m " remove menu bar
:set guioptions-=T " remove toolbar
:set guioptions-=r " remove right-hand scroll bar
:set guioptions-=L " remove left-hand scroll bar
":set lines=999 columns=999
set shortmess+=A " disable swap file warning

" hybrid line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" colorschemes 
" Dark: monokai-chris, gruvbox
" Light: ChocolatePapaya
set background=dark
colorscheme gruvbox
  let g:gruvbox_contrast_dark='default'
  let g:gruvbox_contrast_light='default'

" split below and right feels more natural
set splitbelow

" no wrapping
set nowrap

" allow backspace immediately after insert
set bs=2

" useful aliases
cnoreabbrev W w
cnoreabbrev Q q

" save undo in a file
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" incremental and highlight search
set incsearch
set hlsearch

" clear highlighting on return in normal mode
nnoremap <silent> <CR> :noh<CR><CR>

" use global clipboard
set clipboard=unnamed,unnamedplus
