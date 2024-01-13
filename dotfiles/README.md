# My Dotfiles

This directory contains my dot/configuration files for many of the tools I use.
These are version-controlled here to streamline the migration/onboarding process when spinning up a new device, and allow me to track configuration changes over time.

The overarching idea is that this directory acts as the *source-of-truth*, with its files *symbolically-linked* to the locations at which they're consumed.
This allows each software to use the file as usual, with any changes (including those from in-software interfaces) automatically propagating here.
> [!important]
> To ensure that files are *sym-linked* and **not** *hard-linked*, make sure to use the `ln -s` option or specify `New-Item -ItemType SymbolicLink`.

## Usage

### Vim

#### Prerequisites

- [OPTIONAL] `deno` for `yuki-yano/fuzzy-motion.vim`, otherwise will fallback to `justinmk/vim-sneak`

#### Configuration

```sh
deno --version

# Annoyingly, vim doesn't support the ~/.config directory
ln -sFf $REPO_DIR/dotfiles/.vim ~/.vim

vim
# Inside vim
:PlugInstall
```

### Neovim

#### Configuration

```sh
# Symbolic link the base .config directory
ln -s $REPO_DIR/dotfiles/.config ~/

# Link vimrc (aka init.vim for nvim)
ln -sf $REPO_DIR/dotfiles/.vim/vimrc ~/.config/nvim/init.vim

nvim
# Inside nvim
:PlugInstall
```

### Visual Studio Code

#### Prerequisites

- [OPTIONAL] `nvim` for `vscode-neovim` to work

#### Configuration

- Turn on Settings Sync with GitHub

- Copy keyboard shortcuts with
	```sh
	# macOS
	ln -sf $REPO_DIR/dotfiles/.vscode/keybindings-macOS.json ~/Library/Application\ Support/Code/User/keybindings.json
	
	# Windows
	rm ~/AppData/Roaming/Code/User/keybindings.json
	# ! warning: $REPO_DIR must be fully-qualified with the drive letter, '~' will not work!
	New-Item -Path ~/AppData/Roaming/Code/User/keybindings.json	-ItemType SymbolicLink -Value $REPO_DIR/dotfiles/.vscode/keybindings-other.json 
	
	# Linux
	ln -sf $REPO_DIR/dotfiles/.vscode/keybindings-other.json ~/.config/Code/User/keybindings.json
	```

### Obsidian

- Sync vault with Obsidian Sync—the `.obsidian` directory serves as a version-controlled backup of a subset of vault configuration files.
- This is set up as
	```sh
	# Move .obsidian vault configuration to dotfiles repository
	mv $VAULT_DIR/.obsidian $REPO_DIR/dotfiles/.obsidian

	# Symbolic link back to vault
	ln -sFf $REPO_DIR/dotfiles/.obsidian $VAULT_DIR/.obsidian
	```
