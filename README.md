# Dot-OSX

Dotfiles for OSX


## Provides Configurations For

- git
- alacritty
- fish
- vim
- tmux

## Install

```sh
git clone git@github.com:theRemix/Dot-OSX.git ~/.dotfiles
```

## Links

```sh
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/fish ~/.config/fish
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
```

## Git

after configuring git, append gitconfig-tail

```sh
cat ~/.dotfiles/gitconfig-tail >> ~/.gitconfig
```
