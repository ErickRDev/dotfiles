eval "$(/opt/homebrew/bin/brew shellenv)"

function vim
    nvim .
end

function gs
    git status
end

function gd
    git diff
end

function gds
    git diff --staged
end

function gl
    git log
end

function ga
    git add .
end

function gc
    git commit
end
