function kubenv
  set -l KUBE_DIR_PREFIX ~/.kube
  set -l KUBE_DIR $KUBE_DIR_PREFIX.$argv[1]
  set -l KUBE_CONFIG_PREFIX $KUBE_DIR/config-
  set -l NEW_KUBE_ENV $argv[2]
  set -l NEW_KUBECONFIG $KUBE_CONFIG_PREFIX$NEW_KUBE_ENV
  set -g KUBE_ENV UNSET
  set -g KUBECONFIG $KUBE_CONFIG_PREFIX$KUBE_ENV

  if test ! -e "$NEW_KUBECONFIG"
    echo "Kube Env $NEW_KUBE_ENV doesn't exist in $KUBE_DIR"
    echo "$NEW_KUBECONFIG file not found."
  else
    set -g KUBE_ENV $NEW_KUBE_ENV
    echo "Set \$KUBE_ENV to $NEW_KUBE_ENV"
    set -g KUBECONFIG $KUBE_CONFIG_PREFIX$KUBE_ENV
    echo "Set \$KUBECONFIG to $KUBE_CONFIG_PREFIX$KUBE_ENV"
  end
end
