#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="$REPO_DIR/.config"
CONFIG_DST="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

INCLUDE_HARDWARE=false
DRY_RUN=false

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Install dotfiles from this repository into \$XDG_CONFIG_HOME (~/.config)
and copy bundled wallpapers into ~/Pictures/Wallpapers/.

Options:
  --include-hardware   Also copy hardware-specific Hyprland files
                       (hypr/gpu.lua, hypr/monitors.lua, hypr/monitors_user.lua)
  --dry-run            Show what would be done without modifying files
  -h, --help           Show this help message
EOF
}

for arg in "$@"; do
  case "$arg" in
    --include-hardware) INCLUDE_HARDWARE=true ;;
    --dry-run) DRY_RUN=true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; usage; exit 1 ;;
  esac
done

echo "Source: $CONFIG_SRC"
echo "Target: $CONFIG_DST"
echo "Backup: $BACKUP_DIR"

if [ "$DRY_RUN" = true ]; then
  echo "[dry-run] Would back up existing targets to $BACKUP_DIR and install configs."
  exit 0
fi

mkdir -p "$CONFIG_DST" "$BACKUP_DIR"

# Back up and copy top-level items in .config/
for item in "$CONFIG_SRC"/*; do
  name="$(basename "$item")"
  target="$CONFIG_DST/$name"

  if [ -e "$target" ]; then
    cp -a "$target" "$BACKUP_DIR/"
  fi

  if [ "$name" = "hypr" ] && [ "$INCLUDE_HARDWARE" = false ]; then
    mkdir -p "$target"
    for sub in "$item"/*; do
      subname="$(basename "$sub")"
      case "$subname" in
        gpu.lua|monitors.lua|monitors_user.lua)
          if [ ! -e "$target/$subname" ]; then
            cp -a "$sub" "$target/$subname"
          else
            echo "Skipping existing hardware config: hypr/$subname (use --include-hardware to overwrite)"
          fi
          ;;
        *)
          rm -rf "$target/$subname"
          cp -a "$sub" "$target/$subname"
          ;;
      esac
    done
  else
    cp -a "$item" "$CONFIG_DST/"
  fi
done

# Replace __HOME__ placeholders in installed JSON configs
for json_file in \
  "$CONFIG_DST/ryoku/launcher.json" \
  "$CONFIG_DST/ryoku/stage/stage-editor.json"; do
  if [ -f "$json_file" ]; then
    sed -i "s|__HOME__|$HOME|g" "$json_file"
  fi
done

# Copy bundled wallpapers
WALL_DST="$HOME/Pictures/Wallpapers/abstract"
mkdir -p "$WALL_DST"
if [ -f "$REPO_DIR/wallpapers/a_painting_of_a_man_with_a_face_on_his_head.png" ]; then
  cp -n "$REPO_DIR/wallpapers/a_painting_of_a_man_with_a_face_on_his_head.png" "$WALL_DST/" || true
fi

if command -v ryoku >/dev/null 2>&1; then
  echo "Detected ryoku CLI. You can run 'ryoku doctor' or 'ryoku materialize' to sync overlays."
fi

echo "Done! Existing configs backed up to: $BACKUP_DIR"
