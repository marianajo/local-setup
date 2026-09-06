# AGENTS.md

Dotfiles/config collection, not a code project. No build, test, or lint pipeline — never run npm/cargo/etc. Each subdir maps to a standard dotfile path and is applied via symlink (see README):

- `iterm2/` — macOS-only iTerm2 profile (`Mariana.json`). Ignore on other platforms.
- `ghostty/` — Ghostty config, symlinked to `~/.config/ghostty/config`. Theme colors come from the desktop (Omarchy) where available — no Omarchy path references may live in the file.
- `git/` — git `config` (XDG global), read automatically from `~/.config/git/config`. `[user]` is intentionally absent; machines fill it in locally.
- `nvim/` — Neovim config (LazyVim), symlinked to `~/.config/nvim`.
- `starship/` — starship prompt config (needs a Nerd Font).
- `zsh/` — symlink `.zshrc` to `~/.zshrc`.

## nvim/

LazyVim layout: `init.lua` → `lua/config/*` (options, plugins list in `lazy.lua`) + `lua/plugins/*` (plugin specs auto-imported by lazy.nvim). `plugin/after/transparency.lua` is a runtime file sourced automatically; it strips backgrounds for terminal transparency.

- `lua/plugins/example.lua` is inert template cruft (`if true then return {} end`), not active config — don't diff it for bugs.
- Keep the config OS-agnostic: it was de-Omarchy'd deliberately. Never re-add Omarchy/herdr references, and never recreate `lua/plugins/theme.lua` — that was a symlink to Omarchy state and must not exist here.
- `all-themes.lua`: themes are loaded but not applied. `bjarneo/aether.nvim` must stay pinned to `branch = "v3"` with `name = "aether"` — lazy caches it under `lazy/aether`, and dropping the explicit name breaks the colorscheme on first load.
- `remote_clipboard.lua` only activates inside tmux/SSH; OSC 52 emission can be gated with `vim.g.remote_clipboard_osc52`. Uses a Wayland (`wl-copy`/`wl-paste`) fallback for the primary register.

Lua verification: `stylua` is not installed here (stylua.toml exists for formatting only). Syntax-check edits with:

```sh
nvim --headless -c "luafile <file.lua>" -c q
```

## Git

Working tree intentionally holds an uncommitted rework of `nvim/` (old kickstart files deleted, new LazyVim files untracked, `README.md` modified). Do not `git clean`, `git restore`, `git add -A`, or commit unless the user explicitly asks — the user stages and commits manually.