# terminalconfig

Personal terminal configuration dotfiles for Mac and Linux. Covers zsh, fish, bash, tmux, and Ghostty.

## Setup

Each tool has its own subdirectory with a setup script. Scripts must be run from their own subdirectory (symlinks use `$(pwd)`):

```sh
cd zsh && ./setup.sh       # installs oh-my-zsh + plugins, symlinks zshrc
cd fish && ./setup         # installs oh-my-fish + kawasaki theme, symlinks fish configs
cd tmux && ./setup         # installs tpm, symlinks tmux.conf
cd ghostty && ./setup.sh   # symlinks ghostty/config to ~/.config/ghostty/config
```

For bash, manually copy files to your home directory:

| File | Destination |
|------|-------------|
| `bash_profile` | `~/.bash_profile` (Mac) |
| `bashrc` | `~/.bashrc` (Linux) |

---

## Shells

### zsh

Uses [Oh My Zsh](https://ohmyz.sh/) with `ZSH_THEME=""` (no omz theme). The prompt is defined inline using `PROMPT`/`RPROMPT` variables with the `git_super_status` function from the `git-prompt` plugin.

Plugins: `git`, `git-prompt`, `fzf`, `zsh-autosuggestions`, `zsh-syntax-highlighting`

### fish

Uses [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish) with the [kawasaki](https://github.com/hastinbe/theme-kawasaki) theme. Theme variables in `fish/omf/init.fish` override kawasaki defaults to match the zsh color scheme.

### bash

256-color prompt configuration. Includes SSH host autocomplete and common aliases.

---

## Prompt Color Scheme

Consistent palette across zsh and fish:

| Element | Color | Hex |
|---------|-------|-----|
| User | Blue | `#087fff` |
| Host | Teal | `#1eb980` |
| Separator (`@`) | Purple | `#b15dff` |
| Prompt character (`$`) | Hot pink | `#ff3399` |

---

## tmux

- Prefix remapped to `C-a`
- Pane splits: `|` (vertical) and `-` (horizontal), preserving current path
- Vi copy mode: `v` to select, `y` to yank
- Mouse: off by default, toggle with `prefix + m`
- Status bar: session name, username, hostname, time, date
- Plugin manager: [tpm](https://github.com/tmux-plugins/tpm) — after setup, activate plugins inside tmux with `prefix + I`

---

## Ghostty

Minimal config — iTerm2 Tango Dark/Light themes, Menlo 12.5pt, 85% opacity, block cursor.

---

## PATH

All shell configs (`zshrc`, `bashrc`, `bash_profile`) automatically add `~/.local/bin` to `$PATH` if the directory exists and is not already included:

```sh
[[ -d "$HOME/.local/bin" && ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"
```

For fish, the equivalent is handled via `fish_add_path` in `fish/omf/init.fish`.

---

## Color Diagnostics

Scripts for testing terminal color support (no install needed):

```sh
./colors.sh        # 8-bit 256-color palette
./colors256.sh     # compact 256-color grid
./truecolors1.sh   # truecolor gradient test
python3 colors.py  # Python color output
```

**Color references:**
- [4-bit colors](http://ciembor.github.io/4bit/)
- [8-bit xterm color names](http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim)
- [Bash colors and formatting](http://misc.flogisoft.com/bash/tip_colors_and_formatting)
- [iTerm2 color themes](https://iterm2colorschemes.com/)
