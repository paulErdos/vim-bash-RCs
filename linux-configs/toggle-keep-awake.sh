#!/usr/bin/env bash

# Check current setting
current=$(gsettings get org.gnome.settings-daemon.plugins.power lid-close-ac-action)

if [[ "$current" == "'suspend'" ]]; then
    echo "Switching to: stay awake (no suspend on lid close)"
    gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
    gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'
    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
else
    echo "Switching to: normal suspend on lid close"
    gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'suspend'
    gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'suspend'
    sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
fi

