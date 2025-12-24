source ~/dotfiles/config/commands.sh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/config/ohmyposh/eva.toml)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/home/samonaco/.local/bin:$PATH"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#AAAAAA"

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $- == *i* ]] && command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
