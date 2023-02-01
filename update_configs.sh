#!/bin/bash

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
 cp "$program/"* "$programpath" 
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
