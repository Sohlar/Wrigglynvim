
-- Compile debug binary
vim.keymap.set('n', '<C-p>', ':!cmake ./ && make<cr>', { remap = true, desc = "Compile C++ Debug Binary" })
vim.keymap.set('n', '<leader>cc', ':!g++ -g main.cpp -o debug<cr>', { remap = true, desc = "Compile C++ Debug Binary" })
vim.keymap.set('n', '<leader>cr', ':!./debug<cr>', { remap = true, desc = "Compile C++ Debug Binary" })
vim.keymap.set('n', '<leader>car', ':!g++ -g main.cpp -o debug && ./debug<cr>',
	{ remap = true, desc = "Compile C++ Debug Binary" })
