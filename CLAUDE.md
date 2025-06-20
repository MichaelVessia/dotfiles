# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository that manages configuration files for various development tools using GNU Stow. The repository follows a modular structure where each tool has its own directory containing its configuration files.

## Key Commands

### Setup/Installation
```bash
make all        # Create symlinks for all configurations using GNU stow
make delete     # Remove all symlinks created by stow
```

### Development Commands
Since this is a configuration repository, there are no build or test commands. However, when modifying configurations:
- Changes take effect immediately after running `make all`
- For Neovim changes, you may need to restart Neovim or run `:Lazy sync` for plugin updates
- For tmux changes, reload with `tmux source-file ~/.tmux.conf` or restart tmux

## Architecture and Structure

### Directory Organization
The repository uses GNU Stow pattern:
- Each top-level directory represents a tool (e.g., `neovim/`, `tmux/`, `zsh/`)
- Within each directory, paths mirror the home directory structure
- Example: `neovim/.config/nvim/` becomes `~/.config/nvim/` when stowed

### Managed Tools
- **neovim/**: LazyVim-based Neovim configuration (Lua)
- **tmux/**: Tmux with TPM (Tmux Plugin Manager)
- **zsh/**: Zsh with Oh-My-Zsh framework
- **alacritty/**: Terminal emulator (TOML config)
- **kitty/**: Terminal emulator
- **i3/**: Linux window manager
- **skhd/**: macOS hotkey daemon
- **zed/**: Zed editor configuration
- **tmuxinator/**: Project session templates

### Configuration Patterns
1. **Plugin Management**: Each tool uses its own plugin manager (LazyVim for Neovim, TPM for tmux)
2. **Theme**: Catppuccin theme is used across multiple tools
3. **Ignore Patterns**: Plugin directories and runtime files are gitignored

### Important Files
- `makefile`: Contains stow commands for symlinking
- `neovim/.config/nvim/lua/plugins/`: Custom Neovim plugin configurations
- `tmuxinator/.config/tmuxinator/`: Project-specific tmux session templates

## Development Guidelines

When modifying configurations:
1. Edit files in their respective tool directories
2. Run `make all` to update symlinks
3. Test changes in the actual application
4. Commit only configuration files, not plugin/runtime directories

When adding a new tool:
1. Create a new directory at the root level
2. Mirror the home directory structure inside it
3. Run `make all` to create symlinks
4. Add any generated/runtime files to `.gitignore`