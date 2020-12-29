#!/bin/bash
cp -r -f $(dirname "${BASH_SOURCE[0]}")/config/* ~/.config/
i3-msg reload > /dev/null
i3-msg restart > /dev/null
nvim +'PlugInstall' +'qa'
