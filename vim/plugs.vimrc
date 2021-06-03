call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}     " language-servers integration

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'               " vim/tmux seamless navigation
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'                         " syntax highlight
" Plug 'SirVer/ultisnips'                             " snippets

Plug 'tpope/vim-sleuth'                             " auto-detect tab/space styling of workspace
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Javascript specific
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\}

Plug 'heavenshell/vim-jsdoc', {
\ 'for': ['javascript', 'javascript.jsx','typescript'],
\ 'do': 'make install'
\}

Plug 'junegunn/goyo.vim'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'

call plug#end()
