# Dot-OSX

Dotfiles for OSX

See [Intro to Vim & Tmux](./INTRO.md)

## Provides Configurations For

- alacritty
- fish
- lunarvim
- tmux
- git

## Install

```sh
git clone git@github.com:theRemix/Dot-OSX.git ~/.dotfiles
```

## Setup Links

```sh
ln -s ~/.dotfiles/lvim  ~/.config/lvim
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/fish ~/.config/fish
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
```

## LunarVim

[Install Lunarvim](https://www.lunarvim.org/docs/installation)

Follow the [PostInstall guide](https://www.lunarvim.org/docs/installation/post-install)

## Git

after configuring git, append gitconfig-tail

```sh
cat ~/.dotfiles/gitconfig-tail >> ~/.gitconfig
```

## Dependencies

after linking and configuring, install dependencies

### Tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Fish

```sh
mkdir ~/.config/fisherman
fisher
```

### Git

```sh
brew install git-delta fzf
mkdir ~/.config/fisherman
fisher
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

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
