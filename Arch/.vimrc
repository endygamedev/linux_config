﻿"--------------------------------------Vundle-------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'miyakogi/conoline.vim'

Plugin 'preservim/nerdtree'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Theme
Plugin 'arcticicestudio/nord-vim'

" Comments
Plugin 'preservim/nerdcommenter'

" Airline
Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Emojis
Plugin 'junegunn/vim-emoji'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"------------------------Syntastic----------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'


"----------------------Airline--------------------------------------
set guifont=Dejavu\ Sans\ Mono\ 12
let g:Powerline_symbols = 'unicode'

let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_dark="meduim"
let g:airline_detect_spelllang=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {} 
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"--------------------------MY SETTINGS------------------------------


"Style
let g:python_highlight_all = 1 "Python Syntax
let g:conoline_auto_enable = 1
syntax enable
colorscheme nord
syntax on
set number
set wrap
set cursorline
set mouse=a

"Backup .swp
set nobackup
set noswapfile

"Tab size
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set linebreak

"Airline
let g:airline_theme='sol'
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"Binds
map <C-z> :undo<CR>
map <C-p> :tabn<CR>
map <C-o> :tabp<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-m> :tabnew<CR>
map <C-x> :tabclose<CR>
map <C-y> :lclose<CR>

"Run Python Scripts
autocmd FileType python map <buffer> <F5> :w<CR>:ba<CR> :ter python3 "%"<CR>
"FileType python map <buffer> <F5> :w<CR>:exec '!clear; time python3' shellescape(@%, 1)<CR>

"Run Rust Projects
autocmd FileType rust map <buffer> <F5> :w<CR> :!clear; time cargo run<CR>

"Comment Lines Python Scripts
autocmd FileType python vmap <buffer> <C-d> :s/^/#/g <CR> :let @/ = ""<CR>
autocmd FileType python map <buffer> <C-d> :s/^/#/g <CR> :let @/ = ""<CR>

"Comment Lines Rust
autocmd FileType rust vmap <buffer> <C-d> :s:^://<CR>
autocmd FileType rust map <buffer> <C-d> :s:^://<CR>
