#!/bin/sh

Mouse=`xinput list |grep -i "Logitech Gaming Mouse G502\s*id" | awk -F= '{ print $2 }'| awk '{print $1}'| awk 'BEGIN{ RS = "" ; FS = "\n"  }{print $1}'`

echo $Mouse
