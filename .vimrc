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
  map <leader>f :CtrlP <cr>
  map <leader>n :tn <cr>
  map <leader>s :A <cr>
  map <leader>sa :AT <cr>
  imap jk <Esc>
  vmap jk <Esc>
"}}}

"Generic {{{
"
  set number                     "Line Numbers
  set backspace=indent,eol,start "Backspace in insert mode
  set showcmd                    "Shows whats going on with current cmd
  syntax enable
  filetype plugin indent on
  set foldmethod=syntax
  set hidden
  set incsearch
  set magic
  set ruler
  set showmatch
  set mat=0
  set noswapfile
  set showtabline=10
  set hlsearch
  set tabstop=2
  set ignorecase
  set smartcase
  set softtabstop=2 
  set shiftwidth=2 
  set expandtab
  set t_Co=256
  "set background=dark
  colorscheme darkmate
"}}}

if $USER == 'smccrear'
  echo "on work pc"
  "Work Specific {{{
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
   "}}}
else
  echo "on home pc"
endif

" ctrlp config {{{
  let g:ctrlp_cache_dir = '/home/$USER/ctrlp_cache'
  let g:ctrlp_max_files = 0
  let g:ctrlp_user_command='cat %s `storage`/cscope.files'
  let g:ctrlp_by_filename = 1
  let g:ctrlp_max_height = 15
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': [],
    \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
    \ }
" }}}



