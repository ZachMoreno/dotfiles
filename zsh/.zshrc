# ~/.zshrc — runs for every interactive shell

# Powerlevel10k instant prompt. Must stay near the top.
# Anything that needs console input (password prompts, etc.) goes above this.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- PATH & Environment ---

# Cargo (Rust)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

if [[ $(uname) == "Darwin" ]]; then
  # Homebrew (must come first so /opt/homebrew/bin is on PATH for everything below)
  eval "$(/opt/homebrew/bin/brew shellenv)"

  export PATH="$HOME/.local/bin:$PATH"                          # local user binaries
  export PATH="$HOME/.antigravity/antigravity/bin:$PATH"        # antigravity
  export PATH="$HOME/depot_tools:$PATH"                         # chromium depot tools
  export PATH="$HOME/DevTools/flutter/bin:$PATH"                # flutter
  export PATH="$PATH:$HOME/.pub-cache/bin"                      # dart pub

  # Google Cloud SDK
  [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ] && \
    . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'
  [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ] && \
    . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'

  # Android
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"
  export PATH="/Applications/Android Studio.app/Contents/MacOS:$PATH"

  export JAVA_HOME=$(/usr/libexec/java_home -v 17)
fi

# --- Shell ---

# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# z (directory jumper)
[ -f ~/DevTools/z-master/z.sh ] && . ~/DevTools/z-master/z.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pyenv
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
