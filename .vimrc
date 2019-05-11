set nocompatible
"Mappings {{{
  let mapleader = ","
  map <leader>t :tabnew<cr>
  noremap <leader>w :w! <cr>
  map <leader>q :q! <cr>
  imap jk <Esc>
""  vmap jk <Esc>
"}}}

"General {{{ 
  set autoread                   "Reloads files changed 
  set mouse=a                    "Set mouse for 'all'
  set number                     "Line Numbers
  set backspace=indent,eol,start "Backspace in insert mode
  set showcmd                    "Shows whats going on with current cmd
  set hidden                     "Allows unsaved buffers to exist
  set ruler                      "Shows line and character number bottom right of window
  set showmode                   "Shows current mode bottom of screen
  syntax on                     
  set foldmethod=syntax
  set incsearch
  set magic
  set showtabline=10
  set t_Co=256
  set cc=80                      "Shows visible line at column 80
  set tw=79
  set formatoptions+=t
  set laststatus=2

  "Indentation {{{
    filetype plugin indent on
    set tabstop=2
    set softtabstop=2 
    set expandtab "use spaces instead of tabs
    set ai "Auto indent
    set si "Smart indent
    set wrap "wrap lines
  "}}}
  
  "Swap Files  {{{
    set noswapfile
    set nobackup
    set nowb
    set shiftwidth=2 
  "}}}
  
  "Search Settings {{{
    set hlsearch
    set showmatch
    set ignorecase
    set mat=0 "tenths of a second to blink when matching brackets
    set smartcase
  "}}}
