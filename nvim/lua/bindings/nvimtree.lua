local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end
--nvim-tree config
nvim_tree.setup({
	--  view={
	--    adaptive_size=true,
	--  },
	renderer = {
		group_empty = true
	},
	filters = {
		dotfiles = true
	},
})

--nvim-tree toggle function
ToggleTree = true
function TreeOToggle()
	if ToggleTree then
		vim.api.nvim_command('NvimTreeToggle')
		ToggleTree = false
	else
		vim.api.nvim_command('NvimTreeToggle');
		ToggleTree = true
	end
end

--nvim-tree keymap
vim.keymap.set('n', '<A-e>', TreeOToggle, { desc = "ToggleTree" })
