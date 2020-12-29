#!/bin/bash
cp -r -f config/* ~/.config/
i3-msg reload > /dev/null
i3-msg restart > /dev/null
nvim +'PlugInstall' +'qa'
