set nocompatible

"Pathogen {{{
execute pathogen#infect()
call pathogen#helptags()
"}}}

"Mappings {{{
  let mapleader = ","
  map <leader>t :tabnew<cr>
  noremap <leader>w :w! <cr>
  map <leader>q :q! <cr>
  imap jk <Esc>
  vmap jk <Esc>
  map j gj
  map k gk
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
  colorscheme darkmate
  

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
  "Scrolling {{{
    set scrolloff=8 
    set sidescrolloff=15
    set sidescroll=1
  "}}}

"}}}
  "Work Specific {{{
if $USER == 'smccrear'
    "ClearCase Functions {{{
      function! CheckOut()
              execute "!" ."ct co -nc ". expand('%:p')
      endfunction

      function CScopeSs()
              execute  ":cs f s ". expand('<cword>')
      endfunction

      function CScopeSc()
              execute  ":cs f c ". expand('<cword>')
      endfunction


      function CScopeSg()
              execute  ":cs f g ". expand('<cword>')
      endfunction

      function CScopeSi()
              execute  ":cs f i ". expand('<cword>')
      endfunction

      nmap <leader>co :call CheckOut()<cr> 
      nmap <leader>4 :call CScopeSs()<cr> 
      nmap <leader>5 :call CScopeSc()<cr> 
      nmap <leader>6 :call CScopeSg()<cr> 
      nmap <leader>7 :call CScopeSi()<cr> 
    "}}}
    
    "cscope {{{
      set csprg=/usr/bin/cscope
      let storagedir = system("echo -n `storage`/cscope.out")
      execute "cscope add " . storagedir 
     "}}}
     
    " ctrlp config {{{
    let g:ctrlp_user_command='cat %s storage/cscope.files'
    set tags="`storage`/machmod"
    " }}}
    
endif
   "}}}
   
" ctrlp config {{{
  let g:ctrlp_cache_dir = '/home/$USER/ctrlp_cache'
  let g:ctrlp_max_files = 0
  "  let g:ctrlp_user_command='cat %s `storage`/cscope.files'
  let g:ctrlp_by_filename = 1
  let g:ctrlp_max_height = 15
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': [],
    \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
    \ }

function! PickProject()
  let PROJS = system('ls -p `pwd`/* | grep -v /')
  let FILES = split(PROJS)
  echo PROJS
  echo FILES
  "exe "!mkdir ctrlp" 
  "exe ":e ctrlp/filelist.txt"
  "exe "put =FILES"
  "let g:ctrlp_user_command='cat %s ' . system("pwd") . 'ctrlp/filelist.txt'
endfunction

  nmap <leader>p :call PickProject()<cr> 

" }}}

" Git Functions {{{j
function! AddCommitPush()
  let currentfilename = expand('%:p:t')
  call inputsave()
  let message = input('Enter commit message: ')
  call inputrestore()
  execute "!" ."git add " . currentfilename 
  execute "!" ."git commit -m \"" . message . "\"& git push origin master"
endfunction
"}}}
