" -------- vim

let mapleader = ","

map <Leader>wh :split<CR>
map <Leader>wv :vsplit<CR>

nnoremap <Space><Tab> :e#<CR>
nnoremap <Space>bd :bd<CR>
" nnoremap <C-N> :Explore<CR>
nnoremap <C-n> :NvimTreeToggle<CR>

" -------- FZF

nnoremap <C-p> :FZF<CR>
