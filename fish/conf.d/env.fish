# set -g -x FZF_DEFAULT_COMMAND 'ag -g ""'
if not set -q __fish_path_set

  set -g -x ANDROID_HOME /Users/remix/Library/Android/sdk/
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

  set -g -x GPG_TTY (tty)

  set -g -x LDFLAGS '-L/usr/local/opt/sqlite/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/ncurses/lib'
  set -g -x CPPFLAGS '-I/usr/local/opt/sqlite/include -I/usr/local/opt/readline/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/ncurses/include'

  set -g __fish_path_set 1
  set -U fish_user_paths ~/.local/bin ~/.fzf/bin ~/.win/bin $GOPATH/bin $ANDROID_HOME/platform-tools/ ~/.nvm/versions/node/v12.19.0/bin/ /opt/homebrew/bin

end

# ssh-agent
if test -z (pgrep ssh-agent | string collect)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end
