# https://gist.github.com/yangwao/f971aa306243953da097c842cfeae4f4

function l --description 'List contents of directory'
  command ls -lhFG $argv
end

function la --description 'List contents of directory'
  command ls -lahFG $argv
end

function df --description 'Displays disk free space'
  command df -H $argv
end

function git_delete_merged_current --description 'Delete all local branches that is already merged to current branch (exludes master)'
  command git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d
  command git remote prune origin
end
