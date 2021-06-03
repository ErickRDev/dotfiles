" -------- vim

let g:netrw_liststyle = 3
let g:netrw_banner = 0

" -------- coc.nvim

set updatetime=300

" give more space for displaying messages.
set cmdheight=2

" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" -------- ultiSnips

" TODO: adjust binds for ultisnip snipper expansion (coc.nvim uses <tab>)

" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories = ['~/.dotfiles/.vim/UltiSnips', 'UltiSnips']

" -------- nerdCommenter

" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" disabling automatic insertion of comments when adding new line from a comment;
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" -------- python

highlight ColorColumn ctermbg=magenta

" drawing column line (limit width) on py files;
function DrawColumnLine()
    set colorcolumn=80
endfunction

autocmd BufRead *.py call DrawColumnLine()

" -------- prettier

let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_require_pragma = 0
