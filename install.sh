#!/usr/bin/env zsh
# Symlink dotfiles into place. Safe to re-run.

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  mkdir -p "$(dirname "$2")"
  ln -sf "$1" "$2"
  echo "  $2"
}

echo "\nZsh"
link "$DOTFILES/zsh/.zshrc"   "$HOME/.zshrc"
link "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

echo "\nGit"
link "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

echo "\nClaude"
link "$DOTFILES/claude/settings.json"  "$HOME/.claude/settings.json"
link "$DOTFILES/claude/skills/blt"     "$HOME/.claude/skills/blt"

echo "\nZed"
link "$DOTFILES/zed/settings.json" "$HOME/.config/zed/settings.json"

if [[ $(uname) == "Darwin" ]]; then
  echo "\nGhostty"
  link "$DOTFILES/ghostty/config" \
    "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

  echo "\nCursor"
  link "$DOTFILES/cursor/settings.json"   "$HOME/Library/Application Support/Cursor/User/settings.json"
  link "$DOTFILES/cursor/keybindings.json" "$HOME/Library/Application Support/Cursor/User/keybindings.json"

  echo "\nVSCode"
  link "$DOTFILES/vscode/settings.json" \
    "$HOME/Library/Application Support/Code/User/settings.json"

  echo "\nBrew"
  echo "  Run: brew bundle --file=$DOTFILES/Brewfile"
fi

echo "\nDone."
