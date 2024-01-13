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
