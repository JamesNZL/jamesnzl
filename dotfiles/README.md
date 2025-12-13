# My Dotfiles

![A screenshot of my set up](../assets/yabai.png)

This directory contains my dot/configuration files for many of the tools I use.
These are version-controlled here to streamline the migration/onboarding process when spinning up a new device, and allow me to track configuration changes over time.

The overarching idea is that this directory acts as the *source-of-truth*, with its files *symbolically-linked* to the locations at which they're consumed.
This allows each software to use the file as usual, with any changes (including those from in-software interfaces) automatically propagating here.
> [!important]
> To ensure that files are *sym-linked* and **not** *hard-linked*, make sure to use the `ln -s` option or specify `New-Item -ItemType SymbolicLink`.

## Usage

### Bash

#### Prerequisites

- `oh-my-posh`

#### Configuration

```sh
# Symbolic link the base .config directory
ln -sFi $REPO_DIR/dotfiles/.config ~/

# Symbolic link .profile
ln -sf ~/.config/bash/profile ~/.profile
```

### Zsh

#### Prerequisites

- `oh-my-posh`
- `brew install zsh-autosuggestions`
- `brew install zsh-syntax-highlighting`
- `brew install zsh-vi-mode`

#### Configuration

```sh
# Symbolic link the base .config directory
ln -sFi $REPO_DIR/dotfiles/.config ~/

# Symbolic link .zshenv
ln -sf ~/.config/zsh/.zshenv ~/.zshenv
```

### Oh My Posh

#### Prerequisites

- `bash` configured with `.bashrc`, or
- `zsh` configured with `.zshrc` to use `oh-my-posh`
	```sh
	eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/jamesnzl.omp.json)"
	```

#### Configuration

```sh
# Symbolic link the base .config directory
ln -sFi $REPO_DIR/dotfiles/.config ~/
```

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
ln -sFi $REPO_DIR/dotfiles/.config ~/

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

### Configuration

- Sync vault with Obsidian Sync—the `.obsidian` directory serves as a version-controlled backup of a subset of vault configuration files
- This is set up as
	```sh
	# Move .obsidian vault configuration to dotfiles repository
	mv $VAULT_DIR/.obsidian $REPO_DIR/dotfiles/.obsidian

	# Symbolic link back to vault
	ln -sFf $REPO_DIR/dotfiles/.obsidian $VAULT_DIR/.obsidian
	```

### yabai

### Prerequisites

- [Disable System Integrity Protection](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection) for full functionality, and
- [Configure Scripting Addition](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#configure-scripting-addition)

### Configuration

```sh
# Symbolic link the base .config directory
ln -sFi $REPO_DIR/dotfiles/.config ~/

# Mark yabairc as executable
chmod +x ~/.config/yabairc

# Run yabai
yabai --start-service
```

### skhd

### Configuration

```sh
# Symbolic link the base .config directory
ln -sFi $REPO_DIR/dotfiles/.config ~/

# Run skhd
skhd --start-service
```
