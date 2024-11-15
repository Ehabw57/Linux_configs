parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#cat ~/.cache/wal/sequences
# Activate vi mode
set -o vi

# Some useful aliasis
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ll="ls --color=auto -al"
alias vim="nvim"
alias xu="sudo xbps-install -S; sudo xbps-install -u"
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove -R"
alias xq="sudo xbps-query -Rs"
alias xl="sudo xbps-query -l"


# Change cmd prompt
PS1='\[\e[33m\]\u@\h \[\e[0m\]\w \[\e[1;34m\]$(parse_git_branch)» \[\e[0m\]'
# Some cool neofetch
#~/.config/ufetch.sh

# some env var for my alx servers
#username="ubuntu@"
web01="$username""204.236.240.39"
web02="$username""18.210.19.134"
lb01="$username""52.204.97.243"

#some cool key-bindgs
bind -x '"\C-o":"source ~/scripts/navigetor.sh"' # Find Your way in dirctorys
bind -x '"\C-l":". ~/scripts/list_sessions.sh"' # List all opend sessions
bind -x '"\C-x":"clear"'


#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init --path)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
