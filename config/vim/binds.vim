" -------- vim

let mapleader = ","

map <Leader>wh :split<CR>
map <Leader>wv :vsplit<CR>

map <Leader>f :NvimTreeFindFile<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <Space><Tab> :e#<CR>
nnoremap <Space>bd :bd<CR>

" -------- FZF

nnoremap <C-p> :FZF<CR>
