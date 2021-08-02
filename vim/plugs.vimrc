call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'               " vim/tmux seamless navigation
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-sleuth'                             " auto-detect tab/space styling of workspace
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'

" Javascript specific
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\}

" visual
Plug 'vim-airline/vim-airline'

" colorschemes
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'andreasvc/vim-256noir'
Plug 'bluz71/vim-moonfly-colors'

call plug#end()
