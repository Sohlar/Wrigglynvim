#!/bin/bash
echo "I take no responsibility for your machine, I don't think this will do any harm to it however I feel I must include this disclaimer.Also If you'd like entering c will only copy the install and hook"
read -p "Do you want to proceed? (y/n/c) " yn

install_prereq (){ sudo pacman -Sy npm neovim python-pynvim; }
copy_conf (){ cp -r ../../nvim ~/.config; }
copy_hook (){  cp ../hooks/post-merge ../../.git/hooks/; }

case $yn in 
	y ) install_prereq && copy_conf && copy_hook ;;
	c ) copy_conf && copy_hook;;
	n ) echo Your loss m8...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac
