local set = vim.opt

set.background="dark"

-- if has("termguicolors") then
    -- set.termguicolors = true
-- endif

set.number = true    --  Display line numbers
set.relativenumber = true -- Display relative line numbers

-- Searching
set.incsearch = true -- Search as characters are entered
set.hlsearch = true -- Highlight searched terms

-- Status bar
set.laststatus=2
-- set.noshowmode = true

-- Pane splits
set.splitbelow = true
set.splitright = true

-- Symbols
set.listchars= "tab:→ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»"
set.list = true

set.shiftwidth=2
set.tabstop=2
set.expandtab = true
