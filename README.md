# dotfiles

Personal config for Claude Code, Ghostty, and Zsh.

## Setup

```bash
git clone https://github.com/ZachMoreno/dotfiles.git ~/Clones/dotfiles
cd ~/Clones/dotfiles
```

### Claude

```bash
ln -sf ~/Clones/dotfiles/claude/skills/blt ~/.claude/skills/blt
ln -sf ~/Clones/dotfiles/claude/settings.json ~/.claude/settings.json
```

> Note: `settings.json` has hardcoded `/home/zachinspace` paths. Update if username differs.

### Zsh / Powerlevel10k

```bash
ln -sf ~/Clones/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Clones/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
```

### Fonts

[Dank Mono](https://philpl.gumroad.com/l/dank-mono) is a paid font used by Ghostty, Zed, and the terminal prompt. After purchase, install by dropping the `.otf` files into `~/Library/Fonts` (macOS) or `~/.local/share/fonts` (Linux).

### Zed

```bash
ln -sf ~/Clones/dotfiles/zed/settings.json ~/.config/zed/settings.json
```

### Ghostty

**macOS:**
```bash
ln -sf ~/Clones/dotfiles/ghostty/config \
  ~/Library/Application\ Support/com.mitchellh.ghostty/config.ghostty
```

**Linux:**
```bash
mkdir -p ~/.config/ghostty
ln -sf ~/Clones/dotfiles/ghostty/config ~/.config/ghostty/config
```

## Claude Skills

- **blt** — Build-Test-Lint health check. Fixes errors, outputs a conventional commit message.
