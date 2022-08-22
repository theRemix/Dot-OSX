if not command -s jenv > /dev/null
    echo "Install <github.com/gcuisinier/jenv> to use 'jenv'."
    exit 1
end

set -l jenv_root ""

if test -z "$JENV_ROOT"
    set jenv_root ~/.jenv
    set -x JENV_ROOT "$jenv_root"
else
    set jenv_root "$JENV_ROOT"
end

set -x PATH "$jenv_root/shims" $PATH
set -x JENV_SHELL fish

command mkdir -p "$jenv_root/"{shims,versions}

status --is-interactive; and source (jenv init -|psub)
