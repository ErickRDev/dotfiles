"                                   
"                    ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄  
"                   ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█  
"                    ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄ 
"                     ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"                      ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"                      ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"                      ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒   
"                        ░░   ▒ ░░      ░     ░░   ░ ░        
"                         ░   ░         ░      ░     ░ ░      
"                        ░                           ░        

set nocompatible              " be iMproved, required
set shell=bash\ --norc
set encoding=utf8

filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot' " syntax highlight
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'

call plug#end()

syntax on

" Colorschemes
colorscheme 256_noir
" Tweaks for 256 noir colorscheme
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

" Changing <Leader> key
let mapleader = ","

" Clipboard interaction under WSL
if system('uname -r') =~ "microsoft"
    augroup Yank 
        autocmd!
        autocmd TextYankPost * :call system('clip.exe ',@")
    augroup END
endif

" Fixing invisible cursor issue when using wal colorscheme
" hi CursorLine ctermbg=7 ctermfg=0
" hi CursorLineNr ctermbg=7 ctermfg=0

" UltiSnips
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories = ['~/.dotfiles/.vim/UltiSnips', 'UltiSnips']

" Forcing ctrlp to use the dir from which vim was started as the base dir
let g:ctrlp_working_path_mode = 0

" Improving ctrlP speed by using ag behind the scenes
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore-dir "node_modules"
      \ -g ""'

" Show existing tab with 4 spaces width
set tabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set number		   " Display line numbers
set relativenumber " Display relative line numbers

" Searching
set incsearch      " Search as characters are entered
set hlsearch 	   " Highlight searched terms

" Status bar
set laststatus=2
set noshowmode

" Pane splits
set splitbelow
set splitright
map <Leader>wh :split<CR>
map <Leader>wv :vsplit<CR>

" Buffers
nnoremap <Space><Tab> :e#<CR>
nnoremap <Space>bd :bd<CR>

" NerdTREE
map <C-n> :NERDTreeToggle<CR>
  " Open NerdTREE automatically if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " Closes NerdTree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

highlight ColorColumn ctermbg=magenta

function DrawColumnLine()
    set colorcolumn=80
endfunction

" Drawing column line (limit width) on py files;
autocmd BufRead *.py call DrawColumnLine()

" Disabling automatic insertion of comments when adding new line from a comment;
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" NerdCommenter
  " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1 
  " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1 
