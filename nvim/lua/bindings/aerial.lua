local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end
--Aerial tagbar alt
aerial.setup({

	backends = { "treesitter", "lsp", "markdown", "man" },

	layout = {
		-- These control the width of the aerial window.
		-- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		-- min_width and max_width can be a list of mixed types.
		-- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
		max_width = { 40, 0.2 },
		width = nil,
		min_width = 10,

		-- key-value pairs of window-local options for aerial window (e.g. winhl)
		win_opts = {},

		-- Determines the default direction to open the aerial window. The 'prefer'
		-- options will open the window in the other direction *if* there is a
		-- different buffer in the way of the preferred direction
		-- Enum: prefer_right, prefer_left, right, left, float
		default_direction = "right",

		-- Determines where the aerial window will be opened
		--   edge   - open aerial at the far right/left of the editor
		--   window - open aerial to the right/left of the current window
		placement = "window",

		-- Preserve window size equality with (:help CTRL-W_=)
		preserve_equality = false,
	},
	attach_mode = "global",
	-- Disable aerial on files with this many lines
	disable_max_lines = 10000,

	-- Disable aerial on files this size or larger (in bytes)
	disable_max_size = 2000000, -- Default 2MB

	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
		vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
	end
})

--aerial toggle function
ToggleVar = true
function AerialOtoggle()
	if ToggleVar then
		vim.api.nvim_command('AerialOpenAll')
		ToggleVar = false
	else
		vim.api.nvim_command('AerialCloseAll');
		ToggleVar = true
	end
end

--Aerial keymap
vim.keymap.set('n', '<A-t>', AerialOtoggle, { desc = "ToggleAerial" })
