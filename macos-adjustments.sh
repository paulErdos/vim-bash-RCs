#!/bin/bash

# Bounce when opening, but don't bounce for attention
defaults write com.apple.dock no-bouncing -bool TRUE
killall Dock
