# Neovim Configuration

This repository contains a Neovim configuration with a variety of plugins and settings. The configuration is written in Lua and uses packer.nvim as a package manager.

## Installation

I've included install scripts for the major package managers this will also install a git hook that will merge changes when you pull from the repo.

An example install on ubuntu would be.
```sh
cd WrigglyNvim/utilities/install_scripts
./install_ubuntu.sh
```

# Manual install 

- Install npm python3-neovim neovim using your package manager.
- cp the nvim directory to your nvim config location. 



## Plugins

The configuration includes the following plugins:

- packer.nvim: A package manager for Neovim.
- nvim-tree.lua: A file explorer tree.
- nvim-treesitter: Parser generator tool and an incremental parsing library.
- nvim-treesitter-textobjects: Additional text objects for treesitter.
- nvim-web-devicons: Adds file type icons to Neovim.
- onedark.nvim: A dark color scheme for Neovim.
- telescope.nvim: A highly extendable fuzzy finder over lists.
- ultisnips: The ultimate snippet solution for Vim.
- vim-fugitive: A Git wrapper so awesome, it should be illegal.
- vim-rhubarb: GitHub extension for fugitive.vim.

For a full list of plugins, please refer to the packer_compiled.lua file.

Customization
You can add your own plugins in the ~/.config/nvim/lua/bindings/custom_plugins.lua file. They will be loaded automatically.
end
