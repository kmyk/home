# Set up the prompt
autoload -Uz promptinit
promptinit
prompt off
if [ -z "$SSH_CONNECTION" ] ; then
    PS1=$'%{%(?.\033[34m.\033[31m)%}%(!.#.$)%{\033[0m%} '
else
    PS1=$'[%n@%m] %{%(?.\033[34m.\033[31m)%}%(!.#.$)%{\033[0m%} '
fi

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
setopt no_flow_control

setopt hist_ignore_space
setopt histignorealldups
setopt sharehistory

# Use modern completion system  (default)
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# envvars
export EDITOR=nvim
export LANG='en_US.UTF-8'

# Set aliases
alias e=$EDITOR
alias r=cat
alias j='jobs -l'
alias md=mkdir
alias mp='mkdir -p'
alias ls='\ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias mv='\mv -b'
alias cp='\cp -b'
alias cpr='cp -r'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias open=xdg-open
function clr() { find -maxdepth 1 -name \*~ -delete }
function clrr() { find -name \*~ -delete }
function chpwd() { ls }

alias cc='clang -std=c99 -Wall -DLOCAL -O2'
alias ccg='clang -std=c99 -Wall -DLOCAL -ggdb3 -fsanitize=undefined'
alias cxxo='clang -std=c99 -Wall -DLOCAL -Ofast -mtune=native -march=native'
alias cxx='clang++ -std=c++17 -I ~/Library -Wall -DLOCAL -O2'
alias cxxg='clang++ -std=c++17 -I ~/Library -Wall -DLOCAL -ggdb3 -fsanitize=undefined -D_GLIBCXX_DEBUG'
alias cxxo='clang++ -std=c++17 -I ~/Library -Wall -DLOCAL -Ofast -mtune=native -march=native'
alias oj-bundle='\oj-bundle -I ~/Library'
alias py2=python2
alias py3=python3
alias py=py3

export PYTHONSTARTUP=$(dirname $(realpath ~/.zshrc))/python.startup.py
export path=( /home/user/bin $path )
export path=( $HOME/.rbenv/bin $path )
eval "$(rbenv init - zsh)"
export path=( $HOME/.cargo/bin $path )
which aws_zsh_completer.sh >/dev/null && source aws_zsh_completer.sh
# eval "$(opam config env)"

# added by travis gem
[ -f /home/user/.travis/travis.sh ] && source /home/user/.travis/travis.sh

function oj-a () { oj d "$@" && [ ! -e a.cpp ] && atcoder-tools codegen "$@" > a.cpp ; }

# export PATH="/home/user/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
