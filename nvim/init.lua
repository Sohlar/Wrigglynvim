-- Includes
require "bindings.aerial"
require "bindings.nvimtree"
require "bindings.debug"
require "bindings.lldb"
require "bindings.indent"
require "bindings.base"
require "bindings.telescope"
require "bindings.lualine"
require "bindings.cpp"
require "bindings.cmp"
require "bindings.gitsigns"
require "bindings.hop"
require "bindings.window"
require "bindings.treesitter"
require "bindings.lsp"
require "bindings.neoscroll"
require "bindings.highlight"
require "bindings.comment"

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end


require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'
	-- Debugger
	use {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	}
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'nvim-telescope/telescope-dap.nvim'
	-- nerdtree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		tag = 'nightly',
	}

	-- icon pack
	use { 'nvim-tree/nvim-web-devicons' }

	use { -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration, makes nvim stuff amazing
			'folke/neodev.nvim',
		},
	}
	use {
		'j-hui/fidget.nvim',
		tag = 'legacy',
	  config = function()
		require("fidget").setup {
		  -- options
		}
	  end,
	}
	-- Sneak clone
	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}
	-- Snippets
	use { 'SirVer/ultisnips' }
	use { 'quangnguyen30192/cmp-nvim-ultisnips' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'L3MON4D3/LuaSnip' }
	use { 'saadparwaiz1/cmp_luasnip' }
	use { 'stevearc/aerial.nvim' }

	use { 'hrsh7th/nvim-cmp',
		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
			'quangnguyen30192/cmp-nvim-ultisnips' },
		{
			config = function()
				local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
				require("cmp").setup({
					snippet = {
						expand = function(args)
							vim.fn["UltiSnips#Anon"](args.body)
						end,
					},
					sources = {
						{ name = 'ultisnips' },
						{ name = 'buffer' }
						-- more sources
					},
					-- recommended configuration for <Tab> people:
					mapping = {
						["<Tab>"] = cmp.mapping(
							function(fallback)
								cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
							end,
							{ "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
						),
						["<S-Tab>"] = cmp.mapping(
							function(fallback)
								cmp_ultisnips_mappings.jump_backwards(fallback)
							end,
							{ "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
						),
					},
				})
			end,
		},
	}

	use { -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}


	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	-- Git related plugins
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'lewis6991/gitsigns.nvim'

	-- Theme and Visuals
	use 'karb94/neoscroll.nvim'
	use 'nvim-lua/plenary.nvim'
	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require "startup".setup({ theme = "evil" })
		end
	}
	use 'navarasu/onedark.nvim'            -- Theme inspired by Atom
	use 'nvim-lualine/lualine.nvim'        -- Fancier statusline
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	use 'numToStr/Comment.nvim'            -- "gc" to comment visual regions/lines
	--use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, 'custom.plugins')
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require('packer').sync()
	end
end)


-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
-- The line beneath this is called `modeline`. See `:help modeline`
