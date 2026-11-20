# Ryoku palette for fish and fzf. Rendered by the theme daemon; do not edit.
#
# Dropped straight into conf.d, which fish sources on its own, so nothing in the
# shipped config has to include it. Your ~/.config/fish/user.fish loads last and
# still wins.

# Syntax highlighting.
set -g fish_color_normal ede1d4
set -g fish_color_command f2be6e
set -g fish_color_keyword b6cea3
set -g fish_color_quote dcc3a1
set -g fish_color_redirection d2c4b4
set -g fish_color_end b6cea3
set -g fish_color_error ffb4ab
set -g fish_color_param ede1d4
set -g fish_color_comment d2c4b4
set -g fish_color_selection --background=614000
set -g fish_color_operator b6cea3
set -g fish_color_escape dcc3a1
set -g fish_color_autosuggestion d2c4b4
set -g fish_color_cancel ffb4ab
set -g fish_color_search_match --background=614000
set -g fish_color_valid_path --underline

# Completion pager.
set -g fish_pager_color_progress d2c4b4
set -g fish_pager_color_prefix f2be6e
set -g fish_pager_color_completion ede1d4
set -g fish_pager_color_description d2c4b4
set -g fish_pager_color_selected_background --background=614000

# fzf takes the same palette, so Ctrl-R and Ctrl-T match the terminal they open
# in. Appended to whatever options are already set rather than replacing them.
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#ede1d4,bg:-1,hl:#f2be6e \
--color=fg+:#ede1d4,bg+:#614000,hl+:#f2be6e \
--color=info:#dcc3a1,prompt:#f2be6e,pointer:#b6cea3 \
--color=marker:#b6cea3,spinner:#dcc3a1,header:#d2c4b4 \
--color=border:#4f4539"
