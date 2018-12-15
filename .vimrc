set nocompatible  " be iMproved, required
set encoding=utf-8 " required by YCM
filetype off      " required

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
Plug 'flazz/vim-colorschemes'

" =========== git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" ========= syntax helpers
Plug 'scrooloose/syntastic'
Plug 'Chiel92/vim-autoformat'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'lambdalisue/vim-django-support'
Plug 'alvan/vim-closetag'
        let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.php,*.phtml,*.js,*.coffee'

" ========= file tree
Plug  'scrooloose/nerdtree'
        let NERDTreeIgnore = [ '__pycache__',  '\.pyc$', '\.o$', '\.swp', '*\.swp', 'node_modules/' ]
        let NERDTreeShowHidden=1

" ========= navigation
Plug 'christoomey/vim-tmux-navigator'
        " autostart nerd-tree
        autocmd vimenter * NERDTree
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif
        " nerdtree toggle
        map <C-n> :NERDTreeToggle<CR>
Plug 'zhaocai/GoldenView.Vim'
        let g:goldenview__enable_default_mapping = 0
Plug 'benmills/vimux'
        " vimux binding
        map <Leader>vp :VimuxPromptCommand<CR>
        nmap <F8> :TagbarToggle<CR>

" ======= fuzzy find
" Plug 'ctrlpvim/ctrlp.vim'

" ======= extras
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'majutsushi/tagbar'
Plug 'wincent/command-t'
Plug 'bling/vim-airline'
    " airline powerline fonts
    let g:airline_powerline_fonts=1

Plug 'easymotion/vim-easymotion'

call plug#end()            " required
filetype plugin indent on    " required

" ============= extra settings
set autochdir
syntax on

" tabs to 4 spaces
" set smartindent
set background=dark " required by gruvbox
set tabstop=4
set shiftwidth=4
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
colorscheme gruvbox
            let g:gruvbox_constrast_dark='hard'

" split below and right feels more natural
set splitbelow
