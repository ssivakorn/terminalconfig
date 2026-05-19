# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal terminal configuration dotfiles for Mac and Linux. Covers zsh, fish, bash, tmux, and Ghostty. Each tool has its own subdirectory with a setup script that installs a plugin manager and symlinks repo files into `~/`.

## Setup Commands

Each setup script must be run from its own subdirectory (symlinks use `$(pwd)`):

```sh
cd zsh && ./setup.sh       # installs oh-my-zsh + plugins, symlinks zshrc
cd fish && ./setup          # installs oh-my-fish + kawasaki theme, symlinks fish configs
cd tmux && ./setup          # installs tpm, symlinks tmux.conf
cd ghostty && ./setup.sh    # symlinks ghostty/config to ~/.config/ghostty/config
```

For bash, manually copy files to home:
- Mac: `bash_profile` → `~/.bash_profile`
- Linux: `bashrc` → `~/.bashrc`

Color diagnostic scripts (no install needed):
```sh
./colors.sh        # 8-bit 256 color palette
./colors256.sh     # compact 256-color grid
./truecolors1.sh   # truecolor gradient test
python3 colors.py  # Python color output
```

## Architecture

**Symlink model**: setup scripts symlink repo files directly into `~/` or `~/.config/`. Editing files in the repo immediately affects the live shell — no deploy step needed.

**Consistent color scheme across shells**: blue (`#087fff`) user, teal (`#1eb980`) host, purple (`#b15dff`) separator, hot pink (`#ff3399`) prompt character. This palette is replicated manually in both `zsh/zshrc` and `fish/omf/init.fish`.

**zsh** (`zsh/zshrc`): Oh My Zsh with `ZSH_THEME=""` (no omz theme). The prompt is defined inline using `PROMPT`/`RPROMPT` variables and the `git_super_status` function from the `git-prompt` plugin. Plugins: `git git-prompt fzf zsh-autosuggestions zsh-syntax-highlighting`. Right prompt shows current time.

**fish** (`fish/omf/init.fish`): Oh My Fish with the [kawasaki](https://github.com/hastinbe/theme-kawasaki) theme. Theme variables in `omf/init.fish` override kawasaki defaults to match the zsh color scheme. `fish_prompt.fish` contains a commented-out custom prompt (unused — kawasaki is active instead).

**tmux** (`tmux/tmux.conf`): Prefix remapped to `C-a`. Pane splits with `|`/`-` preserving current path. Vi copy mode (`v` to select, `y` to yank). Mouse off by default, toggled with `prefix + m`. Status bar shows session name, username, hostname, time, and date. Plugin manager: [tpm](https://github.com/tmux-plugins/tpm) — after setup, activate plugins with `prefix + I` inside tmux.

**Ghostty** (`ghostty/config`): Minimal config — iTerm2 Tango Dark/Light themes, Menlo 12.5pt, 85% opacity, block cursor.

**welcome.sh**: Login greeting sourced by `zsh/zshrc` (symlinked to `~/.welcome.sh`). Prints a bordered welcome box with current date/time.
