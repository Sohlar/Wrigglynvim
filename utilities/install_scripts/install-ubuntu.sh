#!/bin/bash
echo "This is going to install using snap store since you are using ubuntu I think it makes more sense adding a ppa seems dirtier."
echo "I take no responsibility for your machine, I don't think this will do any harm to it however I feel I must include this disclaimer."
echo "Also If you'd like entering c will only copy the install and hook"
read -p "Do you want to proceed? (y/n/c) " yn

	 
install_prereq (){ sudo apt-get install npm python3-neovim && sudo snap install --beta nvim --classic; }
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
