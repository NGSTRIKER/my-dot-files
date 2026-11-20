# my-dot-files

My Arch Linux + Hyprland rice dotfiles, built on **Ryoku**, **Quickshell**, and **Matugen**.

## Stack Overview

| Component | Tool / Config |
|---|---|
| OS | Arch Linux |
| Compositor | Hyprland (configured via Ryoku `hl` Lua API in `.config/hypr/`) |
| Shell / Bar / Dock / Widgets | Ryoku Shell (`quickshell` / `qsbar`), `macbar`, `macdock`, `macwidgets`, `karuma` |
| Theme / Dynamic Colors | Matugen + Ryogami (`matugen/`, `ryoku/matugen.json`, `ryoku/theme.json`, `ryoku/ryogami.json`) |
| Active Rice Profile | `noc` (`.config/ryoku/rices/noc/`) |
| Terminals | Kitty (`SpaceMono Nerd Font`), Ghostty, Alacritty |
| Shell & Prompt | Fish (`fish/config.fish`, `fish/user.fish`), Starship (`mythos` pill palette), Zsh/Bash helpers |
| System Fetch | Fastfetch (`3d-arch/spin` emblem + custom layout) |
| Editor | Neovim (LazyVim + Ryoku plugins) |
| File Manager / Monitor / Visualizer / Reader | Yazi, btop, Cava, Zathura, Tmux, Zed |
| Cursor / Icons / GTK / Qt | `Bibata-Modern-Ice`, `ryoku-folders` / `Papirus-Dark`, `adw-gtk3-dark`, `qt6ct` (`Space Grotesk` / `SpaceMono Nerd Font`) |

## Repository Structure

- `.config/ryoku/` — Ryoku tool stores (`desktop.json`, `shell.json`, `stage.json`, `visualizer.json`, `widgets.json`, `ryogami.json`, `matugen.json`, etc.), active `noc` rice, and `user_edits/` overlay forks.
- `.config/hypr/` — Hyprland Lua configuration, animations, shaders, plugins config (`dynamic-cursors`, `hyprfocus`, `keysounds`, `borders-plus-plus`), `user.lua`, and `monitors_user.lua`.
- `.config/fish/`, `.config/zsh/`, `.config/bash/`, `.config/starship.toml`, `.config/starship/` — Shell configurations and Starship `mythos` prompt.
- `.config/kitty/`, `.config/ghostty/`, `.config/alacritty/` — Terminal configs and Matugen color includes.
- `.config/nvim/`, `.config/btop/`, `.config/cava/`, `.config/yazi/`, `.config/zathura/`, `.config/zed/`, `.config/tmux/`, `.config/fastfetch/` — CLI/TUI/GUI app configs.
- `.config/gtk-3.0/`, `.config/gtk-4.0/`, `.config/qt6ct/`, `.config/macbar/`, `.config/macdock/`, `.config/macwidgets/`, `.config/karuma/`, `.config/omarchy/`, `.config/qylock/` — Desktop theming and shell bar/dock/widget settings.
- `wallpapers/` — Active wallpaper (`a_painting_of_a_man_with_a_face_on_his_head.png`) and `noc` rice wallpaper (`noc-wall.webp`).

## Installation

> **Note:** This setup targets Arch Linux with Ryoku packages (`ryoku`, `ryoku-shell`, `ryoku-desktop-hyprland`, `quickshell`, `matugen`, `hyprland`, `kitty`, `fish`, `starship`, `fastfetch`, `neovim`, `btop`, `cava`, `yazi`, `zathura`, `qt6ct`).

1. Clone the repository:
   ```bash
   git clone https://github.com/NGSTRIKER/my-dot-files.git
   cd my-dot-files
   ```

2. Preview or run the installer (automatically backs up existing `~/.config` entries):
   ```bash
   chmod +x install.sh
   ./install.sh --dry-run
   ./install.sh
   ```

   If you also want to copy hardware-specific GPU/monitor files (`hypr/gpu.lua`, `hypr/monitors.lua`, `hypr/monitors_user.lua`), pass `--include-hardware`:
   ```bash
   ./install.sh --include-hardware
   ```

3. If using Ryoku, reconcile overlays and reload:
   ```bash
   ryoku doctor
   ```

## Privacy & Hardware Notes

- Personal location metadata, credentials, keyrings, and runtime lockfiles (`keyring.json`, `stash.json`, `rashin.json`, `fish_variables`, etc.) have been excluded/sanitized.
- Home directory paths in JSON stores use `__HOME__` in the repo and are expanded to `$HOME` by `install.sh`.
- `hypr/gpu.lua`, `hypr/monitors.lua`, and `hypr/monitors_user.lua` reflect the original machine's GPU/display (`DP-2` 1080p modeline) and are skipped by default if they already exist on your system.
