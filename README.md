# dotfiles

Personal config for Zsh, Ghostty, Zed, Cursor, VSCode, and Claude Code.

## Setup

```bash
git clone https://github.com/ZachMoreno/dotfiles.git ~/Clones/dotfiles
cd ~/Clones/dotfiles
./install.sh
```

`install.sh` symlinks everything into place and is safe to re-run.

## Fonts

[Dank Mono](https://philpl.gumroad.com/l/dank-mono) is a paid font used across Ghostty, Zed, Cursor, and VSCode. After purchase, install by dropping the `.otf` files into `~/Library/Fonts` (macOS) or `~/.local/share/fonts` (Linux).

## GitHub SSH

```bash
./github/setup-ssh.sh
```

Generates an ed25519 key, adds it to the agent, copies it to your clipboard, and opens GitHub's SSH settings page. Run it once on a new machine. Optionally pass an email: `./github/setup-ssh.sh you@example.com`

## macOS settings

```bash
./macos.sh
```

## Brew

Restore all packages, casks, and VSCode extensions:

```bash
brew bundle --file=Brewfile
```

## What's included

| Path in repo | Symlinked to |
|---|---|
| `zsh/.zshrc` | `~/.zshrc` |
| `zsh/.p10k.zsh` | `~/.p10k.zsh` |
| `git/.gitconfig` | `~/.gitconfig` |
| `ghostty/config` | `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty` |
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `cursor/settings.json` | `~/Library/Application Support/Cursor/User/settings.json` |
| `cursor/keybindings.json` | `~/Library/Application Support/Cursor/User/keybindings.json` |
| `vscode/settings.json` | `~/Library/Application Support/Code/User/settings.json` |
| `claude/settings.json` | `~/.claude/settings.json` |
| `claude/skills/blt` | `~/.claude/skills/blt` |
