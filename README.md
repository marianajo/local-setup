# Local setup

A collection of config files for my personal setup across machines and
operating systems. Everything here is meant to be OS-agnostic: copy or
symlink each directory into place on any machine.

## Layout

```
local-setup/
├── README.md
├── iterm2/     macOS iTerm2 dynamic profile (import via iTerm2 > Preferences > Profiles)
├── nvim/       Neovim config (LazyVim) — symlink to ~/.config/nvim
└── zsh/        zsh config — symlink to ~/.zshrc
```

## Installing

Each entry maps to a standard dotfile location. The typical flow is to clone
this repo and symlink the pieces you want:

```sh
git clone <this-repo> ~/local-setup

# nvim
ln -s ~/local-setup/nvim ~/.config/nvim

# zsh
ln -s ~/local-setup/zsh/.zshrc ~/.zshrc
```

OS-specific items (e.g. `iterm2/`) live side by side; pick whatever applies
to the current machine.

## Notes

- `nvim/` is a Neovim config based on [LazyVim](https://lazyvim.github.io).
  On first launch it bootstraps lazy.nvim and installs all plugins, so the
  only requirement is a recent Neovim.
- The clipboard integration in `nvim/lua/config/remote_clipboard.lua` handles
  tmux/SSH sessions via OSC 52 with a local Wayland fallback.