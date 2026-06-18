#!/usr/bin/env zsh
# macOS system preferences. Run once after a fresh setup.
# Changes take effect after logging out or restarting affected apps.

echo "Dock..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.2
defaults write com.apple.dock show-recents -bool false

echo "Finder..."
defaults write com.apple.finder AppleShowAllFiles -bool true               # show hidden files
defaults write NSGlobalDomain AppleShowAllExtensions -bool true            # show all file extensions
defaults write com.apple.finder ShowPathbar -bool true                     # path bar at bottom
defaults write com.apple.finder ShowStatusBar -bool true                   # status bar at bottom
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"        # column view
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true         # full path in title bar
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true  # no .DS_Store on network
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true      # no .DS_Store on USB

echo "Keyboard..."
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 68 # lower is faster
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Screenshots..."
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string "~/Pictures/Screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo "Login items..."
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Stats.app", hidden:false}' 2>/dev/null

echo "Restarting affected apps..."
killall Finder Dock 2>/dev/null

echo "Done. Log out and back in for all changes to take effect."
