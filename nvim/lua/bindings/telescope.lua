require('telescope').load_extension('aerial')
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
	extensions = {
		aerial = {
			-- Display symbols as <root>.<parent>.<symbol>
			show_nesting = {
				['_'] = false, -- This key will be the default
				json = true, -- You can set the option for specific filetypes
				yaml = true,
			}
		}
	},
	defaults = {
		layout_config = {
			vertical = { width = 0.8 },
		},
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		}
	},
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

--set to 0 for dropdown theme set to 1 for ivy
ThemeOptions = 1
--set height,width
OptsIn = {
	layout_config = {
		width = 0.5,
		height = 0.9
	}
}
--Opts for file search
OptsInFS = {
	layout_config = {
		width = 0.5,
		height = 0.9
	},
	cwd = "~/Programming/"
}

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

-- Search fuzzy Theme
function FuzzySearch()
	if ThemeOptions == 0 then
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown(OptsIn))
	elseif ThemeOptions == 1 then
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy(OptsIn))
	end
end

-- Search Help Theme
function HelpSearch()
	if ThemeOptions == 0 then
		require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown(OptsIn))
	elseif ThemeOptions == 1 then
		require('telescope.builtin').help_tags(require('telescope.themes').get_ivy(OptsIn))
	end
end

-- Search Grep String
function GrepStr()
	--  require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown{})
	if ThemeOptions == 0 then
		require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown(OptsIn))
	elseif ThemeOptions == 1 then
		require('telescope.builtin').grep_string(require('telescope.themes').get_ivy(OptsIn))
	end
end

-- Search Help live Grep
function LiveGrep()
	--  require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown{})
	if ThemeOptions == 0 then
		require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown(OptsIn))
	elseif ThemeOptions == 1 then
		require('telescope.builtin').live_grep(require('telescope.themes').get_ivy(OptsIn))
	end
end

-- Search Help Diagnostics
function SearchDiag()
	--require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown{})
	if ThemeOptions == 0 then
		require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown(OptsIn))
	elseif ThemeOptions == 1 then
		require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy(OptsIn))
	end
end

-- Search Help Diagnostics
function SearchFiles()
	--require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown{})
	if ThemeOptions == 0 then
		require('telescope.builtin').find_files(require('telescope.themes').get_dropdown(OptsInFS))
	elseif ThemeOptions == 1 then
		require('telescope.builtin').find_files(require('telescope.themes').get_ivy(OptsInFS))
	end
end

vim.keymap.set('n', '<leader>/', FuzzySearch, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>sf', SearchFiles, { desc = '[S]earch [F]iles' })
--vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sh', HelpSearch, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', GrepStr, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', LiveGrep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', SearchDiag, { desc = '[S]earch [D]iagnostics' })
