#!/bin/bash
echo "I take no responsibility for your machine, I don't think this will do any harm to it however I feel I must include this disclaimer."
read -p "Do you want to proceed? (y/n) " yn

install_prereq (){ sudo pacman -Sy npm neovim python-pynvim; }
copy_conf (){ cp -r ../nvim ~/.config; }
copy_hook (){  cp post-merge ../nvim/.git/hooks/; }

case $yn in 
	y ) install_prereq && copy_conf && copy_hook ;;
	n ) echo Your loss m8...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac
