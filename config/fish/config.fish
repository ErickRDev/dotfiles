# Variables

set --universal nvm_default_version 24
set --universal nvm_auto_use true
set -x PYENV_ROOT $HOME/.pyenv
set -gx EDITOR "/opt/homebrew/bin/nvim"

set FZF_MULTI_SELECT_ARGS \
    "--multi" \
    "--height=40%" \
    "--border" \
    "--prompt=Service > " \
    "--header-first" \
    "--header='Use Ctrl+Y to Toggle All Filtered Options'" \
    "--highlight-line" \
    "--info=hidden" \
    "--layout=reverse-list" \
    "--list-label='Databases'" \
    "--marker=Ξ" \
    "--pointer=█" \
    "--style=full" \
    "--bind=ctrl-y:toggle-all,enter:accept" \
    "--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672" \
    "--color=current-fg:35,selected-fg:green:bold,marker:green:reverse"

# Miscellaneous

function reload_fish
    source $HOME/.config/fish/config.fish
end

function envsource
  for line in (cat $argv | grep -v '^#')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] $item[2]
    echo "Exported key $item[1]"
  end
end

function urld
    python -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"
end

function uuid
    python -c "import uuid; print(uuid.uuid4());"
end

# Navigation

function code
    cd $HOME/code
end

function dotfiles
    cd $HOME/.dotfiles
end

function open_with_fzf
    fd -t f -H | fzf -m --preview="head -100 {}" | xargs -ro -d "\n" nvim 2>&-
end

function cd_with_fzf
    cd $HOME/code && cd "$(fd -t d -H | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD"
end

# Neovim

function vim
    nvim $argv
end

# Git

function rm_merged_branches
    set merged_branches (git branch --merged=main | rg -v 'main' | tr -d ' ')
    if test (count $merged_branches) -gt 0
        echo "At least one merged branch!"
        git branch -d $merged_branches
    end
end

function gs
    git status $argv
end

function gd
    git diff $argv
end

function gds
    git diff --staged $argv
end

function gl
    git log
end

function ga
    git add $argv
end

function gaf
    git status -s | fzf $FZF_MULTI_SELECT_ARGS | awk '{print $2}' | xargs git add
end

function gc
    git commit $argv
end

function gcof
    git status -s | fzf $FZF_MULTI_SELECT_ARGS | awk '{print $2}' | xargs git checkout
end

# Docker

function dcs
    docker compose ps $argv --format "table {{.Name}}\t{{.Service}}\t{{.Status}}"
end

function dcl
    docker compose ps --services --status=running | fzf | xargs docker compose logs -f
end

function dck
    docker compose ps --format=json | jq -r ".| .ID, .Service" | xargs -n2 | fzf | awk '{print $2}' | xargs docker compose kill
end

# Java

function java23
    set JAVA_HOME "$(/usr/libexec/java_home -v 23)"; fish_add_path $JAVA_HOME/bin; java $argv
end

function java11
    set JAVA_HOME "$(/usr/libexec/java_home -v 11)"; fish_add_path $JAVA_HOME/bin; java $argv
end

# Rust

function cr
    cargo run $argv
end

# Node

function load_nvm --on-variable PWD
    if test -f .nvmrc
        nvm use
    end
end

# Binds

bind \cf cd_with_fzf
bind \co open_with_fzf

# Source scripts

# bass source "$NVM_DIR/nvm.sh"

# PATH

fish_add_path $HOME/.local/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path "/usr/local/bin"
fish_add_path "/usr/local/go/bin"
fish_add_path $HOME/go/bin
fish_add_path /opt/homebrew/opt/postgresql@16/bin

# Integrations
eval "$(/opt/homebrew/bin/brew shellenv)"

pyenv init - | source

# >>> coursier install directory >>>
set -gx PATH "$PATH:/Users/erickrocha/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
fish_add_path $HOME/.local/bin

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/erickrocha/.opam/opam-init/init.fish' && source '/Users/erickrocha/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
