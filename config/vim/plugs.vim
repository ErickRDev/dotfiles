call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'               " vim/tmux seamless navigation
Plug 'scrooloose/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'                 " for file icons

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
