export PS1='\e[0;36m\u\e[m@\e[0;32m\h\e[m:\e[0;31m\w/\e[m $ '
if echo $PATH | grep -v $HOME/bin; then
    export PATH=$PATH:$HOME/bin
fi

alias ll='ls -l'
alias la='ls -lA'
alias back='cd -'
unalias l 2> /dev/null

cl() {
    cd $1 && ls -l
}

chat() {
    echo "Did you mean 'cat'?"
    false
}
