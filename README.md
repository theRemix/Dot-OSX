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

## Dependencies

after linking and configuring, install dependencies

```sh
brew install git-delta fzf
mkdir ~/.config/fisherman
fisher
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

add the Nerd Font patched version of OperatorMono

## Change default shell ><>

```sh
sudo sh -c 'echo `which fish` >> /private/etc/shells'
chsh -s $(which fish)
```

## Install tmux plugins

```sh
tmux source ~/.tmux.conf
```

`prefix` + `I`

## Install vim plugins

in vim

```sh
:PlugInstall
```
