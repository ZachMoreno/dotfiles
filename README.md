# dotfiles

Personal config for Claude Code and other tools.

## Claude

### Skills

Custom Claude Code skills in `claude/skills/`:

- **blt** — Build-Test-Lint health check. Fixes errors, outputs a conventional commit message.

### Setup

```bash
git clone https://github.com/ZachMoreno/dotfiles.git ~/dotfiles

ln -s ~/dotfiles/claude/skills/blt ~/.claude/skills/blt
ln -s ~/dotfiles/claude/settings.json ~/.claude/settings.json
```

> Note: `settings.json` has hardcoded `/home/zachinspace` paths. Update if username differs.
