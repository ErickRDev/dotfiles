" -------- vim

let g:netrw_liststyle = 3
let g:netrw_banner = 0

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
