# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Limits recursive functions, see 'man bash'
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

# Update PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]linux\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\]\$(parse_git_branch)\[\033[00m\] \$ "

# Use the up and down arrow keys for finding a command in history
# (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export LANG=en_US.utf8
export EDITOR=vim

# Color support for less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Zoxide
eval "$(zoxide init --cmd cd bash)"

# Aliases
alias ls='ls --color=auto'
alias l='ls -lav --ignore=. --ignore=..'

alias rm='rm -v --preserve-root'
alias mkdir='mkdir -p'

alias bat='bat -p'
alias grep='grep --color -n'
alias untar='tar -xvf'
alias vim='nvim'
alias tree='tree -Ca -I .git'

alias gdb='gdb -q -tui'
alias cf='clang-format --verbose -i'
alias make='make -j'

alias py='python3'

alias gcce='gcc -std=c99 -Wall -Wextra -Werror -Wvla -pedantic'
alias gcct='gcc -std=c99 -Wall -Wextra -Werror -Wvla -pedantic -fsanitize=address -g'

alias gpp='g++ -Wall -Wextra -Wold-style-cast -Werror -pedantic -std=c++20 *.cc -o '
alias clangpp='clang++ -Wall -Wextra -Wold-style-cast -Werror -pedantic -std=c++20 *.cc -o '

# Postgres
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"

# Path

export PATH=$PATH:/usr/local/texlive/2024/bin/x86_64-linux
export MANPATH=$MANPATH:/usr/local/texlive/2024/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2024/texmf-dist/doc/info

# Launch fastfetch

fastfetch
