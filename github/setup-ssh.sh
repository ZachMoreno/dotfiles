#!/usr/bin/env zsh
# Set up GitHub SSH key. Safe to re-run — skips keygen if a key already exists.

KEY="$HOME/.ssh/id_ed25519"
EMAIL="${1:-$(git config --global user.email)}"
MACOS=[[ $(uname) == "Darwin" ]]

echo "\n🔑 GitHub SSH Setup\n"

# Generate key if it doesn't exist
if [[ -f "$KEY" ]]; then
  echo "✔ SSH key already exists at $KEY"
else
  echo "Generating SSH key for $EMAIL..."
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY" -N ""
  echo "✔ Key generated"
fi

# Ensure SSH config loads the key automatically
SSH_CONFIG="$HOME/.ssh/config"
if ! grep -q "id_ed25519" "$SSH_CONFIG" 2>/dev/null; then
  mkdir -p "$HOME/.ssh"
  if $MACOS; then
    cat >> "$SSH_CONFIG" <<EOF

Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
  else
    cat >> "$SSH_CONFIG" <<EOF

Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519
EOF
  fi
  chmod 600 "$SSH_CONFIG"
  echo "✔ Added key to ~/.ssh/config"
fi

# Add to agent
eval "$(ssh-agent -s)" > /dev/null
if $MACOS; then
  ssh-add --apple-use-keychain "$KEY" 2>/dev/null || ssh-add "$KEY"
else
  ssh-add "$KEY"
fi
echo "✔ Key added to SSH agent"

# Copy public key to clipboard
if $MACOS; then
  pbcopy < "$KEY.pub"
  echo "✔ Public key copied to clipboard\n"
elif command -v xclip &>/dev/null; then
  xclip -selection clipboard < "$KEY.pub"
  echo "✔ Public key copied to clipboard\n"
elif command -v xsel &>/dev/null; then
  xsel --clipboard --input < "$KEY.pub"
  echo "✔ Public key copied to clipboard\n"
else
  echo "ℹ Public key (copy this):\n"
  cat "$KEY.pub"
  echo ""
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Next: add it to GitHub"
echo "  1. Opening github.com/settings/ssh/new..."
echo "  2. Paste your key (already in clipboard)"
echo "  3. Give it a name and click Add SSH Key"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"

if $MACOS; then
  open "https://github.com/settings/ssh/new"
else
  xdg-open "https://github.com/settings/ssh/new" 2>/dev/null || \
    echo "  Open: https://github.com/settings/ssh/new"
fi

echo "Press Enter once you've added the key to GitHub..."
read

# Test connection
echo "\nTesting connection..."
ssh -T git@github.com 2>&1

echo "\nDone. You can now clone repos with SSH."
