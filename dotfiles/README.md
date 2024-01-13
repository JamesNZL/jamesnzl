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

## Obsidian

- Sync vault with Obsidian Sync—the `.obsidian` directory serves as a version-controlled backup of a subset of vault configuration files.
- This is set up as
	```sh
	# Move .obsidian vault configuration to dotfiles repository
	mv $VAULT_DIR/.obsidian $REPO_DIR/dotfiles/.obsidian

	# Symbolic link back to vault
	ln -s $REPO_DIR/dotfiles/.obsidian $VAULT_DIR/.obsidian
	```
