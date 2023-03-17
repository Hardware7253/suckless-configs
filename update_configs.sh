#!/bin/bash

hdpi() {
 cd dwm
 mv config_hdpi.h config.h
 cd ..
 cd st
 mv config_hdpi.h config.h
 cd ..
 cd dmenu
 mv config_hdpi.h config.h
 cd ..
}

read -r -n 1 -p "$*Setup for high dpi screen? [y/N]: " yn
yn=${yn:-N}
case $yn in
	[Yy]*) hdpi ;;
	[Nn]*) ;;
esac



path=$PWD

build() {
 programpath="$srcpath/$program"
 cd "$programpath"
 sudo make clean install
 return
}

copy_config() {
 cd "$path"
 programpath="$srcpath/$program"
 sudo cp "$program/"* "$programpath" 
}


srcpath="/usr/src"


program="dwm"
copy_config
build

program="dwmblocks"
copy_config
build

program="st"
copy_config
build

program="dmenu"
copy_config
build
