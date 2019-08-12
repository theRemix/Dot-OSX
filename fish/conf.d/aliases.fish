alias pbcopy="xclip -selection c"
alias pbpaste="xclip -selection c -o"
alias pbj='pbpaste | python -m json.tool'

alias ag="ag --hidden -p ~/.agignore"

alias glances="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --network host -it docker.io/nicolargo/glances"

alias lll='ls -FlGogtrh'
alias ll='ls -lah'
# alias l='-lhFG'
# alias la='-lahFG'

alias t='task'
alias ta='task add'
#alias td='task done' # task 123 done # in /usr/local/bin/td
alias ts='task start' # task start 123
alias tst='task stop' # task stop 123
alias tm='task modify' # task modify ...
alias tt='t +TODAY list'
# alias tt='t +DUE list'
alias tta='task add due:eod'

alias gfl='git flow'

alias gs='git status'
alias gd='git diff'
alias gps='git push'
alias gp='git pull'
alias gr='git remote'
alias grv='git remote -vv'
alias gc='git commit -vv'
alias gc!='git commit -vv --amend'
alias gca='git commit -vv -a'
alias gca!='git commit -vv -a --amend'
alias gb='git branch -vv'
alias ga='git add'
alias gap='git add -p'
alias gl='git log --graph --decorate --all'
alias gst='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gcm='git commit -m'

alias gco='git checkout'
alias gm='git merge'
alias gll='git log --graph --decorate --all --stat --color'
alias gdt='git difftool'


alias nvm="bass source ~/.nvm/nvm.sh --no-use ';' nvm"
