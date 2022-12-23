# set -g -x FZF_DEFAULT_COMMAND 'ag -g ""'
if not set -q __fish_path_set

  set -g -x ANDROID_HOME ~/Library/Android/sdk/
  set -g -x TERM xterm-256color
  set -g -x EDITOR /opt/homebrew/bin/nvim
  set -g -x GIT_EDITOR $EDITOR
  set -g -x GOPATH ~/.gopath
  set -g -x DISPLAY :0.0
  set -g -x LIBGL_ALWAYS_INDIRECT 1
  # set -g -x DOCKER_HOST localhost:2375
  set -g -x FZF_DEFAULT_COMMAND 'ag --path-to-ignore ~/.ignore -f -g ""'
  set -g -x LC_ALL en_US.UTF-8
  set -g -x LANG en_US.UTF-8
  set -g -x LANGUAGE en_US.UTF-8
  set -g -x DOCKER_BUILDKIT 1

  set -g -x LDFLAGS '-L/opt/homebrew/lib/ -L/opt/homebrew/opt/sqlite/lib/ -L/opt/homebrew/opt/readline/lib/ -L/opt/homebrew/opt/openssl@1.1/lib/ -L/opt/homebrew/opt/ncurses/lib/'
  set -g -x CPPFLAGS '-I/opt/homebrew/include/ -I/opt/homebrew/opt/sqlite/include/ -I/opt/homebrew/opt/readline/include/ -I/opt/homebrew/opt/openssl@1.1/include/ -I/opt/homebrew/opt/ncurses/include/'

  set -g __fish_path_set 1
  set -U fish_user_paths ~/.local/bin ~/.fzf/bin $GOPATH/bin $ANDROID_HOME/platform-tools/ /opt/homebrew/bin

end

if test -z (pgrep gpg-agent | string collect)
  gpgconf --launch gpg-agent
end

if not set -q __fish_ssh_auth_sock_set
  set -g -x GPG_TTY (tty)
  # set -x GPG_TTY (tty)
  set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

  set -g __fish_ssh_auth_sock_set 1
end

# ssh-agent
# if test -z (pgrep ssh-agent | string collect)
#   eval (ssh-agent -c)
#   set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
#   set -Ux SSH_AGENT_PID $SSH_AGENT_PID
# end
