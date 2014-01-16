execute pathogen#infect()
set csprg=/usr/bin/cscope
call pathogen#helptags()

syntax enable
let mapleader = ","
map <leader>t :tabnew<cr>
map <leader>w :w! <cr>
map <leader>q :q! <cr>
map <leader>f :CtrlP <cr>
map <leader>n :tn <cr>

function! CheckOut()
		    execute "!" ."ct co -nc ". expand('%:p')
endfunction
nmap <leader>co :call CheckOut()<cr> 

function CScopeSs()
		    execute  ":cs f s ". expand('<cword>')
endfunction
nmap <leader>4 :call CScopeSs()<cr> 

function CScopeSc()
		    execute  ":cs f c ". expand('<cword>')
endfunction
nmap <leader>5 :call CScopeSc()<cr> 


function CScopeSg()
		    execute  ":cs f g ". expand('<cword>')
endfunction
nmap <leader>6 :call CScopeSg()<cr> 

function CScopeSi()
		    execute  ":cs f i ". expand('<cword>')
endfunction
nmap <leader>7 :call CScopeSi()<cr> 

imap jk <Esc>
vmap jk <Esc>

set hidden
set incsearch
set magic
set ruler
set showmatch

set mat=0
let g:ctrlp_cache_dir = '/home/smccrear/ctrlp_cache'
let g:ctrlp_max_files = 0
let g:ctrlp_user_command='cat %s `storage`/cscope.files'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 15

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

set noswapfile
set showtabline=10
set hlsearch
set tabstop=2

set softtabstop=2 
set shiftwidth=2 
set noexpandtab

set t_Co=256
set background=dark
colorscheme koehler
set number
filetype plugin indent on
set foldmethod=syntax
let storagedir = system("echo -n `storage`/cscope.out")
let storagedir2 = system("echo -n `storage`/tags")
execute "cscope add " . storagedir 
execute 'set tags=' . storagedir2 .",./tags,tags"
execute 'set tags=' . storagedir2 .",./tags,tags;~/tags"

