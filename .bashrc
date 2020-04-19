# ---------------------------
# binds

bind '"\C-o": "open_with_fzf\n"'
bind '"\C-f": "cd_with_fzf\n"'
bind '"\C-v": "vim\n"'

# ---------------------------
# sourcing


[[ $(uname -a) == *"microsoft"* ]] && \. $HOME/.dotfiles/.aliases.wsl
[[ -f $HOME/.dotfiles/.aliases ]] && \. $HOME/.dotfiles/.aliases
[[ -f $HOME/.fzf.bash ]] && \. $HOME/.fzf.bash

for file in $HOME/.dotfiles/.local/bin/*.sh
do
    . $file
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ---------------------------
# functions

open_with_fzf() {
    fd -t f -H | fzf -m --preview="head -100 {}" | xargs -ro -d "\n" nvim 2>&-
}
cd_with_fzf() {
    cd $HOME && cd "$(fd -t d -H | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD"
}
