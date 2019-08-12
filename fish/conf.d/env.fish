# set -g -x FZF_DEFAULT_COMMAND 'ag -g ""'
if not set -q __fish_path_set
  set -g __fish_path_set 1
  set -U fish_user_paths ~/.local/bin ~/.fzf/bin ~/.win/bin $GOPATH/bin ~/.asdf/shims ~/.asdf/installs/python/3.7.0/bin/ ~/.asdf/installs/python/2.7/bin/

  set -g -x TERM xterm-256color
  set -g -x EDITOR /usr/bin/vim
  set -g -x GIT_EDITOR $EDITOR
  set -g -x GOPATH ~/.gopath
  set -g -x DISPLAY :0.0
  set -g -x LIBGL_ALWAYS_INDIRECT 1
  set -g -x DOCKER_HOST localhost:2375
  set -g -x FZF_DEFAULT_COMMAND 'ag --path-to-ignore ~/.ignore -f -g ""'
  set -g -x LC_ALL en_US.UTF-8
  set -g -x LANG en_US.UTF-8
  set -g -x LANGUAGE en_US.UTF-8

  # Fix umask value if WSL didn't set it properly.
  # https://github.com/Microsoft/WSL/issues/352
  if test (umask) -eq "0000"
    umask 022
  end
end
