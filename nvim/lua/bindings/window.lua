-- Toggle window min/max
function ToggleWindowSize()
	vim.api.nvim_command('wincmd w')
	vim.api.nvim_command('wincmd _')
end


-- Toggle Window min/max on change
vim.keymap.set('n', '<A-w>', ToggleWindowSize, { desc = "Swap Window and maximize" })
-- Toggle swap to next window
vim.keymap.set('n', '<A-Tab>', '<cmd>winc w<cr>', { desc = "Swap Window" })
-- Set window to half height (only works if multiple windows are open)
vim.keymap.set('n', '<A-+>', '<cmd>winc =<cr>', { desc = "Set window size to half height" })
-- Move window to alternate position
vim.keymap.set('n', '<A-r>', '<cmd>winc R<cr>', { desc = "Swap window position" })
-- Set window to maxHeight
vim.keymap.set('n', '<A-_>', '<cmd>winc _<cr>', { desc = "Set window size to max height" })
-- Quit Window
vim.keymap.set('n', '<A-->', '<cmd>q<cr>', { desc = "Quit" })
-- Custom window navigation hjkl keys for movement
vim.keymap.set('n', '<A-h>', '<cmd>winc h<cr>', { desc = "Move to window left" })
vim.keymap.set('n', '<A-j>', '<cmd>winc j<cr>', { desc = "Move to window down" })
vim.keymap.set('n', '<A-k>', '<cmd>winc k<cr>', { desc = "Move to window up" })
vim.keymap.set('n', '<A-l>', '<cmd>winc l<cr>', { desc = "Move to window right" })
