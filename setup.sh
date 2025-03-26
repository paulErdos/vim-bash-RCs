#!/bin/bash

echo "Setup initiated... "

cp .bashrc ~/
cp .bash_profile ~/
cp .vimrc ~/
cp .zshrc ~/
#cp com.apple.Terminal.plist ~/Library/Preferences/

# Start the user a new shell
echo 'Dropping you into a new shell with configs sourced'
# Could do this
#bash
# But this is cool and good
eval "$(echo $SHELL)"
