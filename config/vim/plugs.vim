call plug#begin('~/.vim/plugged')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'               " vim/tmux seamless navigation
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-sleuth'                             " auto-detect tab/space styling of workspace
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Javascript specific
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'svelte']
\}

Plug 'nvim-lualine/lualine.nvim'

" colorschemes
Plug 'EdenEast/nightfox.nvim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'

Plug 'shaunsingh/oxocarbon.nvim', { 'do': './install.sh' }

call plug#end()
