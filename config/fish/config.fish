# Variables

set -x NVM_DIR "$HOME/.nvm"
set -x PYENV_ROOT $HOME/.pyenv
set -gx EDITOR "/opt/homebrew/bin/nvim"

# Functions

function rm_merged_branches
    set merged_branches (git branch --merged=main | rg -v 'main' | tr -d ' ')
    if test (count $merged_branches) -gt 0
        echo "At least one merged branch!"
        git branch -d $merged_branches
    end
end

function nvm
    bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
end

function vim
    nvim $argv
end

function gs
    git status
end

function gd
    git diff $argv
end

function gds
    git diff $argv --staged
end

function gl
    git log
end

function ga
    git add $argv
end

function gc
    git commit $argv
end

function dcl
    docker compose ps --services --status=running | fzf | xargs docker compose logs -f
end

# Source scripts

bass source "$NVM_DIR/nvm.sh"

# PATH

fish_add_path $HOME/.local/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path "/usr/local/bin"

# Integrations
eval "$(/opt/homebrew/bin/brew shellenv)"

pyenv init - | source


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/erickrocha/.opam/opam-init/init.fish' && source '/Users/erickrocha/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
