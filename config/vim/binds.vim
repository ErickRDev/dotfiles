" -------- vim

let mapleader = ","

map <Leader>wh :split<CR>
map <Leader>wv :vsplit<CR>

map <Leader>f :NvimTreeFindFile<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <Space><Tab> :e#<CR>
nnoremap <Space>bd :bd<CR>

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-i> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-b> <cmd>lua require('telescope.builtin').buffers()<cr>
map <Leader>gs <cmd>lua require('telescope.builtin').grep_string()<cr>
