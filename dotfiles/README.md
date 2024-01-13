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

## Visual Studio Code

### Prerequisites

- [OPTIONAL] `nvim` for `vscode-neovim` to work

### Configuration

- Turn on Settings Sync with GitHub

- Copy keyboard shortcuts with
	```sh
	# macOS
	rm ~/Library/Application Support/Code/User/keybindings.json
	ln $REPO_DIR/dotfiles/.vscode/keybindings-macOS.json ~/Library/Application Support/Code/User/keybindings.json
	
	# Windows
	rm ~/AppData/Roaming/Code/User/keybindings.json
	# ! warning: $REPO_DIR must be fully-qualified with the drive letter, '~' will not work!
	New-Item -Path ~/AppData/Roaming/Code/User/keybindings.json	-ItemType SymbolicLink -Value $REPO_DIR/dotfiles/.vscode/keybindings-other.json 
	
	# Linux
	rm ~/.config/Code/User/keybindings.json
	ln $REPO_DIR/dotfiles/.vscode/keybindings-other.json ~/.config/Code/User/keybindings.json
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
