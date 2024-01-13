# Usage

## Vim

### Prerequisites

- [OPTIONAL] `deno` for `yuki-yano/fuzzy-motion.vim`, otherwise will fallback to `justinmk/vim-sneak`

### Configuration

```sh
deno --version

# Annoyingly, vim doesn't support the ~/.config directory
ln -s $REPO_DIR/dotfiles/.vim ~/.vim

vim
# Inside vim
:PlugInstall
```

## Neovim

### Configuration

```sh
# Symbolic link the base .config directory
ln -s $REPO_DIR/dotfiles/.config ~/

# Link vimrc (aka init.vim for nvim)
ln $REPO_DIR/dotfiles/.vim/vimrc ~/.config/nvim/init.vim

nvim
# Inside nvim
:PlugInstall
```
